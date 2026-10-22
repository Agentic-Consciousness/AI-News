# Session Handoff

> Bridge between Claude Code sessions. Updated at the end of every session.
> The SessionStart hook auto-injects this into context.

## Last Updated

- **Date:** 2026-10-22
- **Branch:** cursor/pin-node-22-23-4-b1e8
- **Focus:** Pin Node.js to 22.23.4 after the 21 Oct 2026 security release. Node 20 is unpatched.

## Accomplished

### This Session
- Pinned the runtime to Node 22.23.4 (`.nvmrc` and `.node-version`) and `package.json` `engines.node` `>=22.23.4 <23`
- Bumped `@types/node` from `^20` to `^22` and refreshed the lockfile
- No GitHub Actions workflow exists, so there is no `setup-node` step to pin
- Logged ADR-007. Production still needs the Vercel Node.js Version set to 22.x and a redeploy

### Previous Session
- Built polished frontend: dark terminal editorial design with score rings, category badges, ticker badges, staggered animations
- Used Newsreader (serif) + IBM Plex Mono (data) + Geist (body) fonts
- Wired homepage to fetch from /api/articles with mock data fallback
- Created Vercel cron route (GET /api/cron/ingest) for automated daily ingestion
- Created vercel.json with daily cron schedule (Hobby plan limitation)
- Set up Neon database (ap-southeast-2 Sydney), ran migration, seeded 5 categories
- Fixed scorer bug: wrong column reference (rawArticles.sourceId → sources.id) + missing import
- Fixed JSON parsing: added extractJSON() to handle markdown-wrapped LLM responses
- Updated model from claude-sonnet-4-20250514 to claude-sonnet-4-6
- Added force-dynamic to homepage (API not available at build time)
- Deployed to Vercel, connected aimarketwire.ai domain
- Ran first ingestion: 137 articles fetched, 11 published, 9 rejected, 0 errors
- Site is LIVE at https://aimarketwire.ai

### Previous Session
- Full backend pipeline: RSS ingestion, AI scoring, summary generation, API routes
- CLI ingest command, 11 tests passing

## In Progress

_None._

## Blocked

_None._

## Next Steps

1. In Vercel (aimarketwire): Settings → Build and Deployment → Node.js Version = 22.x, then redeploy production so the patched 22.x runtime is actually used
2. Run more ingestion batches to process remaining 117 unprocessed articles
3. Upgrade to Vercel Pro for hourly cron (currently daily)
4. Connect GitHub repo to Vercel for auto-deploy on push
5. Build article detail page (/articles/[id])
6. Add category filtering (currently nav links are placeholders)
7. Set up monitoring/alerting for ingestion failures
8. Tune relevance threshold after more data (currently 40)
9. Consider Proxmox worker for more frequent ingestion

## Active Beads Issues

_Beads not yet initialised._

## Context

- Neon project: aimarketwire in ap-southeast-2, org-calm-flower-05958305
- Vercel project: danieljhall-mecoms-projects/aimarketwire
- Domain: aimarketwire.ai (SSL provisioned)
- Cron: daily at midnight UTC (Hobby plan limit)
- Scorer processes 20 articles per batch — need multiple runs to clear 137 backlog
- Store function counts inserts wrong (counts conflicts as stored) — cosmetic only
- The `sources` table column was being incorrectly referenced in scorer — now fixed
- LLM sometimes wraps JSON in markdown code blocks — extractJSON() handles this

## Files Modified (This Session)

```
.nvmrc (new)
.node-version (new)
package.json
pnpm-lock.yaml
CLAUDE.md
specs/decisions.md
strategy/learnings.md
memory/HANDOFF.md
.claude/rules/memory-decisions.md
.claude/rules/memory-sessions.md
```

### Previous session files

```
src/app/globals.css
src/app/layout.tsx
src/app/page.tsx
src/app/api/cron/ingest/route.ts (new)
src/lib/env.ts
src/lib/llm/claude.ts
src/lib/pipeline/scorer.ts
src/scripts/ingest.ts
src/scripts/reset-stuck.ts (new)
vercel.json (new)
drizzle/0000_magical_shinko_yamashiro.sql (generated)
drizzle/meta/ (generated)
```
