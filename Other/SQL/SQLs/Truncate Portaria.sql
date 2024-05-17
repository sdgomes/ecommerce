USE [PROGRAMAS]
GO

DECLARE @TABLES_TO_DELETE VARCHAR(max);


SELECT @TABLES_TO_DELETE = STRING_AGG('DELETE FROM [' + TABLE_NAME + ']; DBCC CHECKIDENT (' + TABLE_NAME + ', RESEED, 0);', ' ') FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME LIKE 'POR_%';

EXEC (@TABLES_TO_DELETE);