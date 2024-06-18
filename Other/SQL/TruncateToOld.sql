USE [PROGRAMAS]
GO

DROP PROCEDURE IF EXISTS dbo.Limpeza
GO

CREATE PROCEDURE dbo.Limpeza @Tabela VARCHAR(255) = ''
AS
    IF @Tabela <> ''
        BEGIN
            DECLARE @CONSTRAINTS VARCHAR(max);

           SELECT @CONSTRAINTS = STUFF((
                SELECT 'ALTER TABLE [' + CAST(OBJECT_SCHEMA_NAME(TEMPSYS.parent_object_id) AS VARCHAR(MAX)) +
                '].[' + CAST(OBJECT_NAME(TEMPSYS.parent_object_id) AS VARCHAR(MAX)) +	
                '] DROP CONSTRAINT [' + name + '];' + ' ' 
                FROM sys.foreign_keys TEMPSYS WHERE OBJECT_NAME(TEMPSYS.parent_object_id) LIKE CONCAT(@Tabela, '%')
                FOR XML PATH ('')
            ), 1, 0, '')

            EXEC (@CONSTRAINTS);

            DECLARE @TABLES_TO_DELETE VARCHAR(MAX);

            SELECT @TABLES_TO_DELETE = STUFF((
                SELECT 'DELETE FROM [' + TEMPSCHEMA.TABLE_NAME + ']; DBCC CHECKIDENT (' + TEMPSCHEMA.TABLE_NAME + ', RESEED, 0);' + ' ' 
                FROM INFORMATION_SCHEMA.TABLES TEMPSCHEMA WHERE TEMPSCHEMA.TABLE_NAME LIKE CONCAT(@Tabela, '%')
                FOR XML PATH ('')
            ), 1, 0, '')

            EXEC (@TABLES_TO_DELETE);
        END
    ELSE
        PRINT 'A variável @Tabela não pode ser nula ou vazia'  
        RETURN   
GO