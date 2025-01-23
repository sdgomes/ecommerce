USE [PROGRAMAS]
GO

DROP PROCEDURE IF EXISTS dbo.Cleaning
GO

CREATE PROCEDURE dbo.Cleaning
AS
    BEGIN
        DECLARE @CONSTRAINTS VARCHAR(max);

       SELECT @CONSTRAINTS = STUFF((
            SELECT 'ALTER TABLE [' + CAST(OBJECT_SCHEMA_NAME(TEMPSYS.parent_object_id) AS VARCHAR(MAX)) +
            '].[' + CAST(OBJECT_NAME(TEMPSYS.parent_object_id) AS VARCHAR(MAX)) +	
            '] DROP CONSTRAINT [' + name + '];' + ' ' 
            FROM sys.foreign_keys TEMPSYS 
            FOR XML PATH ('')
        ), 1, 0, '')

        EXEC (@CONSTRAINTS);

        DECLARE @TABLES_TO_DELETE VARCHAR(MAX);

        SELECT @TABLES_TO_DELETE = STUFF((
            SELECT 'DELETE FROM [' + TEMPSCHEMA.TABLE_NAME + ']; DBCC CHECKIDENT (' + TEMPSCHEMA.TABLE_NAME + ', RESEED, 1);' + ' ' 
            FROM INFORMATION_SCHEMA.TABLES TEMPSCHEMA 
            FOR XML PATH ('')
        ), 1, 0, '')

        EXEC (@TABLES_TO_DELETE);
    END  
GO