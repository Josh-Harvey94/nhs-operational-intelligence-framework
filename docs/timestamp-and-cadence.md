# Timestamp, Timezone and Reporting Cadence

Time handling is an operational data-quality control, not a cosmetic detail.

## Why this matters

A common snapshot pattern calculates "today" in an operational timezone but reads the source timestamp directly. That is safe only when the storage semantics are understood.

Around daylight-saving transitions, or where a warehouse stores UTC while the operational service uses local time, an apparently simple date/hour filter can:
- place readings in the wrong reporting day;
- mislabel an hour;
- omit or duplicate readings;
- create incorrect overnight comparisons.

## Minimum local documentation

Record:

| Setting | Local value |
|---|---|
| Source timestamp datatype | `[DEFINE]` |
| Source timestamp timezone | `[UTC / LOCAL / OFFSET-AWARE / UNKNOWN]` |
| Operational reporting timezone | `[DEFINE]` |
| Day boundary | `[DEFINE]` |
| Daylight-saving handling | `[DEFINE]` |
| Current-day calculation method | `[DEFINE]` |
| Hour-bucketing method | `[DEFINE]` |

Do not move to production while the source timezone is `UNKNOWN`.

## Cadence

Each indicator should have an expected reporting cadence.

Examples of generic cadence classes:
- frequent: several times per hour;
- hourly;
- two-hourly;
- daily;
- event-driven.

The agent should not call one missing interval a failure when the indicator is not expected to report in that interval.

## Scaffold rows

Some SQL patterns generate all 24 hours and `LEFT JOIN` available source readings.

This is useful because it makes future/empty hours visible, but a NULL scaffold row does **not** itself prove that the hour is in the future.

Interpret it against:
1. the current reporting-local clock;
2. indicator cadence;
3. extraction status.

## Complete-day summaries

A daily summary described as "complete days" should normally:
- calculate the current reporting-local date;
- use an inclusive historical start boundary;
- use an exclusive current-day end boundary.

This keeps the incomplete current day out of long-horizon baselines.
