# Structured Operational Data Contract

The Info Manager Agent should only be trusted if the structured source has a documented contract.

## Recommended logical datasets

### 1. Live intraday snapshot

Suggested file: `LIVE_TODAY.csv`

Purpose:
- current/most recent position;
- intraday movement;
- overnight-to-current analysis.

Recommended fields:

| Field | Type | Meaning |
|---|---|---|
| `HOUR_PERIOD` | text | Human-readable reporting window |
| `HOUR_NUMBER` | integer | 0-23 or agreed operational hour |
| `INDICATOR_ID` | text | Stable unique indicator key |
| `INDICATOR_NAME` | text | Display name |
| `DESCRIPTION` | text | Optional definition |
| `VALUE` | decimal/text | Reported value |
| `PRESSURE_LEVEL` | integer/null | Optional pressure band |
| `TIMESTAMP` | datetime | Source observation timestamp |
| `SOURCE_SYSTEM` | text | Origin |
| `SNAPSHOT_DATE` | date | Snapshot date |

If an indicator reports multiple times within an hour, define a deterministic rule such as "latest timestamp wins".

### 2. Daily archive

Suggested file: `DAILY_SNAPSHOT_YYYYMMDD.csv`

Purpose:
- complete-day record;
- day-on-day comparisons over a short horizon;
- audit/reproducibility.

### 3. Long-horizon summary

Suggested file: `SUMMARY_365D.csv`

Purpose:
- weekly/day-of-week pattern;
- typical ranges;
- longer-horizon comparisons;
- contextualising signal vs ordinary variation.

Recommended fields:

`DAY_DATE, DAY_OF_WEEK, WEEK_NUMBER, INDICATOR_ID, INDICATOR_NAME, MEAN_VALUE, MIN_VALUE, MAX_VALUE, PEAK_PRESSURE, READINGS_AT_MAX_PRESSURE`

## Source selection rules

Default reusable pattern:

- **Current position:** live file; where local policy permits, explicitly labelled fallback to the most recent valid archived value.
- **Intraday/overnight:** live or one daily archive file.
- **Short comparison:** relevant daily archives, using like-for-like reporting times.
- **Longer than the configured short horizon:** summary dataset only.
- If the required dataset cannot answer the question, say so rather than constructing an estimate.

## NULL semantics

Do not treat NULL as zero.

A deployment should explicitly distinguish:

1. **Future period / not yet reported** — the row exists but the time has not occurred.
2. **Not applicable** — e.g. an indicator has no pressure banding.
3. **Normal reporting cadence** — the indicator is absent because it does not report every interval.
4. **Unexpected data silence** — an indicator that normally reports frequently is overdue.

Encode these semantics in the data dictionary where possible instead of relying only on prompt instructions.

## Comparison rules

- Compare like-for-like clock periods.
- Do not call a single point a trend.
- Require a configured number of consecutive deteriorating observations before calling something an emerging risk.
- Document inverse indicators (e.g. "lower availability = worse").
- Treat seasonality explicitly.
- Contextualise movements against expected range before describing them as exceptional.

## Provenance

Every number in a generated brief should be reproducible from:
- dataset name;
- snapshot date;
- observation time;
- indicator key;
- transformation rule, if any.
