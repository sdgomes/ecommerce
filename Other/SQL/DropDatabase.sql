USE [PROGRAMAS]
GO

DROP PROCEDURE IF EXISTS dbo.dropEcommerce
GO

CREATE PROCEDURE dbo.dropEcommerce
AS
    BEGIN
        DECLARE @CONSTRAINTS VARCHAR(max);

        SELECT @CONSTRAINTS = STRING_AGG('ALTER TABLE [' +  OBJECT_SCHEMA_NAME(parent_object_id) +
            '].[' + OBJECT_NAME(parent_object_id) + 
            '] DROP CONSTRAINT [' + name + '];', ' ')
        FROM sys.foreign_keys;

        EXEC (@CONSTRAINTS);

        DECLARE @TABLES VARCHAR(max);

        SELECT @TABLES = STRING_AGG('DROP TABLE [' + name + '];', ' ') FROM sys.tables;

        EXEC (@TABLES);
    END
GO