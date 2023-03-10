USE [master];
GO

-- ****************************************
-- Drop Database
-- ****************************************

IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'METADATA')
    DROP DATABASE METADATA;

-- If the database has any other open connections close the network connection.
IF @@ERROR = 3702 
    RAISERROR('METADATA database cannot be dropped because there are still other open connections', 127, 127) WITH NOWAIT, LOG;
GO

-- ****************************************
-- Create Database
-- ****************************************

CREATE DATABASE METADATA;
GO

USE METADATA;
GO

/****** Object:  Table [dbo].[Data_Flow]    Script Date: 1/3/2022 5:13:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Data_Flow](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[LSET] [datetime] NULL,
	[CET] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--
-- Data for table dbo.Data_Flow  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[Data_Flow] ON
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [Name], [LSET], [CET])
VALUES 
  (1, N'CasesReport_Stage', '20010822 00:00:00.000', '20010822 00:00:00.000')
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [Name], [LSET], [CET])
VALUES 
  (2, N'CompiledCOVID19CaseDetails_Stage', '20010822 00:00:00.000', '20010822 00:00:00.000')
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [Name], [LSET], [CET])
VALUES 
  (3, N'OngoingOutbreaksPhu_Stage', '20010822 00:00:00.000', '20010822 00:00:00.000')
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [Name], [LSET], [CET])
VALUES 
  (4, N'PublicHealthUnit_Stage', '20010822 00:00:00.000', '20010822 00:00:00.000')
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [Name], [LSET], [CET])
VALUES 
  (5, N'PublicHealthUnitsGROUP_Stage', '20010822 00:00:00.000', '20010822 00:00:00.000')
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [Name], [LSET], [CET])
VALUES 
  (6, N'VaccinesByAgePhu_Stage', '20010822 00:00:00.000', '20010822 00:00:00.000')
GO

SET IDENTITY_INSERT [dbo].[Data_Flow] OFF
GO
