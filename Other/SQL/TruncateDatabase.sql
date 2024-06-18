USE [PROGRAMAS]
GO

DROP PROCEDURE IF EXISTS dbo.Cleaning
GO

CREATE PROCEDURE dbo.Cleaning
AS
    BEGIN
        DECLARE @CONSTRAINTS VARCHAR(max);

        SELECT @CONSTRAINTS = STRING_AGG('ALTER TABLE [' +  OBJECT_SCHEMA_NAME(parent_object_id) +
            '].[' + OBJECT_NAME(parent_object_id) + 
            '] DROP CONSTRAINT [' + name + '];', ' ')
        FROM sys.foreign_keys;

        EXEC (@CONSTRAINTS);

        DECLARE @TABLES_TO_DELETE VARCHAR(max);

        SELECT @TABLES_TO_DELETE = STRING_AGG('DELETE FROM [' + TABLE_NAME + ']; DBCC CHECKIDENT (' + TABLE_NAME + ', RESEED, 0);', ' ') FROM INFORMATION_SCHEMA.TABLES;

        EXEC (@TABLES_TO_DELETE);
    END
GO
