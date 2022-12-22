USE [master];
GO

-- ****************************************
-- Drop Database
-- ****************************************

IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'CleanData')
    DROP DATABASE CleanData;

-- If the database has any other open connections close the network connection.
IF @@ERROR = 3702 
    RAISERROR('CleanData database cannot be dropped because there are still other open connections', 127, 127) WITH NOWAIT, LOG;
GO

-- ****************************************
-- Create Database
-- ****************************************

CREATE DATABASE CleanData;
GO

USE CleanData;
GO

-- ******************************************************
-- Create tables DataClean
-- ******************************************************

CREATE TABLE [dbo].[CasesReportDataClean](
	[Outcome] [nvarchar](20) NULL,
	[Age] [char](3) NULL,
	[Gender] [nvarchar](6) NULL,
	[ReportingPHU] [nvarchar](100) NULL,
	[SpecimenDate] [date] NULL,
	[CaseReportedDate] [date] NULL,
	[PHUCity] [nvarchar](20) NULL,
	[TestReportedDate] [date] NULL,
	[CaseAcquisitionInfo] [nvarchar](20) NULL,
	[AccurateEpisodeDate] [date] NULL,
	[PHUAddress] [nvarchar](50) NULL,
	[PHUWebsite] [nvarchar](50) NULL,
	[OutbreakRelated] [nvarchar](5) NULL,
	[PHULatitude] [float](50) NULL,
	[PHULongitude] [float](50) NULL,
	[PHUPostalCode] [char](7) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[CompiledCOVID19CaseDetailsDataClean](
	[ObjectId] [int] NOT NULL,
	[row_id] [int] NULL,
	[date_reported] [date] NULL,
	[health_region] [varchar](100) NULL,
	[age_group] [nvarchar](20) NULL,
	[gender] [nvarchar](6) NULL,
	[exposure] [nvarchar](20) NULL,
	[case_status] [nvarchar](10) NULL,
	[province] [nvarchar](20) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[OngoingOutbreaksPhuDataClean](
	[date] [date] NULL,
	[phu_num] [int] NULL,
	[outbreak_group] [nvarchar](20) NULL,
	[number_ongoing_outbreaks] [int] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PublicHealthUnitDataClean](
	[PHU_ID] [int] NOT NULL,
	[Reporting_PHU] [nvarchar](100) NULL,
	[Reporting_PHU_Address] [nvarchar](50) NULL,
	[Reporting_PHU_City] [nvarchar](20) NULL,
	[Reporting_PHU_Postal_Code] [char](7) NULL,
	[Reporting_PHU_Website] [nvarchar](50) NULL,
	[Reporting_PHU_Latitude] [float] NULL,
	[Reporting_PHU_Longitude] [float] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PublicHealthUnitsGROUPDataClean](
	[PHU_Group] [nvarchar](50) NULL,
	[PHU_City] [nvarchar](20) NULL,
	[PHU_region] [nvarchar](100) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[VaccinesByAgePhuDataClean](
	[Date] [date] NULL,
	[PHU_ID] [int] NULL,
	[Agegroup] [nvarchar](30) NULL,
	[At_least_one_dose_cumulative] [int] NULL,
	[Second_dose_cumulative] [int] NULL,
	[fully_vaccinated_cumulative] [int] NULL,
	[third_dose_cumulative] [int] NULL
) ON [PRIMARY];
GO

-- ******************************************************
-- Create tables DataNull
-- ******************************************************

CREATE TABLE [dbo].[CasesReportDataNull](
	[Outcome] [nvarchar](20) NULL,
	[Age] [char](3) NULL,
	[Gender] [nvarchar](6) NULL,
	[ReportingPHU] [nvarchar](100) NULL,
	[SpecimenDate] [date] NULL,
	[CaseReportedDate] [date] NULL,
	[PHUCity] [nvarchar](20) NULL,
	[TestReportedDate] [date] NULL,
	[CaseAcquisitionInfo] [nvarchar](20) NULL,
	[AccurateEpisodeDate] [date] NULL,
	[PHUAddress] [nvarchar](50) NULL,
	[PHUWebsite] [nvarchar](50) NULL,
	[OutbreakRelated] [nvarchar](5) NULL,
	[PHULatitude] [float](50) NULL,
	[PHULongitude] [float](50) NULL,
	[PHUPostalCode] [char](7) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[CompiledCOVID19CaseDetailsDataNull](
	[ObjectId] [int] NOT NULL,
	[row_id] [int] NULL,
	[date_reported] [date] NULL,
	[health_region] [varchar](100) NULL,
	[age_group] [nvarchar](20) NULL,
	[gender] [nvarchar](6) NULL,
	[exposure] [nvarchar](20) NULL,
	[case_status] [nvarchar](10) NULL,
	[province] [nvarchar](20) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[OngoingOutbreaksPhuDataNull](
	[date] [date] NULL,
	[phu_num] [int] NULL,
	[outbreak_group] [nvarchar](20) NULL,
	[number_ongoing_outbreaks] [int] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PublicHealthUnitDataNull](
	[PHU_ID] [int] NOT NULL,
	[Reporting_PHU] [nvarchar](100) NULL,
	[Reporting_PHU_Address] [nvarchar](50) NULL,
	[Reporting_PHU_City] [nvarchar](20) NULL,
	[Reporting_PHU_Postal_Code] [char](7) NULL,
	[Reporting_PHU_Website] [nvarchar](50) NULL,
	[Reporting_PHU_Latitude] [float] NULL,
	[Reporting_PHU_Longitude] [float] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PublicHealthUnitsGROUPDataNull](
	[PHU_Group] [nvarchar](50) NULL,
	[PHU_City] [nvarchar](20) NULL,
	[PHU_region] [nvarchar](100) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[VaccinesByAgePhuDataNull](
	[Date] [date] NULL,
	[PHU_ID] [int] NULL,
	[Agegroup] [nvarchar](30) NULL,
	[At_least_one_dose_cumulative] [int] NULL,
	[Second_dose_cumulative] [int] NULL,
	[fully_vaccinated_cumulative] [int] NULL,
	[third_dose_cumulative] [int] NULL
) ON [PRIMARY];
GO