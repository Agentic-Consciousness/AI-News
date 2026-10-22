# Project Learnings

> Things discovered during development. Gotchas, workarounds, and non-obvious knowledge.
> Claude updates this when discoveries are made (see CLAUDE.md mandatory memory rules).

## Format

Each entry: `[YYYY-MM-DD] Learning — Context`

## Learnings

<!-- Claude: add new entries at the top -->

- [2026-10-22] Node 20 gets no patch for the 21 Oct 2026 security release (Brotli RCE CVE-2026-111497 and other highs). Fixed lines are 22.23.4, 24.22.1, and 26.12.1. Vercel only exposes major versions (22.x / 24.x) and rolls patches itself; `.nvmrc` does not set the Vercel runtime. An unbounded `engines.node` of `>=22.0.0` deploys latest 24.x. Use `>=22.23.4 <23` plus the dashboard Node.js Version set to 22.x, then redeploy — existing deployments keep the previous runtime.
- [YYYY-MM-DD] [e.g., AlphaESS Modbus register 0x0020 returns SOC as percentage * 10, not raw percentage]
- [YYYY-MM-DD] [e.g., Shopify webhook verification requires raw body, not parsed JSON]
- [YYYY-MM-DD] [e.g., Docker Alpine images missing tzdata — need to install for timezone support]
