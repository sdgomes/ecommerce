USE [PROGRAMAS]
GO

DROP PROCEDURE IF EXISTS dbo.populateEcommerce
GO

CREATE PROCEDURE dbo.populateEcommerce
AS
    BEGIN
        INSERT INTO ECM_BANDEIRAS (NOME)
        VALUES ('VISA'), ('MASTERCARD'),('HIPER'),
        ('ELO'), ('AURA'), ('AMEX'), ('VOYAGER'),
        ('DINERS'), ('JCB'), ('DISCOVER'), ('ENROUTE');

        INSERT INTO ECM_TIPOS_LOGRADOURO (NOME)
        VALUES ('AEROPORTO'), ('ALAMEDA'), ('ÁREA'), ('AVENIDA'), ('CAMPO'), 
        ('CHÁCARA'), ('COLÔNIA'), ('CONDOMÍNIO'), ('CONJUNTO'), ('DISTRITO'), 
        ('ESPLANADA'), ('ESTAÇÃO'), ('ESTRADA'), ('FAVELA'), ('FAZENDA'),
        ('FEIRA'), ('JARDIM'), ('LADEIRA'), ('LAGO'), ('LAGOA'), ('LARGO'),
        ('LOTEAMENTO'), ('MORRO'), ('NÚCLEO'), ('PARQUE'), ('PASSARELA'),
        ('PÁTIO'), ('PRAÇA'), ('QUADRA'), ('RECANTO'), ('RESIDENCIAL'),
        ('RODOVIA'), ('RUA'), ('SETOR'), ('SÍTIO'), ('TRAVESSA'), ('TRECHO'),
        ('TREVO'), ('VALE'), ('VEREDA'), ('VIA'), ('VIADUTO'), ('VIELA'), ('VILA');

        INSERT INTO ECM_TIPOS_RESIDENCIA (NOME)
        VALUES ('CASA'),('APARTAMENTO'),
        ('STUDIO'),('EMPRESA');

        INSERT INTO ECM_ESTADOS (NOME)
        VALUES ('AC'), ('AL'), ('AP'), ('AM'),
        ('BA'), ('CE'), ('DF'), ('ES'),
        ('GO'), ('MA'), ('MT'), ('MS'),
        ('MG'), ('PA'), ('PB'), ('PR'),
        ('PE'), ('PI'), ('RJ'), ('RN'),
        ('RS'), ('RO'), ('RR'), ('SC'),
        ('SP'), ('SE'), ('TO');

        INSERT INTO ECM_GENEROS (CHAVE, NOME)
        VALUES ('MASCULINO', 'Masculino'), ('FEMININO', 'Feminino'),
        ('GENERO_NEUTRO', 'Gênero Neutro'), ('NAO_BINARIO', 'Não-binário'),
        ('PREFIRO_NAO_DIZER', 'Prefiro Não Dizer');
    END
GO