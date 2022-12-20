USE [master];
GO


-- ****************************************
-- Drop Database
-- ****************************************

IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'NDS')
    DROP DATABASE NDS;

-- If the database has any other open connections close the network connection.
IF @@ERROR = 3702 
    RAISERROR('NDS database cannot be dropped because there are still other open connections', 127, 127) WITH NOWAIT, LOG;
GO

-- ****************************************
-- Create Database
-- ****************************************

CREATE DATABASE NDS;
GO

USE NDS;
GO

-- ******************************************************
-- Create tables
-- ******************************************************
CREATE TABLE [dbo].[AgeGroup](
	[ID_AgeGroupSK] [int] IDENTITY(1,1) NOT NULL,
	[Age_Group] [nvarchar](20) NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];

CREATE TABLE [dbo].[Postalcode](
	[ID_PostalCodeSK] [int] IDENTITY(1,1) NOT NULL,
	[City] [nchar](3) NULL,
	[PostalCode] [char](7) NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];

CREATE TABLE [dbo].[PHU_Group](
	[ID_GROUPSK] [int] IDENTITY(1,1) NOT NULL,
	[PHU_Group] [nvarchar](50) NULL,
	[PHU_City] [nvarchar](20) NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];

CREATE TABLE [dbo].[PublicHealthUnit](
	[IDPHU_SK] [int] IDENTITY(1,1) NOT NULL,
	[PHU_ID] [int] NULL,
	[Reporting_PHU] [nvarchar](100) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](20) NULL,
	[Website] [nvarchar](50) NULL,
	[Latitude] [float] NULL,
	[Longtitude] [float] NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];

CREATE TABLE [dbo].[Outgoing_outbreaks](
	[IDOutbreakSK] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[PHU_ID] [int] NULL,
	[Outbreak_group] [nvarchar](20) NULL,
	[Number_outgoing_outbreaks] [int] NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];

CREATE TABLE [dbo].[VaccineByAge](
	[IDVaccineByAge_SK] [int] IDENTITY(1,1) NOT NULL,
	[PHU_ID] [int] NULL,
	[Date] [date] NULL,
	[Age_group] [nvarchar](30) NULL,
	[At least one dose_cumulative ] [int] NULL,
	[Second_dose_cumulative ] [int] NULL,
	[Fully_vaccinated_cumulative] [int] NULL,
	[Third_dose_cumulative ] [int] NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];

CREATE TABLE [dbo].[ReportedCases](
	[IDReportedCaseSK] [int] IDENTITY(1,1) NOT NULL,
	[CaseID] [int] NULL,
	[Case_status] [nvarchar](10) NULL,
	[Age_Group] [int] NULL,
	[Gender] [nvarchar](6) NULL,
	[PHU_ID] [int] NULL,
	[SpecimenDate] [date] NULL,
	[CaseReportedDate] [date] NULL,
	[TestReportedDate] [date] NULL,
	[CaseAccquistionInfo] [nvarchar](20) NULL,
	[AccurateEpisodeDate] [date] NULL,
	[OutbreakRelated] [nvarchar](5) NULL,
	[CreatDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY];


-- ******************************************************
-- Add Primary Keys
-- ******************************************************

ALTER TABLE [dbo].[AgeGroup] WITH CHECK ADD 
    CONSTRAINT [PK_AgeGroup] PRIMARY KEY CLUSTERED
	(
	[ID_AgeGroupSK]
	) ON [PRIMARY];
GO

ALTER TABLE [dbo].[Postalcode] WITH CHECK ADD 
    CONSTRAINT [PK_Postalcode] PRIMARY KEY CLUSTERED
	(
	[ID_PostalCodeSK]
	) ON [PRIMARY];
GO

ALTER TABLE [dbo].[PHU_Group] WITH CHECK ADD 
    CONSTRAINT [PK_PHU_Group] PRIMARY KEY CLUSTERED
	(
	[ID_GROUPSK]
	) ON [PRIMARY];
GO

ALTER TABLE [dbo].[PublicHealthUnit] WITH CHECK ADD 
    CONSTRAINT [PK_PublicHealthUnit] PRIMARY KEY CLUSTERED
	(
	[IDPHU_SK]
	) ON [PRIMARY];
GO

ALTER TABLE [dbo].[Outgoing_outbreaks] WITH CHECK ADD 
    CONSTRAINT [PK_Outgoing_outbreaks] PRIMARY KEY CLUSTERED
	(
	[IDOutbreakSK]
	) ON [PRIMARY];
GO

ALTER TABLE [dbo].[VaccineByAge] WITH CHECK ADD 
    CONSTRAINT [PK_VaccineByAge] PRIMARY KEY CLUSTERED
	(
	[IDVaccineByAge_SK]
	) ON [PRIMARY];
GO

ALTER TABLE [dbo].[ReportedCases] WITH CHECK ADD 
    CONSTRAINT [PK_ReportedCases] PRIMARY KEY CLUSTERED
	(
	[IDReportedCaseSK]
	) ON [PRIMARY];
GO

-- ****************************************
-- Create Foreign key constraints
-- ****************************************

--ALTER TABLE [dbo].[Outgoing_outbreaks] ADD 
--    CONSTRAINT [FK_Outgoing_outbreaks_PublicHealthUnit] FOREIGN KEY
--    (
--        [PHU_ID]
--    ) REFERENCES [dbo].[PublicHealthUnit] ([PHU_ID]);
--GO

--ALTER TABLE [dbo].[VaccineByAge] ADD 
--    CONSTRAINT [FK_VaccineByAge_PublicHealthUnit] FOREIGN KEY
--    (
--        [PHU_ID]
--    ) REFERENCES [dbo].[PublicHealthUnit] ([PHU_ID]);
--GO

--ALTER TABLE [dbo].[ReportedCases] ADD 
--    CONSTRAINT [FK_ReportedCases_PublicHealthUnit] FOREIGN KEY 
--    (
--        [PHU_ID]
--    )REFERENCES [dbo].[PublicHealthUnit] ([PHU_ID]),
--	CONSTRAINT [FK_ReportedCases_AgeGroup] FOREIGN KEY
--	(
--		[Age_Group]
--	) REFERENCES [dbo].[AgeGroup] ([ID_AgeGroupSK]);
--GO