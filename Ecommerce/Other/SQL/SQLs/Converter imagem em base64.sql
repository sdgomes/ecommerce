SELECT 
    IMAGEM = CONCAT('data:image/webp;base64,', CAST('' AS XML).value('xs:base64Binary(sql:column("IMG"))','VARCHAR(MAX)'))
FROM (
	SELECT
		IMG = CAST(IMAGEM AS VARBINARY(MAX))
	FROM POR_VISITANTE WHERE IMAGEM IS NOT NULL
) TEMPTABLE