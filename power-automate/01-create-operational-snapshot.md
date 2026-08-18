# Flow 01 — Create Operational Snapshot

## Trigger
Scheduled recurrence at the local reporting cadence.

## High-level steps

1. Authenticate to `[YOUR_OPERATIONAL_DATA_SOURCE]`.
2. Retrieve only required operational fields.
3. Apply documented mapping to the public data-contract shape.
4. Validate required fields and timestamp.
5. Deduplicate per indicator/interval using the configured rule.
6. Write/update `LIVE_TODAY`.
7. At the configured close point, persist a dated immutable `DAILY_SNAPSHOT_YYYYMMDD`.
8. Log success/failure without writing confidential payloads into logs.
9. Alert the operational data owner if the flow misses its service threshold.

## Failure behaviour

- Never replace a valid current file with an empty/partial extract without an explicit status marker.
- Record `EXTRACT_STATUS`.
- Allow the agent to identify staleness from timestamps.
- Do not silently backfill a failed current value and present it as live.

## Security

Use an approved connection identity with minimum read/write rights necessary for the snapshot store.
