# SQL

SQL is optional. These files demonstrate **public-safe patterns** derived from a working operational snapshot approach while removing all local database, schema and table names.

Never commit:
- real server/database names;
- credentials or connection strings;
- production table/view names where they expose non-public infrastructure;
- sensitive filters or operational logic that reveals vulnerabilities.

## Included patterns

- `live-snapshot.example.sql` — current reporting day with a 24-hour scaffold and raw source readings.
- `previous-day-snapshot.example.sql` — previous complete reporting day using the same shape.
- `long-horizon-summary.example.sql` — example complete-day rolling summary.
- `latest-per-hour.sql` — optional deterministic rule for selecting the latest reading within each indicator/hour.
- `data-contract.sql` — generic logical schema.
- `daily-summary.sql` — generic summary against the logical schema.

## Important: raw extracts may have multiple readings per hour

The live/previous-day patterns intentionally preserve one row per source reading. A frequent indicator may therefore appear several times within one hour.

If the consumer requires a single hourly value, apply a documented rule such as **latest timestamp wins**. Do not assume the extraction query already did this.

## Important: 24-hour scaffold rows

A `LEFT JOIN` from a generated 0–23 hour list can create a row where all source fields are NULL.

That means **no reading matched the hour**.

Whether it represents:
- a future hour;
- an expected reporting gap;
- unexpected data silence; or
- extraction failure

must be determined from the reporting clock, data dictionary and pipeline status.

## Complete days

If a summary is described as using complete days, use both:
- a lower historical boundary; and
- an exclusive upper boundary at the current reporting day.

## Timezone

The examples use a placeholder reporting timezone. Confirm how the underlying source timestamps are stored before adapting them.

Do not assume that applying a timezone to "today" also converts the source `TIMESTAMP`.
