USE [PROGRAMAS]
GO

DROP PROCEDURE IF EXISTS dbo.Freshstart
GO

CREATE PROCEDURE dbo.Freshstart
AS
    BEGIN
        EXEC dbo.Elimination;
        EXEC dbo.Creation;
        EXEC dbo.Populate;
        EXEC dbo.Simulation;
    END
GO

DROP PROCEDURE IF EXISTS dbo.Cleardata
GO

CREATE PROCEDURE dbo.Cleardata
AS
    BEGIN
        EXEC dbo.Cleaning;
        EXEC dbo.Populate;
        EXEC dbo.Simulation;
    END
GO