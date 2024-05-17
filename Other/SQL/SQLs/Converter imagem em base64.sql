SELECT 
	documento,
    base64_img1 = CAST('' AS XML).value('xs:base64Binary(sql:column("img1"))','VARCHAR(MAX)')
FROM (
    SELECT 
	CONCAT('perfil_',documento,'.png;#;') as documento,
        img1 = CAST(foto as varbinary(max))
    FROM Visitante
    ) T