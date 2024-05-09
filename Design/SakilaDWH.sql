/****** Object:  Database SakilaDWH    Script Date: 5/9/2024 10:13:21 PM ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 4

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/
/*
DROP DATABASE SakilaDWH
GO
CREATE DATABASE SakilaDWH
GO
ALTER DATABASE SakilaDWH
SET RECOVERY SIMPLE
GO
*/

CREATE DATABASE SakilaDWH
GO

USE SakilaDWH
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;





-- Create a schema to hold user views (set schema name on home page of workbook).
-- It would be good to do this only if the schema doesn't exist already.
GO
CREATE SCHEMA MDWT
GO






/* Drop table dbo.DimDate */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimDate') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimDate 
;

/* Create table dbo.DimDate */
CREATE TABLE dbo.DimDate (
   [date_key]  int   NOT NULL
,  [Date]  datetime   NOT NULL
,  [DayOfWeek]  int   NULL
,  [DayName]  nvarchar(255)   NOT NULL
,  [DayOfMonth]  int   NOT NULL
,  [DayOfYear]  int   NOT NULL
,  [WeekOfYear]  int   NOT NULL
,  [MonthName]  nvarchar(255)   NOT NULL
,  [MonthOfYear]  int   NOT NULL
,  [Quarter]  int   NOT NULL
,  [Year]  int   NOT NULL
,  [IsAWeekday]  nvarchar(255)   NOT NULL
, CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
( [date_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Date', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Date dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Date]'))
DROP VIEW [MDWT].[Date]
GO
CREATE VIEW [MDWT].[Date] AS 
SELECT [date_key] AS [date_key]
, [Date] AS [Date]
, [DayOfWeek] AS [DayOfWeek]
, [DayName] AS [DayName]
, [DayOfMonth] AS [DayOfMonth]
, [DayOfYear] AS [DayOfYear]
, [WeekOfYear] AS [WeekOfYear]
, [MonthName] AS [MonthName]
, [MonthOfYear] AS [MonthOfYear]
, [Quarter] AS [Quarter]
, [Year] AS [Year]
, [IsAWeekday] AS [IsAWeekday]
FROM dbo.DimDate
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfWeek', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfMonth', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeekOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MonthName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MonthOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Quarter', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'IsAWeekday', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsAWeekday'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Temp', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsAWeekday'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsAWeekday'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Date_Dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsAWeekday'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DayOfWeek', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DayName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DayOfMonth', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DayOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'WeekOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'MonthName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'MonthOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Quarter', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'IsAWeekday', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsAWeekday'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'date_key'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Date'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Quarter'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'Year'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsAWeekday'; 
;





/* Drop table dbo.DimRental */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimRental') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimRental 
;

/* Create table dbo.DimRental */
CREATE TABLE dbo.DimRental (
   [rental_key]  int IDENTITY  NOT NULL
,  [rental_id]  int   NOT NULL
,  [customer_id]  int   NOT NULL
,  [inventory_id]  int   NOT NULL
,  [staff_id]  int   NOT NULL
,  [amount]  decimal   NOT NULL
,  [rental_date]  datetime   NOT NULL
,  [payment_date]  datetime   NOT NULL
,  [return_date]  datetime  DEFAULT '23/05/2005' NULL
, CONSTRAINT [PK_dbo.DimRental] PRIMARY KEY CLUSTERED 
( [rental_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimRental
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Rentals', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimRental
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimRental
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Rentals dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimRental
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Rentals]'))
DROP VIEW [MDWT].[Rentals]
GO
CREATE VIEW [MDWT].[Rentals] AS 
SELECT [rental_key] AS [rental_key]
, [rental_id] AS [rental_id]
, [customer_id] AS [customer_id]
, [inventory_id] AS [inventory_id]
, [staff_id] AS [staff_id]
, [amount] AS [amount]
, [rental_date] AS [rental_date]
, [payment_date] AS [payment_date]
, [return_date] AS [return_date]
FROM dbo.DimRental
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'inventory_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'staff_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'amount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'amount'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'payment_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'payment_date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'return_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'return_date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The money of a payment', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'amount'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date of rental', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date of payment', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'payment_date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date of return', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'return_date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'amount'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'payment_date'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'return_date'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'amount'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_date'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'payment_date'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'return_date'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'rental', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'rental', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'rental', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'rental', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'payment', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'amount'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'rental', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_date'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'rental', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'payment_date'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'return', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'return_date'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'rental_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'inventory_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'staff_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'amount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'amount'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'rental_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_date'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'payment_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'payment_date'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'return_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'return_date'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'amount'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'rental_date'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'payment_date'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimRental', @level2type=N'COLUMN', @level2name=N'return_date'; 
;





/* Drop table dbo.DimInventory */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimInventory') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimInventory 
;

/* Create table dbo.DimInventory */
CREATE TABLE dbo.DimInventory (
   [inventory_key]  int IDENTITY  NOT NULL
,  [Inventory_id]  int   NOT NULL
,  [title]  varchar(255)   NOT NULL
,  [release_year]  varchar(4)  DEFAULT 'N/A' NULL
,  [language]  char(20)  DEFAULT 'N/A' NULL
,  [rental_duration]  tinyint   NOT NULL
,  [length]  smallint  DEFAULT -1 NULL
,  [rental_rate]  decimal   NOT NULL
,  [replacement_cost]  decimal   NOT NULL
,  [category_name]  varchar(25)   NOT NULL
,  [rating]  varchar(10)  DEFAULT 'N/A' NULL
,  [special_features]  varchar(255)  DEFAULT 'N/A' NULL
,  [film_id]  int  DEFAULT -1 NULL
, CONSTRAINT [PK_dbo.DimInventory] PRIMARY KEY CLUSTERED 
( [inventory_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimInventory
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Inventories', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimInventory
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimInventory
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Inventory dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimInventory
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Inventories]'))
DROP VIEW [MDWT].[Inventories]
GO
CREATE VIEW [MDWT].[Inventories] AS 
SELECT [inventory_key] AS [inventory_key]
, [Inventory_id] AS [Inventory_id]
, [title] AS [title]
, [release_year] AS [release_year]
, [language] AS [language]
, [rental_duration] AS [rental_duration]
, [length] AS [length]
, [rental_rate] AS [rental_rate]
, [replacement_cost] AS [replacement_cost]
, [category_name] AS [category_name]
, [rating] AS [rating]
, [special_features] AS [special_features]
, [film_id] AS [film_id]
FROM dbo.DimInventory
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'inventory_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'inventory_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Inventory_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'Inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'title', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'title'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'release_year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'release_year'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'language', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'language'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_duration', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_duration'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'length', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'length'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_rate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_rate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'replacement_cost', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'replacement_cost'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'category_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'category_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rating', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rating'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'special_features', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'special_features'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'film_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'inventory_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'Inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The title of the film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'title'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The year the film was released', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'release_year'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Language of the film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'language'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Rental duration (in days)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_duration'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'the length of the film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'length'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Rental rate of the film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_rate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Replacement cost of the film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'replacement_cost'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Category name of the film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'category_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Rating of the film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rating'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Special features of the film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'special_features'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'the film_id of the film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'inventory_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1,2,3,4...', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'Inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'ACADEMY DINOSAUR', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'title'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2006', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'release_year'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'English', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'language'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'6', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_duration'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'38', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'length'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'0.99', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_rate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'20.99', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'replacement_cost'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Action', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'category_name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'PG', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rating'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Deleted Scenes,Behind the Scenes', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'special_features'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'inventory_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'Inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'title'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'release_year'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'language'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_duration'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'length'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_rate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'replacement_cost'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'category_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rating'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'special_features'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'Inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'title'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'release_year'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'language'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_duration'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'length'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_rate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'replacement_cost'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'category_name'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rating'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'special_features'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Inventory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'Inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'title'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'release_year'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Language', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'language'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_duration'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'length'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_rate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'replacement_cost'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Category', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'category_name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rating'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'special_features'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Inventory_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'Inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'title', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'title'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'release_year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'release_year'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'language', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'language'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'rental_duration', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_duration'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'length', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'length'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'rental_rate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_rate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'replacement_cost', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'replacement_cost'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'category_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'category_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'rating', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rating'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'special_features', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'special_features'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'film_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'Inventory_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'title'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'release_year'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'char', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'language'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'tinyint', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_duration'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'smallint', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'length'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rental_rate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'replacement_cost'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'category_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'rating'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'special_features'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimInventory', @level2type=N'COLUMN', @level2name=N'film_id'; 
;





/* Drop table dbo.DimCustomers */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCustomers') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCustomers 
;

/* Create table dbo.DimCustomers */
CREATE TABLE dbo.DimCustomers (
   [customer_key]  int IDENTITY  NOT NULL
,  [customer_id]  int   NOT NULL
,  [first_name]  varchar(45)   NOT NULL
,  [last_name]  varchar(45)   NOT NULL
,  [email]  varchar(50)   NULL
,  [address_id]  int   NOT NULL
,  [active]  char(1)   NOT NULL
, CONSTRAINT [PK_dbo.DimCustomers] PRIMARY KEY CLUSTERED 
( [customer_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomers
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomers
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomers
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Customer dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomers
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[customer]'))
DROP VIEW [MDWT].[customer]
GO
CREATE VIEW [MDWT].[customer] AS 
SELECT [customer_key] AS [CustomerKey]
, [customer_id] AS [customer_id]
, [first_name] AS [first_name]
, [last_name] AS [last_name]
, [email] AS [email]
, [address_id] AS [address_id]
, [active] AS [active]
FROM dbo.DimCustomers
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'first_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'last_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'email', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'address_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'active', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The first name of customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The last name of customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Email of customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The information address of customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Active of customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'customer_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'first_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'last_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'email', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'address_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'active', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'customer_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'char', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomers', @level2type=N'COLUMN', @level2name=N'active'; 
;





/* Drop table dbo.DimStaff */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimStaff') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimStaff 
;

/* Create table dbo.DimStaff */
CREATE TABLE dbo.DimStaff (
   [staff_key]  int IDENTITY  NOT NULL
,  [staff_id]  int   NOT NULL
,  [store_id]  int   NOT NULL
,  [manager_staff_id]  int   NOT NULL
,  [address_store_id]  int   NOT NULL
,  [city]  varchar(50)   NOT NULL
,  [district]  varchar(20)   NOT NULL
,  [country]  varchar(50)   NOT NULL
,  [full_name]  varchar(90)   NOT NULL
,  [email]  varchar(50)   NOT NULL
,  [active]  bit  DEFAULT -1 NULL
, CONSTRAINT [PK_dbo.DimStaff] PRIMARY KEY CLUSTERED 
( [staff_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimStaff
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Staffs', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimStaff
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimStaff
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Staffs dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimStaff
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Staffs]'))
DROP VIEW [MDWT].[Staffs]
GO
CREATE VIEW [MDWT].[Staffs] AS 
SELECT [staff_key] AS [staff_key]
, [staff_id] AS [staff_id]
, [store_id] AS [store_id]
, [manager_staff_id] AS [manager_staff_id]
, [address_store_id] AS [address_store_id]
, [city] AS [city]
, [district] AS [district]
, [country] AS [country]
, [full_name] AS [full_name]
, [email] AS [email]
, [active] AS [active]
FROM dbo.DimStaff
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'staff_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'staff_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'store_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'store_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'manager_staff_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'manager_staff_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'address_store_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'address_store_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'city', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'district', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'full_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'full_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'email', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'active', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'store_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'manager_staff_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'address_store_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The city of store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The district of store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The country of store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The fullname of staff', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'full_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The e-mail of staff', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the staff is working now (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'store_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'manager_staff_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'address_store_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 0', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'store_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'manager_staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'address_store_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'full_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'store_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'manager_staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'address_store_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'full_name'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'staff', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'staff', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'store_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'manager_staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'address_store_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'staff', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'full_name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'staff', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'staff', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SupplierID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'store_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'store_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'manager_staff_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'manager_staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'address_store_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'address_store_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'city', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'district', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'full_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'full_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'email', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'active', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'active'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'store_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'manager_staff_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'address_store_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'full_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'email'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimStaff', @level2type=N'COLUMN', @level2name=N'active'; 
;





/* Drop table dbo.DimAddress */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimAddress') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimAddress 
;

/* Create table dbo.DimAddress */
CREATE TABLE dbo.DimAddress (
   [address_key]  int IDENTITY  NOT NULL
,  [address_id]  int   NOT NULL
,  [address]  varchar(50)   NOT NULL
,  [address2]  varchar(50)  DEFAULT 'N/A' NULL
,  [district]  varchar(20)   NOT NULL
,  [city_id]  int   NOT NULL
,  [city]  varchar(50)   NOT NULL
,  [country_id]  SMALLINT   NOT NULL
,  [country]  varchar(50)   NOT NULL
,  [postal_code]  varchar(10)  DEFAULT 'N/A' NULL
,  [phone]  varchar(20)   NOT NULL
, CONSTRAINT [PK_dbo.DimAddress] PRIMARY KEY CLUSTERED 
( [address_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAddress
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'address', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAddress
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAddress
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Suppliers dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAddress
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[address]'))
DROP VIEW [MDWT].[address]
GO
CREATE VIEW [MDWT].[address] AS 
SELECT [address_key] AS [address_key]
, [address_id] AS [address_id]
, [address] AS [address]
, [address2] AS [address2]
, [district] AS [district]
, [city_id] AS [city_id]
, [city] AS [city]
, [country_id] AS [country_id]
, [country] AS [country]
, [postal_code] AS [postal_code]
, [phone] AS [phone]
FROM dbo.DimAddress
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'address_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'address_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'address2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address2'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'district', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'city_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'city', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'country_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'postal_code', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'postal_code'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'phone', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'phone'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The first address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The second address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address2'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'District of address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'City_id of address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The id of the country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The name of the country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The postal_code of address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'postal_code'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Phone number', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'phone'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address2'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'postal_code'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'phone'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address2'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'postal_code'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'phone'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address2'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'postal_code'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'phone'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'address_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'address2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address2'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'district', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'city_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'city', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'country_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'postal_code', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'postal_code'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'phone', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'phone'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'address2'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'SMALLINT', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'postal_code'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAddress', @level2type=N'COLUMN', @level2name=N'phone'; 
;





/* Drop table dbo.DimActor */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimActor') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimActor 
;

/* Create table dbo.DimActor */
CREATE TABLE dbo.DimActor (
   [actor_key]  int IDENTITY  NOT NULL
,  [actor_id]  int   NOT NULL
,  [film_id]  int   NOT NULL
,  [first_name]  varchar(45)   NULL
,  [last_name]  varchar(45)   NULL
, CONSTRAINT [PK_dbo.DimActor] PRIMARY KEY CLUSTERED 
( [actor_key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimActor
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Actors', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimActor
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimActor
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimActor
;

SET IDENTITY_INSERT dbo.DimActor ON
;
INSERT INTO dbo.DimActor (actor_key, actor_id, film_id, first_name, last_name)
VALUES (-1, -1, -1, 'N/A', 'N/A')
;
SET IDENTITY_INSERT dbo.DimActor OFF
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Actors]'))
DROP VIEW [MDWT].[Actors]
GO
CREATE VIEW [MDWT].[Actors] AS 
SELECT [actor_key] AS [actor_key]
, [actor_id] AS [actor_id]
, [film_id] AS [film_id]
, [first_name] AS [first_name]
, [last_name] AS [last_name]
FROM dbo.DimActor
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'actor_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'actor_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'film_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'first_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'last_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business key from source system (aka natural key)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The FilmId of the Film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The FirstName of the Actor', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The name of supplying company', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'PENELOPE', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'GUINESS', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_key'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sakila', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Actor', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Film', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Actor', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Actor', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'actor_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'film_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'first_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'last_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'actor_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'film_id'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimActor', @level2type=N'COLUMN', @level2name=N'last_name'; 
;





/* Drop table dbo.FactBPerformance */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactBPerformance') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactBPerformance 
;

/* Create table dbo.FactBPerformance */
CREATE TABLE dbo.FactBPerformance (
   [staff_key]  int   NOT NULL
,  [rental_key]  int   NOT NULL
,  [store_id]  int   NOT NULL
,  [store_address_key]  int   NOT NULL
,  [city]  varchar(50)   NOT NULL
,  [district]  varchar(20)   NOT NULL
,  [country]  varchar(50)   NOT NULL
,  [full_name]  varchar(90)   NOT NULL
,  [amount]  decimal   NOT NULL
,  [quantity]  int  DEFAULT -1 NULL
,  [revenue]  decimal  DEFAULT -1 NULL
,  [rental_date_key]  int   NOT NULL
,  [payment_date_key]  int   NOT NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPerformance
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Business-Performance', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPerformance
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPerformance
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPerformance
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Business-Performance]'))
DROP VIEW [MDWT].[Business-Performance]
GO
CREATE VIEW [MDWT].[Business-Performance] AS 
SELECT [staff_key] AS [staff_key]
, [rental_key] AS [rental_key]
, [store_id] AS [store_id]
, [store_address_key] AS [store_address_key]
, [city] AS [city]
, [district] AS [district]
, [country] AS [country]
, [full_name] AS [full_name]
, [amount] AS [amount]
, [quantity] AS [quantity]
, [revenue] AS [revenue]
, [rental_date_key] AS [rental_date_key]
, [payment_date_key] AS [payment_date_key]
FROM dbo.FactBPerformance
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'staff_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'staff_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'rental_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'store_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'store_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'store_address_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'store_address_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'city', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'district', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'district'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'full_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'full_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'amount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'amount'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'quantity'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'revenue', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'revenue'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'rental_date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'payment_date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'payment_date_key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Staff dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPerformance', @level2type=N'COLUMN', @level2name=N'staff_key'; 
;





/* Drop table dbo.FactRentalExpense */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactRentalExpense') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactRentalExpense 
;

/* Create table dbo.FactRentalExpense */
CREATE TABLE dbo.FactRentalExpense (
   [customer_key]  int   NOT NULL
,  [rental_key]  int   NULL
,  [full_name]  varchar(90)   NOT NULL
,  [customer_address_key]  int   NOT NULL
,  [city]  varchar(50)   NOT NULL
,  [country]  varchar(50)   NOT NULL
,  [expense]  decimal  DEFAULT -1 NULL
,  [total_expense]  float  DEFAULT -1 NULL
,  [rental_date_key]  int   NOT NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactRentalExpense
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Rental-Expense', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactRentalExpense
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactRentalExpense
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactRentalExpense
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Rental-Expense]'))
DROP VIEW [MDWT].[Rental-Expense]
GO
CREATE VIEW [MDWT].[Rental-Expense] AS 
SELECT [customer_key] AS [customer_key]
, [rental_key] AS [rental_key]
, [full_name] AS [full_name]
, [customer_address_key] AS [customer_address_key]
, [city] AS [city]
, [country] AS [country]
, [expense] AS [expense]
, [total_expense] AS [total_expense]
, [rental_date_key] AS [rental_date_key]
FROM dbo.FactRentalExpense
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRentalExpense', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRentalExpense', @level2type=N'COLUMN', @level2name=N'rental_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'full_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRentalExpense', @level2type=N'COLUMN', @level2name=N'full_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_address_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRentalExpense', @level2type=N'COLUMN', @level2name=N'customer_address_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'city', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRentalExpense', @level2type=N'COLUMN', @level2name=N'city'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRentalExpense', @level2type=N'COLUMN', @level2name=N'country'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'expense', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRentalExpense', @level2type=N'COLUMN', @level2name=N'expense'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'total_expense', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRentalExpense', @level2type=N'COLUMN', @level2name=N'total_expense'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactRentalExpense', @level2type=N'COLUMN', @level2name=N'rental_date_key'; 
;





/* Drop table dbo.FactBPFilmActor */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactBPFilmActor') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactBPFilmActor 
;

/* Create table dbo.FactBPFilmActor */
CREATE TABLE dbo.FactBPFilmActor (
   [actor_key]  int   NOT NULL
,  [rental_key]  int   NOT NULL
,  [inventory_key]  int   NOT NULL
,  [rental_date_key]  int   NOT NULL
,  [RentalFilm]  smallint  DEFAULT -1 NULL
,  [ActorFamous]  smallint  DEFAULT -1 NULL
,  [ActorCategory]  smallint  DEFAULT -1 NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPFilmActor
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Film-Actor', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPFilmActor
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPFilmActor
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPFilmActor
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Film-Actor]'))
DROP VIEW [MDWT].[Film-Actor]
GO
CREATE VIEW [MDWT].[Film-Actor] AS 
SELECT [actor_key] AS [actor_key]
, [rental_key] AS [rental_key]
, [inventory_key] AS [inventory_key]
, [rental_date_key] AS [rental_date_key]
, [RentalFilm] AS [RentalFilm]
, [ActorFamous] AS [ActorFamous]
, [ActorCategory] AS [ActorCategory]
FROM dbo.FactBPFilmActor
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'actor_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmActor', @level2type=N'COLUMN', @level2name=N'actor_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmActor', @level2type=N'COLUMN', @level2name=N'rental_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'inventory_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmActor', @level2type=N'COLUMN', @level2name=N'inventory_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmActor', @level2type=N'COLUMN', @level2name=N'rental_date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RentalFilm', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmActor', @level2type=N'COLUMN', @level2name=N'RentalFilm'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ActorFamous', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmActor', @level2type=N'COLUMN', @level2name=N'ActorFamous'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ActorCategory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmActor', @level2type=N'COLUMN', @level2name=N'ActorCategory'; 
;





/* Drop table dbo.FactBPFilmInventory */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactBPFilmInventory') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactBPFilmInventory 
;

/* Create table dbo.FactBPFilmInventory */
CREATE TABLE dbo.FactBPFilmInventory (
   [inventory_key]  int   NOT NULL
,  [rental_key]  int   NOT NULL
,  [rental_date_key]  int   NOT NULL
,  [Remaining]  smallint  DEFAULT -1 NULL
,  [TotalRentalAmount]  smallint  DEFAULT -1 NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPFilmInventory
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Film-Inventory', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPFilmInventory
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPFilmInventory
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPFilmInventory
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Film-Inventory]'))
DROP VIEW [MDWT].[Film-Inventory]
GO
CREATE VIEW [MDWT].[Film-Inventory] AS 
SELECT [inventory_key] AS [inventory_key]
, [rental_key] AS [rental_key]
, [rental_date_key] AS [rental_date_key]
, [Remaining] AS [Remaining]
, [TotalRentalAmount] AS [TotalRentalAmount]
FROM dbo.FactBPFilmInventory
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'inventory_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmInventory', @level2type=N'COLUMN', @level2name=N'inventory_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmInventory', @level2type=N'COLUMN', @level2name=N'rental_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmInventory', @level2type=N'COLUMN', @level2name=N'rental_date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Remaining', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmInventory', @level2type=N'COLUMN', @level2name=N'Remaining'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TotalRentalAmount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPFilmInventory', @level2type=N'COLUMN', @level2name=N'TotalRentalAmount'; 
;





/* Drop table dbo.FactBPCustomer */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactBPCustomer') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactBPCustomer 
;

/* Create table dbo.FactBPCustomer */
CREATE TABLE dbo.FactBPCustomer (
   [customer_key]  int   NOT NULL
,  [first_name]  varchar   NOT NULL
,  [last_name]  varchar   NOT NULL
,  [address_key]  int   NOT NULL
,  [address]  varchar(50)   NOT NULL
,  [rental_key]  int   NOT NULL
,  [rental_id]  int   NOT NULL
,  [rental_date_key]  int   NOT NULL
,  [amount]  DECIMAL(5,2)  DEFAULT -1 NULL
,  [payment_date_key]  int   NOT NULL
,  [recency]  int   NOT NULL
,  [frequency]  int   NOT NULL
,  [monetary]  decimal(5,2)   NOT NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPCustomer
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Customer-Behavior', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPCustomer
exec sys.sp_addextendedproperty @name=N'Database Schema', @value=N'dbo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPCustomer
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Always create a table description, which becomes a table extended property.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactBPCustomer
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Customer-Behavior]'))
DROP VIEW [MDWT].[Customer-Behavior]
GO
CREATE VIEW [MDWT].[Customer-Behavior] AS 
SELECT [customer_key] AS [customer_key]
, [first_name] AS [first_name]
, [last_name] AS [last_name]
, [address_key] AS [address_key]
, [address] AS [address]
, [rental_key] AS [rental_key]
, [rental_id] AS [rental_id]
, [rental_date_key] AS [rental_date]
, [amount] AS [amount]
, [payment_date_key] AS [payment_date_key]
, [recency] AS [recency]
, [frequency] AS [frequency]
, [monetary] AS [monetary]
FROM dbo.FactBPCustomer
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'customer_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'customer_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'first_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'first_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'last_name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'last_name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'address_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'address_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'address'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'rental_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_id', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'rental_id'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'rental_date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'rental_date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'amount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'amount'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'payment_date_key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'payment_date_key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'recency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'recency'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'frequency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'frequency'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'monetary', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactBPCustomer', @level2type=N'COLUMN', @level2name=N'monetary'; 
;
ALTER TABLE dbo.FactBPerformance ADD CONSTRAINT
   FK_dbo_FactBPerformance_staff_key FOREIGN KEY
   (
   staff_key
   ) REFERENCES DimStaff
   ( staff_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPerformance ADD CONSTRAINT
   FK_dbo_FactBPerformance_rental_key FOREIGN KEY
   (
   rental_key
   ) REFERENCES DimRental
   ( rental_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPerformance ADD CONSTRAINT
   FK_dbo_FactBPerformance_store_address_key FOREIGN KEY
   (
   store_address_key
   ) REFERENCES DimAddress
   ( address_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPerformance ADD CONSTRAINT
   FK_dbo_FactBPerformance_rental_date_key FOREIGN KEY
   (
   rental_date_key
   ) REFERENCES DimDate
   ( date_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPerformance ADD CONSTRAINT
   FK_dbo_FactBPerformance_payment_date_key FOREIGN KEY
   (
   payment_date_key
   ) REFERENCES DimDate
   ( date_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactRentalExpense ADD CONSTRAINT
   FK_dbo_FactRentalExpense_customer_key FOREIGN KEY
   (
   customer_key
   ) REFERENCES DimCustomers
   ( customer_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactRentalExpense ADD CONSTRAINT
   FK_dbo_FactRentalExpense_rental_key FOREIGN KEY
   (
   rental_key
   ) REFERENCES DimRental
   ( rental_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactRentalExpense ADD CONSTRAINT
   FK_dbo_FactRentalExpense_customer_address_key FOREIGN KEY
   (
   customer_address_key
   ) REFERENCES DimAddress
   ( address_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactRentalExpense ADD CONSTRAINT
   FK_dbo_FactRentalExpense_rental_date_key FOREIGN KEY
   (
   rental_date_key
   ) REFERENCES DimDate
   ( date_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPFilmActor ADD CONSTRAINT
   FK_dbo_FactBPFilmActor_actor_key FOREIGN KEY
   (
   actor_key
   ) REFERENCES DimActor
   ( actor_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPFilmActor ADD CONSTRAINT
   FK_dbo_FactBPFilmActor_rental_key FOREIGN KEY
   (
   rental_key
   ) REFERENCES DimRental
   ( rental_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPFilmActor ADD CONSTRAINT
   FK_dbo_FactBPFilmActor_inventory_key FOREIGN KEY
   (
   inventory_key
   ) REFERENCES DimInventory
   ( inventory_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPFilmActor ADD CONSTRAINT
   FK_dbo_FactBPFilmActor_rental_date_key FOREIGN KEY
   (
   rental_date_key
   ) REFERENCES DimDate
   ( date_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPFilmInventory ADD CONSTRAINT
   FK_dbo_FactBPFilmInventory_inventory_key FOREIGN KEY
   (
   inventory_key
   ) REFERENCES DimInventory
   ( Inventory_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPFilmInventory ADD CONSTRAINT
   FK_dbo_FactBPFilmInventory_rental_key FOREIGN KEY
   (
   rental_key
   ) REFERENCES DimRental
   ( rental_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPFilmInventory ADD CONSTRAINT
   FK_dbo_FactBPFilmInventory_rental_date_key FOREIGN KEY
   (
   rental_date_key
   ) REFERENCES DimDate
   ( date_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPCustomer ADD CONSTRAINT
   FK_dbo_FactBPCustomer_customer_key FOREIGN KEY
   (
   customer_key
   ) REFERENCES DimCustomers
   ( customer_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPCustomer ADD CONSTRAINT
   FK_dbo_FactBPCustomer_address_key FOREIGN KEY
   (
   address_key
   ) REFERENCES DimAddress
   ( address_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPCustomer ADD CONSTRAINT
   FK_dbo_FactBPCustomer_rental_key FOREIGN KEY
   (
   rental_key
   ) REFERENCES DimRental
   ( rental_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPCustomer ADD CONSTRAINT
   FK_dbo_FactBPCustomer_rental_date_key FOREIGN KEY
   (
   rental_date_key
   ) REFERENCES DimDate
   ( date_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactBPCustomer ADD CONSTRAINT
   FK_dbo_FactBPCustomer_payment_date_key FOREIGN KEY
   (
   payment_date_key
   ) REFERENCES DimDate
   ( date_key )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
