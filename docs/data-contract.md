# Structured Operational Data Contract

The Info Manager Agent should only be trusted if the structured source has a documented contract.

## Important distinction: raw reading vs analytical value

A source extract may contain **one row per source reading**, meaning the same indicator can occur several times in the same hour.

Do not assume the SQL extract has already selected one hourly value.

If the use case needs a single value per indicator/hour, define a deterministic selection rule such as:

> **Latest valid `TIMESTAMP` within the reporting hour wins.**

Apply that rule either:
- in a deterministic transformation step before the AI layer; or
- explicitly and consistently in the agent logic.

The transformation location must be documented.

## Recommended logical datasets

### 1. Live/current-day raw snapshot

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
| `INDICATOR_ID` | text | Stable unique indicator key where available |
| `INDICATOR_NAME` | text | Display name |
| `DESCRIPTION` | text | Optional definition |
| `VALUE` | decimal/text/null | Reported value |
| `PRESSURE_LEVEL` | integer/null | Optional pressure band |
| `TIMESTAMP` | datetime/null | Source observation timestamp |
| `SOURCE_SYSTEM` | text | Origin |
| `SNAPSHOT_DATE` | date | Snapshot date |

The raw file may contain:
- multiple readings for the same indicator/hour;
- a NULL scaffold row when no source reading matched an hour.

### 2. Daily archive

Suggested file: `DAILY_SNAPSHOT_YYYYMMDD.csv`

Purpose:
- complete-day record;
- short-horizon day-on-day comparisons;
- audit/reproducibility.

Where practical, retain the raw source-reading pattern rather than silently averaging within the archive.

### 3. Long-horizon summary

Suggested file: `SUMMARY_365D.csv`

Purpose:
- weekly/day-of-week pattern;
- typical ranges;
- longer-horizon comparisons;
- contextualising signal vs ordinary variation.

Recommended fields:

`DAY_DATE, DAY_OF_WEEK, WEEK_NUMBER, INDICATOR_ID, INDICATOR_NAME, MEAN_VALUE, MIN_VALUE, MAX_VALUE, PEAK_PRESSURE, READINGS_AT_MAX_PRESSURE`

The summary should be built deterministically outside the language model.

### 4. Indicator dictionary

Recommended fields:

`INDICATOR_ID, INDICATOR_NAME, UNIT, DIRECTION, EXPECTED_CADENCE_MINUTES, PRESSURE_BANDING_APPLIES, SOURCE_OWNER`

`DIRECTION` should state whether higher or lower values normally represent deterioration.

## Source selection rules

Default reusable pattern:

- **Current position:** live/current-day dataset.
- **Intraday/overnight:** live or one daily archive file.
- **Short comparison:** relevant daily archives, using like-for-like reporting times.
- **Longer than the configured short horizon:** summary dataset only.
- If the required dataset cannot answer the question, say so rather than constructing an estimate.

If a previous-day value is used because today's indicator has not reported, label it clearly as a **fallback historic observation**, not as the current value.

## NULL and missing-data semantics

Do not treat NULL as zero.

A NULL scaffold row means only that **no source reading matched that hour**. Determine the meaning using the reporting clock and indicator dictionary:

1. **Future period / not yet possible to report** — hour has not yet occurred.
2. **Not applicable** — e.g. pressure banding does not apply.
3. **Expected reporting cadence** — an indicator does not report every interval.
4. **Unexpected data silence** — a frequently reporting indicator is overdue.
5. **Source/extraction issue** — the data pipeline failed or returned incomplete data.

Do not decide which case applies from NULL alone.

## Timestamp and timezone contract

Document:
- how the source `TIMESTAMP` is stored;
- whether it is UTC, local time or carries an offset;
- the operational reporting timezone;
- daylight-saving behaviour;
- how "today" is calculated;
- how reporting hours are derived;
- whether summary dates are based on source time or reporting-local time.

See [`timestamp-and-cadence.md`](timestamp-and-cadence.md).

## Comparison rules

- Compare like-for-like clock periods.
- Do not call a single point a trend.
- Require a configured number of consecutive deteriorating observations before calling something an emerging risk.
- Document inverse indicators.
- Treat seasonality explicitly.
- Contextualise movements against expected range before describing them as exceptional.
- When multiple readings exist in an interval, state or apply the configured selection rule.

## Long-horizon completeness

If the product is described as containing **complete days**, exclude the current incomplete reporting day from the summary.

A "365 complete days" product should have an explicit start and end boundary rather than relying on only a lower date bound.

## Provenance

Every material number in a generated brief should be reproducible from:
- dataset name;
- snapshot date;
- observation timestamp;
- indicator key/name;
- selection/transformation rule;
- summary-generation timestamp where relevant.
