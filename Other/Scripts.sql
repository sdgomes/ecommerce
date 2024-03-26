/** Drop Table */
SELECT 
    'ALTER TABLE [' +  OBJECT_SCHEMA_NAME(parent_object_id) +
    '].[' + OBJECT_NAME(parent_object_id) + 
    '] DROP CONSTRAINT [' + name + '];'
FROM sys.foreign_keys;

select 'DROP TABLE [' + name + '];'from sys.tables;


/** Truncate datebase */
SELECT 'DELETE FROM [' + TABLE_NAME + ']; DBCC CHECKIDENT (' + TABLE_NAME + ', RESEED, 0);' FROM INFORMATION_SCHEMA.TABLES