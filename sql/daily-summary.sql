-- Illustrative only. Adapt pressure semantics and NULL handling locally.
SELECT
    SnapshotDate AS DayDate,
    IndicatorId,
    MAX(IndicatorName) AS IndicatorName,
    AVG(ValueNumeric) AS MeanValue,
    MIN(ValueNumeric) AS MinValue,
    MAX(ValueNumeric) AS MaxValue,
    MAX(PressureLevel) AS PeakPressure,
    SUM(CASE WHEN PressureLevel = 4 THEN 1 ELSE 0 END) AS ReadingsAtMaxPressure
FROM dbo.OperationalReading
WHERE ExtractStatus = 'VALID'
  AND ValueNumeric IS NOT NULL
GROUP BY SnapshotDate, IndicatorId;
