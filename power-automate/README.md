# Power Automate Implementation

This folder provides **flow specifications**, not importable production exports.

## Why no solution ZIP is included?

Power Platform solution exports include environment/component metadata. A safe reusable pattern is to build the flows in a controlled development environment, place them in a Solution, use connection references/environment variables, test, then export through the organisation's ALM process.

## Suggested flows

1. `01-create-operational-snapshot.md`
2. `02-build-long-horizon-summary.md`
3. `03-publish-approved-brief.md`

Start with flows that **read and prepare data**. Add outbound communication only after human review and local approval.

## Environment variables

See `environment-variables.example.json`.

Recommended:
- `ORG_NAME`
- `OPS_SITE_URL`
- `OPS_DOCUMENT_LIBRARY`
- `LIVE_SNAPSHOT_PATH`
- `ARCHIVE_PATH`
- `SUMMARY_PATH`
- `STALE_AFTER_HOURS`
- `BRIEF_RECIPIENT_GROUP` (private deployment only)
- `TIME_ZONE`

Do not store secrets in plain-text environment variables.
