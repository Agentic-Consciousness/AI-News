# Memory: Decisions

> Past choices made during this project for consistency. Dated entries.
> Claude adds here when a decision is made. Auto-loaded every session.

## Format

Each entry: `[YYYY-MM-DD] Decision — Rationale`

## Decisions

<!-- Claude: add new entries at the top -->

- [2026-10-22] October dependency upkeep takes patch and minor updates only. A minor on a 0.x package counts as a major and stays put. Node.js stays 22.23.4. `@vitejs/plugin-react` 6 peers Vite 8, so those two majors move together or not at all.
- [2026-10-22] Pin Node.js to 22.23.4 (`>=22.23.4 <23`, `.nvmrc` and `.node-version`) — Node 20 is unpatched for the 21 Oct 2026 security release; the `<23` cap keeps Vercel on 22.x instead of defaulting an open `>=22` range to 24.x. Dashboard Node.js Version must be 22.x and production must be redeployed. No Actions `setup-node` workflow exists.
- [2026-02-27] Domain aimarketwire.ai — registered and connected to Vercel
- [2026-02-27] Vercel Hobby plan — daily cron (0 0 * * *) for ingestion, hourly requires Pro
- [2026-02-27] Neon free tier in ap-southeast-2 (Sydney) — low latency for Australian users
- [2026-02-27] claude-sonnet-4-6 for scoring/summarisation — updated from claude-sonnet-4-20250514
- [2026-02-27] Force-dynamic homepage — page fetches from API at runtime, not statically generated
- [2026-02-25] 7 RSS sources for launch — Bloomberg Tech, TechCrunch AI, AI Business, The Decoder, MIT Tech Review, The Verge AI, VentureBeat AI. Reuters dropped (no free RSS since 2020)
- [2026-02-25] Lazy DB connection via Proxy — avoids build-time errors when DATABASE_URL not set
- [2026-02-25] Next.js 16 instead of 15 — latest stable at scaffold time, same App Router architecture, React 19 support
- [2026-02-25] Vitest over Jest for testing — faster, native ESM, better TypeScript support
- [2026-02-25] Relevance threshold at 40/100 — will tune after Week 2 data, targeting <5% false positive rate
- [2026-02-25] Five AI categories at launch (Infrastructure, Regulation, Applications, Chips, Models) — expandable later
- [2026-02-25] Inngest first, BullMQ fallback for background jobs — evaluate during Week 1 implementation
- [2026-02-25] Drizzle ORM over Prisma — lighter weight, better edge runtime compatibility, no binary engine
- [2026-02-25] Neon serverless Postgres — native Vercel integration, connection pooling, generous free tier
- [2026-02-25] Next.js App Router on Vercel with pnpm — SSR/ISR for <200ms page loads
