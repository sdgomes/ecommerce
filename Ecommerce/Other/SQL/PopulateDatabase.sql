USE [PROGRAMAS]
GO

DROP PROCEDURE IF EXISTS dbo.Populate
GO

CREATE PROCEDURE dbo.Populate
AS
    BEGIN
       INSERT INTO ECM_BANDEIRAS (NOME, COR, IMAGEM)
        VALUES ('VISA', 'linear-gradient(to right, #005ca8, #f6a723)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Bandeiras\visa.png', SINGLE_BLOB) AS IMAGE)),
        ('MASTERCARD', 'linear-gradient(45deg, #f50014, #f79c03)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Bandeiras\mastercard.png', SINGLE_BLOB) AS IMAGE)),
        ('HIPER', 'linear-gradient(45deg, #950f18, #a1161c)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Bandeiras\hiper.png', SINGLE_BLOB) AS IMAGE)),
        ('ELO', 'linear-gradient(45deg, #009fd8, #f7c405, #e73f22)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Bandeiras\elo.png', SINGLE_BLOB) AS IMAGE)),
        ('AURA', 'linear-gradient(45deg, #6ab5a8, #398c76)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Bandeiras\aura.png', SINGLE_BLOB) AS IMAGE)),
        ('AMEX', 'linear-gradient(45deg, #aac2b8, #d6e6dc)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Bandeiras\amex.png', SINGLE_BLOB) AS IMAGE)),
        ('VOYAGER', 'linear-gradient(45deg, #afafaf, #2e2e2e)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Bandeiras\voyager.png', SINGLE_BLOB) AS IMAGE)),
        ('DINERS', 'linear-gradient(45deg, #a27c38, #947d3f)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Bandeiras\diners.png', SINGLE_BLOB) AS IMAGE)), 
        ('JCB', 'linear-gradient(45deg, #bca561, #dbc383)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Bandeiras\jcb.png', SINGLE_BLOB) AS IMAGE)), 
        ('DISCOVER', 'linear-gradient(45deg, #509dbd, #6cb4ce)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Bandeiras\discover.png', SINGLE_BLOB) AS IMAGE)),
        ('ENROUTE', 'linear-gradient(45deg, #242424, #000000)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Bandeiras\enroute.png', SINGLE_BLOB) AS IMAGE))

        INSERT INTO ECM_TIPOS_LOGRADOURO (NOME)
        VALUES ('AEROPORTO'), ('ALAMEDA'), ('ÁREA'), ('AVENIDA'), ('CAMPO'), 
        ('CHÁCARA'), ('COLÔNIA'), ('CONDOMÍNIO'), ('CONJUNTO'), ('DISTRITO'), 
        ('ESPLANADA'), ('ESTAÇÃO'), ('ESTRADA'), ('FAVELA'), ('FAZENDA'),
        ('FEIRA'), ('JARDIM'), ('LADEIRA'), ('LAGO'), ('LAGOA'), ('LARGO'),
        ('LOTEAMENTO'), ('MORRO'), ('NÚCLEO'), ('PARQUE'), ('PASSARELA'),
        ('PÁTIO'), ('PRAÇA'), ('QUADRA'), ('RECANTO'), ('RESIDENCIAL'),
        ('RODOVIA'), ('RUA'), ('SETOR'), ('SÍTIO'), ('TRAVESSA'), ('TRECHO'),
        ('TREVO'), ('VALE'), ('VEREDA'), ('VIA'), ('VIADUTO'), ('VIELA'), ('VILA')

        INSERT INTO ECM_TIPOS_RESIDENCIA (NOME)
        VALUES ('CASA'),('APARTAMENTO'),
        ('STUDIO'),('EMPRESA')

        INSERT INTO ECM_ESTADOS (NOME)
        VALUES ('AC'), ('AL'), ('AP'), ('AM'),
        ('BA'), ('CE'), ('DF'), ('ES'),
        ('GO'), ('MA'), ('MT'), ('MS'),
        ('MG'), ('PA'), ('PB'), ('PR'),
        ('PE'), ('PI'), ('RJ'), ('RN'),
        ('RS'), ('RO'), ('RR'), ('SC'),
        ('SP'), ('SE'), ('TO')

        INSERT INTO ECM_GENEROS (CHAVE, NOME)
        VALUES ('MASCULINO', 'Masculino'), ('FEMININO', 'Feminino'),
        ('GENERO_NEUTRO', 'Gênero Neutro'), ('NAO_BINARIO', 'Não-binário'),
        ('PREFIRO_NAO_DIZER', 'Prefiro Não Dizer')

        INSERT INTO ECM_CATEGORIAS (ID_CATEGORIA_PAI, SUBCATEGORIA, NOME)
        VALUES (NULL, 0, 'COLORIDOS'), (NULL, 0, 'PICTURE DISC'), (NULL, 0, 'TEMA'),
        (NULL, 0, 'SHOWS'), (NULL, 0, 'IMPORTADOS'), (NULL, 0, 'POP'), (NULL, 0, 'CLÁSSICA'),
        (NULL, 0, 'REGGAE'), (NULL, 0, 'RAP'), (NULL, 0, 'SERTANEJO'),
        (NULL, 0, 'SAMBA'), (NULL, 0, 'BLACK MUSIC'), (NULL, 0, 'COUNTRY'),
        (NULL, 0, 'ELETRÔNICA'), (NULL, 0, 'MPB'), (NULL, 0, 'ROCK')

        INSERT INTO ECM_CATEGORIAS (ID_CATEGORIA_PAI, SUBCATEGORIA, NOME)
        VALUES ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'TEMA'), 1, 'CARNAVAL'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'TEMA'), 1, 'INFANTIL'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'TEMA'), 1, 'FILMES'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'TEMA'), 1, 'NOVELAS'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'TEMA'), 1, 'ROMÂNTICO'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'TEMA'), 1, 'SERIADO'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'TEMA'), 1, 'RELIGIOSO'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'BLACK MUSIC'), 1, 'BLUES'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'BLACK MUSIC'), 1, 'FUNK'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'BLACK MUSIC'), 1, 'HIP HOP'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'BLACK MUSIC'), 1, 'HITS'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'BLACK MUSIC'), 1, 'JAZZ'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'COUNTRY'), 1, 'FOLK'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'BREAK'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'DANCE'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'DISCO MUSIC'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'DRUM N’ BASS'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'DUB'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'GARAGE'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'ELECTRO'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'GABBER'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'HARDCORE'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'HOUSE'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'JUNGLE'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'TECHNO'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ELETRÔNICA'), 1, 'TRANCE'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'MPB'), 1, 'FORRÓ'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'MPB'), 1, 'JOVEM GUARDA'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'MPB'), 1, 'LAMBADA'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'MPB'), 1, 'LATIN'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'MPB'), 1, 'PAGODE'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ROCK'), 1, 'HEAVY METAL'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ROCK'), 1, 'HARD ROCK'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ROCK'), 1, 'NEW WAVE'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ROCK'), 1, 'PUNK'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ROCK'), 1, 'PUNK ROCK'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ROCK'), 1, 'ROCK ALTERNATIVO'),
        ((SELECT ID_CATEGORIA FROM ECM_CATEGORIAS WHERE NOME = 'ROCK'), 1, 'ROCK NACIONAL') 

        INSERT INTO ECM_ETAPAS (ETAPA, COR)
        VALUES ('PROCESSANDO PAGAMENTO', '#ffd700'), ('EM PREPARAÇÃO', '#9b68d1'), ('A CAMINHO', '#007ad5'), ('ENTREGUE', '#00d57b'), ('DEVOLVIDO', '#b66e1f'), 
        ('TROCA SOLICITADA', '#b497b1'), ('DEVOLUÇÃO SOLICITADA', '#8aaad8'), ('ENVIADO PARA TROCA', '#e4d35e'), ('ENVIADO PARA DEVOLUÇÃO', '#f4e225'),
        ('COMPRA RECUSADA', '#ca5a41'), ('COMPRA APROVADA', '#2e8b57'), ('CANCELADO', '#fc1d1d'), ('REEMBOLSO', '#ff8800')

        INSERT INTO ECM_PRECIFICACOES (SUBCATEGORIA,TIPO,PRECO_MINIMO,PRECO_MAXIMO)
        VALUES ('CD','CD-R',297.08,882.81),
        ('CD','CD-RW',251.09,716.10),
        ('VINIL','VINIL MONOMERICO',281.58,837.56),
        ('VINIL','VINIL POLIMERICO',226.94,616.13)    

        INSERT INTO ECM_DESCONTOS (TIPO)
        VALUES ('CUPONS'),('CUPONS'),('CUPONS'),('CUPONS'),('CUPONS'),('CUPONS'),('CUPONS'),('CUPONS'),
        ('CUPONS'),('CUPONS'),('CUPONS'),('CUPONS'),('CUPONS'),('CUPONS'),('CUPONS'),('CUPONS'),('CUPONS'),
        ('CUPONS'),('CUPONS')

        INSERT INTO ECM_FRETES (ESTADO,PRECO)
        VALUES
        ('AC','13.33'), ('MT','84.41'),
        ('AL','68.36'), ('MS','75.49'),
        ('AP','43.60'), ('MG','70.24'),
        ('AM','71.26'), ('PA','84.04'),
        ('BA','27.27'), ('PB','98.34'),
        ('CE','31.18'), ('PR','81.86'),
        ('DF','84.32'), ('PE','78.01'),
        ('ES','49.14'), ('PI','58.12'),
        ('GO','11.47'), ('RJ','77.33'),
        ('MA','36.85'), ('RN','42.82')

        INSERT INTO ECM_FRETES (ESTADO,PRECO)
        VALUES
        ('RS','25.59'),
        ('RO','58.60'),
        ('RR','6.81'),
        ('SC','16.53'),
        ('SP','54.07'),
        ('SE','95.15'),
        ('TO','95.20')

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7899673881858','Batidão Tropical - Pabllo Vittar',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Batidão Tropical é o quarto álbum de estúdio do cantor e drag queen brasileiro Pabllo Vittar, lançado em 24 de junho de 2021, através da Sony Music Brasil.',0,0,0,'2024','Pabllo Vittar',41),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7893513377117','Não Para Não - Pabllo Vittar',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Não Para Não é o segundo álbum de estúdio do cantor e drag queen brasileiro Pabllo Vittar, lançado em 4 de outubro de 2018, através da Sony Music Brasil. O álbum contém participações de Urias, Dilsinho e Ludmilla. O primeiro single do disco, "Problema Seu", foi lançado em 15 de agosto de 2018.',0,0,0,'1992','Pabllo Vittar',26),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7898734244027','Noitada - Pabllo Vittar',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','Noitada é o quinto álbum de estúdio do cantor e drag queen brasileiro Pabllo Vittar, lançado em 8 de fevereiro de 2023, através da Sony Music Brasil.',0,0,0,'1992','Pabllo Vittar',38),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7895511388953','After - Pabllo Vittar',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','After é o quarto álbum de remixes do cantor e drag queen brasileiro Pabllo Vittar. Foi lançado no dia 27 de julho de 2023 pela Sony Music Brasil. A coletânea contém uma seleção de remixes de canções de seu quinto álbum de estúdio, Noitada. O disco traz a participação de diversos artistas nacionais.',0,0,0,'2021','Pabllo Vittar',40),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7892907498215','Batidão Tropical 2 - Pabllo Vittar',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','Batidão Tropical 2 será o sexto álbum de estúdio do cantor e drag queen brasileiro Pabllo Vittar, com lançamento prevista para abril de 2024',0,0,0,'1970','Pabllo Vittar',18),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7898650158417','Anti-Herói - Jão',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Anti-Herói é o segundo álbum de estúdio do cantor brasileiro Jão, lançado em 10 de outubro de 2019 através da Head Media e Universal Music. Foi co-escrito e co-produzido por Jão com Los Brasileiros e Paul Ralphes. Ele também trabalhou com André Jordão, Pedro Tófani e Pedro Calais.',0,0,0,'1985','Jão',28),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7898985117888','Lobos- Jão',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Lobos é o álbum de estúdio de estreia do cantor brasileiro Jão, lançado em 17 de agosto de 2018, através da Head Media e Universal Music. Os temas líricos do álbum giram em torno de suas narrativas pessoais que deixam visíveis suas fragilidades, tristezas e medos.',0,0,0,'2021','Jão',37),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7897820505246','Back to Black - Amy Winehouse',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Back to Black é o segundo álbum de estúdio da artista musical britânica Amy Winehouse, lançado primeiramente na Irlanda em 27 de outubro de 2006 e três dias depois no Reino Unido através da editora discográfica Island Records.',0,0,0,'1969','Amy Winehouse',40),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7895558082712','Amy - Amy Winehouse',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Amy é a trilha sonora original do filme de mesmo nome de 2015. Foi lançada pela Island Records em 30 de outubro de 2015. É a segunda compilação póstuma da cantora e compositora inglesa Amy Winehouse.',0,0,0,'1997','Amy Winehouse',30),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7890446177526','Lioness: Hidden Treasures - Amy Winehouse',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Lioness é o primeiro álbum de compilação póstumo da cantora britânica Amy Winehouse, com músicas inéditas, lançado em 2 de Dezembro de 2011 pela Island Records.',0,0,0,'2023','Amy Winehouse',15)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7896562109621','Like a Virgin - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Like a Virgin é o segundo álbum de estúdio da artista musical estadunidense Madonna. O seu lançamento ocorreu em 12 de novembro de 1984, através das gravadoras Sire Records e Warner Bros. Records.',0,0,0,'1968','Madonna',25),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7892548307425','Rebel Heart - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Rebel Heart é o décimo terceiro álbum de estúdio da artista musical americana Madonna. O seu lançamento ocorreu em 6 de março de 2015, através da editora discográfica Interscope.',0,0,0,'1999','Madonna',21),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7891815878205','Erotica - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Erotica é o quinto álbum de estúdio da artista musical estadunidense Madonna, lançado em 20 de outubro de 1992 através das gravadoras Maverick e Warner Bros. Foi lançado simultaneamente ao livro Sex, que contém fotografias explícitas da cantora.',0,0,0,'2016','Madonna',28),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7893591834164','Madonna (álbum) - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Madonna é o álbum de estreia e homônimo da artista musical estadunidense Madonna. O seu lançamento ocorreu em 27 de julho de 1983, através das gravadoras Sire Records e Warner Bros. Records. Foi relançado em 1985 nos mercados europeus sob o título de Madonna: The First Album.',0,0,0,'1988','Madonna',49),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7898851074796','Ray of Light - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'PRE-VENDA','Ray of Light é o sétimo álbum de estúdio da artista musical estadunidense Madonna. O seu lançamento ocorreu inicialmente em 22 de fevereiro de 1998 no Japão, logo depois nos Estados Unidos em 3 de março de 1998, através das gravadoras Maverick e Warner Bros.',0,0,0,'1995','Madonna',43),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7894308575425','Madame X - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'PRE-VENDA','Madame X é o décimo quarto álbum de estúdio da cantora estadunidense Madonna, lançado a 14 de junho de 2019, pela Interscope Records. O álbum foi influenciado criativamente por sua vida de expatriada em Lisboa, Portugal, depois de se mudar para lá no verão de 2017.',0,0,0,'2023','Madonna',17),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7898497558619','MDNA - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','MDNA é o décimo segundo álbum de estúdio da artista musical americana Madonna. O seu lançamento ocorreu em 23 de março de 2012, através da gravadora Interscope, marcando o primeiro lançamento da cantora a não ser associado com a Warner Bros.',0,0,0,'2000','Madonna',24),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7893105862273','Like a Prayer - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Like a Prayer é o quarto álbum de estúdio da artista musical estadunidense Madonna. O seu lançamento ocorreu em 21 de março de 1989, através das gravadoras Sire e Warner Bros',0,0,0,'2012','Madonna',45),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7893993032295','I''m Breathless - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','I''m Breathless: Music from and Inspired by the Film Dick Tracy, referida comumente como I''m Breathless, é um álbum da artista musical estadunidense Madonna, que inclui faixas da trilha sonora do filme Dick Tracy e outras canções inspiradas no longa-metragem.',0,0,0,'2024','Madonna',45),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7893352238356','Who''s That Girl - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'NOVO','Who''s That Girl: Original Motion Picture Soundtrack ou simplesmente chamada de Who''s That Girl é a primeira trilha ou banda sonora da artista musical estadunidense Madonna, lançada em 21 de julho de 1987 pela Sire Records para promover o filme de mesmo nome.',0,0,0,'1969','Madonna',18)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7898198862433','Abbey Road - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Abbey Road é o 12º álbum de estúdio da banda britânica The Beatles. Foi lançado em 26 de setembro de 1969, e leva o mesmo nome da rua de Londres onde situa-se o estúdio Abbey Road. Foi produzido e orquestrado por George Martin para a Apple Records.',0,0,0,'2011','Os Beatles',41),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7898486861674','The Beatles - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','The Beatles é o décimo álbum de estúdio dos Beatles, lançado como disco duplo em 22 de novembro de 1968. Um álbum duplo, com uma capa branca com nada nela, apenas o nome da banda em alto relevo, que foi feito com a ideia de ter um contraste com a arte de capa de seu álbum anterior Sgt.',0,0,0,'2003','Os Beatles',37),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7892215238255','Revolver - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Revolver é o sétimo álbum de estúdio da banda britânica de rock The Beatles. Foi lançado em 5 de agosto de 1966, acompanhado pelo single de duplo lado A "Eleanor Rigby" / "Yellow Submarine".',0,0,0,'2012','Os Beatles',26),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7898082255445','Please Please Me - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Please Please Me é o álbum de estreia gravado em estúdio e lançado pelos Beatles em 22 de março de 1963. O álbum contém 14 canções, oito escritas por Lennon/McCartney. Em 2003, a revista Rolling Stone listou o álbum no número 39 na lista de 500 melhores álbuns de todos os tempos.',0,0,0,'1971','Os Beatles',30),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7893831086025','Help! - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'NOVO','Help! é o quinto álbum do grupo The Beatles, que teve também um lançamento simultâneo de um filme com o mesmo nome. Lançado em agosto de 1965, no auge da beatlemania e das turnês do grupo, o álbum reflete algumas mudanças na música dos fab-four.',0,0,0,'1975','Os Beatles',16),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7895662912826','Magical Mystery Tour - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'NOVO','Magical Mystery Tour é um disco gravado pelos Beatles, lançado no formato EP duplo no Reino Unido e LP nos Estados Unidos. Produzidas por George Martin, ambas as versões incluem as seis canções da trilha sonora do filme homônimo de 1967.',0,0,0,'2017','Os Beatles',24),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7896344777104','With the Beatles - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','With the Beatles é o segundo álbum do grupo de rock inglês The Beatles, lançado em 22 de novembro de 1963. Gravado quatro meses após o lançamento do primeiro álbum, do qual repete a fórmula.',0,0,0,'2001','Os Beatles',46),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7890262627244','Let It Be - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Let It Be é o décimo terceiro e último álbum de estúdio lançado pelo grupo inglês de rock The Beatles. Gravado entre janeiro de 1969 e março/abril de 1970, o álbum foi somente lançado em 8 de maio de 1970, após o disco Abbey Road e juntamente com o documentário com o mesmo nome.',0,0,0,'2004','Os Beatles',30),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7899918021214','A Hard Day''s Night - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','A Hard Day''s Night é o terceiro álbum da banda britânica The Beatles, lançado em 1964 na Inglaterra, acompanhando o lançamento do filme homônimo.',0,0,0,'2016','Os Beatles',35),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7898203755837','Yellow Submarine - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Yellow Submarine é o décimo primeiro álbum de estúdio da banda inglesa The Beatles, lançado em 13 de Janeiro de 1969 nos Estados Unidos e em 17 de Janeiro de 1969 no Reino Unido. Foi comercializado como banda sonora para o filme de animação de mesmo nome, que estreou em Londres em Julho de 1968.',0,0,0,'2020','Os Beatles',35)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7898157225798','Random Access Memories - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Random Access Memories é o quarto e último álbum de estúdio da dupla francesa de música eletrônica Daft Punk, lançado em 17 de maio de 2013, pela Columbia Records.',0,0,0,'1991','Daft Punk',23),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7894842177971','Discovery - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Discovery é o segundo álbum de estúdio da dupla de french house Daft Punk, lançado em 12 de março de 2001. Este marca uma mudança no som do Chicago house, que foram anteriormente conhecidos por disco e estilos synthpop.',0,0,0,'1976','Daft Punk',38),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7894821726167','Tron: Legacy - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Tron: Legacy é o álbum da trilha sonora do filme homônimo lançado em 2010. Disponibilizado em 6 de dezembro do mesmo ano pela Walt Disney Records, é o único álbum de trilha sonora composto pela dupla francesa Daft Punk.',0,0,0,'2016','Daft Punk',47),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7897822848031','Homework - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Homework é o álbum de estreia da dupla francesa de música eletrônica Daft Punk, primeiramente lançado em 20 de janeiro de 1997. O álbum é considerado uma mistura de house, techno, acid e funk. Este é notado por induzir o interesse ao toque musical francês com diversos artistas seguindo o estilo.',0,0,0,'1994','Daft Punk',49),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7898055857716','Alive 2007 - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Alive 2007 é um álbum ao vivo de Daft Punk, lançado inicialmente em 19 de novembro de 2007. É o segundo álbum gravado ao vivo pela dupla, seguido de Alive 1997. Alive 2007 apresenta sua performance em Bercy em Paris em 14 de junho de 2007.',0,0,0,'2021','Daft Punk',46),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7899883962321','Human After All - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Human After All é o terceiro álbum de estúdio da dupla francesa Daft Punk, primeiramente lançado em 14 de março de 2005 internacionalmente e um dia depois nos Estados Unidos. Com ele, Daft Punk aplica minimalismo e rock ao seu estilo francês de house music.',0,0,0,'1996','Daft Punk',35),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7897854441469','Greatest Hits - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Seu álbum de estreia, Homework (1997), rendeu-lhes ainda mais elogios na cena da dance music, e o single "Around the World" - que apresentava um vocal em loop e processado eletronicamente.',0,0,0,'2007','Daft Punk',25),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7898133388273','Daft Club - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'NOVO','Daft Club é o primeiro álbum de remixes da dupla francesa de música eletrônica Daft Punk, lançado em 1 de dezembro de 2003 pela Virgin Records. O álbum apresenta vários remixes de faixas de seu segundo álbum, Discovery, e um de sua estreia, Homework.',0,0,0,'1975','Daft Punk',15),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7892013850788','Deep Cuts - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','As versões alternativas e remixes de Daft Punk irão saciar os fãs de live house e grooves eletrônicos. Os Netunos levam "Mais Difícil, Melhor, Mais Rápido',0,0,0,'2021','Daft Punk',48),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7893952251796','Alive 1997 - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'PRE-VENDA','Alive 1997 é o primeiro álbum ao vivo da dupla francesa de música eletrônica Daft Punk, lançado em 1 de outubro de 2001 pela Virgin Records. Ele contém um trecho de 45 minutos de uma apresentação ao vivo gravada durante Daftendirektour no Que Club de Birmingham em 8 de novembro de 1997.',0,0,0,'1979','Daft Punk',22)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7891120212247','Homecoming: The Live Album - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Homecoming: The Live Album é o quinto álbum ao vivo da cantora americana Beyoncé, lançado em 17 de abril de 2019. Foi gravado em 14 e 21 de abril de 2018 durante as apresentações da cantora no Coachella Valley Music and Arts Festival em Indio, na Califórnia.',0,0,0,'2006','Beyoncé',30),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7896067702047','B''Day - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','B''Day é o segundo álbum de estúdio da artista musical americana Beyoncé, lançado internacionalmente através da Sony BMG Music Entertainment a 4 de setembro de 2006 para que coincidisse com o 25.° aniversário da artista.',0,0,0,'2021','Beyoncé',18),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7890333696109','4 - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','4 é o quarto álbum de estúdio da artista musical estadunidense Beyoncé. Foi lançado em 24 de junho de 2011 pela Parkwood Entertainment e Columbia Records.',0,0,0,'2008','Beyoncé',41),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7893312597821','Lemonade - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Lemonade é o sexto álbum de estúdio da artista musical estadunidense Beyoncé. O seu lançamento ocorreu em 23 de abril de 2016, através das gravadoras Parkwoood e Columbia.',0,0,0,'1994','Beyoncé',36),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7893773614526','I Am… Sasha Fierce - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'PRE-VENDA','I Am... Sasha Fierce é o terceiro álbum de estúdio da artista musical estadunidense Beyoncé. Foi lançado em 12 de novembro de 2008 pela Columbia Records e pela Music World Entertainment.',0,0,0,'1976','Beyoncé',20),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7890563610353','Dangerously in Love - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'PRE-VENDA','Dangerously in Love é o álbum de estreia solo da artista musical estadunidense Beyoncé. Foi lançado em 23 de junho de 2003 pela Columbia Records e Music World Entertainment.',0,0,0,'1986','Beyoncé',47),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7893267624964','Renaissance - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Renaissance é o sétimo álbum de estúdio da cantora americana, Beyoncé, lançado em 29 de julho de 2022, através da Parkwood Entertainment e Columbia Records. É seu primeiro lançamento solo em estúdio desde Lemonade e serve como a primeira parte de uma trilogia.',0,0,0,'1995','Beyoncé',48),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7897444973686','Beyoncé - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Beyoncé é o quinto álbum de estúdio e homônimo da artista musical estadunidense Beyoncé. O seu lançamento ocorreu em 13 de dezembro de 2013 sem qualquer aviso prévio na loja virtual iTunes Store, através das gravadoras Columbia Records e Parkwood Entertainment, seguido de uma distribuição física nos dias seguintes.',0,0,0,'1973','Beyoncé',33),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7895108628739','Cowboy Carter - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Cowboy Carter é o oitavo álbum de estúdio da cantora norte-americana Beyoncé. Lançado no dia 29 de março de 2024, através da Parkwood Entertainment e Columbia Records, o álbum é segunda parte de uma trilogia de projetos concebidos durante a pandemia de COVID-19, que começou com Renaissance.',0,0,0,'1973','Beyoncé',23),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7898152540388','The Lion King: The Gift - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'NOVO','The Lion King: The Gift é uma trilha sonora produzida pela cantora norte-americana Beyoncé para o remake em renderização 3D The Lion King, e mais tarde para o filme musical Black Is King.',0,0,0,'1991','Beyoncé',40)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7891364108499','Sucka Free - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','Sucka Free é a segunda mixtape da rapper Nicki Minaj. Foi lançado em 12 de abril de 2008 pela Dirty Money Records. Sucka Free conta com participações especiais dos colegas rappers Lil Wayne, Gucci Mane, Jadakiss, Lil'' Kim e Ransom.',0,0,0,'1999','Nicki Minaj',27),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7898278373197','Barbie World - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','A parceria entre Nicki Minaj e Ice Spice, na música "Barbie World", faz parte da trilha sonora do live-action da Barbie',0,0,0,'1997','Nicki Minaj',36),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7894537718471','Queen - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Queen é o quarto álbum de estúdio da rapper Nicki Minaj. Foi lançado em 10 de agosto de 2018 pela Young Money Entertainment, Cash Money Records e Republic Records. Foi o primeiro álbum de Minaj em quase quatro anos após The Pinkprint (2014).',0,0,0,'2001','Nicki Minaj',16),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7891255944715','Pink Friday: Roman Reloaded - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Pink Friday: Roman Reloaded é o segundo álbum de estúdio da rapper e compositora trinidiana Nicki Minaj, lançado em 2 de abril de 2012 pela Young Money Entertainment, Cash Money Records e Universal Republic Records.',0,0,0,'1992','Nicki Minaj',38),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7898443982862','Massive Attack - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'NOVO','Massive Attack é o single de estreia da rapper de Trinidad Nicki Minaj, com participação de Sean Garrett. Foi lançado em 13 de abril de 2010 pela Young Money, Cash Money e Universal Motown.',0,0,0,'1970','Nicki Minaj',38),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7891990168344','The Pinkprint - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'NOVO','The Pinkprint é o terceiro álbum de estúdio da rapper trinidiana-americana Nicki Minaj, lançado em 15 de dezembro de 2014 pela Young Money Entertainment, Cash Money Records e Republic Records.',0,0,0,'1978','Nicki Minaj',25),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7895863872504','Beam Me Up Scotty - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Beam Me Up Scotty é o terceiro mixtape da artista americana Nicki Minaj. Foi lançado em 18 de abril de 2009 pela Young Money Entertainment e Dirty Money Entertainment. O disco inclui participações especiais de Lil Wayne, Gucci Mane, Busta Rhymes, Bobby Valentino, outros artistas da Young Money como Drake e Jae Millz.',0,0,0,'1978','Nicki Minaj',49),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7896588238767','Playtime Is Over - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'PRE-VENDA','Playtime Is Over é a mixtape de estreia da rapper Nicki Minaj. Foi lançado em 5 de julho de 2007 pela Dirty Money Records. Conta com participações especiais de Hell Rell, Red Café, Murda Mook, Ransom, Gravy, Lil Wayne, Angel De-Mar e Ru Spits.',0,0,0,'1985','Nicki Minaj',20),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7898473648573','Pink Friday - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Pink Friday é o álbum de estreia da rapper trinitina Nicki Minaj, lançado no dia 19 de novembro de 2010 pela Universal Music e no dia 22 de novembro pela Young Money, Cash Money e Universal Motown.',0,0,0,'1972','Nicki Minaj',17),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7892855743156','Pink Friday 2 - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Pink Friday 2 é o quinto álbum de estúdio da rapper norte-americana Nicki Minaj, lançado em 8 de dezembro de 2023, pela Young Money Entertainment e Republic Records.',0,0,0,'1981','Nicki Minaj',49)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7891536597171','Never Say Never: The Remixes - Justin Bieber',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Never Say Never - The Remixes é uma coletânea com regravações de remixes do cantor canadense Justin Bieber. O álbum foi criado exclusivamente para o seu filme, Justin Bieber: Never Say Never.',0,0,0,'1972','Justin Bieber',44),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7895753631524','My World - Justin Bieber',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','My World é o primeiro lançamento do cantor canadense Justin Bieber. O EP é considerado a primeira parte das duas de seu álbum de estréia. O álbum foi lançado em 17 de novembro de 2009 através de Island Records, sendo seguido por My World 2.0, sua segunda parte, foi disponibilizado em 23 de março de 2010.',0,0,0,'2018','Justin Bieber',31),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7892127026034','Journals - Justin Bieber',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','Journals é a segunda coletânea musical do cantor canadense Justin Bieber, lançada para digital download no iTunes Store 23 de dezembro de 2013 pela editora discográfica Island Records.',0,0,0,'1990','Justin Bieber',32),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7897078338688','Under the Mistletoe - Justin Bieber',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','Under the Mistletoe é o primeiro álbum natalino e o segundo álbum de estúdio do cantor canadense Justin Bieber, lançado no dia 1º de novembro de 2011 nos Estados Unidos e Canadá pela Island Def Jam.',0,0,0,'2020','Justin Bieber',29),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7895047129002','Believe - Justin Bieber',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Believe é o terceiro álbum de estúdio lançado pelo cantor canadense Justin Bieber em 19 de junho de 2012. O álbum marca uma partida musical do gênero teen pop de seus lançamentos anteriores, e incorpora mais elementos de dance-pop e R&B contemporâneo.',0,0,0,'2006','Justin Bieber',20),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7894489960232','My World 2.0 - Justin Bieber',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','My World 2.0 é a segunda e última parte do álbum de estúdio de estreia do cantor canadense Justin Bieber, e seu primeiro lançamento completo. O álbum é o sucessor da primeira metade, que foi lançada em 17 de novembro de 2009. My World 2.0 foi lançado em 23 de março de 2010.',0,0,0,'1974','Justin Bieber',40),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7895742873341','Changes - Justin Bieber',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Changes é o quinto álbum de estúdio do cantor canadense Justin Bieber. Foi lançado em 14 de fevereiro de 2020 pela Def Jam Recordings e RBMG.',0,0,0,'2023','Justin Bieber',45),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7898465442563','Justice - Justin Bieber',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'NOVO','Justice é o sexto álbum de estúdio do cantor canadense Justin Bieber, lançado em 19 de março de 2021 através da Def Jam Recordings.',0,0,0,'2002','Justin Bieber',28),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7891446171705','Purpose - Justin Bieber',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Purpose é o quarto álbum de estúdio do cantor canadense Justin Bieber. O seu lançamento ocorreu em 13 de novembro de 2015 através da Def Jam Recordings. O álbum foi precedido pelo lançamento do single "What Do You Mean?" em 28 de agosto de 2015.',0,0,0,'1991','Justin Bieber',29),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7895141126289','Freedom - Justin Bieber',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'PRE-VENDA','Freedom é o segundo extended play (EP) do cantor canadense Justin Bieber. É também o primeiro EP lançado por Bieber desde My World. Foi lançado de surpresa em 4 de abril de 2021, pela Def Jam Recordings.',0,0,0,'1982','Justin Bieber',19)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7892686492735','Pure Heroine - Lorde',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Pure Heroine é o álbum de estreia da cantora e compositora neozelandesa Lorde. O seu lançamento ocorreu em 27 de setembro de 2013, através da editora discográfica Universal Music.',0,0,0,'2018','Lorde',36),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7898322306344','Melodrama - Lorde',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Melodrama é o segundo álbum de estúdio gravado pela cantora e compositora neozelandesa Lorde. O seu lançamento ocorreu em 16 de junho de 2017, através da gravadora Universal Music e suas afiliadas.',0,0,0,'1973','Lorde',17),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7893454775381','Solar Power - Lorde',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Solar Power é o terceiro álbum de estúdio da cantora e compositora neozelandesa Lorde, lançado no dia 20 de agosto de 2021 pela Universal Music. Lorde escreveu e produziu o álbum com o músico estadunidense Jack Antonoff, colaboração que já havia ocorrido em seu segundo álbum de estúdio, Melodrama.',0,0,0,'1980','Lorde',39),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7898013317471','Four Pink Walls - Alessia Cara',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Four Pink Walls é o EP de estreia da cantora canadense Alessia Cara. Foi lançado em 26 de agosto de 2015 pela Def Jam. Com todas as músicas escritas por Cara, a prévia de seu próximo álbum de estreia Know-It-All também inclui grandes contribuições de composição e produção da dupla Pop & Oak.',0,0,0,'1981','Alessia Cara',19),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7895188034351','Know-It-All - Alessia Cara',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'PRE-VENDA','Know-It-All é o álbum de estreia da artista musical canadense Alessia Cara, que foi lançado oficialmente em 13 de novembro de 2015 pela Def Jam. O disco foi lançado em sequência a seu primeiro extended play Four Pink Walls, o que foi considerado uma prévia do álbum.',0,0,0,'2009','Alessia Cara',39),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7895918641511','The Pains of Growing - Alessia Cara',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'PRE-VENDA','The Pains of Growing é o segundo álbum de estúdio da cantora canadense Alessia Cara, lançado em 30 de novembro de 2018, pela Def Jam Recordings. Suas canções foram escritas principalmente pela própria Cara, com os produtores Pop & Oak. Musicalmente.',0,0,0,'1993','Alessia Cara',24),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7892441277852','This Summer - Alessia Cara',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','This Summer é o terceiro EP da cantora e compositora canadense Alessia Cara. Foi lançado no dia 6 de setembro de 2019, através da Def Jam e Universal Music Group. Cara escreveu e co-escreveu todas as faixas, trabalhando em parceriao com Jon Levine, Midi Jones e Mike Sabath.',0,0,0,'1972','Alessia Cara',16),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7896312505121','In The Meantime - Alessia Cara',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','In the Meantime é o terceiro álbum de estúdio da cantora e compositora canadense Alessia Cara, lançado em 24 de setembro de 2021, pela Def Jam Recordings. Cara colaborou com Jon Levine, Salaam Remi e Joel Little entre vários outros produtores do projeto.',0,0,0,'2016','Alessia Cara',25),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7895513908516','Cry Baby - Melanie Martinez',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Cry Baby é o álbum de estreia da artista musical estadunidense Melanie Martinez. O seu lançamento ocorreu em 14 de agosto de 2015, através da Atlantic Records. Entre setembro e dezembro de 2012, Martinez ganhou destaque participando da terceira temporada da edição estadunidense da competição de canto The Voice.',0,0,0,'2010','Melanie Martinez',15),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7899654075376','K-12 - Melanie Martinez',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'NOVO','K-12 é o segundo álbum de estúdio da cantora e compositora norte-americana Melanie Martinez. Foi lançado junto ao filme de mesmo nome, escrito e dirigido por Martinez, em 6 de setembro de 2019, através da Atlantic Records.',0,0,0,'2004','Melanie Martinez',36)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7897678458077','After School - Melanie Martinez',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'PRE-VENDA','After School é o terceiro extended play da cantora estadunidense Melanie Martinez, lançado em 25 de setembro de 2020 pela Atlantic Records. "The Bakery" foi lançada em como primeiro single juntamente com o lançamento do EP. Martinez disse que o EP é "muito mais pessoal e menos ligado à Cry Baby".',0,0,0,'1981','Melanie Martinez',41),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7893652936623','Portals - Melanie Martinez',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'PRE-VENDA','Portals é o terceiro álbum de estúdio da cantora e compositora americana Melanie Martinez. Foi lançado em 31 de março de 2023, pela Atlantic Records. Foi precedido por dois singles, "Death", em 17 de março de 2023, e "Void", em 29 de março de 2023.',0,0,0,'1989','Melanie Martinez',19),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7895482566767','Ao vivo - Alcione',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Gravado em abril de 2003, no Olimpo (RJ), o segundo DVD ao vivo de Alcione pela Indie Records reúne hits e inéditas como: Não deixe o samba morrer, A loba.',0,0,0,'2014','Alcione',45),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7893761887414','A Voz Do Samba - Alcione',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','LP Alcione - A Voz do Samba Alcione, voz potente e com uma personalidade ímpar, nossa querida Marrom, assim chamada carinhosamente por amigos e fãs.',0,0,0,'1985','Alcione',40),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7896445316131','Morte De Um Poeta - Alcione',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Morte De Um Poeta · 01. Estranha Loucura · 02. Quem É Você · 03. O Surdo · 04. Gostoso Veneno · 05. O Que Eu Faço Amanhã · 06. Um Ser de Luz · 07. Linda Flor (yayá).',0,0,0,'1981','Alcione',34),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7895444833694','Fogo da Vida - Alcione',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Venha ouvir "Faz Corpo Mole", "Mesa de Bar", "Coco Partido" e muitas outras músicas do álbum Alcione - Fogo da Vida!',0,0,0,'2005','Alcione',23),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7899534735787','Da Cor Do Brasil - Alcione',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'PRE-VENDA','CD Alcione 1984 - Da Cor do Brasil 01. Mangueira Estação Primeira 02. Roda Ciranda 03. Desiguais 04. Vida Boa 05. Forroficar 06. Pedrinhas de Cor 07.',0,0,0,'2020','Alcione',28),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7898280083382','Profissão Cantora - Alcione',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'PRE-VENDA','Profissão Cantora. Alcione. 199516 songs, 54 min 14 sec. Fora De Ocasião. Alcione. Não dá Mais pra Segurar (Explode Coração). Alcione.',0,0,0,'1998','Alcione',49),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7898362186063','Alerta geral - Alcione',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Alerta Geral se transformou em um programa na Rede Globo e marca uma virada importante na carreira de Alcione.',0,0,0,'2009','Alcione',29),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7891762824510','De Tudo Que eu Gosto - Alcione',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','A cantora Alcione, a "Marrom", em seu disco “De Tudo Que Eu Gosto,” chamou atenção com a música Maria da Penha, em que ataca, de forma bem humorada.',0,0,0,'1972','Alcione',32)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7897611486763','Thank U, Next - Ariana Grande',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Thank U, Next é o quinto álbum de estúdio da cantora estadunidense Ariana Grande. O seu lançamento ocorreu em 8 de fevereiro de 2019, através da Republic Records.',0,0,0,'1985','Ariana Grande',49),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7896532792674','Dangerous Woman - Ariana Grande',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Dangerous Woman é o terceiro álbum de estúdio da cantora norte-americana Ariana Grande. Foi lançado em 20 de maio de 2016 através da gravadora Republic Records. A canção de mesmo nome foi lançada como o primeiro single do álbum em 11 de março de 2016. O álbum recebeu críticas positivas, com nota 76 no site Metacritic.',0,0,0,'2017','Ariana Grande',39),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7893490466362','Yours Truly - Ariana Grande',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Yours Truly é o álbum de estreia da cantora e compositora estadunidense Ariana Grande, lançado em 3 de setembro de 2013 através da Republic Records. Inicialmente denominado Daydreamin, o disco foi desenvolvido desde meados de 2011, com a produção de Harmony Samuels, Babyface, entre outros.',0,0,0,'1983','Ariana Grande',15),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7892817494146','My Everything - Ariana Grande',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','My Everything é o segundo álbum de estúdio da cantora norte-americana Ariana Grande, lançado em 25 de agosto de 2014 através da gravadora Republic Records. Ariana descreve My Everything como "uma evolução", de seu álbum de estreia, Yours Truly; pois explora temas e gêneros mais maduros.',0,0,0,'2002','Ariana Grande',35),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7894693011184','Sweetener - Ariana Grande',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Sweetener é o quarto álbum de estúdio da cantora estadunidense Ariana Grande, lançado em 17 de agosto de 2018 através da Republic Records. As sessões de gravação e composição iniciaram-se em julho de 2016, meses após o lançamento de Dangerous Woman.',0,0,0,'1996','Ariana Grande',41),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7897420564268','Positions - Ariana Grande',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Positions é o sexto álbum de estúdio da cantora estadunidense Ariana Grande, lançado em 30 de outubro de 2020, através da Republic Records. Grande trabalhou com vários produtores no álbum, incluindo o colaborador frequente Tommy Brown, acompanhado das co-compositoras de longa data Victoria Monét e Tayla Parx.',0,0,0,'1976','Ariana Grande',41),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7893672436219','Eternal Sunshine - Ariana Grande',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Eternal Sunshine é o sétimo álbum de estúdio da cantora norte-americana Ariana Grande, lançado em 8 de março de 2024, através da Republic Records.',0,0,0,'2007','Ariana Grande',45),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7896210284033','Reputation - Taylor Swift',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Reputation é o sexto álbum de estúdio da artista musical estadunidense Taylor Swift, lançado em 10 de novembro de 2017, através da gravadora Big Machine.',0,0,0,'1988','Taylor Swift',42),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7897985628068','The Tortured Poets Department - Taylor Swift',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','The Tortured Poets Department é o futuro décimo primeiro álbum de estúdio da cantora e compositora estadunidense Taylor Swift, com lançamento previsto para 19 de abril de 2024, através da Republic Records.',0,0,0,'1988','Taylor Swift',34),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7896514521745','1989: Taylor''s Version - Taylor Swift',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','Taylor Swift é o álbum de estreia homônimo da cantora e compositora estadunidense Taylor Swift, lançado através da Big Machine Records em 24 de outubro de 2006.',0,0,0,'1981','Taylor Swift',44),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7892174565145','Dua Lipa - LP Radical Optimism',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Inspirado na autodescoberta de Dua, Radical Optimism é um álbum que explora a pura alegria e felicidade de ter clareza em situações que antes pareciam impossíveis de enfrentar..',0,0,0,'2020','Dua Lipa',44),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7896517451452','Leigh-Anne: Don’t Say Love (Autografado)',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Signed Don''t Say Love CD single bundle including standard and alternative cover versions. Both CD singles include a personal message record by Leigh-Anne.',0,0,0,'2019','Leigh-Anne',44)

        INSERT INTO ECM_STATUS (ID_PRODUTO,ATIVO,OBSERVACAO)
        VALUES
        (1,1,''), (11,1,''), (21,1,''), (31,1,''), (41,1,''),
        (2,1,''), (12,1,''), (22,1,''), (32,1,''), (42,1,''),
        (3,1,''), (13,1,''), (23,1,''), (33,1,''), (43,1,''),
        (4,1,''), (14,1,''), (24,1,''), (34,1,''), (44,1,''),
        (5,1,''), (15,1,''), (25,1,''), (35,1,''), (45,1,''),
        (6,1,''), (16,1,''), (26,1,''), (36,1,''), (46,1,''),
        (7,1,''), (17,1,''), (27,1,''), (37,1,''), (47,1,''),
        (8,1,''), (18,1,''), (28,1,''), (38,1,''), (48,1,''),
        (9,1,''), (19,1,''), (29,1,''), (39,1,''), (49,1,''),
        (10,1,''), (20,1,''), (30,1,''), (40,1,''), (50,1,'')

        INSERT INTO ECM_STATUS (ID_PRODUTO,ATIVO,OBSERVACAO)
        VALUES
        (51,1,''), (61,1,''), (71,1,''), (81,1,''), (91,1,''),
        (52,1,''), (62,1,''), (72,1,''), (82,1,''), (92,1,''),
        (53,1,''), (63,1,''), (73,1,''), (83,1,''), (93,1,''),
        (54,1,''), (64,1,''), (74,1,''), (84,1,''), (94,1,''),
        (55,1,''), (65,1,''), (75,1,''), (85,1,''), (95,1,''),
        (56,1,''), (66,1,''), (76,1,''), (86,1,''), (96,1,''),
        (57,1,''), (67,1,''), (77,1,''), (87,1,''), (97,1,''),
        (58,1,''), (68,1,''), (78,1,''), (88,1,''), (98,1,''),
        (59,1,''), (69,1,''), (79,1,''), (89,1,''), (99,1,''),
        (60,1,''), (70,1,''), (80,1,''), (90,1,''), (100,1,''),
        (101,1,''), (102,1,'')

        UPDATE ECM_PRODUTOS SET PRE_VENDA = 1 WHERE TIPO = 'PRE-VENDA'

        UPDATE ECM_PRODUTOS SET NOVO = 1 WHERE TIPO = 'NOVO'

        UPDATE ECM_PRODUTOS SET DESCONTO = 1 WHERE ID_PRODUTO IN (6, 7, 13, 14, 23, 26, 27, 2, 3, 4, 20, 21, 22, 29, 30, 31, 32, 33, 57, 58, 59, 70, 71, 72, 92, 93, 94)

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (1,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Batidão Tropical.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (2,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Não Para Não.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (3,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Noitada.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (4,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\After.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (5,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Batidão Tropical 2.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (6,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Anti-Herói.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (7,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lobos.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (8,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Back to Black.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (9,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Amy.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lioness Hidden Treasures.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Like a Virgin.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Rebel Heart.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Erotica.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Madonna.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Ray of Light.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Madame X.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\MDNA.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Like a Prayer.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (19,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Im Breathless.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Whos That Girl.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Abbey Road.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Beatles.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Revolver.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Please Please Me.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Help!.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Magical Mystery Tour.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\With the Beatles.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Let It Be.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\A Hard Days Night.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Yellow Submarine.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Random Access Memories.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Discovery.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Tron Legacy.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Homework.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alive 2007.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Human After All.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Greatest Hits.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Daft Club.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Deep Cuts.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alive 1997.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Homecoming The Live Album.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\BDay.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\4.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lemonade.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\I Am Sasha Fierce.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dangerously in Love.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Renaissance.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Beyoncé.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Cowboy Carter.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Lion King The Gift.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (51,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Sucka Free.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (52,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Barbie World.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (53,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Queen.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (54,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday Roman Reloaded.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (55,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Massive Attack.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (56,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Pinkprint.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (57,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Beam Me Up Scotty.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (58,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Playtime Is Over.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (59,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (60,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday 2.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (61,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Never Say Never The Remixes.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (62,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My World.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (63,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Journals.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (64,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Under the Mistletoe.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (65,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Believe.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (66,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My World 2.0.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (67,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Changes.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (68,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Justice.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (69,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Purpose.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (70,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Freedom.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (71,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pure Heroine.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (72,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Melodrama.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (73,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Solar Power.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (74,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Four Pink Walls.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (75,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Know-It-All.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (76,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Pains of Growing.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (77,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\This Summer.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (78,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\In The Meantime.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (79,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Cry Baby.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (80,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\K12.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (81,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\After School.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (82,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Portals.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (83,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Ao vivo.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (84,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\A Voz Do Samba.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (85,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Morte De Um Poeta.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (86,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Fogo da Vida.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (87,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Da Cor Do Brasil.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (88,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Profissão Cantora.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (89,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alerta geral.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (90,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\De Tudo Que eu Gosto.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (91,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Thank U, Next.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (92,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dangerous Woman.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (93,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Yours Truly.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (94,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My Everything.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (95,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Sweetener.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (96,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Positions.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (97,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Eternal Sunshine.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (98,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Reputation.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (99,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Tortured Poets Department.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (100,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\1989 Taylors Version.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (101,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Radical Optimism.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (102,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dont Say Love.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (1,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Batidão Tropical.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (2,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Não Para Não.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (3,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Noitada.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (4,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\After.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (5,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Batidão Tropical 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (6,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Anti-Herói.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (7,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lobos.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (8,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Back to Black.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (9,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Amy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lioness Hidden Treasures.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Like a Virgin.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Rebel Heart.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Erotica.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Madonna.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Ray of Light.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Madame X.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\MDNA.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Like a Prayer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (19,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Im Breathless.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Whos That Girl.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Abbey Road.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Revolver.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Please Please Me.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Help!.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Magical Mystery Tour.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\With the Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Let It Be.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\A Hard Days Night.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Yellow Submarine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Random Access Memories.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Discovery.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Tron Legacy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Homework.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alive 2007.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Human After All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Greatest Hits.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Daft Club.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Deep Cuts.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alive 1997.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Homecoming The Live Album.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\BDay.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\4.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lemonade.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\I Am Sasha Fierce.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dangerously in Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Renaissance.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Beyoncé.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Cowboy Carter.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Lion King The Gift.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (51,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Sucka Free.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (52,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Barbie World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (53,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Queen.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (54,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday Roman Reloaded.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (55,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Massive Attack.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (56,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Pinkprint.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (57,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Beam Me Up Scotty.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (58,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Playtime Is Over.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (59,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (60,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (61,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Never Say Never The Remixes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (62,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (63,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Journals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (64,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Under the Mistletoe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (65,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Believe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (66,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My World 2.0.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (67,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Changes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (68,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Justice.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (69,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Purpose.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (70,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Freedom.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (71,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pure Heroine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (72,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Melodrama.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (73,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Solar Power.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (74,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Four Pink Walls.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (75,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Know-It-All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (76,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Pains of Growing.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (77,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\This Summer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (78,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\In The Meantime.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (79,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Cry Baby.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (80,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\K12.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (81,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\After School.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (82,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Portals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (83,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Ao vivo.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (84,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\A Voz Do Samba.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (85,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Morte De Um Poeta.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (86,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Fogo da Vida.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (87,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Da Cor Do Brasil.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (88,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Profissão Cantora.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (89,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alerta geral.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (90,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\De Tudo Que eu Gosto.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (91,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Thank U, Next.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (92,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dangerous Woman.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (93,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Yours Truly.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (94,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My Everything.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (95,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Sweetener.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (96,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Positions.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (97,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Eternal Sunshine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (98,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Reputation.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (99,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Tortured Poets Department.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (100,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\1989 Taylors Version.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (101,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Radical Optimism.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (102,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dont Say Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (1,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Batidão Tropical.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (2,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Não Para Não.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (3,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Noitada.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (4,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\After.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (5,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Batidão Tropical 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (6,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Anti-Herói.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (7,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lobos.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (8,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Back to Black.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (9,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Amy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lioness Hidden Treasures.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Like a Virgin.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Rebel Heart.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Erotica.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Madonna.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Ray of Light.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Madame X.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\MDNA.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Like a Prayer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (19,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Im Breathless.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Whos That Girl.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Abbey Road.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Revolver.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Please Please Me.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Help!.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Magical Mystery Tour.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\With the Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Let It Be.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\A Hard Days Night.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Yellow Submarine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Random Access Memories.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Discovery.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Tron Legacy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Homework.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alive 2007.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Human After All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Greatest Hits.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Daft Club.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Deep Cuts.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alive 1997.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Homecoming The Live Album.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\BDay.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\4.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lemonade.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\I Am Sasha Fierce.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dangerously in Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Renaissance.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Beyoncé.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Cowboy Carter.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Lion King The Gift.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (51,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Sucka Free.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (52,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Barbie World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (53,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Queen.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (54,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday Roman Reloaded.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (55,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Massive Attack.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (56,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Pinkprint.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (57,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Beam Me Up Scotty.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (58,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Playtime Is Over.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (59,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (60,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (61,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Never Say Never The Remixes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (62,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (63,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Journals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (64,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Under the Mistletoe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (65,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Believe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (66,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My World 2.0.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (67,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Changes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (68,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Justice.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (69,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Purpose.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (70,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Freedom.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (71,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pure Heroine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (72,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Melodrama.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (73,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Solar Power.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (74,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Four Pink Walls.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (75,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Know-It-All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (76,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Pains of Growing.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (77,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\This Summer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (78,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\In The Meantime.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (79,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Cry Baby.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (80,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\K12.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (81,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\After School.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (82,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Portals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (83,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Ao vivo.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (84,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\A Voz Do Samba.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (85,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Morte De Um Poeta.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (86,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Fogo da Vida.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (87,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Da Cor Do Brasil.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (88,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Profissão Cantora.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (89,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alerta geral.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (90,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\De Tudo Que eu Gosto.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (91,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Thank U, Next.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (92,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dangerous Woman.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (93,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Yours Truly.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (94,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My Everything.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (95,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Sweetener.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (96,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Positions.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (97,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Eternal Sunshine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (98,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Reputation.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (99,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Tortured Poets Department.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (100,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\1989 Taylors Version.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (101,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Radical Optimism.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (102,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dont Say Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (1,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Batidão Tropical.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (2,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Não Para Não.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (3,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Noitada.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (4,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\After.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (5,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Batidão Tropical 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (6,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Anti-Herói.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (7,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lobos.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (8,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Back to Black.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (9,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Amy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lioness Hidden Treasures.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Like a Virgin.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Rebel Heart.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Erotica.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Madonna.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Ray of Light.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Madame X.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\MDNA.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Like a Prayer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (19,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Im Breathless.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Whos That Girl.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Abbey Road.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Revolver.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Please Please Me.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Help!.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Magical Mystery Tour.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\With the Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Let It Be.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\A Hard Days Night.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Yellow Submarine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Random Access Memories.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Discovery.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Tron Legacy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Homework.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alive 2007.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Human After All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Greatest Hits.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Daft Club.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Deep Cuts.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alive 1997.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Homecoming The Live Album.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\BDay.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\4.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lemonade.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\I Am Sasha Fierce.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dangerously in Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Renaissance.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Beyoncé.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Cowboy Carter.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Lion King The Gift.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (51,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Sucka Free.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (52,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Barbie World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (53,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Queen.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (54,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday Roman Reloaded.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (55,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Massive Attack.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (56,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Pinkprint.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (57,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Beam Me Up Scotty.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (58,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Playtime Is Over.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (59,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (60,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (61,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Never Say Never The Remixes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (62,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (63,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Journals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (64,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Under the Mistletoe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (65,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Believe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (66,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My World 2.0.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (67,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Changes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (68,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Justice.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (69,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Purpose.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (70,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Freedom.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (71,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pure Heroine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (72,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Melodrama.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (73,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Solar Power.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (74,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Four Pink Walls.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (75,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Know-It-All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (76,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Pains of Growing.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (77,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\This Summer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (78,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\In The Meantime.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (79,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Cry Baby.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (80,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\K12.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (81,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\After School.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (82,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Portals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (83,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Ao vivo.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (84,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\A Voz Do Samba.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (85,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Morte De Um Poeta.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (86,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Fogo da Vida.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (87,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Da Cor Do Brasil.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (88,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Profissão Cantora.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (89,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alerta geral.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (90,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\De Tudo Que eu Gosto.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (91,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Thank U, Next.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (92,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dangerous Woman.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (93,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Yours Truly.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (94,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My Everything.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (95,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Sweetener.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (96,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Positions.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (97,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Eternal Sunshine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (98,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Reputation.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (99,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Tortured Poets Department.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (100,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\1989 Taylors Version.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (101,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Radical Optimism.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (102,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dont Say Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (1,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Batidão Tropical.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (2,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Não Para Não.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (3,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Noitada.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (4,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\After.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (5,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Batidão Tropical 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (6,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Anti-Herói.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (7,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lobos.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (8,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Back to Black.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (9,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Amy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lioness Hidden Treasures.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Like a Virgin.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Rebel Heart.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Erotica.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Madonna.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Ray of Light.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Madame X.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\MDNA.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Like a Prayer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (19,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Im Breathless.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Whos That Girl.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Abbey Road.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Revolver.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Please Please Me.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Help!.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Magical Mystery Tour.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\With the Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Let It Be.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\A Hard Days Night.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Yellow Submarine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Random Access Memories.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Discovery.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Tron Legacy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Homework.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alive 2007.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Human After All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Greatest Hits.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Daft Club.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Deep Cuts.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alive 1997.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Homecoming The Live Album.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\BDay.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\4.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Lemonade.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\I Am Sasha Fierce.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dangerously in Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Renaissance.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Beyoncé.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Cowboy Carter.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Lion King The Gift.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (51,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Sucka Free.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (52,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Barbie World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (53,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Queen.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (54,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday Roman Reloaded.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (55,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Massive Attack.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (56,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Pinkprint.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (57,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Beam Me Up Scotty.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (58,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Playtime Is Over.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (59,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (60,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pink Friday 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (61,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Never Say Never The Remixes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (62,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (63,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Journals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (64,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Under the Mistletoe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (65,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Believe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (66,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My World 2.0.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (67,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Changes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (68,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Justice.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (69,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Purpose.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (70,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Freedom.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (71,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Pure Heroine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (72,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Melodrama.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (73,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Solar Power.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (74,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Four Pink Walls.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (75,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Know-It-All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (76,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Pains of Growing.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (77,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\This Summer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (78,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\In The Meantime.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (79,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Cry Baby.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (80,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\K12.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (81,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\After School.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (82,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Portals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (83,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Ao vivo.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (84,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\A Voz Do Samba.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (85,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Morte De Um Poeta.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (86,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Fogo da Vida.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (87,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Da Cor Do Brasil.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (88,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Profissão Cantora.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (89,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Alerta geral.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (90,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\De Tudo Que eu Gosto.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (91,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Thank U, Next.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (92,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dangerous Woman.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (93,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Yours Truly.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (94,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\My Everything.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (95,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Sweetener.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (96,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Positions.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (97,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Eternal Sunshine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (98,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Reputation.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (99,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\The Tortured Poets Department.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (100,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\1989 Taylors Version.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (101,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Radical Optimism.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (102,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Imagens\Dont Say Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (1,'7899673881858',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',148.87,'','120mm','SONY','WARNER MUSIC',1.3),
        (2,'7893513377117',14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',119.07,'','120mm','MAKETECH','VIRGIN MUSIC',1.3),
        (3,'7898734244027',12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',136.26,'','17.50cm','ELGIN','TODAH MUSIC',1.6),
        (4,'7895511388953',22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',120.37,'','17.50cm','MAXPRINT','SONY MUSIC',1.6),
        (5,'7892907498215',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',125.43,'','120mm','VERBATIM','SPOTLIGHT RECORDS',2.3),
        (6,'7898650158417',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',160.25,'','120mm','CIS','SINEWAVE',2.3),
        (7,'7898985117888',21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',130.92,'','17.50cm','MULTILASER','POLYSOM',1.3),
        (8,'7897820505246',50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',93.92,'','17.50cm','SONY','ONIMUSIC',1.3),
        (9,'7895558082712',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',85.60,'','120mm','MAKETECH','NOVO TEMPO',1.6),
        (10,'7890446177526',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',144.72,'','120mm','ELGIN','MOVIEPLAY',1.6)

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (11,'7896562109621',40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',166.41,'','17.50cm','MAXPRINT','MONSTRO DISCOS',2.3),
        (12,'7892548307425',32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',153.28,'','17.50cm','VERBATIM','MK MUSIC',2.3),
        (13,'7891815878205',35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',121.97,'','120mm','CIS','MIDSUMMER MADNESS',1.3),
        (14,'7893591834164',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',79.46,'','120mm','MULTILASER','FURACÃO 2000',1.3),
        (15,'7898851074796',10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',111.86,'','17.50cm','SONY','ELO MUSIC',1.6),
        (16,'7894308575425',33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',149.00,'','17.50cm','MAKETECH','WARNER MUSIC',1.6),
        (17,'7898497558619',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',135.00,'','120mm','ELGIN','VIRGIN MUSIC',2.3),
        (18,'7893105862273',27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',151.56,'','120mm','MAXPRINT','TODAH MUSIC',2.3),
        (19,'7893993032295',12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',133.51,'','17.50cm','VERBATIM','SONY MUSIC',1.3),
        (20,'7893352238356',40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',157.24,'','17.50cm','CIS','SPOTLIGHT RECORDS',1.3)

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (21,'7898198862433',13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',143.76,'','120mm','MULTILASER','SINEWAVE',1.6),
        (22,'7898486861674',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',129.99,'','120mm','SONY','POLYSOM',1.6),
        (23,'7892215238255',36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',75.29,'','17.50cm','MAKETECH','ONIMUSIC',2.3),
        (24,'7898082255445',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',107.20,'','17.50cm','ELGIN','NOVO TEMPO',2.3),
        (25,'7893831086025',35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',95.48,'','120mm','MAXPRINT','MOVIEPLAY',1.3),
        (26,'7895662912826',32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',88.97,'','120mm','VERBATIM','MONSTRO DISCOS',1.3),
        (27,'7896344777104',33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',115.48,'','17.50cm','CIS','MK MUSIC',1.6),
        (28,'7890262627244',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',139.36,'','17.50cm','MULTILASER','MIDSUMMER MADNESS',1.6),
        (29,'7899918021214',22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',158.91,'','120mm','SONY','FURACÃO 2000',2.3),
        (30,'7898203755837',17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',119.02,'','120mm','MAKETECH','ELO MUSIC',2.3)

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (31,'7898157225798',34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',82.96,'','17.50cm','ELGIN','WARNER MUSIC',1.3),
        (32,'7894842177971',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',149.92,'','17.50cm','MAXPRINT','VIRGIN MUSIC',1.3),
        (33,'7894821726167',16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',125.72,'','120mm','VERBATIM','TODAH MUSIC',1.6),
        (34,'7897822848031',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',104.41,'','120mm','CIS','SONY MUSIC',1.6),
        (35,'7898055857716',38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',144.05,'','17.50cm','MULTILASER','SPOTLIGHT RECORDS',2.3),
        (36,'7899883962321',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',128.37,'','17.50cm','SONY','SINEWAVE',2.3),
        (37,'7897854441469',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',80.12,'','120mm','MAKETECH','POLYSOM',1.3),
        (38,'7898133388273',11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',165.57,'','120mm','ELGIN','ONIMUSIC',1.3),
        (39,'7892013850788',39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',157.00,'','17.50cm','MAXPRINT','NOVO TEMPO',1.6),
        (40,'7893952251796',26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',93.13,'','17.50cm','VERBATIM','MOVIEPLAY',1.6)

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (41,'7891120212247',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',101.75,'','120mm','CIS','MONSTRO DISCOS',2.3),
        (42,'7896067702047',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',90.66,'','120mm','MULTILASER','MK MUSIC',2.3),
        (43,'7890333696109',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',126.39,'','17.50cm','SONY','MIDSUMMER MADNESS',1.3),
        (44,'7893312597821',38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',174.42,'','17.50cm','MAKETECH','FURACÃO 2000',1.3),
        (45,'7893773614526',27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',160.39,'','120mm','ELGIN','ELO MUSIC',1.6),
        (46,'7890563610353',22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',149.18,'','120mm','MAXPRINT','WARNER MUSIC',1.6),
        (47,'7893267624964',23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',155.70,'','17.50cm','VERBATIM','VIRGIN MUSIC',2.3),
        (48,'7897444973686',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',118.29,'','17.50cm','CIS','TODAH MUSIC',2.3),
        (49,'7895108628739',43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',125.29,'','120mm','MULTILASER','SONY MUSIC',1.3),
        (50,'7898152540388',11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',134.66,'','120mm','SONY','SPOTLIGHT RECORDS',1.3)

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (51,'7891364108499',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',111.84,'','17.50cm','MAKETECH','SINEWAVE',1.6),
        (52,'7898278373197',34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',113.61,'','17.50cm','ELGIN','POLYSOM',1.6),
        (53,'7894537718471',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',162.62,'','120mm','MAXPRINT','ONIMUSIC',2.3),
        (54,'7891255944715',41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',129.97,'','120mm','VERBATIM','NOVO TEMPO',2.3),
        (55,'7898443982862',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',92.35,'','17.50cm','CIS','MOVIEPLAY',1.3),
        (56,'7891990168344',29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',75.98,'','17.50cm','MULTILASER','MONSTRO DISCOS',1.3),
        (57,'7895863872504',16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',166.96,'','120mm','SONY','MK MUSIC',1.6),
        (58,'7896588238767',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',142.40,'','120mm','MAKETECH','MIDSUMMER MADNESS',1.6),
        (59,'7898473648573',43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',161.24,'','17.50cm','ELGIN','FURACÃO 2000',2.3),
        (60,'7892855743156',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',163.63,'','17.50cm','MAXPRINT','ELO MUSIC',2.3)

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (61,'7891536597171',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',148.30,'','120mm','VERBATIM','WARNER MUSIC',1.3),
        (62,'7895753631524',48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',88.06,'','120mm','CIS','VIRGIN MUSIC',1.3),
        (63,'7892127026034',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',90.15,'','17.50cm','MULTILASER','TODAH MUSIC',1.6),
        (64,'7897078338688',47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',92.67,'','17.50cm','SONY','SONY MUSIC',1.6),
        (65,'7895047129002',32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',150.20,'','120mm','MAKETECH','SPOTLIGHT RECORDS',2.3),
        (66,'7894489960232',25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',158.76,'','120mm','ELGIN','SINEWAVE',2.3),
        (67,'7895742873341',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',112.45,'','17.50cm','MAXPRINT','POLYSOM',1.3),
        (68,'7898465442563',21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',105.32,'','17.50cm','VERBATIM','ONIMUSIC',1.3),
        (69,'7891446171705',17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',133.39,'','120mm','CIS','NOVO TEMPO',1.6),
        (70,'7895141126289',25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',99.56,'','120mm','MULTILASER','MOVIEPLAY',1.6)

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (71,'7892686492735',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',162.79,'','17.50cm','SONY','MONSTRO DISCOS',2.3),
        (72,'7898322306344',50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',87.43,'','17.50cm','MAKETECH','MK MUSIC',2.3),
        (73,'7893454775381',38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',92.78,'','120mm','ELGIN','MIDSUMMER MADNESS',1.3),
        (74,'7898013317471',30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',149.73,'','120mm','MAXPRINT','FURACÃO 2000',1.3),
        (75,'7895188034351',27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',133.89,'','17.50cm','VERBATIM','ELO MUSIC',1.6),
        (76,'7895918641511',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',96.73,'','17.50cm','CIS','WARNER MUSIC',1.6),
        (77,'7892441277852',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',114.56,'','120mm','MULTILASER','VIRGIN MUSIC',2.3),
        (78,'7896312505121',37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',148.31,'','120mm','SONY','TODAH MUSIC',2.3),
        (79,'7895513908516',46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',169.51,'','17.50cm','MAKETECH','SONY MUSIC',1.3),
        (80,'7899654075376',25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',130.12,'','17.50cm','ELGIN','SPOTLIGHT RECORDS',1.3)

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (81,'7897678458077',21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',150.18,'','120mm','MAXPRINT','SINEWAVE',1.6),
        (82,'7893652936623',34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',159.30,'','120mm','VERBATIM','POLYSOM',1.6),
        (83,'7895482566767',18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',123.11,'','17.50cm','CIS','ONIMUSIC',2.3),
        (84,'7893761887414',46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',86.31,'','17.50cm','MULTILASER','NOVO TEMPO',2.3),
        (85,'7896445316131',37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',138.29,'','120mm','SONY','MOVIEPLAY',1.3),
        (86,'7895444833694',40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',159.87,'','120mm','MAKETECH','MONSTRO DISCOS',1.3),
        (87,'7899534735787',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',88.48,'','17.50cm','ELGIN','MK MUSIC',1.6),
        (88,'7898280083382',43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',129.22,'','17.50cm','MAXPRINT','MIDSUMMER MADNESS',1.6),
        (89,'7898362186063',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',95.33,'','120mm','VERBATIM','FURACÃO 2000',2.3),
        (90,'7891762824510',31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',160.10,'','120mm','CIS','ELO MUSIC',2.3)

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (91,'7897611486763',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',114.37,'','17.50cm','MULTILASER','WARNER MUSIC',1.3),
        (92,'7896532792674',16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',129.63,'','17.50cm','SONY','VIRGIN MUSIC',1.3),
        (93,'7893490466362',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',126.94,'','120mm','MAKETECH','TODAH MUSIC',1.6),
        (94,'7892817494146',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',147.85,'','120mm','ELGIN','SONY MUSIC',1.6),
        (95,'7894693011184',26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',129.80,'','17.50cm','MAXPRINT','SPOTLIGHT RECORDS',2.3),
        (96,'7897420564268',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',116.15,'','17.50cm','VERBATIM','SINEWAVE',2.3),
        (97,'7893672436219',44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',163.37,'','120mm','CIS','POLYSOM',1.3),
        (98,'7896210284033',33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',89.13,'','120mm','MULTILASER','ONIMUSIC',1.3),
        (99,'7897985628068',18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',107.59,'','17.50cm','SONY','NOVO TEMPO',1.6),
        (100,'7896514521745',31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',102.57,'','17.50cm','MAKETECH','MOVIEPLAY',1.6),
        (101,'7896514521745',31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',102.57,'','17.50cm','MAKETECH','MOVIEPLAY',1.6),
        (102,'7896514521745',31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\Nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',102.57,'','17.50cm','MAKETECH','MOVIEPLAY',1.6)
        
        INSERT INTO ECM_CAT_PRO (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (1,48), (2,2), (3,8), (4,34), (5,22), (6,15), (7,31), (8,25), 
        (9,9), (10,29), (11,10), (12,32), (13,44), (14,12), (15,52)

        INSERT INTO ECM_CAT_PRO (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (16,24), (17,33), (18,16), (19,10), (20,23), (21,37), (22,44), (23,41),
        (24,36), (25,40), (26,8), (27,40), (28,45), (29,18), (30,18)

        INSERT INTO ECM_CAT_PRO (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (31,17), (32,34), (33,18), (34,51), (35,15), (36,40), (37,41), (38,50), 
        (39,44), (40,40), (41,29), (42,40), (43,3), (44,49), (45,31)

        INSERT INTO ECM_CAT_PRO (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (46,48), (47,23), (48,48), (49,28), (50,23)

        INSERT INTO ECM_CAT_PRO (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (51,28), (52,3), (53,43), (54,21), (55,13), (56,4), (57,52), (58,31),
        (59,9), (60,5), (61,29), (62,9), (63,18), (64,37), (65,3)

        INSERT INTO ECM_CAT_PRO (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (66,25), (67,48), (68,54), (69,3), (70,4), (71,11), (72,24), (73,49), 
        (74,53), (75,46), (76,23), (77,5), (78,3), (79,20), (80,28)

        INSERT INTO ECM_CAT_PRO (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (81,41), (82,6), (83,42), (84,52), (85,41), (86,3), (87,39), (88,5), 
        (89,20), (90,38), (91,8), (92,49), (93,35), (94,11), (95,48)

        INSERT INTO ECM_CAT_PRO (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (96,22), (97,11), (98,40), (99,54), (100,38), (101,32), (102,3)

        INSERT INTO ECM_USUARIOS (EMAIL,SENHA,TIPO)
        VALUES ('oseias.gomes@purpleray.com', '$2a$12$9x/O3VpmmIHdv3p902rQ7O3nrxHdlyRSYdxF5ZV9VW1HCHRe5/ngi', 'ADMINISTRADOR'),
        ('chelsea.medeiros@google.com.br', '$2a$12$9x/O3VpmmIHdv3p902rQ7O3nrxHdlyRSYdxF5ZV9VW1HCHRe5/ngi', 'CLIENTE'),
        ('coby.souza@icloud.com', '$2a$12$9x/O3VpmmIHdv3p902rQ7O3nrxHdlyRSYdxF5ZV9VW1HCHRe5/ngi', 'CLIENTE'),
        ('edan.sales@icloud.com.br', '$2a$12$9x/O3VpmmIHdv3p902rQ7O3nrxHdlyRSYdxF5ZV9VW1HCHRe5/ngi', 'CLIENTE'),
        ('candace.pinheiro@google.com', '$2a$12$9x/O3VpmmIHdv3p902rQ7O3nrxHdlyRSYdxF5ZV9VW1HCHRe5/ngi', 'CLIENTE')

        INSERT INTO ECM_FUNCIONARIOS (ID_USUARIO,NOME_COMPLETO,CODIGO,CARGO)
        VALUES (1,UPPER('Oséias Gomes'),UPPER('fuv05hro6bn'),'TI')

        INSERT INTO ECM_CLIENTES (ID_USUARIO,CODIGO,NOME,SOBRENOME,CPF,DATA_NASCIMENTO,RG,TELEFONE,CELULAR,SITUACAO,GENERO)
        VALUES ((SELECT ID_USUARIO FROM ECM_USUARIOS WHERE EMAIL = 'chelsea.medeiros@google.com.br'), UPPER('o3gl3af7l'), UPPER('Chelsea'), UPPER('Medeiros'),'664.916.335-48','1999-01-22','40.559.514-1','(12) 4819-3563','(24) 91177-1323',1,'FEMININO'),
        ((SELECT ID_USUARIO FROM ECM_USUARIOS WHERE EMAIL = 'coby.souza@icloud.com'), UPPER('m0ny5ht8v'), UPPER('Coby'), UPPER('de Souza'),'586.027.874-58','1995-06-08','15.890.600-7','(21) 4679-6255','(12) 96921-9350',1,'PREFIRO_NAO_DIZER'),
        ((SELECT ID_USUARIO FROM ECM_USUARIOS WHERE EMAIL = 'edan.sales@icloud.com.br'), UPPER('q4mf0ny1i'), UPPER('Edan'), UPPER('Sales'),'852.919.756-37','1998-08-10','39.984.513-0','(24) 4422-1748','(12) 91083-3888',1,'PREFIRO_NAO_DIZER'),
        ((SELECT ID_USUARIO FROM ECM_USUARIOS WHERE EMAIL = 'candace.pinheiro@google.com'), UPPER('j0qk7hn1o'), UPPER('Candace'), UPPER('Pinheiro'),'747.173.417-84','1997-06-16','10.569.680-9','(22) 4462-8441','(22) 92661-5710',1,'MASCULINO')

        INSERT INTO ECM_CARTOES (ID_CLIENTE,ID_BANDEIRA,NOME_CARTAO,NOME_TITULAR,CPF_TITULAR,NUMERO,DATA_VALIDADE,CODIGO_SEGURANCA)
        VALUES
        (1,6, UPPER('Xandra Chen'),UPPER('Chelsea Medeiros'),'664.916.335-48','1675 2124 6532 6729','2030-03','877'),
        (2,1, UPPER('Reuben Glenn'),UPPER('Coby de Souza'),'586.027.874-58','5921 2920 4055 4196','2027-07','1808'),
        (3,2, UPPER('Dylan Cruz'),UPPER('Edan Sales'),'852.919.756-37','4728 2275 5372 6170','2030-02','537'),
        (4,10, UPPER('Mechelle Graham'),UPPER('Candace Pinheiro'),'747.173.417-84','3018 5829 5909 5836','2027-09','744');

        INSERT INTO ECM_CARTOES (ID_CLIENTE,ID_BANDEIRA,NOME_CARTAO,NOME_TITULAR,CPF_TITULAR,NUMERO,DATA_VALIDADE,CODIGO_SEGURANCA)
        VALUES
        (1,8, UPPER('Porter Floyd'),UPPER('Chelsea Medeiros'),'664.916.335-48','8336 6738 2119 0023','2028-02','6170'),
        (2,5, UPPER('Maite Rosa'),UPPER('Coby de Souza'),'586.027.874-58','5633 6477 5651 1643','2026-08','7242'),
        (3,5, UPPER('Vivian Ellis'),UPPER('Edan Sales'),'852.919.756-37','1188 7544 2735 4444','2026-04','389'),
        (4,3, UPPER('Beatrice Golden'),UPPER('Candace Pinheiro'),'747.173.417-84','5280 1771 1405 2397','2028-08','352');

        INSERT INTO ECM_CARTOES (ID_CLIENTE,ID_BANDEIRA,NOME_CARTAO,NOME_TITULAR,CPF_TITULAR,NUMERO,DATA_VALIDADE,CODIGO_SEGURANCA)
        VALUES
        (1,8, UPPER('Nulla'),UPPER('Chelsea Medeiros'),'664.916.335-48','2014 8541 8115 7194','2025-06','8916'),
        (2,5, UPPER('veniam'),UPPER('Coby de Souza'),'586.027.874-58','6011 8466 5918 8189','2026-03','554');

        INSERT INTO ECM_ENDERECOS (ID_CLIENTE,CEP,TIPO_LOGRADOURO,TIPO_RESIDENCIA,LOGRADOURO,BAIRRO,CIDADE,ESTADO,NOME_ENDERECO,PRINCIPAL,COBRANCA,NUMERO,PAIS)
        VALUES
        (1,'79106-501', 'RUA', 'APARTAMENTO',  'Rua Luiz Alberto Naglis', 'Vila Popular', 'Campo Grande', 'MS', 'Minha Casa', 1, 0, '704', 'Brasil'),
        (2,'79321-725', 'RUA', 'CASA', 'Rua Vinte e Um de Setembro', 'Jardim dos Estados', 'Corumbá', 'MS', 'Minha Casa', 1, 0, '9063', 'Brasil'),
        (3,'79082-010', 'RUA', 'STUDIO', 'Rua Ipero', 'Guanandi II', 'Campo Grande', 'MS', 'Trabalho', 1, 0, '67', 'Brasil'),
        (4,'79083-080', 'RUA', 'APARTAMENTO', 'Rua Bongiavane', 'Jardim Aero Rancho', 'Campo Grande', 'MS', 'Minha Casa', 1, 0, '9051', 'Brasil'),
        (1,'79117-242', 'RUA', 'CASA', 'Rua Nain Mastoub', 'Coophasul', 'Campo Grande', 'MS', 'Casa', 0, 1, '942', 'Brasil'),
        (2,'79064-462', 'RUA', 'EMPRESA', 'Rua Nazarena Milfont Sobreira', 'Paraíso do Lageado', 'Campo Grande', 'MS', 'Trabalho', 0, 1, '51', 'Brasil'),
        (3,'79823-025', 'RUA', 'CASA', 'Rua Cornélia Cerzósimo de Souza', 'Vila Aurora', 'Dourados', 'MS', 'Casa', 0, 1, '2704', 'Brasil'),
        (4,'79042-668', 'RUA', 'CASA', 'Rua Bronzita', 'Jardim Jerusalem', 'Campo Grande', 'MS', 'Casa', 0, 1, '500', 'Brasil')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (1,4,3,'porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (2,3,3,'ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (3,2,4,'lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a, enim.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (4,3,5,'dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (5,2,4,'et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (6,3,2,'nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (7,3,2,'tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (8,3,3,'non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (9,3,3,'Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (10,3,5,'ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (11,3,2,'interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (12,3,2,'pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (13,3,5,'a, dui. Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (14,1,4,'nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (15,2,4,'dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (16,4,2,'elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (17,2,4,'purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (18,3,5,'eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (19,2,2,'neque et nunc. Quisque ornare tortor at risus. Nunc ac',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (20,2,4,'Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante. Vivamus non',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (21,3,4,'sodales nisi magna sed dui. Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (22,3,5,'ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (23,2,3,'Aliquam adipiscing lobortis risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (24,2,3,'Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (25,3,2,'sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (26,3,5,'Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (27,2,2,'Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (28,3,4,'erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (29,1,3,'scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (30,3,3,'enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (31,1,4,'ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (32,1,4,'pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (33,1,4,'Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing. Mauris',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (34,1,2,'sed pede. Cum sociis natoque penatibus et magnis dis parturient montes,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (35,2,2,'ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (36,4,4,'mus. Proin vel arcu eu odio tristique pharetra. Quisque ac',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (37,4,5,'id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (38,2,3,'arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (39,3,4,'Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (40,4,3,'montes, nascetur ridiculus mus. Donec dignissim magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (41,3,2,'fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (42,2,4,'leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (43,4,4,'purus mauris a nunc. In at pede. Cras vulputate velit eu sem. Pellentesque ut',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (44,4,3,'iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (45,3,4,'tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (46,2,5,'justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (47,2,3,'amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (48,2,3,'facilisis, magna tellus faucibus leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (49,2,3,'augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (50,1,4,'sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (51,2,4,'Cras eu tellus eu augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (52,3,3,'eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (53,3,3,'lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (54,4,3,'commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi tempor lorem, eget mollis lectus pede et risus.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (55,4,5,'libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (56,3,3,'elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (57,3,2,'odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (58,3,5,'tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (59,1,2,'Nullam nisl. Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (60,3,3,'sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (61,3,4,'magna a tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (62,2,4,'Curabitur ut odio vel est tempor bibendum. Donec felis orci, adipiscing',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (63,3,2,'commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (64,1,5,'sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (65,3,3,'a, auctor non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (66,3,3,'eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (67,2,3,'Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (68,3,4,'odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (69,2,4,'rhoncus id, mollis nec, cursus a, enim. Suspendisse aliquet, sem ut',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (70,4,5,'augue porttitor interdum. Sed auctor odio a purus. Duis elementum, dui quis accumsan convallis, ante lectus convallis est, vitae sodales',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (71,2,3,'odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales at, velit. Pellentesque',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (72,3,3,'et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (73,1,2,'ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (74,3,3,'enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (75,2,4,'nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (76,2,4,'nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (77,2,3,'Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (78,4,3,'Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (79,2,3,'quis diam luctus lobortis. Class aptent taciti sociosqu ad litora torquent per conubia nostra,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (80,4,4,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris ut quam vel sapien imperdiet ornare. In faucibus.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (81,4,2,'accumsan neque et nunc. Quisque ornare tortor at risus. Nunc ac sem',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (82,3,3,'fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (83,2,4,'tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (84,1,5,'massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (85,1,3,'dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (86,2,4,'augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (87,4,4,'dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (88,1,4,'nunc. Quisque ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus ante dictum mi,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (89,3,5,'Fusce aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (90,1,5,'Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (91,1,5,'mauris elit, dictum eu, eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (92,1,4,'Fusce mollis. Duis sit amet diam eu dolor egestas rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (93,2,5,'sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (94,2,2,'tristique senectus et netus et malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (95,3,5,'ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu arcu. Morbi sit',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (96,1,2,'amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (97,3,5,'magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (98,2,4,'Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (99,2,3,'sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (100,2,4,'nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (101,2,3,'enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac facilisis facilisis,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (102,3,4,'In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci tincidunt adipiscing.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (1,3,3,'vel, vulputate eu, odio. Phasellus at augue id ante dictum cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (2,3,4,'nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (3,3,3,'dictum eleifend, nunc risus varius orci, in consequat enim diam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (4,3,3,'purus mauris a nunc. In at pede. Cras vulputate velit eu sem.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (5,2,4,'Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (6,3,3,'parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum metus. Aenean sed',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (7,2,4,'purus gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (8,3,4,'interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (9,2,3,'sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel arcu eu odio tristique pharetra. Quisque',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (10,4,3,'turpis egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (11,3,2,'Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum enim non nisi. Aenean',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (12,2,5,'adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui, in sodales elit erat vitae risus. Duis a mi',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (13,3,3,'feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla est.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (14,3,4,'euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim pharetra.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (15,2,4,'sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (16,3,3,'Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (17,1,5,'ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (18,3,4,'feugiat placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (19,3,4,'quis lectus. Nullam suscipit, est ac facilisis facilisis, magna tellus faucibus leo,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (20,2,5,'eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (21,2,4,'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (22,1,3,'lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (23,3,2,'justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (24,4,4,'mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (25,1,5,'Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (26,1,4,'neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (27,3,3,'In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (28,1,3,'dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (29,3,4,'leo, in lobortis tellus justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium aliquet,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (30,4,4,'luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada malesuada.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (31,1,3,'urna. Ut tincidunt vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (32,2,3,'gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (33,4,4,'vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (34,3,4,'gravida sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (35,2,3,'nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer vulputate, risus a ultricies adipiscing, enim mi',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (36,1,5,'aptent taciti sociosqu ad litora torquent per conubia nostra, per',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (37,3,5,'Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor vitae dolor. Donec fringilla. Donec feugiat metus sit amet ante.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (38,3,3,'ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (39,3,4,'sem. Pellentesque ut ipsum ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices, mauris ipsum porta elit, a',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (40,2,4,'vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (41,2,5,'nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (42,2,4,'non, feugiat nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis eget, ipsum. Donec sollicitudin adipiscing',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (43,2,3,'primis in faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel pede blandit congue.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (44,2,5,'luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi dictum augue malesuada',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (45,1,3,'In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor erat neque non quam. Pellentesque habitant morbi tristique',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (46,4,3,'metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (47,2,2,'sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (48,3,5,'tincidunt, neque vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (49,4,4,'Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin eget',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (50,1,5,'pede. Praesent eu dui. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (51,3,3,'non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (52,4,4,'Fusce feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (53,3,2,'blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (54,2,2,'posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (55,2,2,'vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus a,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (56,2,3,'viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (57,4,4,'dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum libero dui nec',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (58,3,4,'eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis dui,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (59,2,4,'ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan interdum libero dui nec',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (60,1,3,'at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (61,4,5,'Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (62,2,4,'elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (63,2,5,'congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (64,2,5,'rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (65,1,3,'Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (66,3,5,'In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (67,3,3,'magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (68,3,4,'eleifend nec, malesuada ut, sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (69,3,5,'luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (70,3,4,'Aliquam fringilla cursus purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (71,2,4,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Mauris',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (72,3,3,'nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (73,3,2,'Cras pellentesque. Sed dictum. Proin eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (74,2,3,'viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (75,3,4,'Mauris non dui nec urna suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante ipsum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (76,3,3,'quis arcu vel quam dignissim pharetra. Nam ac nulla. In tincidunt congue turpis. In condimentum. Donec at',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (77,3,4,'natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (78,3,2,'feugiat tellus lorem eu metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus pede sagittis augue,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (79,2,4,'eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (80,1,4,'eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit, pellentesque a, facilisis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (81,3,5,'Donec felis orci, adipiscing non, luctus sit amet, faucibus ut, nulla. Cras eu tellus eu augue porttitor interdum. Sed auctor odio',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (82,1,5,'orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus sit amet risus. Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (83,4,3,'elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna. Praesent interdum ligula eu enim.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (84,2,5,'imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (85,1,3,'blandit at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (86,3,4,'sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat nunc sit amet',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (87,3,5,'sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (88,1,5,'metus sit amet ante. Vivamus non lorem vitae odio sagittis semper. Nam tempor diam dictum sapien. Aenean',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (89,2,4,'eu turpis. Nulla aliquet. Proin velit. Sed malesuada augue ut lacus. Nulla tincidunt, neque vitae semper egestas, urna justo faucibus lectus,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (90,3,2,'odio sagittis semper. Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec, cursus',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (91,3,4,'Sed eget lacus. Mauris non dui nec urna suscipit nonummy. Fusce fermentum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (92,3,2,'leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis turpis vitae purus gravida',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (93,3,3,'nunc sed pede. Cum sociis natoque penatibus et magnis dis parturient montes,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (94,2,4,'malesuada id, erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (95,3,3,'nonummy ac, feugiat non, lobortis quis, pede. Suspendisse dui. Fusce diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris. Integer sem elit, pharetra ut,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (96,4,4,'eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis. Cras eget nisi',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (97,1,5,'Aliquam auctor, velit eget laoreet posuere, enim nisl elementum purus, accumsan',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (98,4,2,'dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (99,1,4,'interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci quis lectus. Nullam suscipit, est ac',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (100,3,2,'Nunc pulvinar arcu et pede. Nunc sed orci lobortis augue scelerisque mollis.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (101,2,5,'at fringilla purus mauris a nunc. In at pede. Cras vulputate',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (102,2,3,'quam, elementum at, egestas a, scelerisque sed, sapien. Nunc pulvinar arcu',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (1,2,2,'tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam laoreet, libero et tristique pellentesque, tellus sem mollis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (2,2,3,'purus. Nullam scelerisque neque sed sem egestas blandit. Nam nulla magna, malesuada vel, convallis in, cursus et,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (3,3,5,'Suspendisse aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (4,2,4,'sit amet orci. Ut sagittis lobortis mauris. Suspendisse aliquet molestie tellus. Aenean egestas hendrerit neque. In ornare sagittis felis. Donec tempor,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (5,3,3,'ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (6,4,4,'tempus mauris erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id nunc interdum feugiat. Sed',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (7,3,2,'sem. Nulla interdum. Curabitur dictum. Phasellus in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (8,1,3,'adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam vestibulum massa',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (9,1,3,'justo sit amet nulla. Donec non justo. Proin non massa non ante bibendum ullamcorper. Duis cursus, diam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (10,3,3,'semper tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (11,2,4,'congue. In scelerisque scelerisque dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (12,4,2,'Proin ultrices. Duis volutpat nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla. Integer',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (13,4,4,'hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida mauris ut mi. Duis risus odio, auctor vitae, aliquet',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (14,2,4,'velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (15,2,3,'metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (16,2,4,'justo eu arcu. Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (17,3,4,'massa rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede ac urna. Ut tincidunt vehicula risus. Nulla eget metus eu',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (18,2,2,'orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (19,3,4,'non massa non ante bibendum ullamcorper. Duis cursus, diam at pretium',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (20,1,3,'est. Mauris eu turpis. Nulla aliquet. Proin velit. Sed malesuada',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (21,3,3,'aliquet lobortis, nisi nibh lacinia orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (22,4,4,'vitae, aliquet nec, imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (23,4,3,'pede. Nunc sed orci lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (24,1,2,'orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc quis arcu vel quam dignissim',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (25,4,4,'felis. Donec tempor, est ac mattis semper, dui lectus rutrum urna, nec luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (26,2,3,'enim mi tempor lorem, eget mollis lectus pede et risus. Quisque libero lacus, varius et, euismod et,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (27,3,3,'augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor, tempus',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (28,3,3,'diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus nisi.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (29,3,3,'orci, consectetuer euismod est arcu ac orci. Ut semper pretium neque. Morbi quis urna. Nunc',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (30,3,4,'in felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (31,3,4,'Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (32,3,4,'orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer in magna. Phasellus dolor elit,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (33,3,3,'erat, eget tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (34,3,5,'rutrum lorem ac risus. Morbi metus. Vivamus euismod urna. Nullam lobortis quam a felis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (35,2,3,'sit amet, dapibus id, blandit at, nisi. Cum sociis natoque penatibus et',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (36,2,3,'sodales elit erat vitae risus. Duis a mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare, elit elit fermentum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (37,1,4,'nisl. Quisque fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh vulputate mauris',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (38,3,5,'aliquet odio. Etiam ligula tortor, dictum eu, placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (39,1,3,'fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum lorem,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (40,3,4,'Duis risus odio, auctor vitae, aliquet nec, imperdiet nec, leo.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (41,4,4,'dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (42,1,4,'bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci, in consequat enim',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (43,4,5,'eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque. Sed eget lacus. Mauris non dui nec urna suscipit',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (44,2,3,'ac tellus. Suspendisse sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (45,4,3,'Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum eu, placerat',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (46,4,5,'in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc. Quisque',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (47,4,3,'placerat eget, venenatis a, magna. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (48,3,5,'interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor, dictum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (49,3,4,'orci, in consequat enim diam vel arcu. Curabitur ut odio vel est',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (50,4,2,'eu nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (51,4,3,'ornare placerat, orci lacus vestibulum lorem, sit amet ultricies sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (52,4,3,'tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus justo eu',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (53,2,3,'odio tristique pharetra. Quisque ac libero nec ligula consectetuer rhoncus. Nullam velit dui, semper et, lacinia vitae, sodales',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (54,2,4,'varius et, euismod et, commodo at, libero. Morbi accumsan laoreet ipsum. Curabitur consequat, lectus',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (55,1,4,'faucibus orci luctus et ultrices posuere cubilia Curae Donec tincidunt. Donec vitae erat vel',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (56,3,5,'Morbi sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (57,2,2,'consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (58,3,4,'eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus id, libero. Donec consectetuer mauris id sapien. Cras',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (59,3,4,'Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (60,4,3,'mattis ornare, lectus ante dictum mi, ac mattis velit justo nec ante. Maecenas mi',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (61,2,3,'dictum ultricies ligula. Nullam enim. Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (62,2,3,'Sed nulla ante, iaculis nec, eleifend non, dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (63,3,3,'egestas. Fusce aliquet magna a neque. Nullam ut nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam arcu.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (64,3,3,'Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (65,2,3,'tellus id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (66,2,5,'Etiam bibendum fermentum metus. Aenean sed pede nec ante blandit viverra. Donec tempus, lorem fringilla ornare',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (67,2,3,'ac, fermentum vel, mauris. Integer sem elit, pharetra ut, pharetra sed,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (68,3,4,'vehicula risus. Nulla eget metus eu erat semper rutrum. Fusce dolor quam, elementum at,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (69,3,4,'gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit enim consequat purus. Maecenas libero est, congue a, aliquet vel,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (70,4,4,'vel, mauris. Integer sem elit, pharetra ut, pharetra sed, hendrerit a, arcu.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (71,1,4,'aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula tortor,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (72,1,4,'Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem semper erat, in consectetuer ipsum nunc id enim. Curabitur massa.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1)),
        (73,2,3,'urna. Nullam lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (74,2,4,'dui. Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit sed consequat auctor, nunc nulla vulputate dui, nec tempus mauris erat eget ipsum.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (75,4,4,'mi, ac mattis velit justo nec ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (76,3,4,'in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (77,2,4,'rutrum, justo. Praesent luctus. Curabitur egestas nunc sed libero. Proin sed turpis nec mauris blandit mattis.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (78,3,4,'bibendum ullamcorper. Duis cursus, diam at pretium aliquet, metus urna',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (79,3,4,'ac nulla. In tincidunt congue turpis. In condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus orci luctus et',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (80,1,4,'lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet diam. Sed diam lorem, auctor quis, tristique ac, eleifend vitae, erat. Vivamus',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (81,2,2,'Duis at lacus. Quisque purus sapien, gravida non, sollicitudin a, malesuada id, erat. Etiam',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (82,4,5,'at, nisi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin vel nisl.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (83,3,3,'ornare tortor at risus. Nunc ac sem ut dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (84,2,2,'risus. In mi pede, nonummy ut, molestie in, tempus eu, ligula. Aenean euismod mauris eu elit. Nulla facilisi. Sed neque.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (85,2,4,'justo faucibus lectus, a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (86,4,2,'pede et risus. Quisque libero lacus, varius et, euismod et, commodo',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (87,2,3,'ante. Maecenas mi felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh dolor, nonummy ac,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (88,4,3,'rhoncus. Proin nisl sem, consequat nec, mollis vitae, posuere at, velit. Cras lorem lorem, luctus ut, pellentesque eget, dictum placerat, augue. Sed molestie. Sed',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (89,3,3,'adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (90,2,3,'aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae aliquam eros turpis non enim. Mauris quis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (91,2,4,'tempor arcu. Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (92,3,5,'auctor velit. Aliquam nisl. Nulla eu neque pellentesque massa lobortis ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper, velit in aliquet',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (93,2,5,'aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in molestie tortor nibh sit amet orci. Ut sagittis lobortis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (94,2,4,'tincidunt dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis vel, faucibus',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (95,1,3,'nisi. Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam erat volutpat.',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 1),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 1));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (96,4,3,'elit, pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis massa. Mauris vestibulum, neque sed dictum eleifend, nunc',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (97,2,3,'Donec porttitor tellus non magna. Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2)),
        (98,4,4,'sit amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede, ultrices a, auctor non, feugiat nec, diam. Duis mi enim, condimentum',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (99,3,3,'placerat velit. Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas malesuada fringilla',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 3),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 3)),
        (100,4,2,'Donec consectetuer mauris id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis quis, pede. Praesent eu dui. Cum sociis natoque',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4));
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (101,4,3,'Mauris ut quam vel sapien imperdiet ornare. In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc mauris. Morbi',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 4),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 4)),
        (102,2,3,'pharetra nibh. Aliquam ornare, libero at auctor ullamcorper, nisl arcu iaculis',(SELECT NOME FROM ECM_CLIENTES WHERE ID_CLIENTE = 2),(SELECT EU.EMAIL FROM ECM_CLIENTES EC INNER JOIN ECM_USUARIOS EU ON EU.ID_USUARIO = EC.ID_USUARIO WHERE ID_CLIENTE = 2));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,1,1,'COMPRA','APROVADO','781.76','385.88','28.33','794.74',CONVERT(DATETIME, '2023-12-19 19:13:41', 121)),
        (1,1,1,'COMPRA','RECUSADO','744.71','326.21','38.77','549.81',CONVERT(DATETIME, '2022-07-20 07:38:26', 121)),
        (2,2,2,'COMPRA','APROVADO','796.70','181.33','56.41','458.85',CONVERT(DATETIME, '2022-04-10 12:58:29', 121)),
        (3,2,2,'COMPRA','APROVADO','743.38','374.77','55.33','843.93',CONVERT(DATETIME, '2022-06-03 21:00:56', 121)),
        (3,3,3,'COMPRA','APROVADO','876.07','482.10','49.55','859.56',CONVERT(DATETIME, '2024-06-11 22:55:19', 121)),
        (1,4,3,'COMPRA','APROVADO','806.84','200.14','73.02','497.88',CONVERT(DATETIME, '2023-01-19 03:45:06', 121)),
        (3,3,4,'COMPRA','APROVADO','712.74','432.94','55.61','499.23',CONVERT(DATETIME, '2023-05-25 21:54:17', 121)),
        (3,1,4,'COMPRA','RECUSADO','704.90','269.39','67.30','574.55',CONVERT(DATETIME, '2024-02-04 15:37:47', 121)),
        (3,4,10,'COMPRA','APROVADO','645.86','373.35','64.47','601.27',CONVERT(DATETIME, '2022-08-28 00:13:06', 121)),
        (1,1,10,'COMPRA','APROVADO','606.90','263.76','56.64','471.16',CONVERT(DATETIME, '2022-05-03 12:44:32', 121)),
        (3,2,11,'COMPRA','APROVADO','690.53','174.92','29.56','826.09',CONVERT(DATETIME, '2023-11-27 20:50:48', 121)),
        (2,4,11,'COMPRA','APROVADO','934.75','466.04','51.02','696.10',CONVERT(DATETIME, '2022-02-07 09:26:18', 121)),
        (3,4,12,'COMPRA','APROVADO','590.88','290.27','50.74','604.69',CONVERT(DATETIME, '2023-04-05 03:34:15', 121)),
        (2,3,12,'COMPRA','RECUSADO','900.75','144.79','64.67','757.92',CONVERT(DATETIME, '2022-06-10 04:15:30', 121)),
        (2,1,1,'COMPRA','APROVADO','553.24','210.97','62.32','783.24',CONVERT(DATETIME, '2024-01-06 18:53:44', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,4,1,'COMPRA','APROVADO','855.69','494.36','27.64','853.74',CONVERT(DATETIME, '2023-12-10 06:24:52', 121)),
        (4,2,2,'COMPRA','APROVADO','532.22','153.20','29.42','539.40',CONVERT(DATETIME, '2023-03-06 01:25:52', 121)),
        (4,4,2,'COMPRA','APROVADO','631.54','313.99','44.35','803.68',CONVERT(DATETIME, '2022-04-16 19:05:49', 121)),
        (2,4,3,'COMPRA','APROVADO','513.14','298.70','63.40','789.22',CONVERT(DATETIME, '2023-01-29 10:58:55', 121)),
        (4,3,3,'COMPRA','RECUSADO','554.38','468.51','70.88','735.90',CONVERT(DATETIME, '2024-03-25 13:04:58', 121)),
        (1,3,4,'COMPRA','APROVADO','586.87','289.39','57.12','787.72',CONVERT(DATETIME, '2023-12-20 14:23:41', 121)),
        (3,3,4,'COMPRA','APROVADO','874.71','191.96','32.11','828.74',CONVERT(DATETIME, '2023-12-16 04:14:26', 121)),
        (4,4,10,'COMPRA','APROVADO','619.33','137.52','33.91','783.00',CONVERT(DATETIME, '2023-12-18 05:13:30', 121)),
        (2,1,10,'COMPRA','APROVADO','661.50','466.97','43.53','578.65',CONVERT(DATETIME, '2023-12-16 22:21:36', 121)),
        (4,2,11,'COMPRA','APROVADO','728.70','430.58','55.19','707.56',CONVERT(DATETIME, '2022-12-27 07:05:51', 121)),
        (2,1,11,'COMPRA','RECUSADO','657.94','437.92','45.69','715.00',CONVERT(DATETIME, '2022-02-18 04:56:54', 121)),
        (3,1,12,'COMPRA','APROVADO','506.50','304.69','60.47','880.51',CONVERT(DATETIME, '2022-01-05 16:03:58', 121)),
        (1,1,12,'COMPRA','APROVADO','826.52','187.29','62.25','653.89',CONVERT(DATETIME, '2022-10-02 17:10:37', 121)),
        (3,4,1,'COMPRA','APROVADO','605.47','128.31','36.76','737.54',CONVERT(DATETIME, '2024-06-27 18:42:53', 121)),
        (2,2,1,'COMPRA','APROVADO','596.46','442.67','46.35','687.52',CONVERT(DATETIME, '2022-01-22 01:46:12', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,4,2,'COMPRA','APROVADO','747.95','164.38','65.15','519.75',CONVERT(DATETIME, '2022-11-01 11:58:33', 121)),
        (3,3,2,'COMPRA','RECUSADO','588.21','471.43','63.42','741.86',CONVERT(DATETIME, '2023-04-09 15:10:37', 121)),
        (2,1,3,'COMPRA','APROVADO','779.93','131.56','29.05','475.38',CONVERT(DATETIME, '2024-03-12 14:07:44', 121)),
        (3,3,3,'COMPRA','APROVADO','936.07','133.64','40.62','525.67',CONVERT(DATETIME, '2024-01-24 09:46:05', 121)),
        (1,2,4,'COMPRA','APROVADO','666.59','317.51','45.75','549.90',CONVERT(DATETIME, '2023-12-15 15:15:02', 121)),
        (4,2,4,'COMPRA','APROVADO','589.20','240.67','69.78','644.77',CONVERT(DATETIME, '2022-01-30 09:51:40', 121)),
        (2,2,10,'COMPRA','APROVADO','810.25','460.89','58.08','594.61',CONVERT(DATETIME, '2023-09-06 16:23:00', 121)),
        (3,2,10,'COMPRA','RECUSADO','822.87','255.70','31.58','618.70',CONVERT(DATETIME, '2024-01-06 03:56:34', 121)),
        (4,2,11,'COMPRA','APROVADO','957.20','425.49','60.82','531.76',CONVERT(DATETIME, '2024-06-05 08:04:48', 121)),
        (2,1,11,'COMPRA','APROVADO','584.11','106.65','33.86','526.52',CONVERT(DATETIME, '2022-07-28 22:36:55', 121)),
        (3,1,12,'COMPRA','APROVADO','673.91','243.78','40.96','601.20',CONVERT(DATETIME, '2022-10-20 15:41:47', 121)),
        (4,4,12,'COMPRA','APROVADO','573.94','346.18','69.90','769.85',CONVERT(DATETIME, '2022-12-22 02:11:17', 121)),
        (3,3,1,'COMPRA','APROVADO','525.33','479.37','65.39','893.15',CONVERT(DATETIME, '2022-08-08 02:44:16', 121)),
        (2,2,1,'COMPRA','RECUSADO','937.89','254.90','66.20','672.15',CONVERT(DATETIME, '2022-03-02 20:29:25', 121)),
        (2,1,2,'COMPRA','APROVADO','968.00','258.68','53.07','867.42',CONVERT(DATETIME, '2022-05-23 08:07:32', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,1,2,'COMPRA','APROVADO','698.55','119.57','29.37','833.07',CONVERT(DATETIME, '2024-01-08 03:56:56', 121)),
        (2,3,3,'COMPRA','APROVADO','759.25','323.26','55.63','709.84',CONVERT(DATETIME, '2023-01-29 20:07:44', 121)),
        (1,3,3,'COMPRA','APROVADO','949.64','485.95','33.48','704.38',CONVERT(DATETIME, '2022-04-25 23:03:28', 121)),
        (2,3,4,'COMPRA','APROVADO','853.41','232.96','46.49','783.56',CONVERT(DATETIME, '2022-04-27 10:02:17', 121)),
        (2,1,4,'COMPRA','RECUSADO','517.28','284.20','49.90','489.21',CONVERT(DATETIME, '2024-01-22 23:27:37', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,2,10,'COMPRA','APROVADO','717.48','451.92','41.76','644.00',CONVERT(DATETIME, '2023-01-14 20:49:49', 121)),
        (4,2,10,'COMPRA','APROVADO','795.01','395.31','35.16','593.52',CONVERT(DATETIME, '2022-06-19 04:03:15', 121)),
        (3,2,11,'COMPRA','APROVADO','541.70','321.88','66.80','555.97',CONVERT(DATETIME, '2022-05-04 07:01:50', 121)),
        (4,4,11,'COMPRA','APROVADO','651.16','436.76','60.05','840.42',CONVERT(DATETIME, '2023-05-29 16:34:38', 121)),
        (3,3,12,'COMPRA','APROVADO','728.26','341.90','39.60','588.98',CONVERT(DATETIME, '2022-12-05 11:46:10', 121)),
        (3,1,12,'COMPRA','RECUSADO','800.81','286.04','43.13','491.39',CONVERT(DATETIME, '2023-09-30 14:41:58', 121)),
        (3,3,1,'COMPRA','APROVADO','796.65','306.83','37.11','684.26',CONVERT(DATETIME, '2024-01-21 05:05:12', 121)),
        (4,1,1,'COMPRA','APROVADO','704.76','268.33','35.17','679.63',CONVERT(DATETIME, '2023-05-12 03:45:56', 121)),
        (3,4,2,'COMPRA','APROVADO','560.19','167.71','72.40','836.37',CONVERT(DATETIME, '2024-04-09 02:55:43', 121)),
        (4,1,2,'COMPRA','APROVADO','505.71','336.39','57.55','738.03',CONVERT(DATETIME, '2022-04-29 15:12:48', 121)),
        (2,1,3,'COMPRA','APROVADO','596.44','411.92','49.46','581.78',CONVERT(DATETIME, '2023-10-17 22:46:15', 121)),
        (2,2,3,'COMPRA','RECUSADO','835.44','276.60','33.27','737.93',CONVERT(DATETIME, '2024-03-04 01:45:15', 121)),
        (2,3,4,'COMPRA','APROVADO','636.97','427.25','66.85','421.27',CONVERT(DATETIME, '2022-09-15 17:44:16', 121)),
        (2,2,4,'COMPRA','APROVADO','919.81','286.85','59.23','592.49',CONVERT(DATETIME, '2023-01-10 22:15:21', 121)),
        (2,3,10,'COMPRA','APROVADO','519.01','450.39','28.63','404.10',CONVERT(DATETIME, '2024-06-26 12:49:19', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,3,10,'COMPRA','APROVADO','605.66','495.42','55.04','886.18',CONVERT(DATETIME, '2022-03-19 09:18:42', 121)),
        (3,2,11,'COMPRA','APROVADO','993.20','409.59','68.26','830.04',CONVERT(DATETIME, '2022-05-29 03:50:44', 121)),
        (3,3,11,'COMPRA','RECUSADO','835.70','285.67','45.83','462.42',CONVERT(DATETIME, '2023-08-31 20:39:19', 121)),
        (3,2,12,'COMPRA','APROVADO','998.94','438.31','52.69','442.47',CONVERT(DATETIME, '2022-05-08 05:05:16', 121)),
        (3,3,12,'COMPRA','APROVADO','523.04','169.09','39.11','653.27',CONVERT(DATETIME, '2023-01-08 07:53:14', 121)),
        (1,3,1,'COMPRA','APROVADO','967.64','273.11','50.40','756.60',CONVERT(DATETIME, '2022-11-06 07:17:20', 121)),
        (2,4,1,'COMPRA','APROVADO','802.73','426.49','42.86','481.56',CONVERT(DATETIME, '2022-04-01 11:00:01', 121)),
        (2,3,2,'COMPRA','APROVADO','937.15','336.25','41.59','779.57',CONVERT(DATETIME, '2024-03-20 12:45:14', 121)),
        (2,2,2,'COMPRA','RECUSADO','935.65','398.90','55.68','856.05',CONVERT(DATETIME, '2024-05-13 11:43:58', 121)),
        (4,2,3,'COMPRA','APROVADO','522.51','274.24','34.64','568.48',CONVERT(DATETIME, '2022-03-08 16:52:12', 121)),
        (1,3,3,'COMPRA','APROVADO','808.88','201.45','45.35','632.01',CONVERT(DATETIME, '2024-02-20 18:26:12', 121)),
        (2,2,4,'COMPRA','APROVADO','691.11','330.14','70.25','698.91',CONVERT(DATETIME, '2024-04-30 02:40:02', 121)),
        (3,3,4,'COMPRA','APROVADO','550.44','334.70','32.28','853.40',CONVERT(DATETIME, '2024-06-04 21:32:34', 121)),
        (1,3,10,'COMPRA','APROVADO','586.48','259.83','32.92','834.42',CONVERT(DATETIME, '2022-10-10 05:12:21', 121)),
        (1,3,10,'COMPRA','RECUSADO','693.75','255.04','30.64','678.23',CONVERT(DATETIME, '2024-03-06 20:59:30', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,11,'COMPRA','APROVADO','874.55','229.21','69.61','524.18',CONVERT(DATETIME, '2022-06-02 12:35:56', 121)),
        (2,3,11,'COMPRA','APROVADO','896.59','145.20','68.27','840.03',CONVERT(DATETIME, '2023-03-05 11:01:43', 121)),
        (2,2,12,'COMPRA','APROVADO','937.06','381.56','38.10','452.38',CONVERT(DATETIME, '2022-12-02 11:39:22', 121)),
        (2,3,12,'COMPRA','APROVADO','510.35','210.71','71.39','870.59',CONVERT(DATETIME, '2022-12-01 06:46:42', 121)),
        (2,3,1,'COMPRA','APROVADO','892.80','230.28','37.67','807.44',CONVERT(DATETIME, '2023-04-17 04:34:33', 121)),
        (2,2,1,'COMPRA','RECUSADO','894.03','451.80','59.06','618.69',CONVERT(DATETIME, '2023-07-09 20:25:11', 121)),
        (3,1,2,'COMPRA','APROVADO','507.29','334.30','74.35','796.91',CONVERT(DATETIME, '2024-01-11 20:43:20', 121)),
        (1,4,2,'COMPRA','APROVADO','545.46','159.69','62.28','477.41',CONVERT(DATETIME, '2023-01-12 03:11:51', 121)),
        (2,1,3,'COMPRA','APROVADO','951.45','121.55','57.61','405.34',CONVERT(DATETIME, '2022-07-13 21:42:43', 121)),
        (4,2,3,'COMPRA','APROVADO','657.99','390.20','47.76','599.17',CONVERT(DATETIME, '2022-04-11 00:45:24', 121)),
        (2,2,4,'COMPRA','APROVADO','975.69','112.22','59.12','848.05',CONVERT(DATETIME, '2022-01-07 21:19:37', 121)),
        (2,2,4,'COMPRA','RECUSADO','884.56','480.05','51.84','513.84',CONVERT(DATETIME, '2024-03-29 21:06:00', 121)),
        (3,4,10,'COMPRA','APROVADO','510.92','498.52','72.07','658.10',CONVERT(DATETIME, '2022-03-22 14:39:07', 121)),
        (1,2,10,'COMPRA','APROVADO','806.57','255.92','41.71','465.86',CONVERT(DATETIME, '2024-02-22 15:38:21', 121)),
        (4,4,11,'COMPRA','APROVADO','883.70','104.76','25.18','767.89',CONVERT(DATETIME, '2023-05-23 21:11:02', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,3,11,'COMPRA','APROVADO','796.43','131.20','71.55','604.98',CONVERT(DATETIME, '2023-03-18 02:15:19', 121)),
        (1,2,12,'COMPRA','APROVADO','633.59','216.36','58.40','576.87',CONVERT(DATETIME, '2023-04-03 09:15:14', 121)),
        (3,2,12,'COMPRA','RECUSADO','593.64','230.91','69.30','555.63',CONVERT(DATETIME, '2023-06-30 03:47:02', 121)),
        (3,3,1,'COMPRA','APROVADO','895.20','238.98','55.04','620.22',CONVERT(DATETIME, '2023-11-25 02:37:17', 121)),
        (2,2,1,'COMPRA','APROVADO','608.09','370.17','72.93','697.67',CONVERT(DATETIME, '2023-09-15 17:00:45', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,4,2,'COMPRA','APROVADO','697.17','133.81','45.01','740.82',CONVERT(DATETIME, '2023-09-17 00:39:41', 121)),
        (2,1,2,'COMPRA','APROVADO','815.26','182.85','71.24','585.21',CONVERT(DATETIME, '2022-08-09 12:08:30', 121)),
        (4,4,3,'COMPRA','APROVADO','601.28','276.38','33.46','597.46',CONVERT(DATETIME, '2022-10-28 10:31:14', 121)),
        (4,1,3,'COMPRA','RECUSADO','595.53','384.49','56.02','717.40',CONVERT(DATETIME, '2024-02-28 15:42:42', 121)),
        (2,2,4,'COMPRA','APROVADO','572.24','390.55','66.61','894.57',CONVERT(DATETIME, '2022-07-28 09:34:00', 121)),
        (2,1,4,'COMPRA','APROVADO','965.37','479.77','64.67','898.97',CONVERT(DATETIME, '2023-05-28 05:58:55', 121)),
        (2,1,10,'COMPRA','APROVADO','975.89','307.49','38.49','607.51',CONVERT(DATETIME, '2022-12-10 02:58:53', 121)),
        (3,4,10,'COMPRA','APROVADO','690.28','392.32','67.71','807.73',CONVERT(DATETIME, '2024-04-23 08:35:18', 121)),
        (2,2,11,'COMPRA','APROVADO','670.05','299.49','43.24','791.04',CONVERT(DATETIME, '2022-09-19 21:19:47', 121)),
        (3,3,11,'COMPRA','RECUSADO','533.11','246.18','58.29','640.67',CONVERT(DATETIME, '2022-04-25 16:33:55', 121)),
        (1,3,12,'COMPRA','APROVADO','880.50','335.24','32.48','476.69',CONVERT(DATETIME, '2023-09-15 15:57:51', 121)),
        (3,4,12,'COMPRA','APROVADO','729.11','221.92','37.64','861.01',CONVERT(DATETIME, '2023-12-25 06:06:26', 121)),
        (3,2,1,'COMPRA','APROVADO','962.81','143.64','33.94','609.24',CONVERT(DATETIME, '2024-02-10 01:42:31', 121)),
        (2,3,1,'COMPRA','APROVADO','914.16','458.45','62.28','709.54',CONVERT(DATETIME, '2024-05-27 02:08:01', 121)),
        (3,2,2,'COMPRA','APROVADO','540.53','485.69','37.17','650.33',CONVERT(DATETIME, '2022-11-17 18:18:03', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,1,2,'COMPRA','RECUSADO','675.85','388.01','69.79','863.11',CONVERT(DATETIME, '2022-10-08 12:30:03', 121)),
        (1,1,3,'COMPRA','APROVADO','658.99','291.63','41.10','450.46',CONVERT(DATETIME, '2022-11-21 22:13:08', 121)),
        (2,4,3,'COMPRA','APROVADO','949.79','257.57','29.28','458.30',CONVERT(DATETIME, '2024-03-10 09:19:31', 121)),
        (3,2,4,'COMPRA','APROVADO','824.53','242.00','33.18','710.07',CONVERT(DATETIME, '2022-12-23 13:30:06', 121)),
        (3,2,4,'COMPRA','APROVADO','802.84','234.81','34.65','424.53',CONVERT(DATETIME, '2023-06-11 12:59:25', 121)),
        (2,3,10,'COMPRA','APROVADO','794.10','122.94','69.83','707.98',CONVERT(DATETIME, '2022-08-11 05:47:08', 121)),
        (2,1,10,'COMPRA','RECUSADO','998.77','497.96','32.78','481.63',CONVERT(DATETIME, '2022-05-28 10:01:02', 121)),
        (3,1,11,'COMPRA','APROVADO','840.93','232.94','51.41','572.95',CONVERT(DATETIME, '2023-03-20 22:12:16', 121)),
        (4,1,11,'COMPRA','APROVADO','521.17','358.67','54.27','820.91',CONVERT(DATETIME, '2023-03-14 03:30:37', 121)),
        (2,4,12,'COMPRA','APROVADO','997.55','442.02','49.11','460.07',CONVERT(DATETIME, '2023-07-13 13:34:20', 121)),
        (2,2,12,'COMPRA','APROVADO','782.23','131.87','61.87','717.44',CONVERT(DATETIME, '2023-02-10 15:46:30', 121)),
        (4,3,1,'COMPRA','APROVADO','704.83','231.70','37.28','457.77',CONVERT(DATETIME, '2022-03-13 19:45:03', 121)),
        (3,1,1,'COMPRA','RECUSADO','915.07','175.15','31.47','804.81',CONVERT(DATETIME, '2022-11-08 13:39:50', 121)),
        (2,3,2,'COMPRA','APROVADO','539.51','499.26','36.77','629.64',CONVERT(DATETIME, '2023-09-07 22:44:58', 121)),
        (3,2,2,'COMPRA','APROVADO','801.45','320.42','33.71','516.27',CONVERT(DATETIME, '2022-06-21 13:00:16', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,2,3,'COMPRA','APROVADO','802.05','109.76','37.57','656.54',CONVERT(DATETIME, '2022-06-30 14:04:39', 121)),
        (2,3,3,'COMPRA','APROVADO','560.02','140.09','63.89','404.73',CONVERT(DATETIME, '2023-03-20 09:42:07', 121)),
        (3,2,4,'COMPRA','APROVADO','903.26','123.09','34.28','793.03',CONVERT(DATETIME, '2022-04-11 03:48:04', 121)),
        (1,2,4,'COMPRA','RECUSADO','627.43','208.07','39.88','410.06',CONVERT(DATETIME, '2022-10-09 07:20:26', 121)),
        (2,3,10,'COMPRA','APROVADO','863.87','239.45','71.68','456.00',CONVERT(DATETIME, '2023-08-06 18:54:10', 121)),
        (1,2,10,'COMPRA','APROVADO','910.66','163.11','40.07','620.30',CONVERT(DATETIME, '2023-11-20 01:51:28', 121)),
        (3,3,11,'COMPRA','APROVADO','632.79','492.20','74.58','415.14',CONVERT(DATETIME, '2022-03-14 14:50:19', 121)),
        (2,2,11,'COMPRA','APROVADO','831.35','374.16','45.14','505.05',CONVERT(DATETIME, '2022-04-25 04:10:22', 121)),
        (2,4,12,'COMPRA','APROVADO','906.74','468.91','31.01','451.01',CONVERT(DATETIME, '2023-07-05 20:09:50', 121)),
        (1,1,12,'COMPRA','RECUSADO','704.54','392.69','64.09','603.78',CONVERT(DATETIME, '2023-05-18 02:44:32', 121)),
        (3,3,1,'COMPRA','APROVADO','733.62','346.00','48.08','613.22',CONVERT(DATETIME, '2022-06-02 11:08:45', 121)),
        (1,1,1,'COMPRA','APROVADO','657.77','341.42','41.24','521.38',CONVERT(DATETIME, '2022-08-12 14:30:20', 121)),
        (3,2,2,'COMPRA','APROVADO','551.83','236.54','45.43','832.70',CONVERT(DATETIME, '2022-09-15 07:20:38', 121)),
        (3,2,2,'COMPRA','APROVADO','664.03','137.24','47.67','545.23',CONVERT(DATETIME, '2023-03-20 05:37:09', 121)),
        (1,3,3,'COMPRA','APROVADO','510.16','272.59','47.60','605.37',CONVERT(DATETIME, '2022-02-15 09:57:37', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,2,3,'COMPRA','RECUSADO','767.25','147.27','66.02','666.82',CONVERT(DATETIME, '2022-06-09 16:55:20', 121)),
        (3,2,4,'COMPRA','APROVADO','742.85','243.75','61.57','425.12',CONVERT(DATETIME, '2024-06-24 18:32:20', 121)),
        (3,1,4,'COMPRA','APROVADO','730.54','498.69','51.02','822.46',CONVERT(DATETIME, '2022-05-03 04:29:37', 121)),
        (2,3,10,'COMPRA','APROVADO','840.46','104.39','49.92','717.70',CONVERT(DATETIME, '2022-10-06 06:34:35', 121)),
        (1,3,10,'COMPRA','APROVADO','622.89','154.32','62.45','568.97',CONVERT(DATETIME, '2022-05-16 01:51:37', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,1,11,'COMPRA','APROVADO','545.88','479.61','27.10','441.60',CONVERT(DATETIME, '2022-03-05 00:27:25', 121)),
        (2,1,11,'COMPRA','RECUSADO','532.99','139.37','63.07','777.45',CONVERT(DATETIME, '2023-12-06 13:54:22', 121)),
        (3,2,12,'COMPRA','APROVADO','922.40','125.88','47.88','653.80',CONVERT(DATETIME, '2023-12-12 18:41:23', 121)),
        (2,3,12,'COMPRA','APROVADO','886.31','425.72','67.51','625.47',CONVERT(DATETIME, '2022-01-27 15:55:09', 121)),
        (4,4,1,'COMPRA','APROVADO','816.26','212.64','55.82','610.02',CONVERT(DATETIME, '2022-06-26 20:26:02', 121)),
        (3,3,1,'COMPRA','APROVADO','586.99','273.06','57.36','718.36',CONVERT(DATETIME, '2022-05-31 02:54:08', 121)),
        (3,1,2,'COMPRA','APROVADO','782.99','485.20','46.95','874.90',CONVERT(DATETIME, '2024-02-18 04:11:23', 121)),
        (2,1,2,'COMPRA','RECUSADO','671.38','405.53','30.84','787.37',CONVERT(DATETIME, '2024-03-31 18:11:26', 121)),
        (2,3,3,'COMPRA','APROVADO','923.14','385.14','52.71','865.82',CONVERT(DATETIME, '2023-02-18 00:01:25', 121)),
        (3,4,3,'COMPRA','APROVADO','671.63','148.53','44.71','400.47',CONVERT(DATETIME, '2022-06-12 05:35:41', 121)),
        (3,2,4,'COMPRA','APROVADO','544.34','353.08','60.60','558.15',CONVERT(DATETIME, '2024-06-13 04:22:16', 121)),
        (3,1,4,'COMPRA','APROVADO','777.06','452.01','54.95','805.20',CONVERT(DATETIME, '2023-05-18 20:31:26', 121)),
        (3,1,10,'COMPRA','APROVADO','628.03','221.37','64.25','875.57',CONVERT(DATETIME, '2022-04-21 07:46:12', 121)),
        (3,1,10,'COMPRA','RECUSADO','889.09','424.77','43.20','507.28',CONVERT(DATETIME, '2024-04-23 00:37:29', 121)),
        (2,2,11,'COMPRA','APROVADO','500.90','452.22','33.83','459.38',CONVERT(DATETIME, '2022-09-08 08:33:24', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,11,'COMPRA','APROVADO','509.85','337.67','47.59','811.32',CONVERT(DATETIME, '2022-05-19 10:27:58', 121)),
        (1,1,12,'COMPRA','APROVADO','500.69','175.12','34.12','676.35',CONVERT(DATETIME, '2022-09-12 14:37:27', 121)),
        (2,4,12,'COMPRA','APROVADO','751.07','333.61','49.21','461.76',CONVERT(DATETIME, '2022-05-15 02:06:10', 121)),
        (1,3,1,'COMPRA','APROVADO','838.99','185.92','50.76','749.64',CONVERT(DATETIME, '2022-08-30 03:29:20', 121)),
        (1,3,1,'COMPRA','RECUSADO','942.12','153.74','37.30','666.74',CONVERT(DATETIME, '2023-02-28 06:36:31', 121)),
        (2,4,2,'COMPRA','APROVADO','771.55','231.45','46.18','807.90',CONVERT(DATETIME, '2022-12-31 23:40:59', 121)),
        (3,2,2,'COMPRA','APROVADO','752.55','350.70','46.12','510.79',CONVERT(DATETIME, '2022-05-12 22:16:19', 121)),
        (4,4,3,'COMPRA','APROVADO','682.68','183.84','29.22','448.96',CONVERT(DATETIME, '2024-02-08 14:31:09', 121)),
        (4,3,3,'COMPRA','APROVADO','835.07','385.39','61.10','406.41',CONVERT(DATETIME, '2022-01-27 01:54:54', 121)),
        (1,3,4,'COMPRA','APROVADO','561.23','190.29','68.39','873.94',CONVERT(DATETIME, '2023-09-03 15:52:54', 121)),
        (1,1,4,'COMPRA','RECUSADO','501.74','476.66','34.20','637.49',CONVERT(DATETIME, '2022-03-10 18:22:21', 121)),
        (1,2,10,'COMPRA','APROVADO','674.33','351.51','50.09','551.79',CONVERT(DATETIME, '2022-09-12 10:49:53', 121)),
        (4,4,10,'COMPRA','APROVADO','758.69','173.83','62.66','732.54',CONVERT(DATETIME, '2023-08-15 21:23:01', 121)),
        (3,4,11,'COMPRA','APROVADO','955.22','466.36','36.09','794.23',CONVERT(DATETIME, '2023-04-16 08:19:36', 121)),
        (3,3,11,'COMPRA','APROVADO','892.74','317.83','46.18','655.05',CONVERT(DATETIME, '2022-06-02 08:07:29', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,12,'COMPRA','APROVADO','677.34','242.92','33.47','597.68',CONVERT(DATETIME, '2022-03-14 09:01:47', 121)),
        (3,1,12,'COMPRA','RECUSADO','663.14','343.19','27.91','607.82',CONVERT(DATETIME, '2024-03-16 01:08:49', 121)),
        (3,1,1,'COMPRA','APROVADO','697.70','143.83','30.35','822.69',CONVERT(DATETIME, '2024-04-12 06:44:03', 121)),
        (3,4,1,'COMPRA','APROVADO','648.50','376.91','73.15','628.68',CONVERT(DATETIME, '2022-12-21 16:24:07', 121)),
        (3,2,2,'COMPRA','APROVADO','961.78','315.87','74.70','657.75',CONVERT(DATETIME, '2022-06-13 20:00:37', 121)),
        (2,2,2,'COMPRA','APROVADO','584.89','442.97','61.97','898.82',CONVERT(DATETIME, '2023-07-12 13:04:59', 121)),
        (1,3,3,'COMPRA','APROVADO','522.05','223.30','45.84','882.23',CONVERT(DATETIME, '2023-10-20 11:54:56', 121)),
        (4,4,3,'COMPRA','RECUSADO','998.45','442.15','36.02','588.35',CONVERT(DATETIME, '2024-03-10 10:03:26', 121)),
        (4,2,4,'COMPRA','APROVADO','633.08','176.90','42.73','807.31',CONVERT(DATETIME, '2023-09-04 00:14:20', 121)),
        (3,3,4,'COMPRA','APROVADO','797.33','268.18','68.95','794.18',CONVERT(DATETIME, '2022-11-30 12:30:52', 121)),
        (2,3,10,'COMPRA','APROVADO','851.21','419.61','36.03','826.70',CONVERT(DATETIME, '2022-07-25 21:53:09', 121)),
        (2,4,10,'COMPRA','APROVADO','952.45','220.39','26.64','757.77',CONVERT(DATETIME, '2023-03-10 09:38:30', 121)),
        (1,4,11,'COMPRA','APROVADO','995.87','253.41','65.14','448.53',CONVERT(DATETIME, '2023-04-29 10:31:01', 121)),
        (3,2,11,'COMPRA','RECUSADO','696.63','488.54','54.19','718.14',CONVERT(DATETIME, '2024-03-09 14:00:07', 121)),
        (2,3,12,'COMPRA','APROVADO','875.28','168.07','38.77','485.26',CONVERT(DATETIME, '2022-12-03 23:06:50', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,2,12,'COMPRA','APROVADO','780.40','189.77','46.66','689.04',CONVERT(DATETIME, '2023-06-29 07:43:19', 121)),
        (2,2,1,'COMPRA','APROVADO','764.80','240.78','67.01','896.59',CONVERT(DATETIME, '2022-05-18 05:52:20', 121)),
        (2,3,1,'COMPRA','APROVADO','744.43','455.73','34.03','487.99',CONVERT(DATETIME, '2022-11-20 01:47:22', 121)),
        (1,2,2,'COMPRA','APROVADO','908.56','125.19','37.25','816.30',CONVERT(DATETIME, '2022-03-15 01:56:49', 121)),
        (2,3,2,'COMPRA','RECUSADO','887.47','464.07','55.44','865.07',CONVERT(DATETIME, '2022-10-11 07:31:56', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,3,3,'COMPRA','APROVADO','791.98','294.54','42.12','630.10',CONVERT(DATETIME, '2022-06-17 22:32:21', 121)),
        (3,2,3,'COMPRA','APROVADO','740.17','116.72','41.27','620.63',CONVERT(DATETIME, '2023-11-01 20:49:39', 121)),
        (2,2,4,'COMPRA','APROVADO','988.28','186.63','45.31','744.28',CONVERT(DATETIME, '2022-02-12 18:35:31', 121)),
        (3,1,4,'COMPRA','APROVADO','960.65','127.02','33.31','637.30',CONVERT(DATETIME, '2023-06-05 18:08:43', 121)),
        (1,3,10,'COMPRA','APROVADO','545.82','381.59','38.93','848.84',CONVERT(DATETIME, '2022-10-30 11:47:21', 121)),
        (1,2,10,'COMPRA','RECUSADO','730.52','423.41','38.22','634.80',CONVERT(DATETIME, '2022-03-03 07:33:02', 121)),
        (1,2,11,'COMPRA','APROVADO','901.91','453.74','62.95','659.54',CONVERT(DATETIME, '2022-04-14 19:36:37', 121)),
        (4,2,11,'COMPRA','APROVADO','840.95','191.36','65.11','752.46',CONVERT(DATETIME, '2022-08-06 04:38:01', 121)),
        (3,1,12,'COMPRA','APROVADO','994.87','294.80','28.49','763.79',CONVERT(DATETIME, '2022-07-04 10:23:21', 121)),
        (3,4,12,'COMPRA','APROVADO','937.52','436.12','69.34','671.16',CONVERT(DATETIME, '2022-02-21 02:19:34', 121)),
        (3,2,1,'COMPRA','APROVADO','964.13','191.80','71.55','761.86',CONVERT(DATETIME, '2023-12-11 13:39:44', 121)),
        (3,2,1,'COMPRA','RECUSADO','596.46','201.43','71.15','658.67',CONVERT(DATETIME, '2023-05-16 02:47:54', 121)),
        (3,1,2,'COMPRA','APROVADO','644.51','335.97','38.65','754.52',CONVERT(DATETIME, '2022-10-10 21:53:28', 121)),
        (2,1,2,'COMPRA','APROVADO','667.68','264.01','35.15','535.78',CONVERT(DATETIME, '2024-03-14 08:40:41', 121)),
        (2,4,3,'COMPRA','APROVADO','987.90','442.15','48.10','490.24',CONVERT(DATETIME, '2022-03-12 20:15:31', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,2,3,'COMPRA','APROVADO','918.50','210.08','61.76','686.56',CONVERT(DATETIME, '2022-01-03 06:51:54', 121)),
        (1,2,4,'COMPRA','APROVADO','776.41','349.88','72.55','822.30',CONVERT(DATETIME, '2024-04-24 15:58:19', 121)),
        (3,2,4,'COMPRA','RECUSADO','868.88','391.94','68.81','701.58',CONVERT(DATETIME, '2023-01-20 02:40:00', 121)),
        (4,4,10,'COMPRA','APROVADO','797.70','324.41','38.42','684.51',CONVERT(DATETIME, '2023-12-01 17:16:43', 121)),
        (2,3,10,'COMPRA','APROVADO','687.71','370.25','63.97','722.81',CONVERT(DATETIME, '2024-05-20 18:20:56', 121)),
        (2,1,11,'COMPRA','APROVADO','818.57','274.26','53.02','853.80',CONVERT(DATETIME, '2024-05-12 10:31:04', 121)),
        (2,3,11,'COMPRA','APROVADO','638.99','406.60','72.50','570.96',CONVERT(DATETIME, '2023-10-26 11:53:59', 121)),
        (3,3,12,'COMPRA','APROVADO','787.55','140.47','28.78','707.09',CONVERT(DATETIME, '2024-05-15 03:55:59', 121)),
        (3,3,12,'COMPRA','RECUSADO','783.20','386.87','52.41','887.91',CONVERT(DATETIME, '2022-12-05 20:19:08', 121)),
        (1,3,1,'COMPRA','APROVADO','986.34','177.68','69.98','547.20',CONVERT(DATETIME, '2022-12-09 23:11:01', 121)),
        (2,2,1,'COMPRA','APROVADO','741.47','431.78','72.49','448.30',CONVERT(DATETIME, '2022-10-23 05:16:10', 121)),
        (1,2,2,'COMPRA','APROVADO','867.97','196.03','64.74','887.97',CONVERT(DATETIME, '2022-02-19 02:34:40', 121)),
        (3,2,2,'COMPRA','APROVADO','815.64','488.12','60.29','775.02',CONVERT(DATETIME, '2024-06-08 05:09:55', 121)),
        (2,2,3,'COMPRA','APROVADO','601.05','316.63','70.24','627.51',CONVERT(DATETIME, '2023-08-31 21:12:54', 121)),
        (3,4,3,'COMPRA','RECUSADO','862.98','149.63','30.89','897.53',CONVERT(DATETIME, '2022-12-10 06:20:21', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,2,4,'COMPRA','APROVADO','977.16','447.98','70.09','502.74',CONVERT(DATETIME, '2023-02-08 02:03:22', 121)),
        (1,1,4,'COMPRA','APROVADO','640.58','352.14','34.61','873.77',CONVERT(DATETIME, '2022-01-22 04:01:51', 121)),
        (2,3,10,'COMPRA','APROVADO','603.35','155.55','70.05','540.14',CONVERT(DATETIME, '2022-12-16 15:32:15', 121)),
        (3,2,10,'COMPRA','APROVADO','577.86','374.26','72.35','604.91',CONVERT(DATETIME, '2023-05-05 15:50:27', 121)),
        (3,2,11,'COMPRA','APROVADO','918.01','220.80','44.16','561.75',CONVERT(DATETIME, '2022-02-25 21:39:22', 121)),
        (2,3,11,'COMPRA','RECUSADO','831.86','362.16','59.10','809.19',CONVERT(DATETIME, '2023-04-25 02:49:23', 121)),
        (4,1,12,'COMPRA','APROVADO','803.13','100.84','39.60','469.43',CONVERT(DATETIME, '2022-07-02 11:04:18', 121)),
        (3,1,12,'COMPRA','APROVADO','606.78','272.73','38.49','789.68',CONVERT(DATETIME, '2022-11-04 02:04:07', 121)),
        (4,2,1,'COMPRA','APROVADO','978.74','464.47','44.66','437.44',CONVERT(DATETIME, '2022-12-20 20:45:33', 121)),
        (2,2,1,'COMPRA','APROVADO','807.48','484.84','30.98','623.38',CONVERT(DATETIME, '2024-03-01 15:27:50', 121)),
        (4,2,2,'COMPRA','APROVADO','981.93','208.54','74.37','694.63',CONVERT(DATETIME, '2023-08-24 09:12:51', 121)),
        (4,3,2,'COMPRA','RECUSADO','551.92','176.35','52.93','748.34',CONVERT(DATETIME, '2022-02-01 10:52:13', 121)),
        (4,3,3,'COMPRA','APROVADO','821.86','144.84','44.30','617.58',CONVERT(DATETIME, '2022-10-13 04:35:20', 121)),
        (2,4,3,'COMPRA','APROVADO','532.54','174.18','70.34','842.34',CONVERT(DATETIME, '2023-08-08 08:37:03', 121)),
        (4,3,4,'COMPRA','APROVADO','667.11','155.99','47.14','839.82',CONVERT(DATETIME, '2024-04-12 15:06:21', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,4,'COMPRA','APROVADO','612.52','157.97','42.01','846.16',CONVERT(DATETIME, '2022-12-06 16:35:38', 121)),
        (2,4,10,'COMPRA','APROVADO','514.82','444.89','67.67','639.47',CONVERT(DATETIME, '2022-09-15 01:34:21', 121)),
        (4,4,10,'COMPRA','RECUSADO','982.19','355.08','67.38','443.91',CONVERT(DATETIME, '2022-11-14 19:49:06', 121)),
        (2,4,11,'COMPRA','APROVADO','727.39','240.30','34.84','825.44',CONVERT(DATETIME, '2024-04-18 01:51:47', 121)),
        (2,1,11,'COMPRA','APROVADO','904.22','102.18','65.42','895.45',CONVERT(DATETIME, '2023-09-27 18:48:25', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,2,12,'COMPRA','APROVADO','884.02','414.14','26.61','704.23',CONVERT(DATETIME, '2023-04-28 23:56:19', 121)),
        (3,1,12,'COMPRA','APROVADO','698.35','250.51','56.64','569.80',CONVERT(DATETIME, '2022-03-11 01:53:44', 121)),
        (1,1,1,'COMPRA','APROVADO','564.96','364.62','26.51','895.96',CONVERT(DATETIME, '2024-02-23 04:42:01', 121)),
        (3,1,1,'COMPRA','RECUSADO','502.17','314.22','51.34','656.75',CONVERT(DATETIME, '2024-02-23 15:50:50', 121)),
        (2,1,2,'COMPRA','APROVADO','701.36','258.88','25.39','475.14',CONVERT(DATETIME, '2023-07-10 23:31:47', 121)),
        (4,2,2,'COMPRA','APROVADO','750.83','302.69','44.05','708.16',CONVERT(DATETIME, '2022-04-30 02:46:41', 121)),
        (2,4,3,'COMPRA','APROVADO','712.07','207.07','42.72','590.65',CONVERT(DATETIME, '2022-05-02 22:58:26', 121)),
        (3,1,3,'COMPRA','APROVADO','501.23','110.90','61.92','510.44',CONVERT(DATETIME, '2024-03-06 18:51:01', 121)),
        (1,3,4,'COMPRA','APROVADO','936.40','203.23','29.85','697.37',CONVERT(DATETIME, '2022-07-12 12:35:26', 121)),
        (2,3,4,'COMPRA','RECUSADO','829.62','354.98','31.44','595.12',CONVERT(DATETIME, '2023-07-26 19:34:57', 121)),
        (1,3,10,'COMPRA','APROVADO','542.79','431.61','73.77','595.28',CONVERT(DATETIME, '2022-12-14 11:07:40', 121)),
        (1,3,10,'COMPRA','APROVADO','737.39','179.16','48.24','750.11',CONVERT(DATETIME, '2023-10-25 17:20:01', 121)),
        (3,2,11,'COMPRA','APROVADO','567.62','221.21','50.07','430.21',CONVERT(DATETIME, '2023-11-08 07:14:12', 121)),
        (2,2,11,'COMPRA','APROVADO','561.27','493.42','46.26','755.86',CONVERT(DATETIME, '2023-12-26 18:15:06', 121)),
        (3,2,12,'COMPRA','APROVADO','951.06','354.95','55.08','478.99',CONVERT(DATETIME, '2023-06-26 11:22:45', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,3,12,'COMPRA','RECUSADO','850.88','488.27','54.76','877.24',CONVERT(DATETIME, '2023-08-22 22:54:12', 121)),
        (3,2,1,'COMPRA','APROVADO','524.87','451.43','25.13','835.02',CONVERT(DATETIME, '2023-01-12 12:54:34', 121)),
        (2,4,1,'COMPRA','APROVADO','701.40','380.93','30.77','767.40',CONVERT(DATETIME, '2023-06-26 13:24:01', 121)),
        (3,2,2,'COMPRA','APROVADO','965.81','420.45','59.98','689.71',CONVERT(DATETIME, '2024-01-29 10:04:02', 121)),
        (4,2,2,'COMPRA','APROVADO','787.87','488.47','59.68','418.81',CONVERT(DATETIME, '2022-12-02 01:58:43', 121)),
        (3,1,3,'COMPRA','APROVADO','972.54','498.17','53.62','459.37',CONVERT(DATETIME, '2022-06-15 06:21:07', 121)),
        (2,3,3,'COMPRA','RECUSADO','583.20','404.44','47.90','853.87',CONVERT(DATETIME, '2022-03-12 14:20:57', 121)),
        (1,4,4,'COMPRA','APROVADO','853.20','433.15','43.60','668.32',CONVERT(DATETIME, '2023-08-19 16:20:54', 121)),
        (3,2,4,'COMPRA','APROVADO','931.09','290.50','37.44','468.85',CONVERT(DATETIME, '2022-07-11 20:54:17', 121)),
        (3,3,10,'COMPRA','APROVADO','700.28','151.59','63.22','632.03',CONVERT(DATETIME, '2022-06-15 12:22:32', 121)),
        (3,2,10,'COMPRA','APROVADO','668.23','484.79','60.48','872.91',CONVERT(DATETIME, '2022-02-03 04:51:01', 121)),
        (4,2,11,'COMPRA','APROVADO','785.06','101.29','38.12','700.62',CONVERT(DATETIME, '2022-12-11 12:59:54', 121)),
        (2,2,11,'COMPRA','RECUSADO','735.85','295.36','59.04','543.94',CONVERT(DATETIME, '2022-04-25 10:42:48', 121)),
        (2,3,12,'COMPRA','APROVADO','695.38','256.07','73.84','402.96',CONVERT(DATETIME, '2023-09-29 01:49:22', 121)),
        (2,4,12,'COMPRA','APROVADO','952.48','366.56','31.00','834.90',CONVERT(DATETIME, '2023-09-12 03:53:18', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,1,1,'COMPRA','APROVADO','685.06','339.95','38.15','617.61',CONVERT(DATETIME, '2022-11-12 20:20:15', 121)),
        (4,3,1,'COMPRA','APROVADO','900.81','311.97','25.42','542.20',CONVERT(DATETIME, '2024-03-15 06:34:46', 121)),
        (4,3,2,'COMPRA','APROVADO','546.66','249.44','25.30','873.49',CONVERT(DATETIME, '2023-11-07 03:37:25', 121)),
        (2,3,2,'COMPRA','RECUSADO','580.26','486.46','45.48','463.08',CONVERT(DATETIME, '2024-01-07 17:57:08', 121)),
        (3,1,3,'COMPRA','APROVADO','677.83','312.85','43.66','445.35',CONVERT(DATETIME, '2022-11-10 01:31:49', 121)),
        (3,2,3,'COMPRA','APROVADO','543.32','417.21','28.00','445.20',CONVERT(DATETIME, '2022-07-15 02:50:01', 121)),
        (2,2,4,'COMPRA','APROVADO','920.64','461.04','64.85','874.33',CONVERT(DATETIME, '2023-08-11 23:10:02', 121)),
        (2,1,4,'COMPRA','APROVADO','686.91','447.05','57.85','482.65',CONVERT(DATETIME, '2023-09-21 22:32:39', 121)),
        (3,3,10,'COMPRA','APROVADO','701.14','431.64','62.53','487.40',CONVERT(DATETIME, '2022-06-06 11:34:29', 121)),
        (3,2,10,'COMPRA','RECUSADO','688.96','124.57','32.62','569.04',CONVERT(DATETIME, '2024-05-15 11:48:12', 121)),
        (3,1,11,'COMPRA','APROVADO','906.01','135.00','41.34','538.07',CONVERT(DATETIME, '2022-10-06 19:43:13', 121)),
        (1,3,11,'COMPRA','APROVADO','705.14','475.94','58.85','716.50',CONVERT(DATETIME, '2023-03-30 21:44:07', 121)),
        (4,3,12,'COMPRA','APROVADO','745.23','231.48','61.41','647.53',CONVERT(DATETIME, '2023-05-27 12:26:40', 121)),
        (2,1,12,'COMPRA','APROVADO','774.72','262.96','60.94','834.42',CONVERT(DATETIME, '2022-06-18 10:50:14', 121)),
        (1,2,1,'COMPRA','APROVADO','671.46','388.68','36.04','628.36',CONVERT(DATETIME, '2022-05-25 03:45:28', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,1,1,'COMPRA','RECUSADO','544.58','496.33','52.93','642.57',CONVERT(DATETIME, '2023-03-25 02:30:51', 121)),
        (2,3,2,'COMPRA','APROVADO','948.04','244.20','44.14','760.24',CONVERT(DATETIME, '2024-05-21 22:21:38', 121)),
        (3,1,2,'COMPRA','APROVADO','693.66','260.42','42.14','887.20',CONVERT(DATETIME, '2024-04-03 16:41:31', 121)),
        (3,1,3,'COMPRA','APROVADO','537.21','209.33','58.73','555.19',CONVERT(DATETIME, '2023-11-27 18:02:52', 121)),
        (2,2,3,'COMPRA','APROVADO','937.47','414.54','48.99','609.01',CONVERT(DATETIME, '2023-09-04 21:27:33', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,4,'COMPRA','APROVADO','896.10','146.94','38.18','483.79',CONVERT(DATETIME, '2023-03-15 14:41:47', 121)),
        (4,1,4,'COMPRA','RECUSADO','653.71','288.85','31.99','765.74',CONVERT(DATETIME, '2022-03-17 05:43:16', 121)),
        (2,1,10,'COMPRA','APROVADO','916.24','280.09','37.19','853.04',CONVERT(DATETIME, '2022-10-18 21:22:13', 121)),
        (1,3,10,'COMPRA','APROVADO','651.90','320.09','58.34','783.87',CONVERT(DATETIME, '2024-03-28 20:36:05', 121)),
        (3,3,11,'COMPRA','APROVADO','713.32','490.88','43.25','840.70',CONVERT(DATETIME, '2022-01-22 16:20:51', 121)),
        (2,3,11,'COMPRA','APROVADO','813.01','399.51','56.19','645.37',CONVERT(DATETIME, '2023-11-20 10:10:10', 121)),
        (4,3,12,'COMPRA','APROVADO','508.43','146.58','53.36','586.69',CONVERT(DATETIME, '2024-06-22 07:40:47', 121)),
        (2,1,12,'COMPRA','RECUSADO','790.30','292.41','31.68','539.91',CONVERT(DATETIME, '2022-01-24 07:54:22', 121)),
        (1,3,1,'COMPRA','APROVADO','523.03','428.08','74.23','626.00',CONVERT(DATETIME, '2023-06-11 14:15:00', 121)),
        (2,1,1,'COMPRA','APROVADO','791.40','340.44','50.03','486.19',CONVERT(DATETIME, '2023-10-03 10:23:40', 121)),
        (1,3,2,'COMPRA','APROVADO','903.47','133.88','40.06','413.19',CONVERT(DATETIME, '2024-05-10 08:51:58', 121)),
        (4,4,2,'COMPRA','APROVADO','730.03','396.89','52.41','570.73',CONVERT(DATETIME, '2024-01-13 08:36:23', 121)),
        (4,3,3,'COMPRA','APROVADO','776.60','119.31','35.28','808.79',CONVERT(DATETIME, '2022-04-30 00:02:07', 121)),
        (3,4,3,'COMPRA','RECUSADO','778.46','174.10','35.46','710.88',CONVERT(DATETIME, '2023-04-12 07:13:32', 121)),
        (2,2,4,'COMPRA','APROVADO','782.06','361.49','59.22','446.55',CONVERT(DATETIME, '2024-03-23 09:32:08', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,3,4,'COMPRA','APROVADO','989.71','124.11','38.76','459.69',CONVERT(DATETIME, '2023-11-29 14:19:48', 121)),
        (2,1,10,'COMPRA','APROVADO','858.99','152.91','36.43','548.69',CONVERT(DATETIME, '2022-03-27 00:20:03', 121)),
        (3,3,10,'COMPRA','APROVADO','985.40','228.83','30.54','851.55',CONVERT(DATETIME, '2023-07-30 15:57:31', 121)),
        (3,4,11,'COMPRA','APROVADO','614.54','255.73','26.04','793.82',CONVERT(DATETIME, '2023-02-20 19:43:14', 121)),
        (2,4,11,'COMPRA','RECUSADO','554.88','289.46','64.70','401.89',CONVERT(DATETIME, '2023-03-04 18:49:11', 121)),
        (3,3,12,'COMPRA','APROVADO','783.46','247.16','65.69','843.29',CONVERT(DATETIME, '2022-02-08 22:48:53', 121)),
        (2,1,12,'COMPRA','APROVADO','589.88','405.97','66.42','867.66',CONVERT(DATETIME, '2024-02-16 02:25:27', 121)),
        (2,3,1,'COMPRA','APROVADO','896.33','233.39','48.30','724.33',CONVERT(DATETIME, '2023-12-01 04:25:44', 121)),
        (3,2,1,'COMPRA','APROVADO','944.15','480.48','52.14','618.47',CONVERT(DATETIME, '2023-09-26 21:48:42', 121)),
        (1,3,2,'COMPRA','APROVADO','727.26','210.85','50.31','413.63',CONVERT(DATETIME, '2022-01-30 12:56:07', 121)),
        (3,4,2,'COMPRA','RECUSADO','616.15','496.19','36.19','654.39',CONVERT(DATETIME, '2022-09-25 09:17:58', 121)),
        (2,3,3,'COMPRA','APROVADO','926.42','441.24','61.15','411.47',CONVERT(DATETIME, '2023-12-16 17:24:45', 121)),
        (3,3,3,'COMPRA','APROVADO','699.69','340.74','26.21','522.65',CONVERT(DATETIME, '2023-01-10 06:38:45', 121)),
        (2,1,4,'COMPRA','APROVADO','854.05','311.59','60.64','529.54',CONVERT(DATETIME, '2023-03-01 07:25:15', 121)),
        (1,2,4,'COMPRA','APROVADO','626.36','190.59','51.81','423.08',CONVERT(DATETIME, '2022-03-05 08:06:39', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,3,10,'COMPRA','APROVADO','900.01','463.10','55.16','412.25',CONVERT(DATETIME, '2022-10-19 04:11:38', 121)),
        (3,2,10,'COMPRA','RECUSADO','913.46','355.84','48.82','674.68',CONVERT(DATETIME, '2022-09-10 04:50:15', 121)),
        (1,4,11,'COMPRA','APROVADO','643.47','310.25','46.66','529.52',CONVERT(DATETIME, '2022-01-20 00:47:02', 121)),
        (3,2,11,'COMPRA','APROVADO','512.94','374.69','42.52','606.32',CONVERT(DATETIME, '2024-06-28 21:27:23', 121)),
        (1,1,12,'COMPRA','APROVADO','707.79','489.09','55.76','657.25',CONVERT(DATETIME, '2023-05-29 09:46:36', 121)),
        (3,1,12,'COMPRA','APROVADO','908.21','432.02','52.78','631.57',CONVERT(DATETIME, '2023-12-20 02:59:53', 121)),
        (3,3,1,'COMPRA','APROVADO','748.57','497.70','50.77','600.98',CONVERT(DATETIME, '2024-06-08 19:43:47', 121)),
        (4,3,1,'COMPRA','RECUSADO','511.32','326.22','41.90','693.39',CONVERT(DATETIME, '2022-10-07 05:33:33', 121)),
        (4,1,2,'COMPRA','APROVADO','611.64','193.14','66.87','597.89',CONVERT(DATETIME, '2024-02-23 00:36:59', 121)),
        (4,1,2,'COMPRA','APROVADO','952.03','289.58','71.34','827.30',CONVERT(DATETIME, '2022-07-30 16:22:26', 121)),
        (3,2,3,'COMPRA','APROVADO','808.64','319.48','50.80','826.91',CONVERT(DATETIME, '2023-12-16 04:53:16', 121)),
        (2,2,3,'COMPRA','APROVADO','818.63','227.02','31.43','772.16',CONVERT(DATETIME, '2022-09-24 02:21:21', 121)),
        (2,3,4,'COMPRA','APROVADO','516.81','330.02','67.87','426.24',CONVERT(DATETIME, '2024-05-26 03:41:19', 121)),
        (1,4,4,'COMPRA','RECUSADO','687.57','316.52','26.90','848.48',CONVERT(DATETIME, '2022-05-18 06:38:16', 121)),
        (1,2,10,'COMPRA','APROVADO','740.34','340.42','31.68','631.31',CONVERT(DATETIME, '2023-11-06 17:57:18', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,10,'COMPRA','APROVADO','685.89','111.61','49.94','589.79',CONVERT(DATETIME, '2023-12-01 17:22:04', 121)),
        (1,1,11,'COMPRA','APROVADO','576.00','178.81','74.33','528.07',CONVERT(DATETIME, '2023-09-27 19:57:02', 121)),
        (2,1,11,'COMPRA','APROVADO','785.11','463.95','42.08','883.16',CONVERT(DATETIME, '2022-04-19 23:46:07', 121)),
        (2,1,12,'COMPRA','APROVADO','974.60','479.34','74.22','636.78',CONVERT(DATETIME, '2023-10-20 02:27:16', 121)),
        (3,3,12,'COMPRA','RECUSADO','580.45','434.57','30.30','518.49',CONVERT(DATETIME, '2023-06-19 21:26:53', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,1,1,'COMPRA','APROVADO','996.34','474.82','64.90','455.16',CONVERT(DATETIME, '2023-10-23 19:08:09', 121)),
        (2,3,1,'COMPRA','APROVADO','543.70','219.36','32.48','604.49',CONVERT(DATETIME, '2023-12-14 02:29:52', 121)),
        (3,3,2,'COMPRA','APROVADO','745.72','381.15','53.38','763.32',CONVERT(DATETIME, '2024-01-14 22:41:38', 121)),
        (1,2,2,'COMPRA','APROVADO','560.88','177.94','37.51','725.03',CONVERT(DATETIME, '2022-11-04 21:00:27', 121)),
        (1,2,3,'COMPRA','APROVADO','879.99','397.14','47.07','799.83',CONVERT(DATETIME, '2023-05-14 22:00:08', 121)),
        (1,3,3,'COMPRA','RECUSADO','711.82','237.49','25.68','784.42',CONVERT(DATETIME, '2022-08-21 10:10:43', 121)),
        (4,4,4,'COMPRA','APROVADO','550.23','431.71','45.29','814.10',CONVERT(DATETIME, '2023-02-06 06:55:13', 121)),
        (3,3,4,'COMPRA','APROVADO','792.16','390.95','53.86','589.50',CONVERT(DATETIME, '2024-04-26 07:36:44', 121)),
        (3,2,10,'COMPRA','APROVADO','987.43','216.99','37.54','772.38',CONVERT(DATETIME, '2023-08-25 13:18:04', 121)),
        (3,3,10,'COMPRA','APROVADO','920.89','271.09','42.83','512.93',CONVERT(DATETIME, '2022-12-13 05:02:53', 121)),
        (3,3,11,'COMPRA','APROVADO','800.55','307.87','61.07','471.14',CONVERT(DATETIME, '2024-06-29 10:35:09', 121)),
        (3,2,11,'COMPRA','RECUSADO','774.81','388.25','44.84','747.33',CONVERT(DATETIME, '2024-06-04 05:19:30', 121)),
        (2,3,12,'COMPRA','APROVADO','621.01','274.31','35.36','596.77',CONVERT(DATETIME, '2023-01-27 13:47:55', 121)),
        (2,4,12,'COMPRA','APROVADO','967.02','170.86','32.28','524.75',CONVERT(DATETIME, '2022-08-14 11:45:01', 121)),
        (3,3,1,'COMPRA','APROVADO','695.50','206.89','34.34','748.48',CONVERT(DATETIME, '2023-10-04 20:08:57', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,1,1,'COMPRA','APROVADO','883.11','145.96','73.43','695.24',CONVERT(DATETIME, '2022-07-24 20:52:57', 121)),
        (3,4,2,'COMPRA','APROVADO','652.57','258.26','71.49','401.08',CONVERT(DATETIME, '2024-03-07 10:07:58', 121)),
        (4,2,2,'COMPRA','RECUSADO','775.29','351.16','44.02','441.90',CONVERT(DATETIME, '2022-06-16 22:36:01', 121)),
        (4,1,3,'COMPRA','APROVADO','975.90','159.70','42.52','793.64',CONVERT(DATETIME, '2022-03-21 07:55:40', 121)),
        (3,2,3,'COMPRA','APROVADO','882.71','378.54','50.73','427.73',CONVERT(DATETIME, '2023-08-22 21:01:04', 121)),
        (4,2,4,'COMPRA','APROVADO','825.08','180.92','61.61','616.27',CONVERT(DATETIME, '2024-03-11 19:43:51', 121)),
        (3,1,4,'COMPRA','APROVADO','548.21','342.37','38.87','889.28',CONVERT(DATETIME, '2022-09-21 13:37:11', 121)),
        (3,1,10,'COMPRA','APROVADO','751.08','481.31','32.65','449.47',CONVERT(DATETIME, '2022-10-04 19:54:53', 121)),
        (4,3,10,'COMPRA','RECUSADO','975.53','484.90','34.55','628.19',CONVERT(DATETIME, '2024-06-15 14:19:12', 121)),
        (3,2,11,'COMPRA','APROVADO','926.38','110.42','34.51','516.17',CONVERT(DATETIME, '2022-04-29 12:54:17', 121)),
        (4,2,11,'COMPRA','APROVADO','944.41','110.27','37.04','722.16',CONVERT(DATETIME, '2022-08-24 15:01:31', 121)),
        (3,2,12,'COMPRA','APROVADO','766.23','331.23','73.61','499.69',CONVERT(DATETIME, '2024-06-25 11:24:34', 121)),
        (4,2,12,'COMPRA','APROVADO','918.03','242.12','38.56','616.52',CONVERT(DATETIME, '2022-01-17 04:20:21', 121)),
        (1,3,1,'COMPRA','APROVADO','945.92','164.16','70.76','723.13',CONVERT(DATETIME, '2024-01-02 07:19:37', 121)),
        (1,2,1,'COMPRA','RECUSADO','511.22','349.66','43.15','755.94',CONVERT(DATETIME, '2023-06-18 21:50:33', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,3,2,'COMPRA','APROVADO','550.45','386.36','54.29','575.17',CONVERT(DATETIME, '2024-06-09 16:40:19', 121)),
        (2,3,2,'COMPRA','APROVADO','634.27','216.48','43.71','600.81',CONVERT(DATETIME, '2023-04-05 04:08:36', 121)),
        (4,2,3,'COMPRA','APROVADO','743.34','199.22','30.83','592.33',CONVERT(DATETIME, '2022-07-27 04:54:58', 121)),
        (3,2,3,'COMPRA','APROVADO','519.15','209.83','63.54','568.67',CONVERT(DATETIME, '2022-04-29 04:41:51', 121)),
        (3,1,4,'COMPRA','APROVADO','619.57','401.16','73.51','659.80',CONVERT(DATETIME, '2022-06-12 23:56:20', 121)),
        (2,4,4,'COMPRA','RECUSADO','960.14','124.74','39.47','899.72',CONVERT(DATETIME, '2022-05-24 22:30:01', 121)),
        (3,3,10,'COMPRA','APROVADO','628.59','476.26','47.54','867.54',CONVERT(DATETIME, '2022-07-31 01:17:31', 121)),
        (3,2,10,'COMPRA','APROVADO','532.54','409.33','46.90','500.64',CONVERT(DATETIME, '2023-07-25 21:33:25', 121)),
        (3,2,11,'COMPRA','APROVADO','805.79','352.73','34.91','730.68',CONVERT(DATETIME, '2023-03-17 05:19:49', 121)),
        (2,2,11,'COMPRA','APROVADO','720.04','178.68','42.50','623.98',CONVERT(DATETIME, '2023-10-21 09:27:21', 121)),
        (1,4,12,'COMPRA','APROVADO','944.44','138.44','56.38','870.74',CONVERT(DATETIME, '2024-04-23 05:51:55', 121)),
        (3,2,12,'COMPRA','RECUSADO','590.68','380.09','63.43','554.79',CONVERT(DATETIME, '2023-04-23 18:04:52', 121)),
        (3,2,1,'COMPRA','APROVADO','907.74','393.89','49.18','886.50',CONVERT(DATETIME, '2024-03-15 07:40:31', 121)),
        (2,2,1,'COMPRA','APROVADO','949.28','463.61','44.19','887.80',CONVERT(DATETIME, '2022-10-06 06:18:24', 121)),
        (2,4,2,'COMPRA','APROVADO','560.13','496.66','52.86','783.01',CONVERT(DATETIME, '2024-02-27 20:42:28', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,4,2,'COMPRA','APROVADO','928.10','277.32','61.44','739.69',CONVERT(DATETIME, '2022-05-10 06:20:56', 121)),
        (3,3,3,'COMPRA','APROVADO','527.63','106.12','44.67','583.50',CONVERT(DATETIME, '2022-06-18 10:57:25', 121)),
        (3,1,3,'COMPRA','RECUSADO','861.62','377.59','59.09','468.47',CONVERT(DATETIME, '2023-07-07 07:54:38', 121)),
        (2,1,4,'COMPRA','APROVADO','735.24','252.79','67.72','717.13',CONVERT(DATETIME, '2023-06-03 09:07:50', 121)),
        (4,4,4,'COMPRA','APROVADO','925.90','109.83','70.85','690.26',CONVERT(DATETIME, '2022-02-20 04:36:07', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,10,'COMPRA','APROVADO','668.30','275.85','69.80','424.21',CONVERT(DATETIME, '2022-11-15 23:48:34', 121)),
        (1,1,10,'COMPRA','APROVADO','850.35','352.29','67.47','513.08',CONVERT(DATETIME, '2022-11-25 10:26:19', 121)),
        (4,1,11,'COMPRA','APROVADO','688.31','123.37','27.87','800.70',CONVERT(DATETIME, '2023-02-02 13:34:48', 121)),
        (2,3,11,'COMPRA','RECUSADO','912.07','396.36','58.77','671.01',CONVERT(DATETIME, '2022-07-01 13:44:30', 121)),
        (3,3,12,'COMPRA','APROVADO','882.10','458.28','47.01','615.70',CONVERT(DATETIME, '2023-10-29 16:25:26', 121)),
        (1,2,12,'COMPRA','APROVADO','935.50','281.73','50.12','867.92',CONVERT(DATETIME, '2022-01-07 06:57:13', 121)),
        (3,3,1,'COMPRA','APROVADO','916.47','283.50','59.96','691.25',CONVERT(DATETIME, '2022-04-08 08:30:08', 121)),
        (3,4,1,'COMPRA','APROVADO','508.01','436.05','32.13','438.09',CONVERT(DATETIME, '2024-06-16 00:29:42', 121)),
        (4,2,2,'COMPRA','APROVADO','897.55','386.19','65.66','557.01',CONVERT(DATETIME, '2023-05-17 16:47:50', 121)),
        (1,2,2,'COMPRA','RECUSADO','990.86','154.27','35.90','668.38',CONVERT(DATETIME, '2023-01-08 20:04:50', 121)),
        (4,3,3,'COMPRA','APROVADO','900.81','234.86','31.83','810.52',CONVERT(DATETIME, '2023-05-02 00:49:40', 121)),
        (2,3,3,'COMPRA','APROVADO','747.57','303.05','50.23','593.37',CONVERT(DATETIME, '2023-08-15 23:52:15', 121)),
        (2,2,4,'COMPRA','APROVADO','581.63','147.57','41.84','872.48',CONVERT(DATETIME, '2024-03-23 02:24:02', 121)),
        (2,3,4,'COMPRA','APROVADO','823.06','157.25','31.89','587.03',CONVERT(DATETIME, '2023-06-29 02:58:48', 121)),
        (2,2,10,'COMPRA','APROVADO','879.54','322.29','71.20','631.24',CONVERT(DATETIME, '2023-07-06 01:01:42', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,4,10,'COMPRA','RECUSADO','723.13','336.59','72.94','896.93',CONVERT(DATETIME, '2023-05-25 23:04:34', 121)),
        (2,4,11,'COMPRA','APROVADO','611.85','365.76','57.80','533.01',CONVERT(DATETIME, '2024-04-29 16:30:16', 121)),
        (1,3,11,'COMPRA','APROVADO','904.42','467.64','30.37','650.00',CONVERT(DATETIME, '2023-05-27 23:43:13', 121)),
        (3,1,12,'COMPRA','APROVADO','578.34','451.13','53.67','776.63',CONVERT(DATETIME, '2023-01-07 05:31:26', 121)),
        (2,2,12,'COMPRA','APROVADO','670.37','343.93','66.09','712.25',CONVERT(DATETIME, '2023-11-20 20:32:06', 121)),
        (3,4,1,'COMPRA','APROVADO','984.05','115.56','40.76','676.71',CONVERT(DATETIME, '2023-03-20 06:55:56', 121)),
        (2,3,1,'COMPRA','RECUSADO','632.72','180.35','51.57','811.94',CONVERT(DATETIME, '2022-07-16 18:58:46', 121)),
        (3,4,2,'COMPRA','APROVADO','873.83','120.24','38.65','745.13',CONVERT(DATETIME, '2024-02-07 09:55:28', 121)),
        (3,2,2,'COMPRA','APROVADO','596.11','459.88','34.12','401.61',CONVERT(DATETIME, '2023-02-16 05:54:18', 121)),
        (4,2,3,'COMPRA','APROVADO','580.12','135.89','44.05','472.81',CONVERT(DATETIME, '2022-04-21 12:58:33', 121)),
        (4,2,3,'COMPRA','APROVADO','606.22','471.70','28.22','610.90',CONVERT(DATETIME, '2022-12-28 01:10:57', 121)),
        (2,1,4,'COMPRA','APROVADO','946.50','260.30','38.20','608.74',CONVERT(DATETIME, '2022-08-18 15:42:34', 121)),
        (4,1,4,'COMPRA','RECUSADO','766.46','182.92','65.01','564.89',CONVERT(DATETIME, '2023-04-29 08:36:25', 121)),
        (4,1,10,'COMPRA','APROVADO','525.29','263.72','59.81','814.93',CONVERT(DATETIME, '2023-09-27 08:54:51', 121)),
        (3,2,10,'COMPRA','APROVADO','829.95','114.55','54.88','769.56',CONVERT(DATETIME, '2024-01-29 22:03:02', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,1,11,'COMPRA','APROVADO','910.68','208.88','37.47','492.22',CONVERT(DATETIME, '2022-10-09 23:32:49', 121)),
        (4,3,11,'COMPRA','APROVADO','631.27','409.56','36.76','725.03',CONVERT(DATETIME, '2023-04-06 06:29:49', 121)),
        (2,3,12,'COMPRA','APROVADO','561.57','380.38','71.49','611.38',CONVERT(DATETIME, '2022-08-09 14:39:41', 121)),
        (3,3,12,'COMPRA','RECUSADO','666.75','400.65','64.68','530.51',CONVERT(DATETIME, '2023-07-10 00:48:12', 121)),
        (1,1,1,'COMPRA','APROVADO','672.80','218.99','70.75','845.25',CONVERT(DATETIME, '2023-04-03 08:29:31', 121)),
        (3,1,1,'COMPRA','APROVADO','816.96','183.44','54.06','542.22',CONVERT(DATETIME, '2023-10-01 16:45:22', 121)),
        (3,2,2,'COMPRA','APROVADO','954.75','160.40','35.32','681.16',CONVERT(DATETIME, '2022-09-13 10:35:42', 121)),
        (3,3,2,'COMPRA','APROVADO','944.59','246.89','54.74','743.16',CONVERT(DATETIME, '2023-05-26 22:48:07', 121)),
        (2,4,3,'COMPRA','APROVADO','920.63','387.80','56.46','771.96',CONVERT(DATETIME, '2023-01-10 03:49:30', 121)),
        (3,2,3,'COMPRA','RECUSADO','856.77','206.49','38.78','429.60',CONVERT(DATETIME, '2022-03-08 15:36:30', 121)),
        (2,2,4,'COMPRA','APROVADO','859.96','190.22','71.03','527.07',CONVERT(DATETIME, '2024-05-25 00:54:58', 121)),
        (2,2,4,'COMPRA','APROVADO','600.11','440.55','32.91','571.93',CONVERT(DATETIME, '2022-09-05 01:16:40', 121)),
        (1,1,10,'COMPRA','APROVADO','601.08','114.34','61.75','428.44',CONVERT(DATETIME, '2022-03-27 03:38:53', 121)),
        (3,2,10,'COMPRA','APROVADO','781.21','213.70','50.82','675.66',CONVERT(DATETIME, '2024-04-18 13:41:15', 121)),
        (3,1,11,'COMPRA','APROVADO','895.76','103.76','59.21','882.60',CONVERT(DATETIME, '2022-01-14 12:18:50', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,1,11,'COMPRA','RECUSADO','530.12','331.47','52.52','858.04',CONVERT(DATETIME, '2023-07-20 04:16:49', 121)),
        (2,2,12,'COMPRA','APROVADO','541.78','413.00','54.04','595.67',CONVERT(DATETIME, '2024-05-19 14:38:07', 121)),
        (3,2,12,'COMPRA','APROVADO','636.68','272.84','74.45','663.99',CONVERT(DATETIME, '2023-11-21 23:30:07', 121)),
        (4,4,1,'COMPRA','APROVADO','771.82','343.18','61.05','755.95',CONVERT(DATETIME, '2023-05-03 14:00:00', 121)),
        (2,3,1,'COMPRA','APROVADO','903.62','195.60','34.80','768.44',CONVERT(DATETIME, '2023-06-28 17:24:01', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,4,2,'COMPRA','APROVADO','848.94','139.29','52.82','790.34',CONVERT(DATETIME, '2023-01-22 02:09:37', 121)),
        (4,1,2,'COMPRA','RECUSADO','807.50','312.62','32.83','591.76',CONVERT(DATETIME, '2023-02-12 10:34:18', 121)),
        (1,3,3,'COMPRA','APROVADO','733.40','250.83','68.06','442.48',CONVERT(DATETIME, '2022-06-18 15:22:14', 121)),
        (3,3,3,'COMPRA','APROVADO','594.80','267.38','53.53','750.31',CONVERT(DATETIME, '2023-12-25 06:37:37', 121)),
        (1,4,4,'COMPRA','APROVADO','782.59','489.40','56.17','448.96',CONVERT(DATETIME, '2023-10-23 20:24:53', 121)),
        (2,3,4,'COMPRA','APROVADO','585.17','201.51','40.44','462.87',CONVERT(DATETIME, '2023-09-21 10:47:28', 121)),
        (2,2,10,'COMPRA','APROVADO','701.32','334.17','64.26','611.17',CONVERT(DATETIME, '2024-05-20 22:22:29', 121)),
        (3,2,10,'COMPRA','RECUSADO','865.13','239.19','51.56','837.80',CONVERT(DATETIME, '2024-01-27 05:04:58', 121)),
        (4,2,11,'COMPRA','APROVADO','557.86','112.75','51.48','734.02',CONVERT(DATETIME, '2022-03-01 18:33:23', 121)),
        (1,4,11,'COMPRA','APROVADO','792.32','451.79','49.34','414.35',CONVERT(DATETIME, '2023-04-02 01:39:03', 121)),
        (1,3,12,'COMPRA','APROVADO','861.09','393.39','53.32','480.37',CONVERT(DATETIME, '2022-02-07 05:47:56', 121)),
        (2,4,12,'COMPRA','APROVADO','600.57','139.54','41.60','548.70',CONVERT(DATETIME, '2023-06-19 00:50:40', 121)),
        (2,3,1,'COMPRA','APROVADO','532.24','329.53','74.10','740.58',CONVERT(DATETIME, '2024-01-29 04:19:32', 121)),
        (1,3,1,'COMPRA','RECUSADO','713.71','109.56','66.63','609.16',CONVERT(DATETIME, '2023-07-31 05:59:43', 121)),
        (4,2,2,'COMPRA','APROVADO','704.72','447.96','26.57','542.45',CONVERT(DATETIME, '2023-01-14 17:12:22', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,3,2,'COMPRA','APROVADO','656.64','459.23','38.87','854.60',CONVERT(DATETIME, '2022-08-29 12:52:14', 121)),
        (3,4,3,'COMPRA','APROVADO','580.29','245.23','72.77','619.67',CONVERT(DATETIME, '2023-11-14 15:49:42', 121)),
        (3,4,3,'COMPRA','APROVADO','750.38','400.15','58.85','564.53',CONVERT(DATETIME, '2022-12-29 00:24:06', 121)),
        (2,1,4,'COMPRA','APROVADO','644.30','267.25','30.49','538.44',CONVERT(DATETIME, '2023-07-28 02:06:42', 121)),
        (1,1,4,'COMPRA','RECUSADO','820.71','151.96','29.05','815.86',CONVERT(DATETIME, '2023-01-17 18:01:11', 121)),
        (4,3,10,'COMPRA','APROVADO','725.58','110.77','57.39','716.86',CONVERT(DATETIME, '2023-11-16 09:41:55', 121)),
        (3,2,10,'COMPRA','APROVADO','528.50','431.97','32.13','568.53',CONVERT(DATETIME, '2023-07-24 03:00:13', 121)),
        (2,1,11,'COMPRA','APROVADO','701.92','334.01','52.24','776.76',CONVERT(DATETIME, '2022-08-25 11:28:45', 121)),
        (3,4,11,'COMPRA','APROVADO','770.29','357.93','44.52','691.22',CONVERT(DATETIME, '2024-05-09 17:05:36', 121)),
        (3,2,12,'COMPRA','APROVADO','986.63','463.55','50.82','801.34',CONVERT(DATETIME, '2023-06-11 13:16:19', 121)),
        (3,4,12,'COMPRA','RECUSADO','938.67','292.36','67.43','658.50',CONVERT(DATETIME, '2024-01-29 08:23:15', 121)),
        (3,4,1,'COMPRA','APROVADO','895.05','187.19','34.03','814.29',CONVERT(DATETIME, '2023-09-13 00:37:45', 121)),
        (2,2,1,'COMPRA','APROVADO','872.39','482.96','73.44','693.53',CONVERT(DATETIME, '2023-05-28 18:14:48', 121)),
        (2,4,2,'COMPRA','APROVADO','557.45','119.36','54.48','729.84',CONVERT(DATETIME, '2022-04-25 03:49:29', 121)),
        (4,1,2,'COMPRA','APROVADO','949.05','357.08','56.70','751.99',CONVERT(DATETIME, '2022-11-25 15:59:23', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,4,3,'COMPRA','APROVADO','532.71','437.06','48.09','851.71',CONVERT(DATETIME, '2024-04-13 14:30:55', 121)),
        (3,2,3,'COMPRA','RECUSADO','708.57','147.48','72.36','824.80',CONVERT(DATETIME, '2022-05-05 23:49:34', 121)),
        (2,1,4,'COMPRA','APROVADO','766.49','404.10','55.35','793.91',CONVERT(DATETIME, '2024-02-04 06:42:19', 121)),
        (3,2,4,'COMPRA','APROVADO','622.00','161.48','65.44','548.75',CONVERT(DATETIME, '2023-10-06 11:08:30', 121)),
        (2,2,10,'COMPRA','APROVADO','510.25','124.39','62.85','613.36',CONVERT(DATETIME, '2024-06-26 07:06:30', 121)),
        (1,2,10,'COMPRA','APROVADO','826.38','390.08','56.71','882.62',CONVERT(DATETIME, '2023-04-08 11:14:30', 121)),
        (2,2,11,'COMPRA','APROVADO','689.07','116.81','70.09','883.28',CONVERT(DATETIME, '2023-02-21 18:09:07', 121)),
        (3,4,11,'COMPRA','RECUSADO','875.54','275.76','45.58','473.51',CONVERT(DATETIME, '2022-12-15 09:13:26', 121)),
        (3,3,12,'COMPRA','APROVADO','573.41','307.26','50.41','747.98',CONVERT(DATETIME, '2023-04-09 19:46:18', 121)),
        (2,3,12,'COMPRA','APROVADO','538.18','120.79','30.84','598.01',CONVERT(DATETIME, '2022-01-13 02:48:11', 121)),
        (2,4,1,'COMPRA','APROVADO','821.17','469.84','37.62','414.07',CONVERT(DATETIME, '2022-10-18 01:43:20', 121)),
        (2,3,1,'COMPRA','APROVADO','959.51','211.69','48.61','616.02',CONVERT(DATETIME, '2023-11-25 08:37:42', 121)),
        (4,3,2,'COMPRA','APROVADO','591.08','486.34','62.69','509.78',CONVERT(DATETIME, '2023-04-12 01:55:05', 121)),
        (4,4,2,'COMPRA','RECUSADO','858.08','355.91','67.10','805.70',CONVERT(DATETIME, '2022-09-11 09:25:37', 121)),
        (3,4,3,'COMPRA','APROVADO','749.13','490.42','33.89','860.36',CONVERT(DATETIME, '2023-07-27 22:21:01', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,3,'COMPRA','APROVADO','656.15','395.01','73.55','811.99',CONVERT(DATETIME, '2023-04-30 07:41:18', 121)),
        (2,4,4,'COMPRA','APROVADO','816.97','268.15','41.92','831.09',CONVERT(DATETIME, '2023-04-10 10:20:01', 121)),
        (2,1,4,'COMPRA','APROVADO','519.78','462.17','52.71','492.39',CONVERT(DATETIME, '2024-03-24 07:42:25', 121)),
        (2,1,10,'COMPRA','APROVADO','520.28','139.96','27.91','762.21',CONVERT(DATETIME, '2023-05-31 16:19:01', 121)),
        (4,3,10,'COMPRA','RECUSADO','646.83','420.35','42.98','644.30',CONVERT(DATETIME, '2024-05-13 14:46:42', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,2,1,'COMPRA','APROVADO','952.06','113.91','58.50','435.22',CONVERT(DATETIME, '2022-12-29 17:47:47', 121)),
        (2,1,1,'COMPRA','RECUSADO','708.47','401.89','41.34','775.06',CONVERT(DATETIME, '2023-10-04 01:59:35', 121)),
        (3,2,2,'COMPRA','APROVADO','969.07','472.62','37.68','822.73',CONVERT(DATETIME, '2023-02-17 13:02:56', 121)),
        (2,4,2,'COMPRA','APROVADO','747.56','206.44','62.93','833.55',CONVERT(DATETIME, '2023-08-12 15:13:18', 121)),
        (2,2,3,'COMPRA','APROVADO','972.65','167.60','42.93','649.42',CONVERT(DATETIME, '2024-03-26 18:17:11', 121)),
        (2,3,3,'COMPRA','APROVADO','528.95','138.16','37.53','579.51',CONVERT(DATETIME, '2023-04-02 15:20:55', 121)),
        (2,1,4,'COMPRA','APROVADO','724.37','233.66','52.38','486.24',CONVERT(DATETIME, '2022-05-03 01:59:14', 121)),
        (3,3,4,'COMPRA','RECUSADO','995.17','148.47','34.22','676.40',CONVERT(DATETIME, '2024-04-22 23:15:30', 121)),
        (4,2,10,'COMPRA','APROVADO','872.56','460.27','56.23','836.59',CONVERT(DATETIME, '2022-05-02 21:27:04', 121)),
        (2,2,10,'COMPRA','APROVADO','711.45','482.74','34.39','877.28',CONVERT(DATETIME, '2022-05-10 12:38:38', 121)),
        (2,3,11,'COMPRA','APROVADO','631.26','177.48','67.62','679.96',CONVERT(DATETIME, '2023-03-23 23:40:53', 121)),
        (4,4,11,'COMPRA','APROVADO','593.08','168.28','34.97','884.99',CONVERT(DATETIME, '2022-04-17 16:50:47', 121)),
        (2,2,12,'COMPRA','APROVADO','758.21','207.76','35.88','556.23',CONVERT(DATETIME, '2023-06-11 09:13:34', 121)),
        (3,4,12,'COMPRA','RECUSADO','821.29','267.07','30.63','552.02',CONVERT(DATETIME, '2022-11-07 15:48:30', 121)),
        (4,3,1,'COMPRA','APROVADO','755.92','355.89','69.00','511.78',CONVERT(DATETIME, '2024-03-23 10:09:01', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,2,1,'COMPRA','APROVADO','997.64','386.58','52.09','428.57',CONVERT(DATETIME, '2022-02-02 19:15:00', 121)),
        (1,4,2,'COMPRA','APROVADO','559.14','104.60','49.55','494.56',CONVERT(DATETIME, '2022-06-09 22:02:51', 121)),
        (2,3,2,'COMPRA','APROVADO','744.07','223.22','67.33','757.94',CONVERT(DATETIME, '2023-03-07 17:30:15', 121)),
        (2,3,3,'COMPRA','APROVADO','604.11','433.37','31.34','827.87',CONVERT(DATETIME, '2023-01-21 16:41:54', 121)),
        (1,4,3,'COMPRA','RECUSADO','824.29','479.03','74.02','604.44',CONVERT(DATETIME, '2022-02-10 16:39:27', 121)),
        (3,2,4,'COMPRA','APROVADO','636.97','434.41','38.32','510.29',CONVERT(DATETIME, '2022-10-29 22:37:41', 121)),
        (2,3,4,'COMPRA','APROVADO','879.38','402.56','55.30','674.02',CONVERT(DATETIME, '2024-02-10 16:51:41', 121)),
        (4,1,10,'COMPRA','APROVADO','677.75','315.11','67.81','558.76',CONVERT(DATETIME, '2023-12-09 20:26:44', 121)),
        (2,2,10,'COMPRA','APROVADO','916.81','438.48','26.09','765.11',CONVERT(DATETIME, '2022-04-19 09:05:09', 121)),
        (3,1,11,'COMPRA','APROVADO','934.96','315.08','48.57','542.25',CONVERT(DATETIME, '2023-04-05 13:54:10', 121)),
        (4,2,11,'COMPRA','RECUSADO','762.32','122.58','34.70','830.39',CONVERT(DATETIME, '2022-09-24 08:59:50', 121)),
        (1,4,12,'COMPRA','APROVADO','598.55','233.26','47.83','754.65',CONVERT(DATETIME, '2024-05-23 02:22:23', 121)),
        (4,1,12,'COMPRA','APROVADO','606.80','146.34','31.80','636.90',CONVERT(DATETIME, '2024-02-09 08:22:12', 121)),
        (4,1,1,'COMPRA','APROVADO','676.55','102.70','52.77','771.31',CONVERT(DATETIME, '2024-03-30 15:33:56', 121)),
        (2,1,1,'COMPRA','APROVADO','946.82','169.36','51.98','854.53',CONVERT(DATETIME, '2022-08-31 12:31:33', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,2,2,'COMPRA','APROVADO','741.94','169.64','58.09','467.66',CONVERT(DATETIME, '2023-06-29 08:29:09', 121)),
        (3,3,2,'COMPRA','RECUSADO','963.21','323.63','57.14','892.62',CONVERT(DATETIME, '2024-05-27 06:23:07', 121)),
        (1,1,3,'COMPRA','APROVADO','740.10','156.50','55.68','895.32',CONVERT(DATETIME, '2023-04-13 18:32:36', 121)),
        (2,2,3,'COMPRA','APROVADO','549.21','423.49','60.71','788.97',CONVERT(DATETIME, '2023-08-03 22:42:32', 121)),
        (1,3,4,'COMPRA','APROVADO','957.28','237.99','63.64','743.26',CONVERT(DATETIME, '2024-04-18 18:41:59', 121)),
        (4,3,4,'COMPRA','APROVADO','738.43','463.55','63.16','808.86',CONVERT(DATETIME, '2023-12-27 15:34:07', 121)),
        (1,3,10,'COMPRA','APROVADO','999.55','360.89','55.97','818.99',CONVERT(DATETIME, '2023-07-24 12:08:54', 121)),
        (1,3,10,'COMPRA','RECUSADO','818.84','109.70','59.79','553.88',CONVERT(DATETIME, '2022-05-27 09:29:28', 121)),
        (3,2,11,'COMPRA','APROVADO','925.75','469.60','61.22','761.36',CONVERT(DATETIME, '2022-10-03 11:19:38', 121)),
        (3,4,11,'COMPRA','APROVADO','952.98','204.61','61.51','730.97',CONVERT(DATETIME, '2022-06-03 15:11:46', 121)),
        (3,1,12,'COMPRA','APROVADO','586.50','168.23','26.12','757.93',CONVERT(DATETIME, '2023-06-24 15:10:57', 121)),
        (3,2,12,'COMPRA','APROVADO','949.01','194.56','27.09','440.95',CONVERT(DATETIME, '2023-02-14 14:35:27', 121)),
        (3,3,1,'COMPRA','APROVADO','629.11','160.38','58.27','895.32',CONVERT(DATETIME, '2023-06-09 23:45:23', 121)),
        (2,4,1,'COMPRA','RECUSADO','830.10','398.18','25.46','620.64',CONVERT(DATETIME, '2024-06-09 05:52:11', 121)),
        (3,2,2,'COMPRA','APROVADO','558.66','140.83','49.37','496.44',CONVERT(DATETIME, '2024-06-25 01:04:49', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,4,2,'COMPRA','APROVADO','592.57','225.49','51.96','450.88',CONVERT(DATETIME, '2023-06-29 18:38:19', 121)),
        (2,3,3,'COMPRA','APROVADO','956.22','268.98','33.70','697.43',CONVERT(DATETIME, '2022-03-03 17:25:22', 121)),
        (2,4,3,'COMPRA','APROVADO','890.36','124.81','50.79','820.54',CONVERT(DATETIME, '2023-11-18 22:33:22', 121)),
        (2,2,4,'COMPRA','APROVADO','619.82','301.31','59.65','544.37',CONVERT(DATETIME, '2022-05-06 12:08:32', 121)),
        (4,2,4,'COMPRA','RECUSADO','994.93','490.92','54.06','705.51',CONVERT(DATETIME, '2023-10-17 02:56:27', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,4,10,'COMPRA','APROVADO','742.84','259.96','50.77','694.60',CONVERT(DATETIME, '2023-12-23 08:36:56', 121)),
        (4,1,10,'COMPRA','APROVADO','850.57','137.64','56.97','485.78',CONVERT(DATETIME, '2023-01-11 16:57:15', 121)),
        (2,3,11,'COMPRA','APROVADO','733.94','361.70','64.80','574.52',CONVERT(DATETIME, '2022-02-14 08:03:33', 121)),
        (2,2,11,'COMPRA','APROVADO','788.00','301.94','72.87','892.86',CONVERT(DATETIME, '2022-05-29 22:50:51', 121)),
        (4,4,12,'COMPRA','APROVADO','932.85','216.13','64.77','822.17',CONVERT(DATETIME, '2023-03-17 09:52:28', 121)),
        (1,2,12,'COMPRA','RECUSADO','654.72','412.72','38.52','887.20',CONVERT(DATETIME, '2023-12-14 02:57:39', 121)),
        (3,3,1,'COMPRA','APROVADO','831.30','146.74','55.47','801.74',CONVERT(DATETIME, '2022-04-27 08:01:45', 121)),
        (1,2,1,'COMPRA','APROVADO','831.42','321.12','51.10','511.34',CONVERT(DATETIME, '2023-11-15 22:23:24', 121)),
        (2,2,2,'COMPRA','APROVADO','583.55','497.20','69.49','695.91',CONVERT(DATETIME, '2022-07-22 04:09:30', 121)),
        (1,2,2,'COMPRA','APROVADO','663.54','349.44','74.54','614.68',CONVERT(DATETIME, '2024-04-05 17:17:33', 121)),
        (4,4,3,'COMPRA','APROVADO','696.39','393.43','28.87','812.06',CONVERT(DATETIME, '2022-02-18 01:15:48', 121)),
        (1,2,3,'COMPRA','RECUSADO','884.93','384.72','32.94','814.51',CONVERT(DATETIME, '2024-03-22 02:57:05', 121)),
        (1,3,4,'COMPRA','APROVADO','883.08','424.33','46.81','589.21',CONVERT(DATETIME, '2022-04-22 17:30:59', 121)),
        (4,2,4,'COMPRA','APROVADO','868.00','346.15','34.47','455.98',CONVERT(DATETIME, '2022-04-25 09:54:53', 121)),
        (3,4,10,'COMPRA','APROVADO','572.80','123.72','65.93','521.90',CONVERT(DATETIME, '2024-01-26 17:12:16', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,10,'COMPRA','APROVADO','990.43','396.28','45.83','762.56',CONVERT(DATETIME, '2024-06-13 01:14:02', 121)),
        (4,2,11,'COMPRA','APROVADO','968.55','487.37','30.96','751.12',CONVERT(DATETIME, '2022-03-08 14:25:04', 121)),
        (2,4,11,'COMPRA','RECUSADO','509.68','105.35','70.97','529.96',CONVERT(DATETIME, '2023-08-08 08:11:08', 121)),
        (2,1,12,'COMPRA','APROVADO','533.39','139.66','64.87','739.32',CONVERT(DATETIME, '2024-04-10 08:30:28', 121)),
        (4,3,12,'COMPRA','APROVADO','885.03','304.02','53.95','726.15',CONVERT(DATETIME, '2022-11-15 00:17:06', 121)),
        (3,3,1,'COMPRA','APROVADO','740.08','143.25','36.88','746.14',CONVERT(DATETIME, '2022-09-26 03:05:55', 121)),
        (1,2,1,'COMPRA','APROVADO','985.06','134.58','38.54','576.43',CONVERT(DATETIME, '2023-01-16 06:51:23', 121)),
        (1,2,2,'COMPRA','APROVADO','617.91','285.18','61.86','891.40',CONVERT(DATETIME, '2023-05-14 04:11:30', 121)),
        (2,3,2,'COMPRA','RECUSADO','905.17','195.43','54.17','559.22',CONVERT(DATETIME, '2024-02-22 12:55:34', 121)),
        (4,4,3,'COMPRA','APROVADO','556.87','176.04','31.59','435.31',CONVERT(DATETIME, '2024-04-14 14:45:08', 121)),
        (3,3,3,'COMPRA','APROVADO','871.09','463.32','71.71','553.97',CONVERT(DATETIME, '2022-01-25 08:36:34', 121)),
        (3,3,4,'COMPRA','APROVADO','869.40','247.85','52.75','580.47',CONVERT(DATETIME, '2024-03-22 22:53:35', 121)),
        (3,2,4,'COMPRA','APROVADO','695.35','428.42','58.99','617.01',CONVERT(DATETIME, '2022-01-27 11:13:20', 121)),
        (1,3,10,'COMPRA','APROVADO','743.44','250.32','74.76','843.42',CONVERT(DATETIME, '2023-03-07 08:03:24', 121)),
        (2,2,10,'COMPRA','RECUSADO','931.25','413.08','56.05','766.56',CONVERT(DATETIME, '2022-02-19 19:59:29', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,3,11,'COMPRA','APROVADO','612.01','347.79','59.39','513.00',CONVERT(DATETIME, '2024-02-23 20:26:19', 121)),
        (2,3,11,'COMPRA','APROVADO','813.93','318.89','44.82','763.75',CONVERT(DATETIME, '2024-06-17 22:43:03', 121)),
        (4,1,12,'COMPRA','APROVADO','592.61','256.12','35.18','726.18',CONVERT(DATETIME, '2022-06-13 19:44:25', 121)),
        (2,2,12,'COMPRA','APROVADO','782.94','319.75','49.99','659.73',CONVERT(DATETIME, '2023-07-10 13:23:43', 121)),
        (1,2,1,'COMPRA','APROVADO','679.07','372.12','45.53','471.33',CONVERT(DATETIME, '2024-04-02 11:38:45', 121)),
        (3,1,1,'COMPRA','RECUSADO','622.77','404.41','67.68','537.80',CONVERT(DATETIME, '2024-05-23 21:28:33', 121)),
        (2,2,2,'COMPRA','APROVADO','607.25','253.15','26.01','518.39',CONVERT(DATETIME, '2022-06-03 19:51:50', 121)),
        (3,4,2,'COMPRA','APROVADO','608.38','386.53','42.72','735.91',CONVERT(DATETIME, '2023-12-19 02:47:28', 121)),
        (3,4,3,'COMPRA','APROVADO','816.67','214.34','30.74','627.94',CONVERT(DATETIME, '2024-03-24 22:01:37', 121)),
        (1,2,3,'COMPRA','APROVADO','992.03','396.46','41.62','467.34',CONVERT(DATETIME, '2023-01-18 19:01:09', 121)),
        (1,3,4,'COMPRA','APROVADO','626.33','289.56','35.87','814.67',CONVERT(DATETIME, '2023-12-09 04:38:16', 121)),
        (3,1,4,'COMPRA','RECUSADO','579.08','300.72','70.57','773.76',CONVERT(DATETIME, '2023-11-13 18:56:22', 121)),
        (3,2,10,'COMPRA','APROVADO','508.58','146.72','37.57','407.78',CONVERT(DATETIME, '2023-01-01 13:29:00', 121)),
        (3,2,10,'COMPRA','APROVADO','839.59','323.39','41.20','639.28',CONVERT(DATETIME, '2024-04-20 09:19:58', 121)),
        (3,1,11,'COMPRA','APROVADO','550.67','188.34','72.56','491.19',CONVERT(DATETIME, '2022-01-09 04:56:46', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,2,11,'COMPRA','APROVADO','831.78','362.94','73.73','858.43',CONVERT(DATETIME, '2022-12-06 03:58:22', 121)),
        (1,2,12,'COMPRA','APROVADO','872.56','370.50','71.29','742.16',CONVERT(DATETIME, '2024-02-18 04:26:59', 121)),
        (2,3,12,'COMPRA','RECUSADO','988.45','356.82','64.47','870.31',CONVERT(DATETIME, '2023-12-21 04:21:36', 121)),
        (1,3,1,'COMPRA','APROVADO','796.50','245.16','65.14','841.09',CONVERT(DATETIME, '2022-05-26 08:48:19', 121)),
        (3,2,1,'COMPRA','APROVADO','913.77','486.55','50.85','405.38',CONVERT(DATETIME, '2022-05-11 10:03:27', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,2,'COMPRA','APROVADO','797.23','178.52','31.26','428.91',CONVERT(DATETIME, '2022-01-15 07:58:55', 121)),
        (1,1,2,'COMPRA','APROVADO','854.45','236.28','55.99','682.10',CONVERT(DATETIME, '2022-12-03 03:40:34', 121)),
        (2,1,3,'COMPRA','APROVADO','729.17','295.25','58.26','440.98',CONVERT(DATETIME, '2022-06-30 17:24:38', 121)),
        (2,1,3,'COMPRA','RECUSADO','985.33','404.93','67.18','442.47',CONVERT(DATETIME, '2022-10-21 07:02:13', 121)),
        (3,4,4,'COMPRA','APROVADO','764.27','232.39','52.32','636.44',CONVERT(DATETIME, '2023-06-03 11:47:18', 121)),
        (3,3,4,'COMPRA','APROVADO','923.06','105.92','65.17','855.72',CONVERT(DATETIME, '2022-05-24 23:32:49', 121)),
        (2,2,10,'COMPRA','APROVADO','954.90','353.75','37.60','897.77',CONVERT(DATETIME, '2023-01-24 14:00:05', 121)),
        (2,3,10,'COMPRA','APROVADO','591.03','235.49','34.66','620.78',CONVERT(DATETIME, '2022-01-05 06:46:16', 121)),
        (2,2,11,'COMPRA','APROVADO','946.45','436.93','70.66','883.87',CONVERT(DATETIME, '2024-02-27 23:20:08', 121)),
        (4,4,11,'COMPRA','RECUSADO','955.80','364.35','45.08','870.43',CONVERT(DATETIME, '2023-06-23 17:29:07', 121)),
        (3,3,12,'COMPRA','APROVADO','671.91','122.64','57.46','665.41',CONVERT(DATETIME, '2022-07-06 20:15:17', 121)),
        (2,3,12,'COMPRA','APROVADO','807.59','102.87','29.49','834.37',CONVERT(DATETIME, '2023-01-25 17:28:03', 121)),
        (1,3,1,'COMPRA','APROVADO','759.77','232.53','70.65','428.49',CONVERT(DATETIME, '2022-05-28 10:13:13', 121)),
        (3,3,1,'COMPRA','APROVADO','677.36','323.61','30.32','452.13',CONVERT(DATETIME, '2022-03-15 23:23:22', 121)),
        (3,2,2,'COMPRA','APROVADO','705.65','117.68','61.51','645.68',CONVERT(DATETIME, '2022-03-27 03:53:30', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,2,'COMPRA','RECUSADO','509.03','400.33','45.51','670.31',CONVERT(DATETIME, '2023-07-21 05:44:14', 121)),
        (4,4,3,'COMPRA','APROVADO','810.91','336.73','55.16','417.80',CONVERT(DATETIME, '2022-12-10 04:50:42', 121)),
        (3,3,3,'COMPRA','APROVADO','954.61','117.78','55.64','831.11',CONVERT(DATETIME, '2022-05-17 21:04:51', 121)),
        (4,2,4,'COMPRA','APROVADO','562.69','485.94','37.79','677.18',CONVERT(DATETIME, '2024-04-20 16:29:28', 121)),
        (1,3,4,'COMPRA','APROVADO','547.00','374.70','33.42','577.15',CONVERT(DATETIME, '2024-06-23 11:33:46', 121)),
        (3,2,10,'COMPRA','APROVADO','740.67','125.35','54.40','633.10',CONVERT(DATETIME, '2023-05-09 06:56:07', 121)),
        (1,3,10,'COMPRA','RECUSADO','852.58','498.63','62.51','838.79',CONVERT(DATETIME, '2022-08-11 09:18:29', 121)),
        (2,2,11,'COMPRA','APROVADO','787.41','221.41','36.71','781.53',CONVERT(DATETIME, '2023-06-17 08:09:50', 121)),
        (4,1,11,'COMPRA','APROVADO','548.34','163.64','26.91','679.92',CONVERT(DATETIME, '2024-03-17 07:34:02', 121)),
        (1,3,12,'COMPRA','APROVADO','548.47','157.34','38.56','508.90',CONVERT(DATETIME, '2024-05-18 20:33:55', 121)),
        (4,3,12,'COMPRA','APROVADO','986.24','126.17','38.96','443.92',CONVERT(DATETIME, '2024-04-05 21:33:50', 121)),
        (3,3,1,'COMPRA','APROVADO','621.38','223.31','62.97','456.58',CONVERT(DATETIME, '2022-06-22 21:57:38', 121)),
        (2,3,1,'COMPRA','RECUSADO','880.86','405.67','52.58','736.07',CONVERT(DATETIME, '2022-05-13 21:39:49', 121)),
        (2,3,2,'COMPRA','APROVADO','695.73','295.44','43.47','637.30',CONVERT(DATETIME, '2023-03-10 02:15:50', 121)),
        (3,3,2,'COMPRA','APROVADO','540.14','260.22','61.15','709.90',CONVERT(DATETIME, '2024-03-19 07:55:43', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,4,3,'COMPRA','APROVADO','610.15','259.19','31.42','634.39',CONVERT(DATETIME, '2022-10-06 23:12:39', 121)),
        (1,1,3,'COMPRA','APROVADO','807.49','232.26','43.79','439.03',CONVERT(DATETIME, '2023-01-26 18:55:07', 121)),
        (2,1,4,'COMPRA','APROVADO','835.41','201.95','58.39','703.85',CONVERT(DATETIME, '2023-09-27 17:51:44', 121)),
        (4,3,4,'COMPRA','RECUSADO','927.69','150.38','51.01','467.61',CONVERT(DATETIME, '2023-03-21 14:27:31', 121)),
        (3,2,10,'COMPRA','APROVADO','630.78','157.47','74.65','537.97',CONVERT(DATETIME, '2024-01-24 05:33:44', 121)),
        (3,3,10,'COMPRA','APROVADO','973.15','233.74','53.49','791.86',CONVERT(DATETIME, '2022-06-18 15:46:12', 121)),
        (3,3,11,'COMPRA','APROVADO','853.40','341.19','47.45','689.04',CONVERT(DATETIME, '2022-09-05 15:22:06', 121)),
        (1,2,11,'COMPRA','APROVADO','816.69','438.67','58.71','609.90',CONVERT(DATETIME, '2024-03-10 17:41:55', 121)),
        (3,1,12,'COMPRA','APROVADO','785.50','137.03','55.84','801.99',CONVERT(DATETIME, '2022-06-27 23:24:33', 121)),
        (2,3,12,'COMPRA','RECUSADO','769.91','271.12','63.02','842.61',CONVERT(DATETIME, '2023-11-04 20:31:51', 121)),
        (2,1,1,'COMPRA','APROVADO','747.34','109.99','52.86','559.56',CONVERT(DATETIME, '2024-01-21 09:58:08', 121)),
        (4,3,1,'COMPRA','APROVADO','779.18','153.76','32.02','577.85',CONVERT(DATETIME, '2023-04-23 20:07:01', 121)),
        (3,4,2,'COMPRA','APROVADO','670.23','218.03','31.72','629.00',CONVERT(DATETIME, '2023-03-10 00:01:37', 121)),
        (2,4,2,'COMPRA','APROVADO','691.16','458.87','64.17','659.51',CONVERT(DATETIME, '2023-01-13 11:44:22', 121)),
        (1,1,3,'COMPRA','APROVADO','853.87','441.72','30.00','869.87',CONVERT(DATETIME, '2023-12-01 19:37:24', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,4,3,'COMPRA','RECUSADO','609.86','215.03','63.80','438.53',CONVERT(DATETIME, '2024-01-16 14:26:36', 121)),
        (4,1,4,'COMPRA','APROVADO','980.08','349.75','40.90','669.90',CONVERT(DATETIME, '2023-05-18 23:07:13', 121)),
        (3,2,4,'COMPRA','APROVADO','522.44','441.69','34.27','841.80',CONVERT(DATETIME, '2022-06-15 14:14:09', 121)),
        (2,2,10,'COMPRA','APROVADO','962.10','139.45','55.88','747.05',CONVERT(DATETIME, '2024-06-16 01:51:43', 121)),
        (1,3,10,'COMPRA','APROVADO','575.90','246.34','71.96','439.22',CONVERT(DATETIME, '2023-11-15 21:48:21', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,1,11,'COMPRA','APROVADO','962.17','283.75','41.87','447.63',CONVERT(DATETIME, '2023-09-02 14:05:30', 121)),
        (3,4,11,'COMPRA','RECUSADO','763.98','385.07','45.39','591.69',CONVERT(DATETIME, '2023-08-28 19:27:47', 121)),
        (2,3,12,'COMPRA','APROVADO','841.08','337.43','65.03','685.29',CONVERT(DATETIME, '2022-11-30 22:41:07', 121)),
        (3,3,12,'COMPRA','APROVADO','835.93','304.26','32.34','468.34',CONVERT(DATETIME, '2023-09-07 03:19:48', 121)),
        (4,2,1,'COMPRA','APROVADO','546.96','103.77','63.32','462.15',CONVERT(DATETIME, '2023-09-18 18:17:41', 121)),
        (3,2,1,'COMPRA','APROVADO','963.42','413.66','55.60','667.77',CONVERT(DATETIME, '2022-05-08 06:24:10', 121)),
        (2,2,2,'COMPRA','APROVADO','671.98','321.65','40.64','885.37',CONVERT(DATETIME, '2023-12-02 15:25:50', 121)),
        (3,1,2,'COMPRA','RECUSADO','926.56','143.46','41.82','787.02',CONVERT(DATETIME, '2024-02-13 18:50:07', 121)),
        (1,4,3,'COMPRA','APROVADO','927.84','276.44','39.13','747.44',CONVERT(DATETIME, '2024-06-24 01:43:40', 121)),
        (4,4,3,'COMPRA','APROVADO','867.31','132.39','50.39','478.59',CONVERT(DATETIME, '2024-05-18 04:26:26', 121)),
        (3,3,4,'COMPRA','APROVADO','885.41','458.77','56.85','511.64',CONVERT(DATETIME, '2022-03-05 20:38:43', 121)),
        (4,2,4,'COMPRA','APROVADO','809.83','433.15','51.07','894.12',CONVERT(DATETIME, '2024-03-08 21:29:53', 121)),
        (1,4,10,'COMPRA','APROVADO','515.04','410.99','51.26','726.08',CONVERT(DATETIME, '2022-12-10 14:52:53', 121)),
        (2,3,10,'COMPRA','RECUSADO','777.21','436.86','32.61','763.74',CONVERT(DATETIME, '2024-05-06 14:45:07', 121)),
        (3,1,11,'COMPRA','APROVADO','993.35','296.33','51.74','454.65',CONVERT(DATETIME, '2023-02-11 12:46:32', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,1,11,'COMPRA','APROVADO','723.76','377.31','62.27','582.26',CONVERT(DATETIME, '2024-04-08 17:59:45', 121)),
        (4,2,12,'COMPRA','APROVADO','842.95','351.35','63.18','639.29',CONVERT(DATETIME, '2024-05-07 18:23:05', 121)),
        (2,1,12,'COMPRA','APROVADO','615.48','164.33','31.73','448.83',CONVERT(DATETIME, '2023-09-16 17:55:44', 121)),
        (1,2,1,'COMPRA','APROVADO','642.19','172.21','74.46','835.66',CONVERT(DATETIME, '2023-11-03 06:29:21', 121)),
        (2,2,1,'COMPRA','RECUSADO','803.92','302.43','47.45','433.59',CONVERT(DATETIME, '2022-11-30 14:11:18', 121)),
        (2,2,2,'COMPRA','APROVADO','780.92','305.21','51.86','855.20',CONVERT(DATETIME, '2023-07-18 14:49:35', 121)),
        (4,3,2,'COMPRA','APROVADO','985.64','464.15','66.25','714.17',CONVERT(DATETIME, '2022-06-10 18:54:53', 121)),
        (3,3,3,'COMPRA','APROVADO','666.43','287.48','30.31','891.62',CONVERT(DATETIME, '2022-03-06 17:19:51', 121)),
        (4,3,3,'COMPRA','APROVADO','713.91','314.73','61.34','448.61',CONVERT(DATETIME, '2022-08-09 18:28:38', 121)),
        (2,4,4,'COMPRA','APROVADO','829.14','296.62','62.99','480.52',CONVERT(DATETIME, '2024-02-24 22:03:08', 121)),
        (3,3,4,'COMPRA','RECUSADO','681.35','243.09','63.81','813.93',CONVERT(DATETIME, '2022-05-26 14:23:32', 121)),
        (3,2,10,'COMPRA','APROVADO','571.87','180.92','30.85','637.86',CONVERT(DATETIME, '2022-03-30 10:36:52', 121)),
        (1,2,10,'COMPRA','APROVADO','944.26','415.78','52.13','619.12',CONVERT(DATETIME, '2023-03-06 17:30:25', 121)),
        (3,1,11,'COMPRA','APROVADO','647.88','163.26','70.88','639.21',CONVERT(DATETIME, '2023-11-02 19:19:05', 121)),
        (2,3,11,'COMPRA','APROVADO','555.45','113.37','35.33','537.68',CONVERT(DATETIME, '2022-02-11 02:48:12', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,2,12,'COMPRA','APROVADO','696.50','131.32','33.38','651.03',CONVERT(DATETIME, '2022-02-24 06:34:22', 121)),
        (2,1,12,'COMPRA','RECUSADO','996.25','363.24','57.79','617.58',CONVERT(DATETIME, '2022-05-09 05:26:36', 121)),
        (3,3,1,'COMPRA','APROVADO','676.82','437.15','48.86','520.55',CONVERT(DATETIME, '2024-01-26 16:22:40', 121)),
        (2,1,1,'COMPRA','APROVADO','937.57','361.31','52.91','440.51',CONVERT(DATETIME, '2024-05-26 01:01:44', 121)),
        (3,1,2,'COMPRA','APROVADO','888.73','213.51','59.76','472.73',CONVERT(DATETIME, '2022-05-26 06:01:53', 121)),
        (3,2,2,'COMPRA','APROVADO','664.89','319.80','40.00','742.96',CONVERT(DATETIME, '2024-06-04 12:12:18', 121)),
        (2,1,3,'COMPRA','APROVADO','890.07','412.00','40.99','810.46',CONVERT(DATETIME, '2023-02-08 07:55:59', 121)),
        (1,3,3,'COMPRA','RECUSADO','589.23','208.70','30.74','653.66',CONVERT(DATETIME, '2023-12-30 12:41:50', 121)),
        (3,3,4,'COMPRA','APROVADO','873.58','440.06','29.67','442.23',CONVERT(DATETIME, '2023-01-14 01:26:59', 121)),
        (4,2,4,'COMPRA','APROVADO','946.80','337.71','52.48','579.81',CONVERT(DATETIME, '2022-10-23 22:04:37', 121)),
        (3,2,10,'COMPRA','APROVADO','949.46','125.61','42.57','601.93',CONVERT(DATETIME, '2022-04-02 07:06:02', 121)),
        (1,4,10,'COMPRA','APROVADO','636.50','424.39','35.09','698.62',CONVERT(DATETIME, '2024-01-22 00:05:27', 121)),
        (4,2,11,'COMPRA','APROVADO','766.45','483.89','68.25','884.04',CONVERT(DATETIME, '2023-01-24 08:40:51', 121)),
        (3,1,11,'COMPRA','RECUSADO','789.46','135.81','43.14','850.27',CONVERT(DATETIME, '2023-10-15 04:41:34', 121)),
        (2,3,12,'COMPRA','APROVADO','983.70','314.90','63.44','892.83',CONVERT(DATETIME, '2023-11-03 18:48:20', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,1,12,'COMPRA','APROVADO','961.30','441.84','51.75','435.65',CONVERT(DATETIME, '2023-09-15 11:45:54', 121)),
        (3,1,1,'COMPRA','APROVADO','656.24','366.94','27.21','634.38',CONVERT(DATETIME, '2024-03-27 21:34:20', 121)),
        (2,3,1,'COMPRA','APROVADO','776.77','221.72','48.76','844.76',CONVERT(DATETIME, '2022-11-18 01:36:48', 121)),
        (4,3,2,'COMPRA','APROVADO','971.10','176.15','39.85','403.66',CONVERT(DATETIME, '2022-06-12 11:32:04', 121)),
        (2,2,2,'COMPRA','RECUSADO','995.02','271.35','66.47','637.72',CONVERT(DATETIME, '2024-05-21 17:47:56', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,1,3,'COMPRA','APROVADO','852.50','137.63','53.33','644.24',CONVERT(DATETIME, '2024-01-10 09:47:03', 121)),
        (1,3,3,'COMPRA','APROVADO','962.58','334.37','74.56','878.07',CONVERT(DATETIME, '2023-06-12 01:50:28', 121)),
        (2,3,4,'COMPRA','APROVADO','538.07','250.99','62.38','621.58',CONVERT(DATETIME, '2022-05-26 12:27:36', 121)),
        (1,2,4,'COMPRA','APROVADO','750.50','455.26','53.25','881.16',CONVERT(DATETIME, '2024-03-30 16:14:04', 121)),
        (2,1,10,'COMPRA','APROVADO','612.28','332.61','52.05','605.25',CONVERT(DATETIME, '2022-04-16 08:15:55', 121)),
        (2,2,10,'COMPRA','RECUSADO','558.90','263.98','38.73','745.31',CONVERT(DATETIME, '2023-11-25 19:44:09', 121)),
        (3,3,11,'COMPRA','APROVADO','746.89','285.43','33.30','532.40',CONVERT(DATETIME, '2022-10-01 23:12:24', 121)),
        (3,1,11,'COMPRA','APROVADO','844.83','212.51','26.51','776.52',CONVERT(DATETIME, '2022-01-18 05:21:27', 121)),
        (3,3,12,'COMPRA','APROVADO','843.78','158.82','30.68','582.31',CONVERT(DATETIME, '2023-12-25 13:15:26', 121)),
        (3,2,12,'COMPRA','APROVADO','862.89','241.74','45.06','745.51',CONVERT(DATETIME, '2024-03-07 23:20:29', 121)),
        (1,2,1,'COMPRA','APROVADO','781.80','241.81','42.23','614.06',CONVERT(DATETIME, '2023-04-23 08:31:03', 121)),
        (1,1,1,'COMPRA','RECUSADO','674.77','312.67','65.57','523.10',CONVERT(DATETIME, '2024-02-25 20:08:53', 121)),
        (2,1,2,'COMPRA','APROVADO','893.93','436.97','52.19','550.42',CONVERT(DATETIME, '2023-09-17 16:17:14', 121)),
        (4,1,2,'COMPRA','APROVADO','744.12','352.43','61.90','743.12',CONVERT(DATETIME, '2022-03-31 19:11:26', 121)),
        (4,4,3,'COMPRA','APROVADO','952.10','237.13','73.25','504.64',CONVERT(DATETIME, '2023-04-22 02:33:03', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,3,3,'COMPRA','APROVADO','852.50','393.87','64.05','655.21',CONVERT(DATETIME, '2022-12-09 03:44:35', 121)),
        (3,4,4,'COMPRA','APROVADO','531.90','342.39','58.43','723.02',CONVERT(DATETIME, '2022-01-02 13:16:08', 121)),
        (3,2,4,'COMPRA','RECUSADO','854.71','296.90','35.66','647.21',CONVERT(DATETIME, '2023-01-22 15:31:10', 121)),
        (4,3,10,'COMPRA','APROVADO','812.58','149.85','45.89','687.71',CONVERT(DATETIME, '2024-04-20 10:06:46', 121)),
        (2,4,10,'COMPRA','APROVADO','716.66','404.89','58.43','613.90',CONVERT(DATETIME, '2023-02-27 13:41:53', 121)),
        (1,3,11,'COMPRA','APROVADO','877.44','311.04','65.24','535.42',CONVERT(DATETIME, '2023-06-21 05:49:09', 121)),
        (1,4,11,'COMPRA','APROVADO','972.48','141.88','44.44','800.79',CONVERT(DATETIME, '2023-04-01 09:32:58', 121)),
        (3,1,12,'COMPRA','APROVADO','931.73','266.65','64.51','677.18',CONVERT(DATETIME, '2022-10-27 07:17:39', 121)),
        (2,4,12,'COMPRA','RECUSADO','943.82','389.76','41.89','778.45',CONVERT(DATETIME, '2023-04-18 03:08:23', 121)),
        (4,3,1,'COMPRA','APROVADO','582.75','387.01','57.85','602.79',CONVERT(DATETIME, '2023-02-06 00:45:12', 121)),
        (3,2,1,'COMPRA','APROVADO','566.71','442.22','35.98','594.18',CONVERT(DATETIME, '2023-03-25 10:04:13', 121)),
        (2,2,2,'COMPRA','APROVADO','902.20','347.31','73.87','418.88',CONVERT(DATETIME, '2024-01-07 21:02:01', 121)),
        (3,3,2,'COMPRA','APROVADO','541.47','185.00','74.67','708.07',CONVERT(DATETIME, '2022-10-23 02:38:46', 121)),
        (2,2,3,'COMPRA','APROVADO','537.56','361.70','31.53','887.23',CONVERT(DATETIME, '2022-06-03 05:42:55', 121)),
        (2,2,3,'COMPRA','RECUSADO','918.39','141.39','35.59','677.27',CONVERT(DATETIME, '2022-01-20 10:19:46', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,3,4,'COMPRA','APROVADO','986.31','402.86','72.58','507.25',CONVERT(DATETIME, '2022-10-16 00:15:17', 121)),
        (3,3,4,'COMPRA','APROVADO','639.56','419.87','30.45','676.48',CONVERT(DATETIME, '2022-04-03 00:25:14', 121)),
        (1,3,10,'COMPRA','APROVADO','690.72','195.86','36.05','627.38',CONVERT(DATETIME, '2023-10-18 06:40:00', 121)),
        (2,4,10,'COMPRA','APROVADO','635.37','289.32','34.06','897.43',CONVERT(DATETIME, '2023-06-23 12:55:26', 121)),
        (4,1,11,'COMPRA','APROVADO','943.23','419.17','36.92','687.88',CONVERT(DATETIME, '2024-06-09 20:39:37', 121)),
        (2,1,11,'COMPRA','RECUSADO','942.63','330.90','69.44','568.36',CONVERT(DATETIME, '2023-09-14 23:20:45', 121)),
        (1,4,12,'COMPRA','APROVADO','549.90','482.96','67.54','455.21',CONVERT(DATETIME, '2023-09-14 20:42:13', 121)),
        (4,2,12,'COMPRA','APROVADO','637.37','265.63','65.51','507.03',CONVERT(DATETIME, '2024-04-01 04:45:23', 121)),
        (4,3,1,'COMPRA','APROVADO','503.83','203.03','69.01','611.93',CONVERT(DATETIME, '2024-06-01 18:15:54', 121)),
        (3,2,1,'COMPRA','APROVADO','615.65','400.66','69.16','869.99',CONVERT(DATETIME, '2022-03-26 15:25:49', 121)),
        (3,3,2,'COMPRA','APROVADO','722.01','189.40','71.72','840.54',CONVERT(DATETIME, '2022-05-26 17:44:38', 121)),
        (2,2,2,'COMPRA','RECUSADO','544.85','427.11','45.75','453.58',CONVERT(DATETIME, '2022-02-09 22:49:58', 121)),
        (4,1,3,'COMPRA','APROVADO','739.48','243.15','60.57','707.70',CONVERT(DATETIME, '2022-06-28 03:32:58', 121)),
        (4,1,3,'COMPRA','APROVADO','699.52','473.36','62.64','606.54',CONVERT(DATETIME, '2024-03-20 09:30:43', 121)),
        (4,2,4,'COMPRA','APROVADO','899.90','149.30','65.72','899.86',CONVERT(DATETIME, '2023-08-12 20:05:07', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,1,4,'COMPRA','APROVADO','608.48','362.84','57.83','671.00',CONVERT(DATETIME, '2022-07-19 05:28:19', 121)),
        (3,2,10,'COMPRA','APROVADO','787.61','424.78','33.64','644.42',CONVERT(DATETIME, '2022-03-11 09:40:17', 121)),
        (1,1,10,'COMPRA','RECUSADO','793.63','336.40','63.92','450.34',CONVERT(DATETIME, '2023-07-12 07:57:22', 121)),
        (3,4,11,'COMPRA','APROVADO','588.17','302.60','56.52','477.53',CONVERT(DATETIME, '2022-06-09 22:41:37', 121)),
        (3,3,11,'COMPRA','APROVADO','815.46','452.34','28.48','584.61',CONVERT(DATETIME, '2022-01-04 08:33:20', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,2,12,'COMPRA','APROVADO','666.10','456.82','58.04','692.54',CONVERT(DATETIME, '2022-08-07 01:25:28', 121)),
        (3,4,12,'COMPRA','APROVADO','846.28','398.55','37.36','601.05',CONVERT(DATETIME, '2022-09-12 01:07:26', 121)),
        (3,2,1,'COMPRA','APROVADO','920.35','306.08','37.36','830.04',CONVERT(DATETIME, '2023-01-04 04:13:47', 121)),
        (1,2,1,'COMPRA','RECUSADO','584.37','239.72','49.91','896.47',CONVERT(DATETIME, '2023-02-19 09:47:41', 121)),
        (2,2,2,'COMPRA','APROVADO','719.44','240.59','46.84','422.72',CONVERT(DATETIME, '2023-11-14 16:01:46', 121)),
        (3,2,2,'COMPRA','APROVADO','934.50','247.20','27.33','471.32',CONVERT(DATETIME, '2023-08-05 12:15:01', 121)),
        (2,2,3,'COMPRA','APROVADO','811.98','447.76','41.04','655.60',CONVERT(DATETIME, '2023-12-27 22:48:00', 121)),
        (3,2,3,'COMPRA','APROVADO','540.65','386.32','72.88','757.75',CONVERT(DATETIME, '2023-11-11 09:33:55', 121)),
        (4,1,4,'COMPRA','APROVADO','799.32','455.08','28.27','652.28',CONVERT(DATETIME, '2024-05-11 19:21:30', 121)),
        (2,1,4,'COMPRA','RECUSADO','524.36','279.92','68.68','750.41',CONVERT(DATETIME, '2023-06-26 16:20:39', 121)),
        (3,3,10,'COMPRA','APROVADO','849.91','422.02','37.01','728.40',CONVERT(DATETIME, '2022-01-25 22:55:37', 121)),
        (4,2,10,'COMPRA','APROVADO','681.92','419.25','32.24','507.55',CONVERT(DATETIME, '2024-02-20 01:09:05', 121)),
        (3,1,11,'COMPRA','APROVADO','790.53','157.30','29.25','506.97',CONVERT(DATETIME, '2022-02-14 07:32:36', 121)),
        (2,2,11,'COMPRA','APROVADO','840.47','311.81','32.09','496.02',CONVERT(DATETIME, '2023-01-13 11:24:41', 121)),
        (1,2,12,'COMPRA','APROVADO','812.93','186.79','28.53','694.10',CONVERT(DATETIME, '2024-03-31 04:53:57', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,3,12,'COMPRA','RECUSADO','780.38','280.58','35.21','733.21',CONVERT(DATETIME, '2023-09-13 17:05:02', 121)),
        (4,1,1,'COMPRA','APROVADO','777.39','437.23','50.63','754.90',CONVERT(DATETIME, '2023-03-09 04:45:57', 121)),
        (2,2,1,'COMPRA','APROVADO','991.22','103.27','51.83','558.54',CONVERT(DATETIME, '2024-04-29 14:21:08', 121)),
        (1,2,2,'COMPRA','APROVADO','795.14','209.84','29.39','465.95',CONVERT(DATETIME, '2023-04-14 16:09:03', 121)),
        (4,2,2,'COMPRA','APROVADO','517.24','220.79','39.53','891.99',CONVERT(DATETIME, '2023-11-14 07:45:16', 121)),
        (4,2,3,'COMPRA','APROVADO','528.89','399.12','47.71','689.50',CONVERT(DATETIME, '2024-04-30 05:21:04', 121)),
        (2,3,3,'COMPRA','RECUSADO','832.61','397.86','64.73','845.62',CONVERT(DATETIME, '2023-12-07 06:54:43', 121)),
        (1,2,4,'COMPRA','APROVADO','820.58','424.38','27.07','672.58',CONVERT(DATETIME, '2023-05-29 00:41:48', 121)),
        (4,2,4,'COMPRA','APROVADO','933.94','338.76','26.54','441.17',CONVERT(DATETIME, '2023-08-02 15:49:34', 121)),
        (3,4,10,'COMPRA','APROVADO','856.30','320.40','38.04','759.48',CONVERT(DATETIME, '2022-06-24 02:41:54', 121)),
        (3,4,10,'COMPRA','APROVADO','989.64','477.44','52.09','874.48',CONVERT(DATETIME, '2022-07-30 12:50:41', 121)),
        (4,3,11,'COMPRA','APROVADO','985.56','347.62','38.99','723.69',CONVERT(DATETIME, '2022-12-26 01:48:07', 121)),
        (1,2,11,'COMPRA','RECUSADO','855.10','422.08','74.23','666.92',CONVERT(DATETIME, '2024-04-15 14:01:48', 121)),
        (2,4,12,'COMPRA','APROVADO','542.90','100.24','44.49','503.75',CONVERT(DATETIME, '2023-01-22 14:09:49', 121)),
        (3,1,12,'COMPRA','APROVADO','587.66','459.24','57.51','823.16',CONVERT(DATETIME, '2022-11-20 17:11:07', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,1,1,'COMPRA','APROVADO','752.35','135.46','70.07','728.87',CONVERT(DATETIME, '2022-12-07 15:59:42', 121)),
        (4,3,1,'COMPRA','APROVADO','642.85','260.15','33.45','747.01',CONVERT(DATETIME, '2024-04-02 02:34:47', 121)),
        (2,3,2,'COMPRA','APROVADO','888.84','291.20','64.32','742.39',CONVERT(DATETIME, '2024-02-27 15:59:24', 121)),
        (2,4,2,'COMPRA','RECUSADO','984.03','183.69','53.74','883.32',CONVERT(DATETIME, '2023-01-11 08:48:54', 121)),
        (4,2,3,'COMPRA','APROVADO','697.47','326.71','64.53','882.61',CONVERT(DATETIME, '2024-05-25 13:27:54', 121)),
        (2,2,3,'COMPRA','APROVADO','532.09','402.83','62.76','740.54',CONVERT(DATETIME, '2023-10-28 15:05:06', 121)),
        (3,4,4,'COMPRA','APROVADO','798.06','269.86','43.88','523.65',CONVERT(DATETIME, '2024-01-24 16:12:29', 121)),
        (3,2,4,'COMPRA','APROVADO','840.68','413.57','26.49','808.57',CONVERT(DATETIME, '2022-05-10 13:46:34', 121)),
        (3,2,10,'COMPRA','APROVADO','728.35','241.70','41.85','749.21',CONVERT(DATETIME, '2023-10-18 13:08:31', 121)),
        (1,2,10,'COMPRA','RECUSADO','998.12','367.08','74.82','666.90',CONVERT(DATETIME, '2022-07-16 09:29:05', 121)),
        (2,2,11,'COMPRA','APROVADO','705.64','186.12','55.78','575.68',CONVERT(DATETIME, '2023-06-13 04:10:39', 121)),
        (2,2,11,'COMPRA','APROVADO','935.68','156.02','71.36','747.67',CONVERT(DATETIME, '2022-11-15 08:02:29', 121)),
        (3,3,12,'COMPRA','APROVADO','500.62','175.57','26.49','612.43',CONVERT(DATETIME, '2023-01-24 11:58:32', 121)),
        (4,3,12,'COMPRA','APROVADO','944.30','257.42','62.29','802.75',CONVERT(DATETIME, '2022-03-16 09:35:54', 121)),
        (2,2,1,'COMPRA','APROVADO','758.23','377.11','31.71','878.39',CONVERT(DATETIME, '2024-02-18 02:00:09', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,4,1,'COMPRA','RECUSADO','784.10','230.52','48.91','874.05',CONVERT(DATETIME, '2022-09-05 06:15:02', 121)),
        (2,3,2,'COMPRA','APROVADO','868.23','259.96','73.25','718.24',CONVERT(DATETIME, '2024-03-25 11:04:14', 121)),
        (4,2,2,'COMPRA','APROVADO','520.71','103.73','66.49','721.75',CONVERT(DATETIME, '2022-09-29 04:48:26', 121)),
        (1,2,3,'COMPRA','APROVADO','599.78','244.79','41.89','669.51',CONVERT(DATETIME, '2023-03-27 16:51:36', 121)),
        (3,3,3,'COMPRA','APROVADO','549.99','360.07','31.72','564.43',CONVERT(DATETIME, '2023-03-03 15:45:33', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,4,4,'COMPRA','APROVADO','960.84','493.40','72.28','453.67',CONVERT(DATETIME, '2024-02-13 07:58:24', 121)),
        (2,3,4,'COMPRA','RECUSADO','585.60','328.93','71.05','733.59',CONVERT(DATETIME, '2024-03-12 06:05:09', 121)),
        (3,1,10,'COMPRA','APROVADO','922.94','159.44','46.62','862.71',CONVERT(DATETIME, '2022-11-30 07:05:19', 121)),
        (2,2,10,'COMPRA','APROVADO','857.64','345.76','67.56','875.09',CONVERT(DATETIME, '2022-04-05 03:31:30', 121)),
        (3,1,11,'COMPRA','APROVADO','948.91','461.19','31.56','547.91',CONVERT(DATETIME, '2022-01-10 09:07:14', 121)),
        (3,2,11,'COMPRA','APROVADO','904.85','118.12','26.33','877.56',CONVERT(DATETIME, '2023-08-12 12:04:08', 121)),
        (2,1,12,'COMPRA','APROVADO','634.15','358.36','53.95','489.72',CONVERT(DATETIME, '2022-04-24 02:13:05', 121)),
        (1,3,12,'COMPRA','RECUSADO','972.09','381.98','62.89','766.51',CONVERT(DATETIME, '2024-02-23 14:05:10', 121)),
        (2,3,1,'COMPRA','APROVADO','548.53','338.82','27.62','892.25',CONVERT(DATETIME, '2024-03-16 08:22:30', 121)),
        (1,2,1,'COMPRA','APROVADO','903.28','113.16','69.08','548.68',CONVERT(DATETIME, '2024-01-02 03:08:34', 121)),
        (3,4,2,'COMPRA','APROVADO','789.08','337.11','44.26','472.37',CONVERT(DATETIME, '2023-04-13 12:59:00', 121)),
        (2,1,2,'COMPRA','APROVADO','945.49','181.39','49.38','883.59',CONVERT(DATETIME, '2023-12-11 06:13:39', 121)),
        (3,2,3,'COMPRA','APROVADO','835.15','406.06','46.22','721.82',CONVERT(DATETIME, '2022-04-27 10:23:14', 121)),
        (2,2,3,'COMPRA','RECUSADO','977.04','454.19','49.74','810.54',CONVERT(DATETIME, '2024-05-06 18:59:58', 121)),
        (3,2,4,'COMPRA','APROVADO','789.52','162.73','69.98','728.17',CONVERT(DATETIME, '2024-03-14 18:28:04', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,4,'COMPRA','APROVADO','747.15','395.35','73.85','718.18',CONVERT(DATETIME, '2023-10-20 17:28:55', 121)),
        (3,3,10,'COMPRA','APROVADO','889.25','279.02','37.17','485.87',CONVERT(DATETIME, '2022-06-03 10:09:21', 121)),
        (1,3,10,'COMPRA','APROVADO','726.02','283.10','46.91','584.90',CONVERT(DATETIME, '2023-05-28 09:21:52', 121)),
        (3,3,11,'COMPRA','APROVADO','711.78','443.65','71.50','796.66',CONVERT(DATETIME, '2024-06-15 03:33:42', 121)),
        (2,2,11,'COMPRA','RECUSADO','894.46','491.82','45.13','867.02',CONVERT(DATETIME, '2024-04-28 19:22:53', 121)),
        (4,2,12,'COMPRA','APROVADO','671.58','249.17','69.66','754.87',CONVERT(DATETIME, '2023-05-01 03:08:50', 121)),
        (3,2,12,'COMPRA','APROVADO','549.59','499.90','30.69','625.66',CONVERT(DATETIME, '2022-12-19 18:21:42', 121)),
        (2,4,1,'COMPRA','APROVADO','665.93','101.61','65.03','784.67',CONVERT(DATETIME, '2022-04-29 11:06:25', 121)),
        (2,2,1,'COMPRA','APROVADO','709.14','167.35','58.78','810.40',CONVERT(DATETIME, '2022-05-14 06:46:08', 121)),
        (2,2,2,'COMPRA','APROVADO','985.03','243.93','63.62','847.39',CONVERT(DATETIME, '2023-12-04 13:42:01', 121)),
        (3,3,2,'COMPRA','RECUSADO','550.98','382.53','61.14','768.02',CONVERT(DATETIME, '2022-05-15 06:37:25', 121)),
        (2,4,3,'COMPRA','APROVADO','772.47','358.96','53.84','737.78',CONVERT(DATETIME, '2022-01-22 16:01:20', 121)),
        (4,3,3,'COMPRA','APROVADO','872.06','226.93','55.04','407.60',CONVERT(DATETIME, '2024-03-01 21:48:19', 121)),
        (4,4,4,'COMPRA','APROVADO','629.04','403.70','51.58','693.40',CONVERT(DATETIME, '2022-05-26 13:44:56', 121)),
        (3,2,4,'COMPRA','APROVADO','925.68','378.69','43.96','405.94',CONVERT(DATETIME, '2023-04-18 19:53:45', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,4,10,'COMPRA','APROVADO','782.71','333.37','42.50','704.79',CONVERT(DATETIME, '2024-05-10 16:42:37', 121)),
        (2,4,10,'COMPRA','RECUSADO','828.27','148.46','52.43','703.51',CONVERT(DATETIME, '2022-02-20 03:20:30', 121)),
        (1,1,11,'COMPRA','APROVADO','512.81','277.99','57.08','771.45',CONVERT(DATETIME, '2022-09-05 15:19:26', 121)),
        (3,4,11,'COMPRA','APROVADO','977.32','137.12','32.88','642.18',CONVERT(DATETIME, '2023-09-08 07:41:58', 121)),
        (3,1,12,'COMPRA','APROVADO','913.98','222.56','69.06','431.20',CONVERT(DATETIME, '2023-06-18 08:25:58', 121)),
        (3,4,12,'COMPRA','APROVADO','763.72','259.82','64.83','714.22',CONVERT(DATETIME, '2023-03-25 03:15:14', 121)),
        (2,2,1,'COMPRA','APROVADO','698.77','234.36','62.55','433.96',CONVERT(DATETIME, '2023-07-29 06:06:14', 121)),
        (1,4,1,'COMPRA','RECUSADO','971.29','116.52','43.95','643.70',CONVERT(DATETIME, '2023-03-26 23:39:27', 121)),
        (2,2,2,'COMPRA','APROVADO','896.72','480.45','52.63','760.66',CONVERT(DATETIME, '2022-05-04 10:36:47', 121)),
        (2,2,2,'COMPRA','APROVADO','829.06','481.73','53.73','843.94',CONVERT(DATETIME, '2023-11-06 07:03:22', 121)),
        (2,2,3,'COMPRA','APROVADO','843.22','330.14','58.81','428.80',CONVERT(DATETIME, '2024-02-29 15:06:38', 121)),
        (2,2,3,'COMPRA','APROVADO','910.97','428.55','56.87','400.01',CONVERT(DATETIME, '2024-03-06 18:43:39', 121)),
        (1,2,4,'COMPRA','APROVADO','551.94','108.59','71.25','441.76',CONVERT(DATETIME, '2023-07-18 10:24:51', 121)),
        (3,1,4,'COMPRA','RECUSADO','900.75','439.10','37.09','821.15',CONVERT(DATETIME, '2023-10-15 10:04:00', 121)),
        (2,2,10,'COMPRA','APROVADO','821.78','180.18','52.60','490.40',CONVERT(DATETIME, '2023-01-05 12:05:17', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,3,10,'COMPRA','APROVADO','820.61','472.83','36.37','743.84',CONVERT(DATETIME, '2022-03-20 03:56:05', 121)),
        (1,4,11,'COMPRA','APROVADO','910.73','458.33','63.77','518.42',CONVERT(DATETIME, '2024-01-26 07:15:17', 121)),
        (1,4,11,'COMPRA','APROVADO','578.26','454.90','38.37','725.19',CONVERT(DATETIME, '2024-01-07 19:43:52', 121)),
        (3,2,12,'COMPRA','APROVADO','805.88','483.74','47.19','554.97',CONVERT(DATETIME, '2024-04-23 18:57:42', 121)),
        (1,3,12,'COMPRA','RECUSADO','573.21','298.65','57.86','646.72',CONVERT(DATETIME, '2024-06-19 14:29:34', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,1,'COMPRA','APROVADO','796.69','252.82','25.81','551.99',CONVERT(DATETIME, '2023-05-03 03:12:36', 121)),
        (3,4,1,'COMPRA','APROVADO','984.62','215.84','34.46','550.80',CONVERT(DATETIME, '2022-07-23 19:02:11', 121)),
        (4,3,2,'COMPRA','APROVADO','786.12','475.94','56.80','876.39',CONVERT(DATETIME, '2022-05-03 17:55:05', 121)),
        (2,3,2,'COMPRA','APROVADO','833.50','177.41','63.80','881.05',CONVERT(DATETIME, '2022-10-15 09:39:49', 121)),
        (4,4,3,'COMPRA','APROVADO','789.45','244.93','52.72','482.42',CONVERT(DATETIME, '2022-02-03 06:35:51', 121)),
        (3,4,3,'COMPRA','RECUSADO','557.13','266.44','61.65','714.19',CONVERT(DATETIME, '2023-03-13 14:51:03', 121)),
        (2,2,4,'COMPRA','APROVADO','672.32','389.02','26.98','527.08',CONVERT(DATETIME, '2023-05-15 18:24:08', 121)),
        (1,3,4,'COMPRA','APROVADO','681.45','275.27','62.24','594.16',CONVERT(DATETIME, '2023-04-26 22:09:47', 121)),
        (2,3,10,'COMPRA','APROVADO','606.02','326.06','46.20','726.78',CONVERT(DATETIME, '2024-02-23 17:07:25', 121)),
        (2,2,10,'COMPRA','APROVADO','791.35','366.61','72.98','868.72',CONVERT(DATETIME, '2023-06-24 23:06:48', 121)),
        (3,2,11,'COMPRA','APROVADO','683.60','132.83','68.37','492.09',CONVERT(DATETIME, '2024-04-25 13:44:32', 121)),
        (4,1,11,'COMPRA','RECUSADO','781.96','497.96','74.03','856.57',CONVERT(DATETIME, '2022-04-12 15:13:48', 121)),
        (4,1,12,'COMPRA','APROVADO','722.15','397.92','69.74','640.98',CONVERT(DATETIME, '2023-08-05 22:08:57', 121)),
        (3,3,12,'COMPRA','APROVADO','795.40','378.68','72.24','833.57',CONVERT(DATETIME, '2022-03-26 04:31:36', 121)),
        (1,3,1,'COMPRA','APROVADO','891.78','409.96','32.45','459.06',CONVERT(DATETIME, '2023-06-16 01:54:22', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,3,1,'COMPRA','APROVADO','533.32','416.14','66.07','710.98',CONVERT(DATETIME, '2022-10-31 12:20:58', 121)),
        (2,2,2,'COMPRA','APROVADO','883.57','141.97','57.98','488.05',CONVERT(DATETIME, '2022-09-21 13:59:29', 121)),
        (1,2,2,'COMPRA','RECUSADO','828.35','391.62','72.88','542.49',CONVERT(DATETIME, '2023-06-07 10:09:44', 121)),
        (3,2,3,'COMPRA','APROVADO','718.85','461.28','62.48','791.36',CONVERT(DATETIME, '2024-06-27 13:37:51', 121)),
        (2,3,3,'COMPRA','APROVADO','883.74','268.11','64.73','402.78',CONVERT(DATETIME, '2022-12-27 01:16:17', 121)),
        (3,3,4,'COMPRA','APROVADO','647.75','310.98','31.45','630.28',CONVERT(DATETIME, '2024-04-25 11:48:00', 121)),
        (1,4,4,'COMPRA','APROVADO','867.09','168.03','31.09','853.21',CONVERT(DATETIME, '2023-01-24 12:26:15', 121)),
        (2,4,10,'COMPRA','APROVADO','869.03','160.73','75.00','872.30',CONVERT(DATETIME, '2023-11-13 00:51:15', 121)),
        (3,4,10,'COMPRA','RECUSADO','517.56','300.40','42.60','660.85',CONVERT(DATETIME, '2024-06-26 23:02:34', 121)),
        (3,3,11,'COMPRA','APROVADO','771.24','186.43','50.32','853.76',CONVERT(DATETIME, '2023-09-05 03:08:12', 121)),
        (3,3,11,'COMPRA','APROVADO','676.74','199.87','44.75','634.06',CONVERT(DATETIME, '2024-04-11 21:57:08', 121)),
        (1,1,12,'COMPRA','APROVADO','928.86','351.50','74.77','542.73',CONVERT(DATETIME, '2024-04-09 05:59:00', 121)),
        (2,3,12,'COMPRA','APROVADO','907.83','175.16','48.00','739.70',CONVERT(DATETIME, '2023-09-27 13:31:41', 121)),
        (3,3,1,'COMPRA','APROVADO','640.90','334.96','39.27','461.88',CONVERT(DATETIME, '2024-03-03 13:27:19', 121)),
        (3,3,1,'COMPRA','RECUSADO','632.77','496.28','28.62','734.92',CONVERT(DATETIME, '2024-01-27 09:20:04', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,3,2,'COMPRA','APROVADO','665.47','202.48','72.28','563.70',CONVERT(DATETIME, '2023-12-17 10:39:25', 121)),
        (4,4,2,'COMPRA','APROVADO','836.46','439.10','25.28','553.92',CONVERT(DATETIME, '2023-06-29 01:03:58', 121)),
        (2,3,3,'COMPRA','APROVADO','895.49','484.02','46.22','742.32',CONVERT(DATETIME, '2023-06-21 21:04:06', 121)),
        (3,1,3,'COMPRA','APROVADO','834.84','393.45','47.92','669.11',CONVERT(DATETIME, '2022-12-07 07:37:32', 121)),
        (4,4,4,'COMPRA','APROVADO','661.92','119.95','30.15','490.33',CONVERT(DATETIME, '2023-12-20 17:47:44', 121)),
        (2,3,4,'COMPRA','RECUSADO','683.24','432.64','67.16','574.35',CONVERT(DATETIME, '2022-09-01 04:54:52', 121)),
        (3,2,10,'COMPRA','APROVADO','579.30','175.57','72.84','514.33',CONVERT(DATETIME, '2024-05-22 18:48:35', 121)),
        (2,1,10,'COMPRA','APROVADO','529.60','311.58','45.45','597.68',CONVERT(DATETIME, '2023-12-08 22:08:35', 121)),
        (4,3,11,'COMPRA','APROVADO','987.20','458.30','73.92','780.54',CONVERT(DATETIME, '2022-12-05 03:03:36', 121)),
        (2,3,11,'COMPRA','APROVADO','844.82','482.70','57.69','871.21',CONVERT(DATETIME, '2022-01-02 10:53:00', 121)),
        (3,3,12,'COMPRA','APROVADO','811.59','436.90','66.34','558.31',CONVERT(DATETIME, '2023-12-18 01:39:04', 121)),
        (4,4,12,'COMPRA','RECUSADO','545.65','143.59','68.20','568.08',CONVERT(DATETIME, '2023-08-01 02:56:30', 121)),
        (3,3,1,'COMPRA','APROVADO','669.13','378.01','51.58','799.64',CONVERT(DATETIME, '2022-11-22 17:00:29', 121)),
        (2,3,1,'COMPRA','APROVADO','691.28','235.28','48.43','780.35',CONVERT(DATETIME, '2023-09-06 22:54:53', 121)),
        (4,3,2,'COMPRA','APROVADO','750.74','108.45','48.53','657.28',CONVERT(DATETIME, '2024-01-26 21:58:36', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,3,2,'COMPRA','APROVADO','761.19','460.04','49.66','829.52',CONVERT(DATETIME, '2022-12-06 15:17:27', 121)),
        (1,3,3,'COMPRA','APROVADO','898.65','220.48','69.56','681.13',CONVERT(DATETIME, '2024-06-25 05:02:01', 121)),
        (2,3,3,'COMPRA','RECUSADO','995.39','455.05','60.23','495.77',CONVERT(DATETIME, '2023-07-01 07:52:59', 121)),
        (3,1,4,'COMPRA','APROVADO','653.86','476.53','39.55','564.35',CONVERT(DATETIME, '2022-07-05 08:26:33', 121)),
        (3,1,4,'COMPRA','APROVADO','757.39','167.89','74.22','895.12',CONVERT(DATETIME, '2024-04-25 22:48:23', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,1,10,'COMPRA','APROVADO','987.62','175.25','25.74','657.27',CONVERT(DATETIME, '2022-06-13 19:00:55', 121)),
        (2,3,10,'COMPRA','APROVADO','500.18','369.89','25.68','707.70',CONVERT(DATETIME, '2023-07-14 12:36:06', 121)),
        (4,2,11,'COMPRA','APROVADO','709.74','148.17','65.02','493.67',CONVERT(DATETIME, '2022-12-13 11:15:29', 121)),
        (2,1,11,'COMPRA','RECUSADO','673.58','161.07','47.57','865.13',CONVERT(DATETIME, '2023-07-08 18:09:48', 121)),
        (1,2,12,'COMPRA','APROVADO','527.37','250.55','35.99','400.54',CONVERT(DATETIME, '2022-01-17 00:44:44', 121)),
        (3,3,12,'COMPRA','APROVADO','686.56','233.46','35.79','769.72',CONVERT(DATETIME, '2024-05-26 02:34:51', 121)),
        (3,3,1,'COMPRA','APROVADO','732.88','216.92','30.78','772.61',CONVERT(DATETIME, '2022-12-27 23:06:33', 121)),
        (3,3,1,'COMPRA','APROVADO','565.54','252.10','57.53','445.90',CONVERT(DATETIME, '2022-12-08 18:24:05', 121)),
        (4,1,2,'COMPRA','APROVADO','868.55','238.19','31.31','869.64',CONVERT(DATETIME, '2022-08-09 07:58:25', 121)),
        (2,3,2,'COMPRA','RECUSADO','905.28','219.90','57.14','669.26',CONVERT(DATETIME, '2024-01-11 00:23:50', 121)),
        (3,2,3,'COMPRA','APROVADO','941.13','254.32','53.94','892.68',CONVERT(DATETIME, '2023-08-13 22:37:05', 121)),
        (2,3,3,'COMPRA','APROVADO','633.73','430.09','33.59','851.02',CONVERT(DATETIME, '2022-05-20 08:01:04', 121)),
        (2,2,4,'COMPRA','APROVADO','594.54','382.42','47.55','496.31',CONVERT(DATETIME, '2022-08-19 12:26:12', 121)),
        (2,3,4,'COMPRA','APROVADO','890.77','439.50','35.73','556.04',CONVERT(DATETIME, '2023-04-25 08:00:15', 121)),
        (4,2,10,'COMPRA','APROVADO','956.19','368.44','41.19','684.35',CONVERT(DATETIME, '2023-06-25 03:34:37', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,10,'COMPRA','RECUSADO','795.76','123.05','61.62','415.64',CONVERT(DATETIME, '2024-01-13 01:42:47', 121)),
        (2,1,11,'COMPRA','APROVADO','532.48','369.86','38.81','470.50',CONVERT(DATETIME, '2023-06-16 04:26:57', 121)),
        (1,3,11,'COMPRA','APROVADO','770.41','463.23','40.60','571.71',CONVERT(DATETIME, '2023-02-06 23:52:34', 121)),
        (1,2,12,'COMPRA','APROVADO','605.20','405.33','39.32','550.69',CONVERT(DATETIME, '2022-01-13 12:40:06', 121)),
        (4,2,12,'COMPRA','APROVADO','550.16','467.64','47.57','458.27',CONVERT(DATETIME, '2022-01-04 10:32:37', 121)),
        (2,2,1,'COMPRA','APROVADO','826.20','419.64','43.23','566.74',CONVERT(DATETIME, '2023-06-20 19:26:03', 121)),
        (2,3,1,'COMPRA','RECUSADO','639.12','202.57','71.60','513.58',CONVERT(DATETIME, '2023-08-16 05:26:07', 121)),
        (1,3,2,'COMPRA','APROVADO','795.72','418.32','38.90','449.39',CONVERT(DATETIME, '2023-07-01 00:11:52', 121)),
        (3,1,2,'COMPRA','APROVADO','831.97','283.79','34.47','518.43',CONVERT(DATETIME, '2023-04-19 22:26:15', 121)),
        (3,2,3,'COMPRA','APROVADO','634.69','411.45','47.08','876.30',CONVERT(DATETIME, '2023-08-17 08:43:14', 121)),
        (3,3,3,'COMPRA','APROVADO','660.57','177.08','70.67','589.25',CONVERT(DATETIME, '2022-09-03 16:36:22', 121)),
        (1,4,4,'COMPRA','APROVADO','700.35','163.60','35.90','711.09',CONVERT(DATETIME, '2023-11-22 21:52:36', 121)),
        (4,2,4,'COMPRA','RECUSADO','553.93','431.76','30.48','630.24',CONVERT(DATETIME, '2024-01-28 02:55:45', 121)),
        (3,3,10,'COMPRA','APROVADO','742.43','351.47','67.18','865.55',CONVERT(DATETIME, '2023-07-03 20:50:32', 121)),
        (2,2,10,'COMPRA','APROVADO','625.98','432.12','56.50','462.67',CONVERT(DATETIME, '2022-12-11 03:32:04', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,4,11,'COMPRA','APROVADO','802.66','326.45','29.30','421.33',CONVERT(DATETIME, '2023-08-23 14:33:11', 121)),
        (3,3,11,'COMPRA','APROVADO','671.61','356.91','26.80','713.82',CONVERT(DATETIME, '2024-01-03 12:05:07', 121)),
        (3,2,12,'COMPRA','APROVADO','685.98','268.06','29.37','844.18',CONVERT(DATETIME, '2024-04-21 03:45:02', 121)),
        (3,3,12,'COMPRA','RECUSADO','941.30','382.33','55.12','513.70',CONVERT(DATETIME, '2023-02-01 03:22:53', 121)),
        (2,2,1,'COMPRA','APROVADO','519.78','155.02','63.24','796.87',CONVERT(DATETIME, '2022-09-20 10:23:06', 121)),
        (4,1,1,'COMPRA','APROVADO','816.48','325.85','62.19','617.88',CONVERT(DATETIME, '2024-01-25 23:04:35', 121)),
        (2,3,2,'COMPRA','APROVADO','873.09','301.57','67.60','758.47',CONVERT(DATETIME, '2022-04-21 00:01:55', 121)),
        (3,1,2,'COMPRA','APROVADO','863.31','106.52','71.10','806.07',CONVERT(DATETIME, '2023-03-08 11:28:44', 121)),
        (2,1,3,'COMPRA','APROVADO','646.60','234.84','51.89','714.16',CONVERT(DATETIME, '2024-04-22 09:08:53', 121)),
        (3,2,3,'COMPRA','RECUSADO','572.01','234.01','70.89','524.31',CONVERT(DATETIME, '2022-10-16 16:01:46', 121)),
        (3,2,4,'COMPRA','APROVADO','818.22','447.91','42.08','579.92',CONVERT(DATETIME, '2023-12-25 22:25:35', 121)),
        (2,2,4,'COMPRA','APROVADO','660.75','354.84','73.37','721.43',CONVERT(DATETIME, '2024-06-18 10:59:39', 121)),
        (2,1,10,'COMPRA','APROVADO','697.62','254.78','54.14','660.13',CONVERT(DATETIME, '2022-04-16 18:21:39', 121)),
        (4,2,10,'COMPRA','APROVADO','683.05','377.21','74.81','544.89',CONVERT(DATETIME, '2024-06-06 05:58:11', 121)),
        (2,3,11,'COMPRA','APROVADO','840.29','169.60','44.19','889.26',CONVERT(DATETIME, '2024-04-19 06:41:05', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,11,'COMPRA','RECUSADO','516.53','257.50','50.04','868.09',CONVERT(DATETIME, '2022-05-03 06:54:18', 121)),
        (3,1,12,'COMPRA','APROVADO','580.28','347.34','71.18','764.33',CONVERT(DATETIME, '2022-10-09 19:34:14', 121)),
        (3,1,12,'COMPRA','APROVADO','559.63','213.05','56.40','638.77',CONVERT(DATETIME, '2024-06-06 21:48:36', 121)),
        (3,3,1,'COMPRA','APROVADO','560.42','144.64','65.21','774.20',CONVERT(DATETIME, '2024-02-23 17:40:12', 121)),
        (4,4,1,'COMPRA','APROVADO','673.70','350.29','73.03','796.73',CONVERT(DATETIME, '2023-01-26 19:51:04', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,1,2,'COMPRA','APROVADO','511.72','114.19','40.91','897.24',CONVERT(DATETIME, '2024-06-19 20:13:41', 121)),
        (3,2,2,'COMPRA','RECUSADO','852.44','395.88','49.41','763.71',CONVERT(DATETIME, '2023-12-07 12:39:30', 121)),
        (2,1,3,'COMPRA','APROVADO','543.11','254.12','38.50','786.51',CONVERT(DATETIME, '2024-06-07 23:12:26', 121)),
        (2,3,3,'COMPRA','APROVADO','988.28','354.05','67.04','480.53',CONVERT(DATETIME, '2023-04-14 09:07:14', 121)),
        (2,3,4,'COMPRA','APROVADO','757.33','110.40','29.31','467.02',CONVERT(DATETIME, '2022-01-20 07:03:12', 121)),
        (4,4,4,'COMPRA','APROVADO','690.19','330.55','28.60','833.15',CONVERT(DATETIME, '2022-11-23 22:51:58', 121)),
        (4,2,10,'COMPRA','APROVADO','547.71','211.50','59.14','429.05',CONVERT(DATETIME, '2023-08-09 06:15:20', 121)),
        (2,2,10,'COMPRA','RECUSADO','831.79','398.57','34.47','626.22',CONVERT(DATETIME, '2023-02-27 01:06:48', 121)),
        (3,3,11,'COMPRA','APROVADO','855.07','125.78','40.72','490.54',CONVERT(DATETIME, '2022-04-11 08:21:48', 121)),
        (4,3,11,'COMPRA','APROVADO','736.96','391.14','37.23','715.30',CONVERT(DATETIME, '2023-12-03 15:54:48', 121)),
        (2,2,12,'COMPRA','APROVADO','682.32','305.05','66.86','431.06',CONVERT(DATETIME, '2024-03-30 00:47:09', 121)),
        (3,2,12,'COMPRA','APROVADO','861.96','234.04','65.90','651.31',CONVERT(DATETIME, '2024-03-20 06:09:45', 121)),
        (3,4,1,'COMPRA','APROVADO','519.60','169.47','36.55','630.09',CONVERT(DATETIME, '2022-11-24 02:33:10', 121)),
        (2,1,1,'COMPRA','RECUSADO','847.53','420.10','36.72','656.76',CONVERT(DATETIME, '2023-02-08 08:26:49', 121)),
        (2,3,2,'COMPRA','APROVADO','626.60','384.71','54.31','748.33',CONVERT(DATETIME, '2023-06-11 00:42:57', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,3,2,'COMPRA','APROVADO','682.18','175.69','36.98','680.30',CONVERT(DATETIME, '2024-01-03 12:09:12', 121)),
        (1,1,3,'COMPRA','APROVADO','765.66','285.24','53.89','837.12',CONVERT(DATETIME, '2023-03-06 14:39:38', 121)),
        (2,2,3,'COMPRA','APROVADO','947.11','159.03','48.35','636.53',CONVERT(DATETIME, '2023-03-29 19:49:59', 121)),
        (1,2,4,'COMPRA','APROVADO','892.29','203.93','55.38','755.70',CONVERT(DATETIME, '2022-12-15 18:47:10', 121)),
        (3,4,4,'COMPRA','RECUSADO','917.43','349.56','47.44','680.55',CONVERT(DATETIME, '2023-04-05 07:14:20', 121)),
        (1,2,10,'COMPRA','APROVADO','573.43','198.30','56.00','423.64',CONVERT(DATETIME, '2022-07-28 05:32:25', 121)),
        (2,3,10,'COMPRA','APROVADO','517.58','199.66','71.52','578.39',CONVERT(DATETIME, '2024-05-22 14:13:38', 121)),
        (3,2,11,'COMPRA','APROVADO','936.36','137.46','43.08','699.96',CONVERT(DATETIME, '2022-09-17 22:10:27', 121)),
        (2,2,11,'COMPRA','APROVADO','904.90','238.67','26.11','899.13',CONVERT(DATETIME, '2022-01-25 21:52:29', 121)),
        (4,4,12,'COMPRA','APROVADO','886.16','271.40','63.77','775.84',CONVERT(DATETIME, '2022-01-07 04:01:34', 121)),
        (1,3,12,'COMPRA','RECUSADO','867.63','150.20','45.29','480.39',CONVERT(DATETIME, '2023-08-12 17:50:21', 121)),
        (4,2,1,'COMPRA','APROVADO','526.22','483.77','64.14','517.58',CONVERT(DATETIME, '2024-04-24 23:35:28', 121)),
        (2,4,1,'COMPRA','APROVADO','809.90','336.89','55.56','792.30',CONVERT(DATETIME, '2022-01-07 19:18:45', 121)),
        (2,3,2,'COMPRA','APROVADO','883.13','245.98','34.28','762.25',CONVERT(DATETIME, '2022-11-12 16:24:30', 121)),
        (1,2,2,'COMPRA','APROVADO','554.41','286.50','46.28','400.00',CONVERT(DATETIME, '2022-11-11 10:08:46', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,3,'COMPRA','APROVADO','693.20','285.52','53.41','648.72',CONVERT(DATETIME, '2023-03-03 12:34:19', 121)),
        (2,2,3,'COMPRA','RECUSADO','730.38','144.50','62.96','434.69',CONVERT(DATETIME, '2022-04-17 22:08:04', 121)),
        (2,2,4,'COMPRA','APROVADO','871.18','372.61','36.03','884.31',CONVERT(DATETIME, '2023-02-02 19:10:30', 121)),
        (2,2,4,'COMPRA','APROVADO','895.81','306.70','46.81','499.34',CONVERT(DATETIME, '2022-03-12 14:18:45', 121)),
        (2,2,10,'COMPRA','APROVADO','706.30','398.54','72.04','651.77',CONVERT(DATETIME, '2022-05-26 21:28:12', 121)),
        (2,2,10,'COMPRA','APROVADO','701.50','406.71','38.34','644.24',CONVERT(DATETIME, '2023-02-12 10:59:55', 121)),
        (4,2,11,'COMPRA','APROVADO','907.11','251.45','70.26','454.86',CONVERT(DATETIME, '2023-05-30 11:30:38', 121)),
        (2,2,11,'COMPRA','RECUSADO','814.39','485.56','52.15','830.86',CONVERT(DATETIME, '2024-06-20 15:01:11', 121)),
        (3,2,12,'COMPRA','APROVADO','643.48','325.30','68.87','628.10',CONVERT(DATETIME, '2024-01-03 06:41:39', 121)),
        (2,3,12,'COMPRA','APROVADO','751.56','176.33','54.57','712.03',CONVERT(DATETIME, '2023-03-21 22:14:44', 121)),
        (4,3,1,'COMPRA','APROVADO','937.20','192.19','44.19','612.62',CONVERT(DATETIME, '2022-01-12 06:11:29', 121)),
        (3,2,1,'COMPRA','APROVADO','808.49','440.85','51.98','786.28',CONVERT(DATETIME, '2022-08-12 22:04:35', 121)),
        (2,2,2,'COMPRA','APROVADO','591.17','161.03','25.83','487.69',CONVERT(DATETIME, '2023-08-02 10:55:40', 121)),
        (2,4,2,'COMPRA','RECUSADO','928.25','255.18','69.18','759.05',CONVERT(DATETIME, '2023-06-06 04:05:46', 121)),
        (2,4,3,'COMPRA','APROVADO','834.68','248.21','31.58','808.35',CONVERT(DATETIME, '2023-07-18 21:39:58', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,4,3,'COMPRA','APROVADO','923.81','266.50','35.21','637.28',CONVERT(DATETIME, '2024-06-01 05:54:31', 121)),
        (1,2,4,'COMPRA','APROVADO','745.30','316.83','65.78','642.70',CONVERT(DATETIME, '2023-10-17 08:47:37', 121)),
        (2,4,4,'COMPRA','APROVADO','642.80','155.85','47.91','887.04',CONVERT(DATETIME, '2024-06-26 07:35:28', 121)),
        (1,2,10,'COMPRA','APROVADO','790.59','304.22','41.84','678.52',CONVERT(DATETIME, '2022-08-25 05:42:21', 121)),
        (2,3,10,'COMPRA','RECUSADO','587.49','252.83','72.35','492.19',CONVERT(DATETIME, '2023-12-17 01:03:06', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,2,1,'COMPRA','APROVADO','762.71','193.51','60.14','443.05',CONVERT(DATETIME, '2024-06-19 06:33:51', 121)),
        (3,3,1,'COMPRA','RECUSADO','514.67','207.94','74.69','619.27',CONVERT(DATETIME, '2022-04-15 18:26:20', 121)),
        (1,4,2,'COMPRA','APROVADO','776.92','338.70','61.90','703.52',CONVERT(DATETIME, '2023-06-13 01:24:18', 121)),
        (4,1,2,'COMPRA','APROVADO','586.51','198.29','53.87','858.28',CONVERT(DATETIME, '2022-08-25 03:24:13', 121)),
        (4,3,3,'COMPRA','APROVADO','947.12','139.43','53.04','855.68',CONVERT(DATETIME, '2022-01-10 12:07:00', 121)),
        (1,3,3,'COMPRA','APROVADO','737.37','390.91','47.91','814.35',CONVERT(DATETIME, '2023-06-25 21:57:50', 121)),
        (3,2,4,'COMPRA','APROVADO','860.73','289.60','44.04','898.64',CONVERT(DATETIME, '2024-02-24 02:51:35', 121)),
        (2,3,4,'COMPRA','RECUSADO','565.21','466.58','43.85','593.64',CONVERT(DATETIME, '2024-02-15 01:36:07', 121)),
        (1,3,10,'COMPRA','APROVADO','602.01','319.81','48.79','581.68',CONVERT(DATETIME, '2023-04-05 01:31:03', 121)),
        (4,3,10,'COMPRA','APROVADO','597.19','123.10','62.68','872.71',CONVERT(DATETIME, '2022-02-17 04:45:08', 121)),
        (3,2,11,'COMPRA','APROVADO','943.42','351.49','34.33','762.54',CONVERT(DATETIME, '2023-03-18 21:54:25', 121)),
        (2,4,11,'COMPRA','APROVADO','788.70','125.81','33.79','402.16',CONVERT(DATETIME, '2022-01-29 12:37:59', 121)),
        (3,4,12,'COMPRA','APROVADO','662.23','102.03','36.91','721.54',CONVERT(DATETIME, '2024-05-22 08:16:58', 121)),
        (3,3,12,'COMPRA','RECUSADO','881.99','299.88','64.10','639.67',CONVERT(DATETIME, '2022-02-15 17:33:45', 121)),
        (1,4,1,'COMPRA','APROVADO','616.91','464.74','55.61','422.91',CONVERT(DATETIME, '2023-05-07 22:35:13', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,1,'COMPRA','APROVADO','812.79','246.47','64.91','647.03',CONVERT(DATETIME, '2022-06-24 21:27:30', 121)),
        (2,1,2,'COMPRA','APROVADO','956.36','255.58','28.29','606.66',CONVERT(DATETIME, '2023-04-17 02:33:28', 121)),
        (4,4,2,'COMPRA','APROVADO','905.71','487.89','43.28','884.99',CONVERT(DATETIME, '2023-12-19 22:25:43', 121)),
        (1,1,3,'COMPRA','APROVADO','903.61','319.51','61.68','410.07',CONVERT(DATETIME, '2024-05-21 09:10:30', 121)),
        (1,4,3,'COMPRA','RECUSADO','980.67','186.30','28.32','848.95',CONVERT(DATETIME, '2022-11-29 00:13:16', 121)),
        (2,2,4,'COMPRA','APROVADO','780.00','312.97','26.48','866.53',CONVERT(DATETIME, '2022-12-07 04:26:23', 121)),
        (4,2,4,'COMPRA','APROVADO','889.23','175.56','26.06','880.46',CONVERT(DATETIME, '2022-12-18 06:40:42', 121)),
        (3,1,10,'COMPRA','APROVADO','856.29','296.81','55.68','432.55',CONVERT(DATETIME, '2023-08-20 18:08:10', 121)),
        (2,3,10,'COMPRA','APROVADO','616.86','361.22','41.28','697.30',CONVERT(DATETIME, '2023-11-19 00:07:09', 121)),
        (3,3,11,'COMPRA','APROVADO','610.59','185.19','42.33','866.16',CONVERT(DATETIME, '2022-07-09 12:23:14', 121)),
        (1,4,11,'COMPRA','RECUSADO','982.81','199.49','71.91','835.86',CONVERT(DATETIME, '2024-04-12 03:22:19', 121)),
        (1,4,12,'COMPRA','APROVADO','911.64','224.26','64.26','680.98',CONVERT(DATETIME, '2022-09-09 19:10:19', 121)),
        (2,3,12,'COMPRA','APROVADO','679.60','260.75','28.55','889.36',CONVERT(DATETIME, '2023-10-17 18:27:50', 121)),
        (3,3,1,'COMPRA','APROVADO','770.40','362.41','65.33','447.17',CONVERT(DATETIME, '2022-10-06 11:56:26', 121)),
        (2,2,1,'COMPRA','APROVADO','915.25','382.33','33.13','627.41',CONVERT(DATETIME, '2023-02-06 07:24:16', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,1,2,'COMPRA','APROVADO','505.66','207.65','72.31','539.42',CONVERT(DATETIME, '2022-08-26 21:30:05', 121)),
        (3,1,2,'COMPRA','RECUSADO','524.35','128.55','52.62','404.51',CONVERT(DATETIME, '2023-07-12 20:51:28', 121)),
        (3,2,3,'COMPRA','APROVADO','832.50','116.55','53.89','441.58',CONVERT(DATETIME, '2022-01-05 17:27:32', 121)),
        (2,3,3,'COMPRA','APROVADO','624.32','313.95','73.08','520.38',CONVERT(DATETIME, '2023-06-13 20:59:00', 121)),
        (4,1,4,'COMPRA','APROVADO','633.26','441.70','36.10','683.63',CONVERT(DATETIME, '2023-06-15 00:53:33', 121)),
        (2,4,4,'COMPRA','APROVADO','621.26','159.07','30.45','757.06',CONVERT(DATETIME, '2023-08-11 10:00:26', 121)),
        (1,2,10,'COMPRA','APROVADO','591.78','268.31','61.62','769.41',CONVERT(DATETIME, '2023-10-09 08:52:26', 121)),
        (1,3,10,'COMPRA','RECUSADO','792.91','482.37','70.22','579.45',CONVERT(DATETIME, '2022-01-01 22:09:18', 121)),
        (1,4,11,'COMPRA','APROVADO','517.94','427.79','27.02','634.47',CONVERT(DATETIME, '2022-11-29 16:36:13', 121)),
        (1,2,11,'COMPRA','APROVADO','743.34','203.20','64.42','598.77',CONVERT(DATETIME, '2022-10-18 16:11:28', 121)),
        (2,1,12,'COMPRA','APROVADO','993.24','139.39','50.61','471.45',CONVERT(DATETIME, '2024-01-23 03:20:10', 121)),
        (2,2,12,'COMPRA','APROVADO','757.38','247.31','39.35','898.79',CONVERT(DATETIME, '2022-10-26 22:08:26', 121)),
        (3,3,1,'COMPRA','APROVADO','829.98','429.94','47.66','638.14',CONVERT(DATETIME, '2024-04-12 02:39:12', 121)),
        (3,2,1,'COMPRA','RECUSADO','827.98','451.95','46.72','698.52',CONVERT(DATETIME, '2022-08-02 21:13:04', 121)),
        (4,3,2,'COMPRA','APROVADO','505.33','258.28','64.31','447.31',CONVERT(DATETIME, '2024-05-06 10:12:29', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,2,2,'COMPRA','APROVADO','540.54','328.24','26.32','644.37',CONVERT(DATETIME, '2023-04-09 01:14:03', 121)),
        (4,4,3,'COMPRA','APROVADO','924.29','222.26','45.78','833.68',CONVERT(DATETIME, '2024-06-11 16:18:13', 121)),
        (3,2,3,'COMPRA','APROVADO','896.74','401.33','69.08','512.12',CONVERT(DATETIME, '2023-01-19 07:02:22', 121)),
        (3,2,4,'COMPRA','APROVADO','783.82','170.66','47.73','512.03',CONVERT(DATETIME, '2023-01-08 22:18:59', 121)),
        (2,3,4,'COMPRA','RECUSADO','520.64','267.61','72.70','880.17',CONVERT(DATETIME, '2024-01-28 19:01:20', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,1,10,'COMPRA','APROVADO','550.88','436.10','30.22','734.19',CONVERT(DATETIME, '2022-10-30 15:21:56', 121)),
        (2,2,10,'COMPRA','APROVADO','886.14','313.30','28.57','660.47',CONVERT(DATETIME, '2024-05-20 02:53:17', 121)),
        (3,1,11,'COMPRA','APROVADO','765.35','460.97','50.87','439.36',CONVERT(DATETIME, '2022-06-23 06:19:51', 121)),
        (4,3,11,'COMPRA','APROVADO','536.71','484.27','57.35','538.73',CONVERT(DATETIME, '2023-02-07 03:56:17', 121)),
        (2,2,12,'COMPRA','APROVADO','756.16','104.16','38.27','535.59',CONVERT(DATETIME, '2022-05-30 13:18:11', 121)),
        (1,2,12,'COMPRA','RECUSADO','680.52','257.11','36.56','473.42',CONVERT(DATETIME, '2024-04-29 16:41:48', 121)),
        (3,3,1,'COMPRA','APROVADO','739.67','486.56','64.58','629.03',CONVERT(DATETIME, '2024-02-20 01:07:48', 121)),
        (2,1,1,'COMPRA','APROVADO','789.22','482.07','57.87','646.86',CONVERT(DATETIME, '2022-12-31 14:54:27', 121)),
        (4,2,2,'COMPRA','APROVADO','944.75','242.27','65.33','730.51',CONVERT(DATETIME, '2022-09-21 08:39:16', 121)),
        (1,2,2,'COMPRA','APROVADO','720.78','381.78','26.89','434.59',CONVERT(DATETIME, '2024-06-21 12:37:24', 121)),
        (4,2,3,'COMPRA','APROVADO','835.14','200.37','48.90','694.90',CONVERT(DATETIME, '2023-01-21 02:27:03', 121)),
        (3,2,3,'COMPRA','RECUSADO','837.29','320.74','33.73','577.75',CONVERT(DATETIME, '2023-01-09 09:52:14', 121)),
        (2,2,4,'COMPRA','APROVADO','985.62','196.73','42.70','613.92',CONVERT(DATETIME, '2023-07-18 22:50:20', 121)),
        (4,4,4,'COMPRA','APROVADO','867.28','293.47','56.18','611.66',CONVERT(DATETIME, '2022-04-17 05:42:39', 121)),
        (3,1,10,'COMPRA','APROVADO','693.86','403.83','33.65','637.96',CONVERT(DATETIME, '2023-10-06 03:16:27', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,4,10,'COMPRA','APROVADO','844.26','397.62','41.86','728.98',CONVERT(DATETIME, '2024-03-02 02:21:59', 121)),
        (4,2,11,'COMPRA','APROVADO','654.75','189.45','42.65','894.51',CONVERT(DATETIME, '2023-06-29 18:49:10', 121)),
        (2,2,11,'COMPRA','RECUSADO','917.36','215.80','62.36','815.00',CONVERT(DATETIME, '2023-10-09 10:55:25', 121)),
        (4,2,12,'COMPRA','APROVADO','800.39','419.84','65.43','547.24',CONVERT(DATETIME, '2023-09-04 15:09:06', 121)),
        (3,1,12,'COMPRA','APROVADO','735.50','232.70','36.06','433.73',CONVERT(DATETIME, '2022-09-24 11:44:26', 121)),
        (4,2,1,'COMPRA','APROVADO','990.14','392.67','54.88','547.25',CONVERT(DATETIME, '2023-02-18 22:25:16', 121)),
        (3,2,1,'COMPRA','APROVADO','866.16','304.33','64.69','534.00',CONVERT(DATETIME, '2024-01-06 16:20:53', 121)),
        (2,1,2,'COMPRA','APROVADO','531.11','432.14','28.11','520.14',CONVERT(DATETIME, '2023-06-27 01:12:14', 121)),
        (2,2,2,'COMPRA','RECUSADO','720.36','308.04','44.19','554.49',CONVERT(DATETIME, '2022-02-04 03:18:28', 121)),
        (1,3,3,'COMPRA','APROVADO','715.53','497.72','71.30','605.04',CONVERT(DATETIME, '2022-03-21 10:53:25', 121)),
        (2,2,3,'COMPRA','APROVADO','790.53','218.36','66.26','894.29',CONVERT(DATETIME, '2022-05-19 21:07:13', 121)),
        (2,1,4,'COMPRA','APROVADO','984.36','240.77','72.37','464.39',CONVERT(DATETIME, '2024-01-29 00:12:05', 121)),
        (1,3,4,'COMPRA','APROVADO','867.46','451.50','35.10','669.69',CONVERT(DATETIME, '2023-04-23 10:14:43', 121)),
        (3,3,10,'COMPRA','APROVADO','558.65','427.46','72.70','835.62',CONVERT(DATETIME, '2023-05-02 06:49:53', 121)),
        (3,4,10,'COMPRA','RECUSADO','681.29','306.17','70.23','452.31',CONVERT(DATETIME, '2023-10-25 13:40:30', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,11,'COMPRA','APROVADO','723.68','442.12','65.54','606.63',CONVERT(DATETIME, '2024-05-28 19:58:34', 121)),
        (2,2,11,'COMPRA','APROVADO','840.06','255.11','42.30','785.36',CONVERT(DATETIME, '2023-12-08 04:12:40', 121)),
        (1,4,12,'COMPRA','APROVADO','942.23','247.12','42.89','535.11',CONVERT(DATETIME, '2022-06-30 14:09:14', 121)),
        (2,2,12,'COMPRA','APROVADO','629.09','292.26','50.44','895.29',CONVERT(DATETIME, '2022-04-23 01:25:17', 121)),
        (3,1,1,'COMPRA','APROVADO','926.50','319.69','48.20','682.57',CONVERT(DATETIME, '2024-05-06 02:42:41', 121)),
        (4,3,1,'COMPRA','RECUSADO','514.43','245.99','39.36','800.03',CONVERT(DATETIME, '2022-02-02 02:42:00', 121)),
        (1,1,2,'COMPRA','APROVADO','726.31','133.65','45.66','725.56',CONVERT(DATETIME, '2024-01-18 10:47:06', 121)),
        (1,3,2,'COMPRA','APROVADO','910.61','456.57','60.03','590.77',CONVERT(DATETIME, '2024-06-07 04:38:53', 121)),
        (1,3,3,'COMPRA','APROVADO','514.11','235.98','30.20','644.53',CONVERT(DATETIME, '2023-04-29 02:18:54', 121)),
        (3,3,3,'COMPRA','APROVADO','670.94','474.89','34.43','663.70',CONVERT(DATETIME, '2022-04-29 12:19:23', 121)),
        (3,3,4,'COMPRA','APROVADO','510.57','405.94','53.86','440.24',CONVERT(DATETIME, '2022-05-22 08:24:49', 121)),
        (3,3,4,'COMPRA','RECUSADO','995.00','330.56','47.65','453.16',CONVERT(DATETIME, '2022-11-24 04:01:13', 121)),
        (3,1,10,'COMPRA','APROVADO','710.90','102.41','65.91','490.05',CONVERT(DATETIME, '2022-03-22 01:10:14', 121)),
        (2,3,10,'COMPRA','APROVADO','824.29','474.28','61.80','618.80',CONVERT(DATETIME, '2023-05-06 22:09:57', 121)),
        (4,2,11,'COMPRA','APROVADO','638.00','154.21','61.94','676.28',CONVERT(DATETIME, '2022-07-10 04:32:52', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,11,'COMPRA','APROVADO','819.78','340.77','54.73','740.01',CONVERT(DATETIME, '2023-10-15 08:09:41', 121)),
        (4,3,12,'COMPRA','APROVADO','775.78','188.00','73.13','801.76',CONVERT(DATETIME, '2022-01-18 12:03:49', 121)),
        (1,3,12,'COMPRA','RECUSADO','733.97','377.85','47.65','559.43',CONVERT(DATETIME, '2023-08-30 18:28:50', 121)),
        (3,3,1,'COMPRA','APROVADO','702.43','456.86','30.64','585.17',CONVERT(DATETIME, '2022-09-04 19:21:44', 121)),
        (4,2,1,'COMPRA','APROVADO','738.98','157.64','59.19','483.48',CONVERT(DATETIME, '2022-08-15 12:31:46', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,2,'COMPRA','APROVADO','502.10','168.83','73.34','408.20',CONVERT(DATETIME, '2023-03-20 07:18:29', 121)),
        (3,3,2,'COMPRA','APROVADO','925.75','457.82','29.91','714.60',CONVERT(DATETIME, '2023-11-01 05:05:25', 121)),
        (1,4,3,'COMPRA','APROVADO','819.04','161.97','47.90','854.59',CONVERT(DATETIME, '2024-02-19 03:35:55', 121)),
        (2,4,3,'COMPRA','RECUSADO','923.46','406.83','52.49','716.03',CONVERT(DATETIME, '2022-03-05 19:05:34', 121)),
        (3,1,4,'COMPRA','APROVADO','898.21','311.37','37.36','684.67',CONVERT(DATETIME, '2022-01-06 13:51:14', 121)),
        (4,3,4,'COMPRA','APROVADO','822.96','122.75','55.32','663.55',CONVERT(DATETIME, '2022-03-19 01:42:45', 121)),
        (1,3,10,'COMPRA','APROVADO','511.23','240.11','68.07','496.13',CONVERT(DATETIME, '2022-11-11 17:58:45', 121)),
        (4,1,10,'COMPRA','APROVADO','603.71','372.18','37.89','721.88',CONVERT(DATETIME, '2024-02-01 23:19:43', 121)),
        (3,2,11,'COMPRA','APROVADO','886.00','304.40','47.80','443.63',CONVERT(DATETIME, '2023-03-10 01:41:02', 121)),
        (4,2,11,'COMPRA','RECUSADO','650.40','457.35','65.73','641.73',CONVERT(DATETIME, '2023-09-05 17:07:41', 121)),
        (4,3,12,'COMPRA','APROVADO','765.06','486.35','49.75','691.79',CONVERT(DATETIME, '2023-10-04 03:43:39', 121)),
        (1,4,12,'COMPRA','APROVADO','503.48','495.68','25.91','472.71',CONVERT(DATETIME, '2022-12-14 17:12:07', 121)),
        (2,3,1,'COMPRA','APROVADO','594.20','180.67','47.97','403.94',CONVERT(DATETIME, '2022-07-03 21:27:02', 121)),
        (1,3,1,'COMPRA','APROVADO','619.73','261.16','53.88','451.44',CONVERT(DATETIME, '2024-02-09 21:31:48', 121)),
        (2,2,2,'COMPRA','APROVADO','665.59','233.39','44.30','766.78',CONVERT(DATETIME, '2023-06-20 03:03:38', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,4,2,'COMPRA','RECUSADO','984.06','338.18','70.03','695.25',CONVERT(DATETIME, '2022-04-19 07:18:51', 121)),
        (1,3,3,'COMPRA','APROVADO','715.53','290.75','36.88','522.88',CONVERT(DATETIME, '2023-06-18 13:37:54', 121)),
        (3,3,3,'COMPRA','APROVADO','916.14','246.10','56.46','479.78',CONVERT(DATETIME, '2023-05-03 07:42:54', 121)),
        (1,2,4,'COMPRA','APROVADO','810.11','267.61','68.21','633.75',CONVERT(DATETIME, '2022-06-02 16:41:04', 121)),
        (3,2,4,'COMPRA','APROVADO','505.20','356.95','59.43','773.12',CONVERT(DATETIME, '2022-11-18 20:49:20', 121)),
        (1,3,10,'COMPRA','APROVADO','570.98','459.68','54.24','421.28',CONVERT(DATETIME, '2022-09-28 05:18:13', 121)),
        (1,2,10,'COMPRA','RECUSADO','695.30','272.75','74.12','628.00',CONVERT(DATETIME, '2024-04-28 22:44:22', 121)),
        (4,3,11,'COMPRA','APROVADO','950.56','358.38','63.62','452.45',CONVERT(DATETIME, '2023-06-10 15:28:10', 121)),
        (2,3,11,'COMPRA','APROVADO','869.55','375.04','30.15','810.41',CONVERT(DATETIME, '2022-07-27 17:56:16', 121)),
        (2,2,12,'COMPRA','APROVADO','661.82','487.22','46.89','482.67',CONVERT(DATETIME, '2022-12-07 12:09:16', 121)),
        (3,3,12,'COMPRA','APROVADO','742.09','447.49','58.73','481.78',CONVERT(DATETIME, '2023-03-11 14:59:32', 121)),
        (3,4,1,'COMPRA','APROVADO','773.28','415.32','33.61','603.31',CONVERT(DATETIME, '2023-11-18 20:58:41', 121)),
        (2,2,1,'COMPRA','RECUSADO','733.11','139.33','33.69','401.03',CONVERT(DATETIME, '2024-04-11 06:31:54', 121)),
        (2,2,2,'COMPRA','APROVADO','814.22','234.34','62.83','690.36',CONVERT(DATETIME, '2023-06-08 09:54:41', 121)),
        (3,2,2,'COMPRA','APROVADO','593.58','233.92','31.92','770.69',CONVERT(DATETIME, '2022-02-04 11:00:26', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,3,3,'COMPRA','APROVADO','582.81','272.80','36.85','712.14',CONVERT(DATETIME, '2024-03-31 06:27:37', 121)),
        (1,1,3,'COMPRA','APROVADO','570.93','492.93','38.52','678.64',CONVERT(DATETIME, '2024-01-12 16:25:58', 121)),
        (3,3,4,'COMPRA','APROVADO','534.25','482.68','39.63','401.72',CONVERT(DATETIME, '2023-12-24 18:05:28', 121)),
        (3,2,4,'COMPRA','RECUSADO','643.64','150.08','52.88','485.49',CONVERT(DATETIME, '2023-03-28 22:21:10', 121)),
        (2,3,10,'COMPRA','APROVADO','789.00','212.41','41.84','883.54',CONVERT(DATETIME, '2024-04-12 04:42:16', 121)),
        (1,3,10,'COMPRA','APROVADO','525.89','173.20','49.92','483.70',CONVERT(DATETIME, '2024-02-11 03:15:09', 121)),
        (3,4,11,'COMPRA','APROVADO','879.78','384.97','47.41','592.79',CONVERT(DATETIME, '2022-12-09 01:30:01', 121)),
        (2,3,11,'COMPRA','APROVADO','502.69','408.11','25.36','857.29',CONVERT(DATETIME, '2023-12-06 06:49:13', 121)),
        (3,3,12,'COMPRA','APROVADO','507.93','154.31','64.08','856.10',CONVERT(DATETIME, '2022-12-23 16:41:03', 121)),
        (2,3,12,'COMPRA','RECUSADO','654.94','439.68','57.64','743.67',CONVERT(DATETIME, '2023-03-04 19:08:27', 121)),
        (3,1,1,'COMPRA','APROVADO','794.60','116.50','65.23','490.11',CONVERT(DATETIME, '2022-11-27 01:55:43', 121)),
        (4,3,1,'COMPRA','APROVADO','563.93','373.68','69.07','860.29',CONVERT(DATETIME, '2024-06-22 22:58:41', 121)),
        (3,1,2,'COMPRA','APROVADO','802.80','248.02','66.91','855.18',CONVERT(DATETIME, '2022-03-26 04:56:10', 121)),
        (4,3,2,'COMPRA','APROVADO','809.39','364.38','43.29','697.61',CONVERT(DATETIME, '2023-03-24 21:34:13', 121)),
        (1,3,3,'COMPRA','APROVADO','944.40','313.19','50.72','520.76',CONVERT(DATETIME, '2023-07-09 10:40:44', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,3,3,'COMPRA','RECUSADO','863.87','479.69','70.14','562.58',CONVERT(DATETIME, '2023-03-23 22:46:29', 121)),
        (3,3,4,'COMPRA','APROVADO','886.21','329.34','31.58','694.09',CONVERT(DATETIME, '2023-07-22 22:25:31', 121)),
        (3,1,4,'COMPRA','APROVADO','707.44','428.16','60.95','704.21',CONVERT(DATETIME, '2023-10-28 11:04:18', 121)),
        (4,3,10,'COMPRA','APROVADO','577.18','277.18','30.02','528.13',CONVERT(DATETIME, '2022-08-07 03:08:32', 121)),
        (2,2,10,'COMPRA','APROVADO','864.45','271.68','43.25','865.36',CONVERT(DATETIME, '2024-02-01 12:19:35', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,11,'COMPRA','APROVADO','629.95','170.75','46.89','400.92',CONVERT(DATETIME, '2024-03-04 03:42:13', 121)),
        (3,3,11,'COMPRA','RECUSADO','633.95','492.40','48.90','799.99',CONVERT(DATETIME, '2023-09-29 10:26:39', 121)),
        (2,2,12,'COMPRA','APROVADO','692.93','151.51','29.45','533.99',CONVERT(DATETIME, '2023-06-07 07:45:47', 121)),
        (4,2,12,'COMPRA','APROVADO','754.08','312.04','61.48','716.62',CONVERT(DATETIME, '2024-04-20 21:39:17', 121)),
        (2,3,1,'COMPRA','APROVADO','949.08','129.82','65.06','605.72',CONVERT(DATETIME, '2022-11-05 02:26:02', 121)),
        (3,4,1,'COMPRA','APROVADO','943.09','266.29','38.78','695.26',CONVERT(DATETIME, '2022-06-14 07:32:45', 121)),
        (4,2,2,'COMPRA','APROVADO','513.36','198.54','47.15','527.97',CONVERT(DATETIME, '2022-08-10 08:02:30', 121)),
        (4,2,2,'COMPRA','RECUSADO','842.45','293.29','42.21','571.82',CONVERT(DATETIME, '2022-07-20 04:40:52', 121)),
        (3,1,3,'COMPRA','APROVADO','658.25','272.56','62.44','545.18',CONVERT(DATETIME, '2022-03-13 23:28:04', 121)),
        (2,2,3,'COMPRA','APROVADO','879.72','466.91','71.08','510.88',CONVERT(DATETIME, '2022-07-11 23:47:57', 121)),
        (4,3,4,'COMPRA','APROVADO','529.78','321.81','68.69','504.90',CONVERT(DATETIME, '2022-04-14 12:27:29', 121)),
        (2,3,4,'COMPRA','APROVADO','825.91','386.06','62.20','748.87',CONVERT(DATETIME, '2023-05-05 13:12:37', 121)),
        (3,2,10,'COMPRA','APROVADO','722.30','241.57','48.21','532.79',CONVERT(DATETIME, '2024-01-04 02:01:21', 121)),
        (2,2,10,'COMPRA','RECUSADO','826.04','238.32','48.37','857.24',CONVERT(DATETIME, '2023-05-01 17:15:16', 121)),
        (4,2,11,'COMPRA','APROVADO','510.19','129.05','39.23','713.19',CONVERT(DATETIME, '2022-03-12 03:12:24', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,3,11,'COMPRA','APROVADO','588.45','119.18','61.67','816.56',CONVERT(DATETIME, '2022-04-30 22:31:11', 121)),
        (4,1,12,'COMPRA','APROVADO','628.65','460.77','30.69','447.66',CONVERT(DATETIME, '2023-04-13 21:10:40', 121)),
        (4,3,12,'COMPRA','APROVADO','643.05','243.37','40.58','657.47',CONVERT(DATETIME, '2022-08-21 20:46:27', 121)),
        (1,3,1,'COMPRA','APROVADO','952.50','137.43','72.56','757.16',CONVERT(DATETIME, '2023-11-04 17:35:09', 121)),
        (3,3,1,'COMPRA','RECUSADO','522.60','413.02','48.50','829.26',CONVERT(DATETIME, '2022-10-11 01:30:01', 121)),
        (2,2,2,'COMPRA','APROVADO','609.19','425.12','48.31','709.79',CONVERT(DATETIME, '2022-05-15 22:08:51', 121)),
        (4,3,2,'COMPRA','APROVADO','616.69','234.92','60.91','863.92',CONVERT(DATETIME, '2022-01-28 21:17:58', 121)),
        (1,2,3,'COMPRA','APROVADO','615.98','153.41','38.73','488.47',CONVERT(DATETIME, '2023-10-12 21:48:49', 121)),
        (1,1,3,'COMPRA','APROVADO','969.17','166.10','73.21','842.91',CONVERT(DATETIME, '2022-05-23 23:36:51', 121)),
        (2,1,4,'COMPRA','APROVADO','551.08','360.00','71.53','781.74',CONVERT(DATETIME, '2024-05-10 15:38:40', 121)),
        (4,4,4,'COMPRA','RECUSADO','909.23','299.91','38.20','567.39',CONVERT(DATETIME, '2023-08-16 20:20:22', 121)),
        (4,1,10,'COMPRA','APROVADO','834.61','215.03','53.97','643.16',CONVERT(DATETIME, '2023-01-14 18:29:20', 121)),
        (2,2,10,'COMPRA','APROVADO','933.38','290.20','67.77','456.33',CONVERT(DATETIME, '2022-07-16 08:14:51', 121)),
        (3,3,11,'COMPRA','APROVADO','843.31','226.81','44.75','472.49',CONVERT(DATETIME, '2023-03-22 14:03:01', 121)),
        (3,1,11,'COMPRA','APROVADO','863.04','247.11','48.17','546.01',CONVERT(DATETIME, '2023-12-08 20:13:48', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,12,'COMPRA','APROVADO','611.94','262.02','68.48','745.31',CONVERT(DATETIME, '2023-01-28 16:36:04', 121)),
        (2,2,12,'COMPRA','RECUSADO','831.94','378.46','50.79','514.73',CONVERT(DATETIME, '2022-08-18 06:12:11', 121)),
        (2,1,1,'COMPRA','APROVADO','817.19','421.60','56.33','666.10',CONVERT(DATETIME, '2024-04-01 16:06:53', 121)),
        (3,1,1,'COMPRA','APROVADO','862.31','278.87','28.73','634.80',CONVERT(DATETIME, '2022-06-02 15:16:22', 121)),
        (2,2,2,'COMPRA','APROVADO','914.38','285.76','74.00','574.06',CONVERT(DATETIME, '2022-07-21 20:09:25', 121)),
        (4,2,2,'COMPRA','APROVADO','667.95','494.07','47.36','728.79',CONVERT(DATETIME, '2022-05-26 12:09:53', 121)),
        (2,2,3,'COMPRA','APROVADO','842.56','246.23','39.49','645.81',CONVERT(DATETIME, '2023-04-11 04:47:49', 121)),
        (3,3,3,'COMPRA','RECUSADO','693.30','215.65','35.43','865.19',CONVERT(DATETIME, '2022-04-29 15:01:16', 121)),
        (2,2,4,'COMPRA','APROVADO','596.17','247.21','39.72','411.96',CONVERT(DATETIME, '2022-05-30 21:33:37', 121)),
        (1,4,4,'COMPRA','APROVADO','879.53','372.12','28.27','687.45',CONVERT(DATETIME, '2022-04-10 18:21:27', 121)),
        (4,4,10,'COMPRA','APROVADO','532.44','471.37','49.57','597.37',CONVERT(DATETIME, '2023-05-27 12:23:14', 121)),
        (3,2,10,'COMPRA','APROVADO','926.19','449.52','65.77','689.33',CONVERT(DATETIME, '2023-04-15 16:33:44', 121)),
        (1,3,11,'COMPRA','APROVADO','528.35','418.32','36.28','495.22',CONVERT(DATETIME, '2022-07-20 06:23:42', 121)),
        (3,3,11,'COMPRA','RECUSADO','638.81','319.26','57.20','658.79',CONVERT(DATETIME, '2022-09-27 00:38:36', 121)),
        (3,1,12,'COMPRA','APROVADO','728.69','246.38','55.38','644.02',CONVERT(DATETIME, '2023-12-14 08:07:47', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,3,12,'COMPRA','APROVADO','969.04','492.47','49.47','680.18',CONVERT(DATETIME, '2023-02-05 04:12:00', 121)),
        (2,4,1,'COMPRA','APROVADO','810.01','147.47','30.65','659.94',CONVERT(DATETIME, '2023-01-30 01:48:05', 121)),
        (3,3,1,'COMPRA','APROVADO','666.07','281.78','70.42','833.75',CONVERT(DATETIME, '2023-12-11 05:11:09', 121)),
        (2,2,2,'COMPRA','APROVADO','960.00','425.46','29.46','887.49',CONVERT(DATETIME, '2023-10-17 00:45:04', 121)),
        (2,3,2,'COMPRA','RECUSADO','806.22','429.52','65.42','440.49',CONVERT(DATETIME, '2022-12-27 02:34:57', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,3,3,'COMPRA','APROVADO','577.58','335.45','67.98','689.47',CONVERT(DATETIME, '2022-03-11 12:34:32', 121)),
        (4,2,3,'COMPRA','APROVADO','530.09','399.59','34.38','855.96',CONVERT(DATETIME, '2023-09-06 13:49:11', 121)),
        (2,1,4,'COMPRA','APROVADO','672.55','319.93','29.65','715.49',CONVERT(DATETIME, '2023-05-14 12:51:53', 121)),
        (1,2,4,'COMPRA','APROVADO','720.21','440.37','38.21','810.74',CONVERT(DATETIME, '2023-02-11 18:26:44', 121)),
        (2,2,10,'COMPRA','APROVADO','789.83','219.98','50.41','511.98',CONVERT(DATETIME, '2022-01-02 11:39:59', 121)),
        (3,2,10,'COMPRA','RECUSADO','565.19','163.58','34.71','483.77',CONVERT(DATETIME, '2024-05-23 16:07:58', 121)),
        (1,4,11,'COMPRA','APROVADO','701.40','265.83','26.24','767.64',CONVERT(DATETIME, '2024-05-06 05:02:31', 121)),
        (4,2,11,'COMPRA','APROVADO','935.42','150.96','29.34','809.22',CONVERT(DATETIME, '2022-04-08 19:48:55', 121)),
        (4,3,12,'COMPRA','APROVADO','715.96','381.31','50.92','836.07',CONVERT(DATETIME, '2022-11-15 02:44:21', 121)),
        (3,4,12,'COMPRA','APROVADO','703.37','108.14','54.19','661.50',CONVERT(DATETIME, '2023-05-28 15:46:03', 121)),
        (4,4,1,'COMPRA','APROVADO','741.57','229.55','40.47','644.65',CONVERT(DATETIME, '2023-08-30 11:50:54', 121)),
        (2,3,1,'COMPRA','RECUSADO','948.64','427.71','28.12','594.05',CONVERT(DATETIME, '2023-07-14 15:28:29', 121)),
        (2,1,2,'COMPRA','APROVADO','843.64','480.95','58.29','858.44',CONVERT(DATETIME, '2024-01-02 15:53:18', 121)),
        (2,3,2,'COMPRA','APROVADO','894.49','244.60','53.11','423.43',CONVERT(DATETIME, '2022-07-28 16:41:49', 121)),
        (4,3,3,'COMPRA','APROVADO','999.83','386.87','31.71','853.10',CONVERT(DATETIME, '2023-03-05 17:40:20', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,4,3,'COMPRA','APROVADO','562.44','494.70','72.93','494.93',CONVERT(DATETIME, '2024-04-13 19:05:04', 121)),
        (1,3,4,'COMPRA','APROVADO','705.33','204.46','44.58','629.32',CONVERT(DATETIME, '2022-05-15 00:03:01', 121)),
        (2,1,4,'COMPRA','RECUSADO','979.06','368.92','30.06','596.34',CONVERT(DATETIME, '2024-03-24 10:45:17', 121)),
        (1,4,10,'COMPRA','APROVADO','771.10','248.53','58.74','441.13',CONVERT(DATETIME, '2024-03-17 04:14:18', 121)),
        (3,2,10,'COMPRA','APROVADO','808.99','188.74','53.23','578.24',CONVERT(DATETIME, '2022-01-16 09:41:47', 121)),
        (3,2,11,'COMPRA','APROVADO','789.73','175.08','49.84','572.37',CONVERT(DATETIME, '2024-03-25 12:15:56', 121)),
        (2,2,11,'COMPRA','APROVADO','585.51','387.78','63.12','719.46',CONVERT(DATETIME, '2022-08-30 09:33:47', 121)),
        (1,2,12,'COMPRA','APROVADO','501.39','436.47','33.07','403.17',CONVERT(DATETIME, '2023-08-22 09:58:05', 121)),
        (4,4,12,'COMPRA','RECUSADO','653.65','126.58','66.70','733.15',CONVERT(DATETIME, '2022-01-06 08:56:18', 121)),
        (1,2,1,'COMPRA','APROVADO','952.38','397.83','29.10','522.34',CONVERT(DATETIME, '2023-11-03 07:54:36', 121)),
        (3,1,1,'COMPRA','APROVADO','504.53','266.88','54.71','583.23',CONVERT(DATETIME, '2022-03-18 18:19:59', 121)),
        (4,2,2,'COMPRA','APROVADO','504.83','385.69','48.38','487.34',CONVERT(DATETIME, '2022-03-30 02:43:37', 121)),
        (4,4,2,'COMPRA','APROVADO','908.44','229.16','39.85','865.65',CONVERT(DATETIME, '2023-04-11 15:50:16', 121)),
        (1,4,3,'COMPRA','APROVADO','554.45','113.44','61.91','824.40',CONVERT(DATETIME, '2023-08-28 05:07:07', 121)),
        (4,3,3,'COMPRA','RECUSADO','663.21','475.27','29.46','664.13',CONVERT(DATETIME, '2022-02-26 05:53:44', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,4,'COMPRA','APROVADO','766.86','497.48','61.84','416.54',CONVERT(DATETIME, '2023-07-12 03:40:12', 121)),
        (4,1,4,'COMPRA','APROVADO','679.53','126.68','49.92','744.80',CONVERT(DATETIME, '2024-05-27 07:04:54', 121)),
        (4,2,10,'COMPRA','APROVADO','636.77','146.64','32.00','709.32',CONVERT(DATETIME, '2023-09-03 04:43:56', 121)),
        (3,3,10,'COMPRA','APROVADO','860.22','142.08','73.32','666.33',CONVERT(DATETIME, '2023-07-18 14:40:06', 121)),
        (4,3,11,'COMPRA','APROVADO','972.43','165.79','59.92','813.27',CONVERT(DATETIME, '2023-11-18 13:11:44', 121)),
        (3,1,11,'COMPRA','RECUSADO','894.35','196.42','37.39','615.78',CONVERT(DATETIME, '2024-02-25 14:09:59', 121)),
        (2,4,12,'COMPRA','APROVADO','683.24','357.46','49.74','437.42',CONVERT(DATETIME, '2022-08-02 06:17:52', 121)),
        (4,2,12,'COMPRA','APROVADO','877.78','218.06','42.09','656.61',CONVERT(DATETIME, '2023-12-07 14:35:21', 121)),
        (1,2,1,'COMPRA','APROVADO','509.38','226.18','46.79','531.07',CONVERT(DATETIME, '2023-04-27 05:00:46', 121)),
        (2,3,1,'COMPRA','APROVADO','873.71','374.65','27.37','581.96',CONVERT(DATETIME, '2022-02-11 15:34:05', 121)),
        (2,4,2,'COMPRA','APROVADO','966.41','211.68','48.72','774.68',CONVERT(DATETIME, '2022-04-18 22:02:10', 121)),
        (2,4,2,'COMPRA','RECUSADO','917.83','156.84','53.17','732.34',CONVERT(DATETIME, '2024-06-02 10:32:04', 121)),
        (3,4,3,'COMPRA','APROVADO','644.35','238.13','54.77','457.30',CONVERT(DATETIME, '2023-01-26 11:22:40', 121)),
        (2,2,3,'COMPRA','APROVADO','914.56','356.13','67.87','817.08',CONVERT(DATETIME, '2022-05-29 08:13:27', 121)),
        (2,3,4,'COMPRA','APROVADO','573.66','286.47','59.01','553.26',CONVERT(DATETIME, '2023-11-30 17:33:31', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,4,'COMPRA','APROVADO','736.25','208.08','57.10','875.75',CONVERT(DATETIME, '2023-06-24 09:13:05', 121)),
        (1,3,10,'COMPRA','APROVADO','737.13','396.67','52.79','708.21',CONVERT(DATETIME, '2023-11-06 01:58:07', 121)),
        (2,4,10,'COMPRA','RECUSADO','759.45','238.78','74.17','784.62',CONVERT(DATETIME, '2024-04-03 16:18:26', 121)),
        (4,2,11,'COMPRA','APROVADO','582.31','398.61','27.66','545.58',CONVERT(DATETIME, '2023-05-05 10:01:23', 121)),
        (1,3,11,'COMPRA','APROVADO','583.75','348.32','33.07','480.12',CONVERT(DATETIME, '2022-06-07 17:31:01', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,3,12,'COMPRA','APROVADO','603.73','303.22','57.72','622.79',CONVERT(DATETIME, '2022-02-22 06:38:00', 121)),
        (2,2,12,'COMPRA','APROVADO','583.45','186.59','52.40','700.03',CONVERT(DATETIME, '2024-06-22 22:34:55', 121)),
        (2,1,1,'COMPRA','APROVADO','532.39','459.27','74.67','520.92',CONVERT(DATETIME, '2022-02-10 10:35:22', 121)),
        (4,4,1,'COMPRA','RECUSADO','873.03','465.75','64.49','847.63',CONVERT(DATETIME, '2023-04-27 11:59:34', 121)),
        (3,4,2,'COMPRA','APROVADO','739.19','224.84','55.72','626.96',CONVERT(DATETIME, '2022-03-17 21:00:36', 121)),
        (4,3,2,'COMPRA','APROVADO','571.59','382.39','30.13','779.91',CONVERT(DATETIME, '2024-05-11 06:55:13', 121)),
        (4,1,3,'COMPRA','APROVADO','713.03','368.31','63.52','401.84',CONVERT(DATETIME, '2022-01-29 23:28:32', 121)),
        (3,1,3,'COMPRA','APROVADO','592.55','469.73','31.05','790.36',CONVERT(DATETIME, '2023-02-20 01:01:27', 121)),
        (4,3,4,'COMPRA','APROVADO','714.08','353.33','44.88','830.42',CONVERT(DATETIME, '2023-07-21 20:56:56', 121)),
        (2,4,4,'COMPRA','RECUSADO','762.29','451.37','42.56','497.24',CONVERT(DATETIME, '2022-02-18 08:43:51', 121)),
        (3,2,10,'COMPRA','APROVADO','997.57','110.28','72.81','655.40',CONVERT(DATETIME, '2024-06-17 10:09:47', 121)),
        (3,1,10,'COMPRA','APROVADO','910.35','321.19','74.98','577.20',CONVERT(DATETIME, '2023-05-31 04:53:57', 121)),
        (3,3,11,'COMPRA','APROVADO','539.67','286.52','27.02','874.38',CONVERT(DATETIME, '2022-04-08 17:50:44', 121)),
        (3,3,11,'COMPRA','APROVADO','644.40','113.41','71.44','653.98',CONVERT(DATETIME, '2023-08-30 14:34:44', 121)),
        (3,3,12,'COMPRA','APROVADO','804.79','283.69','38.80','779.63',CONVERT(DATETIME, '2024-01-07 10:27:03', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,3,12,'COMPRA','RECUSADO','572.20','156.86','54.43','726.36',CONVERT(DATETIME, '2022-07-16 20:06:36', 121)),
        (3,3,1,'COMPRA','APROVADO','992.62','249.41','64.55','699.10',CONVERT(DATETIME, '2022-06-12 10:49:53', 121)),
        (3,2,1,'COMPRA','APROVADO','798.20','361.59','31.28','605.51',CONVERT(DATETIME, '2022-08-17 19:16:41', 121)),
        (3,2,2,'COMPRA','APROVADO','649.30','447.47','25.03','558.73',CONVERT(DATETIME, '2022-04-03 13:56:06', 121)),
        (2,4,2,'COMPRA','APROVADO','758.97','312.88','45.13','421.80',CONVERT(DATETIME, '2023-08-17 18:41:45', 121)),
        (2,1,3,'COMPRA','APROVADO','940.22','410.00','39.07','734.68',CONVERT(DATETIME, '2023-06-25 13:02:35', 121)),
        (3,3,3,'COMPRA','RECUSADO','815.42','421.05','64.38','749.25',CONVERT(DATETIME, '2023-05-23 02:10:55', 121)),
        (4,2,4,'COMPRA','APROVADO','756.81','137.49','67.59','852.88',CONVERT(DATETIME, '2022-12-05 04:00:40', 121)),
        (2,4,4,'COMPRA','APROVADO','598.57','253.74','58.74','860.86',CONVERT(DATETIME, '2022-05-21 12:31:13', 121)),
        (2,1,10,'COMPRA','APROVADO','766.36','104.55','47.80','818.89',CONVERT(DATETIME, '2023-02-04 08:11:37', 121)),
        (2,4,10,'COMPRA','APROVADO','992.05','176.77','61.79','781.37',CONVERT(DATETIME, '2022-06-19 09:07:34', 121)),
        (1,2,11,'COMPRA','APROVADO','641.38','296.28','68.40','848.41',CONVERT(DATETIME, '2022-07-26 07:10:45', 121)),
        (2,2,11,'COMPRA','RECUSADO','651.24','412.45','63.31','660.02',CONVERT(DATETIME, '2024-01-31 22:28:28', 121)),
        (3,2,12,'COMPRA','APROVADO','856.26','353.46','57.26','768.97',CONVERT(DATETIME, '2022-09-29 12:36:17', 121)),
        (3,2,12,'COMPRA','APROVADO','679.48','393.25','53.88','758.60',CONVERT(DATETIME, '2023-03-29 00:22:18', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,2,1,'COMPRA','APROVADO','972.19','422.71','60.79','788.73',CONVERT(DATETIME, '2023-04-24 09:21:06', 121)),
        (2,3,1,'COMPRA','APROVADO','537.48','233.46','60.89','615.94',CONVERT(DATETIME, '2022-10-28 16:55:55', 121)),
        (3,3,2,'COMPRA','APROVADO','709.31','128.18','55.81','523.55',CONVERT(DATETIME, '2023-05-01 12:28:14', 121)),
        (1,2,2,'COMPRA','RECUSADO','767.30','438.46','34.51','412.11',CONVERT(DATETIME, '2022-05-20 19:17:50', 121)),
        (2,1,3,'COMPRA','APROVADO','847.23','206.06','62.71','867.34',CONVERT(DATETIME, '2023-07-03 02:30:38', 121)),
        (1,4,3,'COMPRA','APROVADO','504.93','118.72','40.76','872.71',CONVERT(DATETIME, '2023-09-05 23:20:59', 121)),
        (2,3,4,'COMPRA','APROVADO','977.15','186.82','65.51','543.37',CONVERT(DATETIME, '2022-08-20 13:24:09', 121)),
        (4,3,4,'COMPRA','APROVADO','688.55','123.06','46.17','578.15',CONVERT(DATETIME, '2023-07-22 11:02:54', 121)),
        (4,3,10,'COMPRA','APROVADO','665.37','245.16','41.27','426.43',CONVERT(DATETIME, '2022-08-06 13:28:25', 121)),
        (1,1,10,'COMPRA','RECUSADO','854.16','202.19','70.05','508.22',CONVERT(DATETIME, '2024-03-18 00:19:25', 121)),
        (3,1,11,'COMPRA','APROVADO','717.39','382.22','60.37','642.95',CONVERT(DATETIME, '2023-04-05 05:39:31', 121)),
        (1,2,11,'COMPRA','APROVADO','905.15','418.20','69.61','891.92',CONVERT(DATETIME, '2022-09-25 21:36:55', 121)),
        (3,3,12,'COMPRA','APROVADO','697.46','354.00','40.09','531.73',CONVERT(DATETIME, '2022-01-28 00:14:46', 121)),
        (3,2,12,'COMPRA','APROVADO','922.49','432.14','27.82','635.00',CONVERT(DATETIME, '2022-02-02 05:52:13', 121)),
        (1,2,1,'COMPRA','APROVADO','646.31','194.80','62.23','567.59',CONVERT(DATETIME, '2023-10-02 12:48:54', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,1,1,'COMPRA','RECUSADO','598.26','165.94','54.24','634.87',CONVERT(DATETIME, '2022-05-23 02:09:02', 121)),
        (3,2,2,'COMPRA','APROVADO','626.73','449.32','25.37','561.05',CONVERT(DATETIME, '2022-07-07 17:13:43', 121)),
        (4,2,2,'COMPRA','APROVADO','925.72','205.46','30.08','496.93',CONVERT(DATETIME, '2023-02-19 13:53:41', 121)),
        (4,1,3,'COMPRA','APROVADO','669.70','486.02','34.52','521.26',CONVERT(DATETIME, '2024-06-29 15:29:05', 121)),
        (1,2,3,'COMPRA','APROVADO','923.17','217.27','60.88','784.40',CONVERT(DATETIME, '2022-10-06 20:55:58', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,1,4,'COMPRA','APROVADO','924.79','311.31','34.49','874.37',CONVERT(DATETIME, '2022-01-20 17:27:59', 121)),
        (3,3,4,'COMPRA','RECUSADO','583.38','197.75','74.60','529.87',CONVERT(DATETIME, '2023-01-08 03:11:09', 121)),
        (2,2,10,'COMPRA','APROVADO','659.66','322.58','39.26','793.69',CONVERT(DATETIME, '2022-12-03 15:08:46', 121)),
        (3,3,10,'COMPRA','APROVADO','764.92','107.45','40.33','791.60',CONVERT(DATETIME, '2023-04-07 12:18:19', 121)),
        (2,3,11,'COMPRA','APROVADO','776.66','181.84','61.12','420.13',CONVERT(DATETIME, '2022-12-08 08:09:17', 121)),
        (4,1,11,'COMPRA','APROVADO','541.85','461.60','49.40','451.28',CONVERT(DATETIME, '2022-12-20 22:59:32', 121)),
        (1,2,12,'COMPRA','APROVADO','879.25','327.44','30.10','474.30',CONVERT(DATETIME, '2022-02-28 14:30:04', 121)),
        (1,2,12,'COMPRA','RECUSADO','701.40','216.44','72.04','535.05',CONVERT(DATETIME, '2023-10-17 00:33:36', 121)),
        (3,2,1,'COMPRA','APROVADO','785.96','230.26','36.31','652.66',CONVERT(DATETIME, '2022-07-20 20:53:48', 121)),
        (3,2,1,'COMPRA','APROVADO','702.22','197.86','64.27','611.14',CONVERT(DATETIME, '2024-03-17 15:54:57', 121)),
        (2,2,2,'COMPRA','APROVADO','761.03','349.36','50.54','485.02',CONVERT(DATETIME, '2024-03-01 22:31:48', 121)),
        (2,2,2,'COMPRA','APROVADO','862.00','482.61','55.17','818.40',CONVERT(DATETIME, '2023-12-23 08:19:59', 121)),
        (3,2,3,'COMPRA','APROVADO','983.46','471.99','42.91','403.17',CONVERT(DATETIME, '2023-11-04 16:24:20', 121)),
        (4,2,3,'COMPRA','RECUSADO','553.89','423.90','56.56','770.81',CONVERT(DATETIME, '2024-06-17 12:13:30', 121)),
        (3,2,4,'COMPRA','APROVADO','947.49','367.01','69.85','631.70',CONVERT(DATETIME, '2022-09-06 14:36:56', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,1,4,'COMPRA','APROVADO','560.49','304.70','47.39','523.91',CONVERT(DATETIME, '2023-04-01 13:03:48', 121)),
        (2,1,10,'COMPRA','APROVADO','852.49','423.47','54.96','690.23',CONVERT(DATETIME, '2022-08-17 00:01:17', 121)),
        (3,3,10,'COMPRA','APROVADO','658.78','211.91','41.61','512.59',CONVERT(DATETIME, '2023-04-01 04:48:18', 121)),
        (1,2,11,'COMPRA','APROVADO','859.21','117.16','61.59','508.18',CONVERT(DATETIME, '2024-04-01 10:40:02', 121)),
        (2,4,11,'COMPRA','RECUSADO','656.10','345.69','60.78','683.93',CONVERT(DATETIME, '2022-12-19 10:28:19', 121)),
        (1,3,12,'COMPRA','APROVADO','546.05','221.26','33.49','538.35',CONVERT(DATETIME, '2023-03-15 22:10:41', 121)),
        (3,3,12,'COMPRA','APROVADO','545.47','475.13','71.09','660.34',CONVERT(DATETIME, '2022-10-16 23:00:08', 121)),
        (3,3,1,'COMPRA','APROVADO','847.46','330.18','52.46','627.48',CONVERT(DATETIME, '2024-02-09 00:02:38', 121)),
        (1,3,1,'COMPRA','APROVADO','929.44','151.33','66.05','470.12',CONVERT(DATETIME, '2022-12-22 09:19:54', 121)),
        (1,1,2,'COMPRA','APROVADO','850.42','290.93','42.83','742.63',CONVERT(DATETIME, '2023-03-28 09:03:50', 121)),
        (1,4,2,'COMPRA','RECUSADO','577.41','495.46','69.69','823.77',CONVERT(DATETIME, '2022-12-05 20:24:28', 121)),
        (3,3,3,'COMPRA','APROVADO','696.42','288.87','71.45','402.27',CONVERT(DATETIME, '2024-03-08 07:52:47', 121)),
        (3,3,3,'COMPRA','APROVADO','783.75','282.70','40.83','425.71',CONVERT(DATETIME, '2023-09-24 00:24:54', 121)),
        (4,2,4,'COMPRA','APROVADO','778.24','216.41','26.58','405.25',CONVERT(DATETIME, '2022-08-11 12:48:40', 121)),
        (3,2,4,'COMPRA','APROVADO','603.70','119.01','61.65','508.06',CONVERT(DATETIME, '2023-04-27 06:06:32', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,2,10,'COMPRA','APROVADO','952.92','359.10','42.20','684.70',CONVERT(DATETIME, '2022-06-02 04:32:23', 121)),
        (3,3,10,'COMPRA','RECUSADO','639.66','466.80','37.96','590.70',CONVERT(DATETIME, '2022-10-04 10:03:36', 121)),
        (3,2,11,'COMPRA','APROVADO','514.35','268.76','47.07','583.39',CONVERT(DATETIME, '2024-06-08 10:59:44', 121)),
        (3,3,11,'COMPRA','APROVADO','970.85','330.86','66.84','839.86',CONVERT(DATETIME, '2023-04-20 01:05:40', 121)),
        (3,4,12,'COMPRA','APROVADO','640.37','376.95','42.85','844.71',CONVERT(DATETIME, '2022-07-20 21:43:19', 121)),
        (3,1,12,'COMPRA','APROVADO','740.73','356.88','31.81','669.58',CONVERT(DATETIME, '2022-04-30 22:55:25', 121)),
        (3,4,1,'COMPRA','APROVADO','946.33','430.42','57.34','403.64',CONVERT(DATETIME, '2023-06-01 19:45:49', 121)),
        (4,2,1,'COMPRA','RECUSADO','706.86','230.14','60.36','654.98',CONVERT(DATETIME, '2022-10-21 10:54:04', 121)),
        (3,4,2,'COMPRA','APROVADO','896.77','257.83','62.07','559.51',CONVERT(DATETIME, '2022-01-22 11:09:21', 121)),
        (3,4,2,'COMPRA','APROVADO','999.68','448.35','38.66','498.18',CONVERT(DATETIME, '2022-02-14 17:27:44', 121)),
        (3,2,3,'COMPRA','APROVADO','918.42','337.44','59.50','565.87',CONVERT(DATETIME, '2022-11-25 04:24:58', 121)),
        (3,1,3,'COMPRA','APROVADO','966.08','154.52','42.35','576.52',CONVERT(DATETIME, '2023-04-09 20:42:56', 121)),
        (1,1,4,'COMPRA','APROVADO','528.59','444.97','37.00','476.97',CONVERT(DATETIME, '2023-09-29 22:35:40', 121)),
        (2,2,4,'COMPRA','RECUSADO','725.90','390.28','41.53','770.07',CONVERT(DATETIME, '2024-06-24 03:23:44', 121)),
        (2,3,10,'COMPRA','APROVADO','536.85','326.81','74.57','603.26',CONVERT(DATETIME, '2022-05-28 07:41:31', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,3,10,'COMPRA','APROVADO','781.50','177.70','42.45','666.98',CONVERT(DATETIME, '2023-04-01 03:16:24', 121)),
        (4,2,11,'COMPRA','APROVADO','568.21','373.52','66.57','805.91',CONVERT(DATETIME, '2024-03-09 10:42:05', 121)),
        (3,3,11,'COMPRA','APROVADO','848.02','254.66','38.29','869.70',CONVERT(DATETIME, '2022-10-13 01:30:56', 121)),
        (1,3,12,'COMPRA','APROVADO','673.56','264.94','63.08','592.50',CONVERT(DATETIME, '2023-01-01 01:50:33', 121)),
        (2,3,12,'COMPRA','RECUSADO','598.99','290.11','40.08','629.65',CONVERT(DATETIME, '2023-11-04 07:58:06', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,3,1,'COMPRA','APROVADO','968.58','230.13','28.61','442.70',CONVERT(DATETIME, '2024-06-20 16:02:10', 121)),
        (2,3,1,'COMPRA','APROVADO','619.32','207.15','37.45','649.11',CONVERT(DATETIME, '2022-02-22 11:29:45', 121)),
        (3,1,2,'COMPRA','APROVADO','726.05','339.65','71.27','765.76',CONVERT(DATETIME, '2023-02-18 19:33:42', 121)),
        (1,3,2,'COMPRA','APROVADO','576.35','202.51','71.67','545.99',CONVERT(DATETIME, '2023-08-07 13:21:49', 121)),
        (3,2,3,'COMPRA','APROVADO','618.52','315.68','63.81','656.59',CONVERT(DATETIME, '2022-04-21 22:35:27', 121)),
        (3,4,3,'COMPRA','RECUSADO','976.73','403.37','53.52','877.16',CONVERT(DATETIME, '2024-02-20 15:40:09', 121)),
        (3,1,4,'COMPRA','APROVADO','976.18','127.64','57.39','542.38',CONVERT(DATETIME, '2022-03-19 12:21:14', 121)),
        (2,1,4,'COMPRA','APROVADO','927.57','252.30','44.43','741.06',CONVERT(DATETIME, '2024-06-01 21:19:34', 121)),
        (3,4,10,'COMPRA','APROVADO','803.41','153.04','58.08','475.04',CONVERT(DATETIME, '2023-07-04 10:02:36', 121)),
        (1,4,10,'COMPRA','APROVADO','691.79','489.22','28.38','633.58',CONVERT(DATETIME, '2024-02-26 12:43:59', 121)),
        (2,2,11,'COMPRA','APROVADO','655.58','407.72','67.87','643.56',CONVERT(DATETIME, '2022-03-09 08:23:02', 121)),
        (2,3,11,'COMPRA','RECUSADO','729.99','269.33','63.55','707.41',CONVERT(DATETIME, '2022-05-14 08:57:54', 121)),
        (4,1,12,'COMPRA','APROVADO','590.10','368.38','35.37','538.95',CONVERT(DATETIME, '2024-05-27 06:09:36', 121)),
        (2,2,12,'COMPRA','APROVADO','637.79','250.33','44.37','598.45',CONVERT(DATETIME, '2022-07-01 05:56:45', 121)),
        (4,3,1,'COMPRA','APROVADO','721.61','408.68','71.73','571.65',CONVERT(DATETIME, '2024-01-08 14:51:53', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,1,1,'COMPRA','APROVADO','989.63','112.82','46.37','784.93',CONVERT(DATETIME, '2024-01-21 07:02:57', 121)),
        (3,3,2,'COMPRA','APROVADO','705.34','226.24','42.03','747.71',CONVERT(DATETIME, '2022-08-13 19:59:26', 121)),
        (2,3,2,'COMPRA','RECUSADO','768.55','128.31','42.80','804.09',CONVERT(DATETIME, '2022-03-06 15:05:44', 121)),
        (2,2,3,'COMPRA','APROVADO','659.93','418.31','34.63','739.57',CONVERT(DATETIME, '2022-01-28 15:52:39', 121)),
        (3,1,3,'COMPRA','APROVADO','908.86','367.15','67.13','722.59',CONVERT(DATETIME, '2024-05-28 18:59:57', 121)),
        (1,2,4,'COMPRA','APROVADO','858.05','197.29','64.13','676.40',CONVERT(DATETIME, '2023-03-18 10:05:46', 121)),
        (3,3,4,'COMPRA','APROVADO','869.03','156.11','36.07','460.02',CONVERT(DATETIME, '2023-10-10 22:22:25', 121)),
        (2,3,10,'COMPRA','APROVADO','629.35','421.76','33.34','491.23',CONVERT(DATETIME, '2023-12-03 15:34:32', 121)),
        (4,2,10,'COMPRA','RECUSADO','787.94','487.13','63.15','854.67',CONVERT(DATETIME, '2023-01-18 20:24:19', 121)),
        (3,2,11,'COMPRA','APROVADO','530.36','147.41','73.59','776.51',CONVERT(DATETIME, '2022-10-15 04:25:17', 121)),
        (3,2,11,'COMPRA','APROVADO','921.78','282.21','29.66','831.01',CONVERT(DATETIME, '2023-03-21 04:53:32', 121)),
        (2,3,12,'COMPRA','APROVADO','643.51','395.34','45.73','722.24',CONVERT(DATETIME, '2024-05-09 20:13:59', 121)),
        (3,4,12,'COMPRA','APROVADO','918.17','152.49','49.03','631.54',CONVERT(DATETIME, '2024-02-02 04:38:23', 121)),
        (3,3,1,'COMPRA','APROVADO','963.81','301.42','72.95','801.31',CONVERT(DATETIME, '2022-12-30 22:05:08', 121)),
        (3,2,1,'COMPRA','RECUSADO','786.32','273.26','36.29','608.33',CONVERT(DATETIME, '2023-01-16 16:32:53', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,1,2,'COMPRA','APROVADO','995.98','216.36','57.91','403.60',CONVERT(DATETIME, '2024-02-15 22:13:38', 121)),
        (1,1,2,'COMPRA','APROVADO','985.40','424.70','38.15','860.04',CONVERT(DATETIME, '2023-02-21 10:48:42', 121)),
        (3,3,3,'COMPRA','APROVADO','564.33','103.61','50.08','627.22',CONVERT(DATETIME, '2023-03-10 17:12:45', 121)),
        (3,3,3,'COMPRA','APROVADO','672.14','145.83','39.89','836.54',CONVERT(DATETIME, '2022-04-24 05:00:00', 121)),
        (3,2,4,'COMPRA','APROVADO','582.84','174.64','66.03','426.75',CONVERT(DATETIME, '2022-02-13 20:09:24', 121)),
        (2,4,4,'COMPRA','RECUSADO','799.83','137.59','43.44','500.72',CONVERT(DATETIME, '2023-04-08 12:08:19', 121)),
        (1,3,10,'COMPRA','APROVADO','542.45','136.20','59.97','448.84',CONVERT(DATETIME, '2023-10-08 23:55:31', 121)),
        (3,4,10,'COMPRA','APROVADO','622.83','199.03','29.57','440.32',CONVERT(DATETIME, '2022-09-19 00:36:57', 121)),
        (2,3,11,'COMPRA','APROVADO','967.39','233.12','29.92','728.36',CONVERT(DATETIME, '2023-12-18 11:18:43', 121)),
        (3,4,11,'COMPRA','APROVADO','567.18','118.95','58.56','600.02',CONVERT(DATETIME, '2023-10-04 16:40:41', 121)),
        (2,3,12,'COMPRA','APROVADO','645.62','152.31','30.77','672.58',CONVERT(DATETIME, '2023-12-13 19:40:54', 121)),
        (4,1,12,'COMPRA','RECUSADO','781.11','317.36','70.72','495.09',CONVERT(DATETIME, '2022-04-18 00:14:09', 121)),
        (3,3,1,'COMPRA','APROVADO','818.49','374.32','72.29','688.86',CONVERT(DATETIME, '2022-06-18 16:59:28', 121)),
        (3,2,1,'COMPRA','APROVADO','543.23','239.81','54.19','569.46',CONVERT(DATETIME, '2022-04-09 13:36:14', 121)),
        (3,2,2,'COMPRA','APROVADO','841.14','411.26','57.90','834.59',CONVERT(DATETIME, '2022-05-12 12:05:28', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,1,2,'COMPRA','APROVADO','761.98','156.97','48.94','462.62',CONVERT(DATETIME, '2023-06-12 14:23:18', 121)),
        (3,4,3,'COMPRA','APROVADO','955.60','356.80','48.38','406.11',CONVERT(DATETIME, '2022-11-18 19:56:46', 121)),
        (3,2,3,'COMPRA','RECUSADO','674.15','141.61','38.95','700.47',CONVERT(DATETIME, '2024-01-01 09:40:39', 121)),
        (2,4,4,'COMPRA','APROVADO','930.35','195.27','44.72','826.42',CONVERT(DATETIME, '2022-04-21 20:45:19', 121)),
        (3,3,4,'COMPRA','APROVADO','703.69','288.88','39.68','617.53',CONVERT(DATETIME, '2022-03-12 08:02:15', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,2,10,'COMPRA','APROVADO','501.92','266.80','73.24','860.72',CONVERT(DATETIME, '2024-03-02 16:21:45', 121)),
        (1,3,10,'COMPRA','APROVADO','550.94','306.05','41.68','675.26',CONVERT(DATETIME, '2022-05-13 09:44:12', 121)),
        (2,3,11,'COMPRA','APROVADO','813.87','193.60','35.90','611.84',CONVERT(DATETIME, '2022-05-12 15:41:52', 121)),
        (4,1,11,'COMPRA','RECUSADO','871.62','132.30','45.19','576.50',CONVERT(DATETIME, '2022-06-18 21:20:12', 121)),
        (2,1,12,'COMPRA','APROVADO','725.45','277.21','27.93','599.67',CONVERT(DATETIME, '2022-02-06 13:08:05', 121)),
        (3,2,12,'COMPRA','APROVADO','791.95','407.39','26.28','511.99',CONVERT(DATETIME, '2024-02-18 02:20:23', 121)),
        (3,3,1,'COMPRA','APROVADO','737.19','479.78','25.12','816.29',CONVERT(DATETIME, '2022-08-04 19:54:25', 121)),
        (2,3,1,'COMPRA','APROVADO','876.61','412.05','71.16','635.86',CONVERT(DATETIME, '2024-03-21 15:07:44', 121)),
        (2,3,2,'COMPRA','APROVADO','520.23','358.14','26.15','480.93',CONVERT(DATETIME, '2022-03-30 16:27:00', 121)),
        (3,1,2,'COMPRA','RECUSADO','531.46','256.01','43.51','492.23',CONVERT(DATETIME, '2024-04-14 08:43:57', 121)),
        (1,3,3,'COMPRA','APROVADO','972.32','365.51','67.42','852.23',CONVERT(DATETIME, '2022-04-11 13:16:46', 121)),
        (3,2,3,'COMPRA','APROVADO','779.19','324.95','67.05','760.73',CONVERT(DATETIME, '2022-03-01 03:58:32', 121)),
        (3,4,4,'COMPRA','APROVADO','720.83','299.47','69.99','500.26',CONVERT(DATETIME, '2022-08-05 14:56:04', 121)),
        (4,2,4,'COMPRA','APROVADO','779.77','217.21','25.22','645.02',CONVERT(DATETIME, '2023-05-10 01:23:10', 121)),
        (3,2,10,'COMPRA','APROVADO','771.40','226.35','42.26','526.71',CONVERT(DATETIME, '2024-05-24 04:43:44', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (1,2,10,'COMPRA','RECUSADO','823.32','414.12','65.11','855.48',CONVERT(DATETIME, '2023-09-12 15:03:39', 121)),
        (3,2,11,'COMPRA','APROVADO','783.27','224.97','41.42','727.43',CONVERT(DATETIME, '2023-05-30 15:15:21', 121)),
        (1,3,11,'COMPRA','APROVADO','901.06','145.04','25.20','617.41',CONVERT(DATETIME, '2022-04-09 16:21:04', 121)),
        (3,3,12,'COMPRA','APROVADO','679.67','204.41','51.70','670.70',CONVERT(DATETIME, '2022-07-15 02:15:00', 121)),
        (3,4,12,'COMPRA','APROVADO','579.54','226.21','54.34','468.04',CONVERT(DATETIME, '2022-02-03 13:32:25', 121)),
        (2,3,1,'COMPRA','APROVADO','828.35','163.28','28.21','658.23',CONVERT(DATETIME, '2022-02-13 08:23:31', 121)),
        (3,2,1,'COMPRA','RECUSADO','734.47','202.32','64.70','531.04',CONVERT(DATETIME, '2023-01-05 14:37:09', 121)),
        (2,3,2,'COMPRA','APROVADO','781.23','274.82','52.46','430.12',CONVERT(DATETIME, '2024-01-03 09:25:23', 121)),
        (3,2,2,'COMPRA','APROVADO','674.23','152.25','38.40','508.55',CONVERT(DATETIME, '2023-01-04 09:22:26', 121)),
        (1,3,3,'COMPRA','APROVADO','735.57','416.66','65.89','410.48',CONVERT(DATETIME, '2023-12-06 17:29:00', 121)),
        (3,1,3,'COMPRA','APROVADO','721.19','283.53','53.69','716.69',CONVERT(DATETIME, '2022-01-07 22:13:20', 121)),
        (2,1,4,'COMPRA','APROVADO','851.07','429.73','29.09','410.82',CONVERT(DATETIME, '2022-07-19 11:36:50', 121)),
        (3,2,4,'COMPRA','RECUSADO','872.58','201.19','65.51','795.81',CONVERT(DATETIME, '2022-06-08 11:05:39', 121)),
        (3,2,10,'COMPRA','APROVADO','958.84','124.91','37.47','753.37',CONVERT(DATETIME, '2024-02-19 23:09:22', 121)),
        (3,2,10,'COMPRA','APROVADO','549.24','241.01','74.94','803.54',CONVERT(DATETIME, '2022-03-03 05:31:32', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,1,11,'COMPRA','APROVADO','687.82','228.82','60.07','821.87',CONVERT(DATETIME, '2022-09-27 01:52:48', 121)),
        (2,2,11,'COMPRA','APROVADO','758.01','162.13','46.03','629.44',CONVERT(DATETIME, '2022-12-26 08:09:11', 121)),
        (4,1,12,'COMPRA','APROVADO','664.04','135.18','27.75','611.69',CONVERT(DATETIME, '2024-02-27 21:03:48', 121)),
        (4,2,12,'COMPRA','RECUSADO','733.66','333.39','34.38','725.49',CONVERT(DATETIME, '2023-07-27 01:24:17', 121)),
        (3,3,1,'COMPRA','APROVADO','967.60','403.59','72.39','857.05',CONVERT(DATETIME, '2022-02-13 12:02:57', 121)),
        (2,2,1,'COMPRA','APROVADO','690.59','360.22','64.00','856.40',CONVERT(DATETIME, '2024-05-30 12:22:18', 121)),
        (1,3,2,'COMPRA','APROVADO','977.10','138.23','41.03','684.70',CONVERT(DATETIME, '2022-08-06 21:50:43', 121)),
        (1,3,2,'COMPRA','APROVADO','687.76','477.44','39.97','571.49',CONVERT(DATETIME, '2022-02-05 03:44:18', 121)),
        (3,4,3,'COMPRA','APROVADO','849.94','107.49','42.99','533.33',CONVERT(DATETIME, '2022-05-01 20:27:13', 121)),
        (4,1,3,'COMPRA','RECUSADO','978.12','187.48','72.48','844.49',CONVERT(DATETIME, '2024-01-03 21:32:56', 121)),
        (2,3,4,'COMPRA','APROVADO','547.78','394.50','36.46','667.82',CONVERT(DATETIME, '2023-02-15 18:12:47', 121)),
        (2,2,4,'COMPRA','APROVADO','817.68','309.18','56.25','780.69',CONVERT(DATETIME, '2024-04-13 04:33:20', 121)),
        (2,4,10,'COMPRA','APROVADO','807.66','497.82','31.06','693.96',CONVERT(DATETIME, '2023-06-14 19:03:15', 121)),
        (3,2,10,'COMPRA','APROVADO','675.57','380.43','25.09','760.95',CONVERT(DATETIME, '2024-04-05 22:32:44', 121)),
        (3,3,11,'COMPRA','APROVADO','914.86','492.94','68.01','735.63',CONVERT(DATETIME, '2024-06-05 17:02:17', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,3,11,'COMPRA','RECUSADO','659.80','415.61','41.89','408.92',CONVERT(DATETIME, '2022-12-07 19:06:14', 121)),
        (3,2,12,'COMPRA','APROVADO','940.58','140.28','62.73','453.43',CONVERT(DATETIME, '2024-05-22 16:23:36', 121)),
        (3,1,12,'COMPRA','APROVADO','851.97','166.54','72.91','452.59',CONVERT(DATETIME, '2022-06-10 13:35:38', 121)),
        (4,3,1,'COMPRA','APROVADO','657.50','315.16','65.63','712.69',CONVERT(DATETIME, '2022-01-10 00:09:41', 121)),
        (4,4,1,'COMPRA','APROVADO','609.00','387.48','47.40','791.97',CONVERT(DATETIME, '2022-10-22 12:58:04', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (4,3,2,'COMPRA','APROVADO','548.45','497.96','61.01','445.79',CONVERT(DATETIME, '2024-04-07 14:08:41', 121)),
        (3,2,2,'COMPRA','RECUSADO','987.52','162.21','58.33','751.25',CONVERT(DATETIME, '2022-05-01 23:09:47', 121)),
        (2,1,3,'COMPRA','APROVADO','752.41','261.27','49.77','559.75',CONVERT(DATETIME, '2022-04-07 19:21:31', 121)),
        (3,1,3,'COMPRA','APROVADO','717.67','428.23','72.57','466.12',CONVERT(DATETIME, '2023-08-12 18:59:56', 121)),
        (2,1,4,'COMPRA','APROVADO','653.76','417.77','39.06','622.43',CONVERT(DATETIME, '2022-10-14 09:13:59', 121)),
        (2,2,4,'COMPRA','APROVADO','858.28','409.70','41.20','410.02',CONVERT(DATETIME, '2023-07-21 14:03:23', 121)),
        (3,2,10,'COMPRA','APROVADO','647.46','451.43','34.75','851.14',CONVERT(DATETIME, '2023-10-22 12:39:51', 121)),
        (2,2,10,'COMPRA','RECUSADO','711.29','276.19','27.24','773.74',CONVERT(DATETIME, '2022-07-24 22:23:05', 121)),
        (3,2,11,'COMPRA','APROVADO','741.61','353.97','66.19','601.25',CONVERT(DATETIME, '2022-01-24 00:44:50', 121)),
        (4,4,11,'COMPRA','APROVADO','772.74','385.29','67.78','877.33',CONVERT(DATETIME, '2022-10-23 17:57:55', 121)),
        (4,1,12,'COMPRA','APROVADO','774.42','388.93','73.34','475.18',CONVERT(DATETIME, '2023-08-21 22:44:31', 121)),
        (3,1,12,'COMPRA','APROVADO','980.64','316.09','68.93','812.85',CONVERT(DATETIME, '2022-07-02 01:25:04', 121)),
        (4,4,1,'COMPRA','APROVADO','987.35','214.03','71.92','572.22',CONVERT(DATETIME, '2023-08-10 12:27:51', 121)),
        (3,2,1,'COMPRA','RECUSADO','744.56','435.32','54.83','562.76',CONVERT(DATETIME, '2022-05-19 10:25:10', 121)),
        (4,1,2,'COMPRA','APROVADO','731.00','232.02','27.25','725.34',CONVERT(DATETIME, '2024-04-26 18:04:23', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,2,2,'COMPRA','APROVADO','976.26','187.44','42.08','420.13',CONVERT(DATETIME, '2022-04-25 01:34:09', 121)),
        (1,4,3,'COMPRA','APROVADO','845.07','435.31','57.34','845.30',CONVERT(DATETIME, '2023-01-25 12:31:03', 121)),
        (2,4,3,'COMPRA','APROVADO','755.16','303.90','55.23','461.66',CONVERT(DATETIME, '2023-03-30 19:23:16', 121)),
        (2,3,4,'COMPRA','APROVADO','660.16','401.59','43.71','577.88',CONVERT(DATETIME, '2022-05-05 20:49:12', 121)),
        (3,1,4,'COMPRA','RECUSADO','770.47','292.06','60.91','535.14',CONVERT(DATETIME, '2024-06-08 02:42:54', 121)),
        (4,1,10,'COMPRA','APROVADO','932.03','246.60','63.87','751.00',CONVERT(DATETIME, '2023-11-23 13:08:13', 121)),
        (1,3,10,'COMPRA','APROVADO','759.06','131.77','61.12','883.74',CONVERT(DATETIME, '2023-03-10 22:22:18', 121)),
        (3,2,11,'COMPRA','APROVADO','785.10','497.16','53.29','797.55',CONVERT(DATETIME, '2023-02-08 21:26:52', 121)),
        (3,3,11,'COMPRA','APROVADO','843.97','229.96','33.94','639.59',CONVERT(DATETIME, '2023-02-27 23:40:08', 121)),
        (3,4,12,'COMPRA','APROVADO','958.80','286.32','41.68','681.57',CONVERT(DATETIME, '2024-02-09 18:20:35', 121)),
        (2,3,12,'COMPRA','RECUSADO','973.24','448.84','46.74','557.13',CONVERT(DATETIME, '2022-05-03 05:36:20', 121)),
        (3,3,1,'COMPRA','APROVADO','522.03','271.43','63.58','532.98',CONVERT(DATETIME, '2022-06-24 18:27:59', 121)),
        (4,3,1,'COMPRA','APROVADO','878.87','402.65','62.51','786.60',CONVERT(DATETIME, '2022-04-17 20:07:29', 121)),
        (2,2,2,'COMPRA','APROVADO','759.94','197.36','44.75','863.25',CONVERT(DATETIME, '2024-03-26 01:23:46', 121)),
        (2,2,2,'COMPRA','APROVADO','603.73','218.53','47.86','584.30',CONVERT(DATETIME, '2023-07-31 13:25:57', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (2,2,3,'COMPRA','APROVADO','562.12','319.98','42.73','422.87',CONVERT(DATETIME, '2023-01-05 05:05:41', 121)),
        (4,3,3,'COMPRA','RECUSADO','585.24','447.36','38.46','865.02',CONVERT(DATETIME, '2022-06-20 02:46:40', 121)),
        (3,1,4,'COMPRA','APROVADO','637.55','141.14','54.07','573.55',CONVERT(DATETIME, '2022-05-27 00:23:02', 121)),
        (2,2,4,'COMPRA','APROVADO','532.91','123.36','65.80','725.69',CONVERT(DATETIME, '2024-04-20 09:10:42', 121)),
        (2,3,10,'COMPRA','APROVADO','518.72','313.28','29.44','565.87',CONVERT(DATETIME, '2022-08-09 14:04:21', 121)),
        (2,3,10,'COMPRA','APROVADO','758.32','258.02','63.06','868.68',CONVERT(DATETIME, '2023-09-14 13:46:28', 121)),
        (3,1,11,'COMPRA','APROVADO','766.00','466.47','29.33','710.62',CONVERT(DATETIME, '2023-11-28 11:06:19', 121)),
        (3,1,11,'COMPRA','RECUSADO','729.42','293.50','71.12','432.51',CONVERT(DATETIME, '2024-05-06 11:44:50', 121)),
        (4,2,12,'COMPRA','APROVADO','597.51','272.96','35.05','456.93',CONVERT(DATETIME, '2024-01-17 15:12:28', 121)),
        (2,1,12,'COMPRA','APROVADO','855.08','411.90','39.86','581.85',CONVERT(DATETIME, '2022-04-17 03:20:52', 121)),
        (2,1,1,'COMPRA','APROVADO','539.24','313.51','67.81','596.08',CONVERT(DATETIME, '2023-03-07 14:11:14', 121)),
        (2,3,1,'COMPRA','APROVADO','991.79','105.97','51.72','602.78',CONVERT(DATETIME, '2023-06-21 22:41:24', 121)),
        (4,2,2,'COMPRA','APROVADO','849.21','253.82','39.15','787.84',CONVERT(DATETIME, '2022-05-18 12:12:20', 121)),
        (3,4,2,'COMPRA','RECUSADO','977.08','251.46','54.59','692.96',CONVERT(DATETIME, '2022-01-02 15:06:31', 121)),
        (1,3,3,'COMPRA','APROVADO','988.96','269.62','56.70','652.98',CONVERT(DATETIME, '2022-09-22 02:12:07', 121));
        INSERT INTO ECM_TRANSACOES (ID_CLIENTE,ID_ENDERECO,ID_ETAPA,TIPO,PAGAMENTO,SUBTOTAL,TOTAL,FRETE,DESCONTOS,CRIACAO)
        VALUES
        (3,2,3,'COMPRA','APROVADO','907.85','427.15','71.23','730.98',CONVERT(DATETIME, '2023-05-20 16:21:52', 121)),
        (2,3,4,'COMPRA','APROVADO','789.37','102.99','43.72','851.68',CONVERT(DATETIME, '2023-10-01 23:56:29', 121)),
        (1,2,4,'COMPRA','APROVADO','553.81','404.75','46.23','405.65',CONVERT(DATETIME, '2023-09-04 17:51:35', 121)),
        (1,2,10,'COMPRA','APROVADO','655.61','320.94','67.34','668.08',CONVERT(DATETIME, '2023-08-21 04:09:57', 121)),
        (4,2,10,'COMPRA','RECUSADO','700.44','489.79','59.40','845.56',CONVERT(DATETIME, '2023-04-25 07:31:25', 121));

        INSERT INTO ECM_PRO_TRA (ID_TRANSACAO, ID_PRODUTO, QUANTIDADE)
        SELECT ID_TRANSACAO, ((ABS(CHECKSUM(NEWID())) % 102) + 1), ((ABS(CHECKSUM(NEWID())) % 10) + 1) 
        FROM ECM_TRANSACOES;

        INSERT INTO ECM_PRO_TRA (ID_TRANSACAO, ID_PRODUTO, QUANTIDADE)
        SELECT ID_TRANSACAO, ((ABS(CHECKSUM(NEWID())) % 102) + 1), ((ABS(CHECKSUM(NEWID())) % 10) + 1) 
        FROM ECM_TRANSACOES WHERE ID_TRANSACAO < 250;

        INSERT INTO ECM_PRO_TRA (ID_TRANSACAO, ID_PRODUTO, QUANTIDADE)
        SELECT ID_TRANSACAO, ((ABS(CHECKSUM(NEWID())) % 102) + 1), ((ABS(CHECKSUM(NEWID())) % 10) + 1) 
        FROM ECM_TRANSACOES WHERE ID_TRANSACAO < 140;

        INSERT INTO ECM_PRO_TRA (ID_TRANSACAO, ID_PRODUTO, QUANTIDADE)
        SELECT ID_TRANSACAO, ((ABS(CHECKSUM(NEWID())) % 102) + 1), ((ABS(CHECKSUM(NEWID())) % 10) + 1) 
        FROM ECM_TRANSACOES WHERE ID_TRANSACAO < 50;

        INSERT INTO ECM_TRA_CAR (ID_TRANSACAO, ID_CARTAO, TOTAL, PAGAMENTO)
        SELECT ID_TRANSACAO, ((ABS(CHECKSUM(NEWID())) % 10) + 1), TOTAL, PAGAMENTO
        FROM ECM_TRANSACOES;

        UPDATE ECM_TRANSACOES SET ENTREGA = GETDATE(), PAGAMENTO = 'APROVADO' WHERE ID_ETAPA = 4;

        INSERT INTO ECM_DESCONTOS (ID_CLIENTE, CODIGO, DESCONTO, RESGATADO, TIPO, ATIVO, CRIACAO)
        VALUES
        (NULL, '82CCF7CD', 25, 0, 'CUPONS', 1, CONVERT(DATETIME, '2024-06-27 11:30:23.177', 121)),
        (1, '80347', 0, 0, 'TROCA', 1, CONVERT(DATETIME, '2024-06-27 11:30:23.177', 121)),
        (1, '20398', 0, 0, 'TROCA', 1, CONVERT(DATETIME, '2024-06-27 11:30:28.200', 121));

        INSERT INTO ECM_SOLICITACOES (CODIGO, GRUPO_CODIGO, ID_TRANSACAO, ID_PRODUTO, ID_DESCONTO, ID_ETAPA, TIPO, PRECO, APROCACAO_1, APROCACAO_2, MOTIVO_SOLICITACAO, DATA_SOLICITACAO, DATA_ENVIO, DATA_RECEBIMENTO, CRIACAO)
        VALUES
        ('1-7898055857716', 78805, 217, 35, 20,	4, 'TROCA', '470.048538032758', 1, 1, 'Compra na aquantidade errada errada', CONVERT(DATETIME, '2024-06-27 11:26:48.313',121), CONVERT(DATETIME, '2024-06-27 11:30:12.150',121), CONVERT(DATETIME, '2024-06-27 11:30:23.183',121), CONVERT(DATETIME, '2024-06-27 11:26:48.313',121)), 
        ('2-7898055857716', 78805, 217, 35, 21,	4, 'TROCA', '470.048538032758', 1, 1, 'Compra na aquantidade errada errada', CONVERT(DATETIME, '2024-06-27 11:26:48.323',121), CONVERT(DATETIME, '2024-06-27 11:30:09.173',121), CONVERT(DATETIME, '2024-06-27 11:30:28.203',121), CONVERT(DATETIME, '2024-06-27 11:26:48.323',121))	 
    END
GO