# Architecture Decisions

> ADR-style log of significant technical decisions. Claude adds entries when decisions are made.

## Format

```
### ADR-[N]: [Title] — [YYYY-MM-DD]
**Status:** Accepted | Superseded | Deprecated
**Context:** [Why this decision was needed]
**Decision:** [What was chosen]
**Consequences:** [Trade-offs and follow-up work]
```

## Decisions

<!-- Claude: add new entries at the top with incrementing ADR number -->

### ADR-007: Pin Node.js 22.23.4 — 2026-10-22

**Status:** Accepted

**Context:** The 21 October 2026 Node.js security release fixes high-severity issues, including Brotli decoder remote code execution (CVE-2026-111497), on 22.23.4, 24.22.1, and 26.12.1. Node 20 is end-of-life for that release and receives no fix. This app had no runtime pin, so local installs, CI, and Vercel could keep running an unpatched Node 20 or an older 22.x.

**Decision:** Pin local and package-manager resolution to Node `>=22.23.4 <23` via `.nvmrc` (`22.23.4`) and `package.json` `engines.node`. Keep `@types/node` on `^22`. Stay on the 22 line rather than 24: the upper bound `<23` stops Vercel from treating an open `>=22` range as its default 24.x. Vercel only offers major versions (`22.x` / `24.x`) and ships security patches on that major; the project setting must be 22.x and a new deployment is required before production picks it up.

**Consequences:** Developers need Node 22.23.4 or a later 22.x. Vercel Project Settings → Build and Deployment → Node.js Version must be set to 22.x, then the production deployment must be redeployed. There is no GitHub Actions `setup-node` workflow in this repo to pin. An unbounded `engines.node` of `>=22` would deploy 24.x on Vercel.

---

### ADR-006: Relevance Threshold at 40 — 2026-02-25

**Status:** Accepted

**Context:** Need a cutoff score to separate publishable AI-relevant articles from noise. Too high misses useful content, too low publishes junk.

**Decision:** Set initial threshold at 40/100. Articles scoring below 40 are rejected. Will re-evaluate after Week 2 when we have real data on false positive rates.

**Consequences:** May need tuning. Target is <5% false positive rate. Log all threshold changes in `strategy/learnings.md`.

---

### ADR-005: AI Category Taxonomy — 2026-02-25

**Status:** Accepted

**Context:** Articles need categorisation for filtering. Need a taxonomy that covers the AI market landscape without being too granular.

**Decision:** Five categories at launch: Infrastructure, Regulation, Applications, Chips, Models. Each article can have multiple categories.

**Consequences:** May need to add categories (e.g., Robotics, Autonomous Vehicles) as coverage expands. Keep taxonomy in a config file for easy updates.

---

### ADR-004: Background Jobs via Inngest or BullMQ — 2026-02-25

**Status:** Accepted

**Context:** Need scheduled background jobs for news ingestion (every 5 mins) and LLM processing. Must work with Vercel deployment.

**Decision:** Evaluate Inngest first (serverless, Vercel-native). Fall back to BullMQ on Railway if Inngest doesn't meet needs (cost, complexity, reliability).

**Consequences:** Inngest is simpler but adds vendor dependency. BullMQ needs a separate worker process and Redis. Decision finalised during Week 1 implementation.

---

### ADR-003: Drizzle ORM over Prisma — 2026-02-25

**Status:** Accepted

**Context:** Need a TypeScript ORM for Postgres. Main options are Prisma and Drizzle.

**Decision:** Drizzle ORM. Lighter weight, SQL-like syntax, better edge runtime compatibility with Vercel, no binary engine dependency.

**Consequences:** Drizzle Studio for DB inspection. Migrations via `drizzle-kit`. Less ecosystem tooling than Prisma but sufficient for this project's needs.

---

### ADR-002: Neon Serverless Postgres — 2026-02-25

**Status:** Accepted

**Context:** Need managed Postgres that works well with Vercel's serverless architecture. Options: Neon, Supabase, Railway, self-hosted on Proxmox.

**Decision:** Neon. Serverless connection pooling, generous free tier, native Vercel integration, automatic scaling.

**Consequences:** Vendor lock-in to Neon's connection string format (minor). Can migrate to any standard Postgres if needed. Free tier covers MVP; paid tier (~$19/mo) if we exceed limits.

---

### ADR-001: Next.js 15 with App Router on Vercel — 2026-02-25

**Status:** Accepted

**Context:** Need a framework for SSR, ISR, and API routes with aggressive caching. PRD requires <200ms page loads and real-time feed updates.

**Decision:** Next.js 15 with App Router, deployed to Vercel. TypeScript throughout. pnpm as package manager.

**Consequences:** Tight coupling to Vercel platform for deployment. ISR handles caching natively. App Router's server components reduce client bundle size. Edge runtime available for API routes if latency becomes an issue.
