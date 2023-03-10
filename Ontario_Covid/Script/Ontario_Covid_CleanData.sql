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
	[Outcome] [nvarchar](255) NULL,
	[Age] [nvarchar](255) NULL,
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
	[PHULatitude] [float] NULL,
	[PHULongitude] [float] NULL,
	[PHUPostalCode] [nvarchar](255) NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[CompiledCOVID19CaseDetailsDataClean](
	[ObjectId] [int] NULL,
	[row_id] [int] NULL,
	[date_reported] [datetime2] NULL,
	[health_region] [nvarchar](255) NULL,
	[age_group] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[exposure] [nvarchar](255) NULL,
	[case_status] [nvarchar](255) NULL,
	[province] [nvarchar](255) NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[OngoingOutbreaksPhuDataClean](
	[date] [date] NULL,
	[phu_num] [int] NULL,
	[outbreak_group] [nvarchar](255) NULL,
	[number_ongoing_outbreaks] [int] NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PublicHealthUnitDataClean](
	[PHU_ID] [int] NOT NULL,
	[Reporting_PHU] [nvarchar](255) NULL,
	[Reporting_PHU_Address] [nvarchar](255) NULL,
	[Reporting_PHU_City] [nvarchar](255) NULL,
	[Reporting_PHU_Postal_Code] [nvarchar](255) NULL,
	[Reporting_PHU_Website] [nvarchar](255) NULL,
	[Reporting_PHU_Latitude] [float] NULL,
	[Reporting_PHU_Longitude] [float] NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PublicHealthUnitsGROUPDataClean](
	[PHU_Group] [nvarchar](255) NULL,
	[PHU_City] [nvarchar](255) NULL,
	[PHU_region] [nvarchar](255) NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[VaccinesByAgePhuDataClean](
	[Date] [date] NULL,
	[PHU_ID] [int] NULL,
	[Agegroup] [nvarchar](255) NULL,
	[At_least_one_dose_cumulative] [int] NULL,
	[Second_dose_cumulative] [int] NULL,
	[fully_vaccinated_cumulative] [int] NULL,
	[third_dose_cumulative] [int] NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];
GO

-- ******************************************************
-- Create tables DataNull
-- ******************************************************

CREATE TABLE [dbo].[CasesReportDataNull](
	[Outcome] [nvarchar](255) NULL,
	[Age] [nvarchar](255) NULL,
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
	[PHULatitude] [float] NULL,
	[PHULongitude] [float] NULL,
	[PHUPostalCode] [nvarchar](255) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[CompiledCOVID19CaseDetailsDataNull](
	[ObjectId] [int] NULL,
	[row_id] [int] NULL,
	[date_reported] [datetime2] NULL,
	[health_region] [nvarchar](255) NULL,
	[age_group] [nvarchar](255) NULL,
	[gender] [nvarchar](255) NULL,
	[exposure] [nvarchar](255) NULL,
	[case_status] [nvarchar](255) NULL,
	[province] [nvarchar](255) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[OngoingOutbreaksPhuDataNull](
	[date] [date] NULL,
	[phu_num] [int] NULL,
	[outbreak_group] [nvarchar](255) NULL,
	[number_ongoing_outbreaks] [int] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PublicHealthUnitDataNull](
	[PHU_ID] [int] NULL,
	[Reporting_PHU] [nvarchar](255) NULL,
	[Reporting_PHU_Address] [nvarchar](255) NULL,
	[Reporting_PHU_City] [nvarchar](255) NULL,
	[Reporting_PHU_Postal_Code] [nvarchar](255) NULL,
	[Reporting_PHU_Website] [nvarchar](255) NULL,
	[Reporting_PHU_Latitude] [float] NULL,
	[Reporting_PHU_Longitude] [float] NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[PublicHealthUnitsGROUPDataNull](
	[PHU_Group] [nvarchar](255) NULL,
	[PHU_City] [nvarchar](255) NULL,
	[PHU_region] [nvarchar](255) NULL
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[VaccinesByAgePhuDataNull](
	[Date] [date] NULL,
	[PHU_ID] [int] NULL,
	[Agegroup] [nvarchar](255) NULL,
	[At_least_one_dose_cumulative] [int] NULL,
	[Second_dose_cumulative] [int] NULL,
	[fully_vaccinated_cumulative] [int] NULL,
	[third_dose_cumulative] [int] NULL
) ON [PRIMARY];
GO