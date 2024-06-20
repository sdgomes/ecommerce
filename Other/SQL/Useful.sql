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

/** Outras Funcoes */

DROP FUNCTION IF EXISTS RepetirRegistros
GO

CREATE FUNCTION RepetirRegistros (
	@qntCompra int
) RETURNS TABLE RETURN (
	WITH TEMP_TABLE AS (
		SELECT 1 AS REPETICAO
		UNION ALL
		SELECT REPETICAO + 1
			FROM TEMP_TABLE
			WHERE
		 (REPETICAO + 1) <= @qntCompra
		)
  SELECT * FROM TEMP_TABLE
)