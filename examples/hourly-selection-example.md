# Synthetic Example — Multiple Readings in One Hour

`LIVE_TODAY.csv` contains three `IND-001` readings in the 08:00 reporting hour:

| Time | Value | Pressure |
|---|---:|---:|
| 08:05 | 70 | 3 |
| 08:22 | 72 | 3 |
| 08:48 | 74 | 3 |

If the local data contract states **latest valid timestamp within the hour wins**, the analytical 08:00 value is:

> `IND-001 = 74 at 08:48`

Do not average these readings unless averaging is explicitly part of the deterministic data contract.
