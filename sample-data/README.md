# Sample Data

All files in this folder are fictional and generated for demonstration.

They are intentionally generic and must not be interpreted as real NHS organisations, performance or pressure.

## What the live example demonstrates

`LIVE_TODAY.csv` deliberately includes:
- multiple readings for `IND-001` in the 08:00 hour;
- an inverse indicator where lower is worse;
- a NULL pressure band where banding is not applicable;
- an empty 10:00 scaffold row.

For the 08:00 hour, if the configured hourly rule is **latest timestamp wins**, the selected `IND-001` value is `74` at `08:48`, not the first or average reading.

The empty scaffold row should not be interpreted from NULL alone. Its meaning depends on the current reporting time and pipeline status.

`indicator-dictionary.csv` shows how cadence, units, pressure applicability and indicator direction can be kept outside the prompt.

Do not replace these files with production data in a public repository.
