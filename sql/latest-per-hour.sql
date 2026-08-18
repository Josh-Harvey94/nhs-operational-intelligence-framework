-- Generic example: deterministic latest observation for each indicator/hour.
-- Use only when one hourly observation is required by the analytical data contract.

WITH ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY SnapshotDate, HourNumber, IndicatorId
            ORDER BY ObservedAt DESC
        ) AS rn
    FROM dbo.OperationalReading
    WHERE ExtractStatus = 'VALID'
)
SELECT
    SnapshotDate,
    HourNumber,
    IndicatorId,
    IndicatorName,
    Description,
    ValueNumeric,
    ValueText,
    PressureLevel,
    ObservedAt,
    SourceSystem
FROM ranked
WHERE rn = 1;
