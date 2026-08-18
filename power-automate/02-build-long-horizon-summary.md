# Flow 02 — Build Long-Horizon Summary

## Purpose
Create a compact summary product so the agent does not need to retrieve hundreds of individual daily files.

## Steps

1. Read validated complete daily snapshots.
2. Group by date and indicator.
3. Calculate only approved summary statistics.
4. Preserve direction/units/definition metadata where possible.
5. Write `SUMMARY_365D` (or configured horizon).
6. Store generation timestamp and included date range.
7. Run data-quality checks before replacing the prior summary.

## Important
The summary is an analytical data product. Its calculations should be defined and version controlled. Do not let the language model invent the aggregation logic.
