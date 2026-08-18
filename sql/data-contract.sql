-- Generic example only.
CREATE TABLE dbo.OperationalReading (
    SnapshotDate      date           NOT NULL,
    HourNumber        int            NOT NULL,
    IndicatorId       varchar(100)   NOT NULL,
    IndicatorName     varchar(255)   NOT NULL,
    Description       varchar(1000)  NULL,
    ValueNumeric      decimal(18,4)  NULL,
    ValueText         varchar(255)   NULL,
    PressureLevel     int            NULL,
    ObservedAt        datetime2      NOT NULL,
    SourceSystem      varchar(100)   NOT NULL,
    ExtractStatus     varchar(30)    NOT NULL
);
