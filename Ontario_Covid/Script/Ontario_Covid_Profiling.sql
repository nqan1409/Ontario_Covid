USE [master];
GO

-- ****************************************
-- Drop Database
-- ****************************************

IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'ProfilingData')
    DROP DATABASE ProfilingData;

-- If the database has any other open connections close the network connection.
IF @@ERROR = 3702 
    RAISERROR('ProfilingData database cannot be dropped because there are still other open connections', 127, 127) WITH NOWAIT, LOG;
GO

-- ****************************************
-- Create Database
-- ****************************************

CREATE DATABASE ProfilingData;
GO

USE ProfilingData;
GO