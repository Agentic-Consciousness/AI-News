# Project Learnings

> Things discovered during development. Gotchas, workarounds, and non-obvious knowledge.
> Claude updates this when discoveries are made (see CLAUDE.md mandatory memory rules).

## Format

Each entry: `[YYYY-MM-DD] Learning — Context`

## Learnings

<!-- Claude: add new entries at the top -->

- [2026-10-22] Next.js 16.4.2 prints "The Edge Runtime is deprecated" and "Using edge runtime on a page currently disables static generation" for `src/app/opengraph-image.tsx` and `src/app/articles/[id]/opengraph-image.tsx` (`export const runtime = "edge"`). `pnpm build` still succeeds. `@vitejs/plugin-react` 6.1.2 peers `vite` `^8.0.0`, so the plugin major cannot land while Vite stays on 7. ESLint 9.39.5 installs with a deprecation warning; ESLint 10 is the next major and was left alone. `eslint-config-next` 16.4.2 still peers `eslint` `>=9`.
- [2026-10-22] Node 20 gets no patch for the 21 Oct 2026 security release (Brotli RCE CVE-2026-111497 and other highs). Fixed lines are 22.23.4, 24.22.1, and 26.12.1. Vercel only exposes major versions (22.x / 24.x) and rolls patches itself; `.nvmrc` does not set the Vercel runtime. An unbounded `engines.node` of `>=22.0.0` deploys latest 24.x. Use `>=22.23.4 <23` plus the dashboard Node.js Version set to 22.x, then redeploy — existing deployments keep the previous runtime.
- [YYYY-MM-DD] [e.g., AlphaESS Modbus register 0x0020 returns SOC as percentage * 10, not raw percentage]
- [YYYY-MM-DD] [e.g., Shopify webhook verification requires raw body, not parsed JSON]
- [YYYY-MM-DD] [e.g., Docker Alpine images missing tzdata — need to install for timezone support]
