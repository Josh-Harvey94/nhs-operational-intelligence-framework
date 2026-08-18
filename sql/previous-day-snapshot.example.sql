/*
Public-safe example: previous complete reporting day, 24-hour scaffold,
one row per source reading.

Replace placeholders only in a PRIVATE/local implementation.
*/

DECLARE @ReportingTimeZone sysname = '[YOUR_WINDOWS_TIME_ZONE]';

DECLARE @Today date =
    CAST(SYSDATETIMEOFFSET() AT TIME ZONE @ReportingTimeZone AS date);

DECLARE @Day date = DATEADD(day, -1, @Today);

;WITH Hours AS (
    SELECT 0 AS HOUR_NUMBER
    UNION ALL
    SELECT HOUR_NUMBER + 1
    FROM Hours
    WHERE HOUR_NUMBER < 23
),
Vals AS (
    SELECT
        DATEPART(HOUR, v.[TIMESTAMP]) AS HOUR_NUMBER,
        i.[INDICATOR_ID],
        i.[NAME],
        i.[DESCRIPTION],
        v.[VALUE],
        v.[PRESSURE_LEVEL],
        v.[TIMESTAMP]
    FROM [YOUR_DATABASE].[YOUR_SCHEMA].[YOUR_INDICATOR_VALUES_TABLE] v
    JOIN [YOUR_DATABASE].[YOUR_SCHEMA].[YOUR_INDICATOR_DEFINITION_TABLE] i
      ON i.[INDICATOR_KEY] = v.[INDICATOR_KEY]
    WHERE v.[TIMESTAMP] >= @Day
      AND v.[TIMESTAMP] < DATEADD(day, 1, @Day)
)
SELECT
    RIGHT('0' + CAST(h.HOUR_NUMBER AS varchar(2)), 2)
        + ':00-'
        + RIGHT('0' + CAST(h.HOUR_NUMBER + 1 AS varchar(2)), 2)
        + ':00' AS HOUR_PERIOD,
    h.HOUR_NUMBER,
    x.[INDICATOR_ID],
    x.[NAME],
    x.[DESCRIPTION],
    x.[VALUE],
    x.[PRESSURE_LEVEL],
    x.[TIMESTAMP]
FROM Hours h
LEFT JOIN Vals x
  ON x.HOUR_NUMBER = h.HOUR_NUMBER
ORDER BY h.HOUR_NUMBER, x.[TIMESTAMP], x.[NAME]
OPTION (MAXRECURSION 23);
