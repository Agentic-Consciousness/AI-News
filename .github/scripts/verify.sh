#!/usr/bin/env bash
# Checks for this repository on GitHub. There was no earlier pipeline, so these are the project's own documented
# commands (CLAUDE.md): install from the lockfile, lint, unit tests and the production build (which type checks).
# Nothing deploys and no real credentials are used.
set -euo pipefail
test "${GITHUB_SERVER_URL:?}" = 'https://github.com'
case "${GITHUB_REPOSITORY:?}" in
  HallyAus/AI-News|Agentic-Consciousness/AI-News) ;;
  *) echo "Unexpected repository: $GITHUB_REPOSITORY" >&2; exit 1 ;;
esac
test "$(git rev-parse HEAD)" = "${GITHUB_SHA:?}"
node -e 'if (process.versions.node.split(".")[0] !== "22") throw Error("Use the Node 22 runtime the project pins")'
unset VERCEL_TOKEN VERCEL_OIDC_TOKEN DATABASE_URL ANTHROPIC_API_KEY
export CI=1 NEXT_TELEMETRY_DISABLED=1 NODE_OPTIONS=--max-old-space-size=3072
corepack enable
corepack prepare pnpm@10.30.2 --activate

pnpm install --frozen-lockfile
pnpm lint
pnpm exec vitest run
pnpm build
