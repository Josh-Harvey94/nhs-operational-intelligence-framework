/*
Public-safe example: rolling summary of COMPLETE days.

This intentionally uses an exclusive upper boundary of today so the
current incomplete day does not enter the historical baseline.

Confirm source timestamp timezone semantics before adapting.
*/

DECLARE @ReportingTimeZone sysname = '[YOUR_WINDOWS_TIME_ZONE]';

DECLARE @Today date =
    CAST(SYSDATETIMEOFFSET() AT TIME ZONE @ReportingTimeZone AS date);

DECLARE @From date = DATEADD(day, -365, @Today);

SELECT
    CAST(v.[TIMESTAMP] AS date) AS DAY_DATE,
    DATENAME(weekday, v.[TIMESTAMP]) AS DAY_OF_WEEK,
    DATEPART(week, v.[TIMESTAMP]) AS WEEK_NUMBER,
    i.[INDICATOR_ID],
    i.[NAME] AS INDICATOR_NAME,
    AVG(CAST(v.[VALUE] AS float)) AS MEAN_VALUE,
    MIN(CAST(v.[VALUE] AS float)) AS MIN_VALUE,
    MAX(CAST(v.[VALUE] AS float)) AS MAX_VALUE,
    MAX(CAST(v.[PRESSURE_LEVEL] AS int)) AS PEAK_PRESSURE,
    SUM(CASE WHEN v.[PRESSURE_LEVEL] >= [YOUR_MAX_PRESSURE_THRESHOLD]
             THEN 1 ELSE 0 END) AS READINGS_AT_MAX_PRESSURE
FROM [YOUR_DATABASE].[YOUR_SCHEMA].[YOUR_INDICATOR_VALUES_TABLE] v
JOIN [YOUR_DATABASE].[YOUR_SCHEMA].[YOUR_INDICATOR_DEFINITION_TABLE] i
  ON i.[INDICATOR_KEY] = v.[INDICATOR_KEY]
WHERE v.[TIMESTAMP] >= @From
  AND v.[TIMESTAMP] < @Today
  /* Optional: apply an explicitly documented local indicator filter here. */
GROUP BY
    CAST(v.[TIMESTAMP] AS date),
    DATENAME(weekday, v.[TIMESTAMP]),
    DATEPART(week, v.[TIMESTAMP]),
    i.[INDICATOR_ID],
    i.[NAME]
ORDER BY DAY_DATE, i.[NAME];
