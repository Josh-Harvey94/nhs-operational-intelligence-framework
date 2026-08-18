# Source-to-Public Mapping

This document explains how local agent concepts were translated into reusable public patterns.

| Original concept | Reusable public pattern |
|---|---|
| Daily operational CSV snapshots | Versioned structured operational snapshots |
| Live-today file | `LIVE_TODAY.csv` logical dataset |
| Daily archive files | `DAILY_SNAPSHOT_YYYYMMDD.csv` |
| 365-day summary | `SUMMARY_365D.csv` long-horizon context |
| Local named pressure system | `[YOUR_OPERATIONAL_DATA_SOURCE]` |
| Local morning system call | Configured daily operational briefing |
| Local SharePoint library | `[YOUR_DOCUMENT_LIBRARY]` |
| Local SCC role | Accountable operational coordination/control role |
| Narrative M365 content | Approved collaboration/document evidence sources |
| OPEL-specific numbers | Optional `PRESSURE_LEVEL`, locally defined |
| Patient identifiers in narrative | Suppressed from outputs; data access minimised locally |
