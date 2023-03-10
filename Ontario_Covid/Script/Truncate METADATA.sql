USE METADATA;
GO

TRUNCATE TABLE [dbo].[Data_Flow]
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