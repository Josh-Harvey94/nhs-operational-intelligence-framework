# Phase 1 — Data Foundation

- Define indicator dictionary.
- Define source system and owner.
- Define source timestamp timezone/storage semantics.
- Define operational reporting timezone and day boundary.
- Define reporting cadence.
- Define NULL/missing semantics.
- Define inverse metrics.
- Define raw-reading versus hourly-selection behaviour.
- Define deterministic deduplication/selection rule.
- Define snapshot timestamp.
- Define staleness threshold.
- Build synthetic dataset including multiple readings per hour.
- Build data-quality monitoring.
- Create long-horizon summary outside the language model.
- Ensure any "complete days" summary excludes the incomplete current day.
