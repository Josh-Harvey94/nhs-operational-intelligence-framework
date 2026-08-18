-- Generic example: latest observation for each indicator within each hour.
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
