USE [master];
GO

-- ****************************************
-- Drop Database
-- ****************************************

IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'Ontario_Covid_Stage')
    DROP DATABASE Ontario_Covid_Stage;

-- If the database has any other open connections close the network connection.
IF @@ERROR = 3702 
    RAISERROR('Ontario_Covid_Stage database cannot be dropped because there are still other open connections', 127, 127) WITH NOWAIT, LOG;
GO

-- ****************************************
-- Create Database
-- ****************************************

CREATE DATABASE Ontario_Covid_Stage;
GO

USE Ontario_Covid_Stage;
GO

-- ******************************************************
-- Create tables
-- ******************************************************

CREATE TABLE [dbo].[CasesReport](
	[ObjectId] [int] IDENTITY(1,1) NOT NULL,
	[Outcome] [nvarchar](255) NULL,
	[Age] [nchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
	[ReportingPHU] [nvarchar](255) NULL,
	[SpecimenDate] [date] NULL,
	[CaseReportedDate] [date] NULL,
	[PHUCity] [nvarchar](255) NULL,
	[TestReportedDate] [date] NULL,
	[CaseAcquisitionInfo] [nvarchar](255) NULL,
	[AccurateEpisodeDate] [date] NULL,
	[PHUAddress] [nvarchar](255) NULL,
	[PHUWebsite] [nvarchar](255) NULL,
	[OutbreakRelated] [nvarchar](255) NULL,
	[PHULatitude] [float](50) NULL,
	[PHULongitude] [float](50) NULL,
	[PHUPostalCode] [nchar](255) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[CompiledCOVID19CaseDetails](
	[ObjectId] [int] NULL,
	[row_id] [int] NULL,
	[date_reported] [date] NULL,
	[health_region] [nvarchar](255) NULL,
	[age_group] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[exposure] [nvarchar](255) NULL,
	[case_status] [nvarchar](255) NULL,
	[province] [nvarchar](255) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[OngoingOutbreaksPhu](
	[date] [date] NULL,
	[phu_num] [int] NULL,
	[outbreak_group] [nvarchar](255) NULL,
	[number_ongoing_outbreaks] [int] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PublicHealthUnit](
	[PHU_ID] [int] NOT NULL,
	[Reporting_PHU] [nvarchar](255) NULL,
	[Reporting_PHU_Address] [nvarchar](255) NULL,
	[Reporting_PHU_City] [nvarchar](255) NULL,
	[Reporting_PHU_Postal_Code] [nchar](255) NULL,
	[Reporting_PHU_Website] [nvarchar](255) NULL,
	[Reporting_PHU_Latitude] [float] NULL,
	[Reporting_PHU_Longitude] [float] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PublicHealthUnitsGROUP](
	[PHU_Group] [nvarchar](255) NULL,
	[PHU_City] [nvarchar](255) NULL,
	[PHU_region] [nvarchar](255) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[VaccinesByAgePhu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[PHU_ID] [int] NULL,
	[Agegroup] [nvarchar](255) NULL,
	[At_least_one_dose_cumulative] [int] NULL,
	[Second_dose_cumulative] [int] NULL,
	[fully_vaccinated_cumulative] [int] NULL,
	[third_dose_cumulative] [int] NULL
) ON [PRIMARY];
GO		