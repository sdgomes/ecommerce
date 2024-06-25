USE [PROGRAMAS]
GO

DROP PROCEDURE IF EXISTS dbo.Populate
GO

CREATE PROCEDURE dbo.Populate
AS
    BEGIN
        INSERT INTO ECM_BANDEIRAS (NOME, COR, IMAGEM)
        VALUES ('VISA', 'linear-gradient(to right, #005ca8, #f6a723)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\bandeiras\visa.png', SINGLE_BLOB) AS IMAGE)),
        ('MASTERCARD', 'linear-gradient(45deg, #f50014, #f79c03)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\bandeiras\mastercard.png', SINGLE_BLOB) AS IMAGE)),
        ('HIPER', 'linear-gradient(45deg, #950f18, #a1161c)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\bandeiras\hiper.png', SINGLE_BLOB) AS IMAGE)),
        ('ELO', 'linear-gradient(45deg, #009fd8, #f7c405, #e73f22)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\bandeiras\elo.png', SINGLE_BLOB) AS IMAGE)),
        ('AURA', 'linear-gradient(45deg, #6ab5a8, #398c76)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\bandeiras\aura.png', SINGLE_BLOB) AS IMAGE)),
        ('AMEX', 'linear-gradient(45deg, #aac2b8, #d6e6dc)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\bandeiras\amex.png', SINGLE_BLOB) AS IMAGE)),
        ('VOYAGER', 'linear-gradient(45deg, #afafaf, #2e2e2e)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\bandeiras\voyager.png', SINGLE_BLOB) AS IMAGE)),
        ('DINERS', 'linear-gradient(45deg, #a27c38, #947d3f)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\bandeiras\diners.png', SINGLE_BLOB) AS IMAGE)), 
        ('JCB', 'linear-gradient(45deg, #bca561, #dbc383)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\bandeiras\jcb.png', SINGLE_BLOB) AS IMAGE)), 
        ('DISCOVER', 'linear-gradient(45deg, #509dbd, #6cb4ce)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\bandeiras\discover.png', SINGLE_BLOB) AS IMAGE)),
        ('ENROUTE', 'linear-gradient(45deg, #242424, #000000)', (SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\bandeiras\enroute.png', SINGLE_BLOB) AS IMAGE))

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
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7899673881858','Batidão Tropical - Pabllo Vittar',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Batidão Tropical é o quarto álbum de estúdio do cantor e drag queen brasileiro Pabllo Vittar, lançado em 24 de junho de 2021, através da Sony Music Brasil.',0,0,0,'2024','Pabllo Vittar',41),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7893513377117','Não Para Não - Pabllo Vittar',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Não Para Não é o segundo álbum de estúdio do cantor e drag queen brasileiro Pabllo Vittar, lançado em 4 de outubro de 2018, através da Sony Music Brasil. O álbum contém participações de Urias, Dilsinho e Ludmilla. O primeiro single do disco, "Problema Seu", foi lançado em 15 de agosto de 2018.',0,0,0,'1992','Pabllo Vittar',26),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7898734244027','Noitada - Pabllo Vittar',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','Noitada é o quinto álbum de estúdio do cantor e drag queen brasileiro Pabllo Vittar, lançado em 8 de fevereiro de 2023, através da Sony Music Brasil.',0,0,0,'1992','Pabllo Vittar',38),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7895511388953','After - Pabllo Vittar',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','After é o quarto álbum de remixes do cantor e drag queen brasileiro Pabllo Vittar. Foi lançado no dia 27 de julho de 2023 pela Sony Music Brasil. A coletânea contém uma seleção de remixes de canções de seu quinto álbum de estúdio, Noitada. O disco traz a participação de diversos artistas nacionais.',0,0,0,'2021','Pabllo Vittar',40),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7892907498215','Batidão Tropical 2 - Pabllo Vittar',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','Batidão Tropical 2 será o sexto álbum de estúdio do cantor e drag queen brasileiro Pabllo Vittar, com lançamento prevista para abril de 2024',0,0,0,'1970','Pabllo Vittar',18),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7898650158417','Anti-Herói - Jão',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Anti-Herói é o segundo álbum de estúdio do cantor brasileiro Jão, lançado em 10 de outubro de 2019 através da Head Media e Universal Music. Foi co-escrito e co-produzido por Jão com Los Brasileiros e Paul Ralphes. Ele também trabalhou com André Jordão, Pedro Tófani e Pedro Calais.',0,0,0,'1985','Jão',28),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7898985117888','Lobos- Jão',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Lobos é o álbum de estúdio de estreia do cantor brasileiro Jão, lançado em 17 de agosto de 2018, através da Head Media e Universal Music. Os temas líricos do álbum giram em torno de suas narrativas pessoais que deixam visíveis suas fragilidades, tristezas e medos.',0,0,0,'2021','Jão',37),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7897820505246','Back to Black - Amy Winehouse',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Back to Black é o segundo álbum de estúdio da artista musical britânica Amy Winehouse, lançado primeiramente na Irlanda em 27 de outubro de 2006 e três dias depois no Reino Unido através da editora discográfica Island Records.',0,0,0,'1969','Amy Winehouse',40),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7895558082712','Amy - Amy Winehouse',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Amy é a trilha sonora original do filme de mesmo nome de 2015. Foi lançada pela Island Records em 30 de outubro de 2015. É a segunda compilação póstuma da cantora e compositora inglesa Amy Winehouse.',0,0,0,'1997','Amy Winehouse',30),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7890446177526','Lioness: Hidden Treasures - Amy Winehouse',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Lioness é o primeiro álbum de compilação póstumo da cantora britânica Amy Winehouse, com músicas inéditas, lançado em 2 de Dezembro de 2011 pela Island Records.',0,0,0,'2023','Amy Winehouse',15)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7896562109621','Like a Virgin - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Like a Virgin é o segundo álbum de estúdio da artista musical estadunidense Madonna. O seu lançamento ocorreu em 12 de novembro de 1984, através das gravadoras Sire Records e Warner Bros. Records.',0,0,0,'1968','Madonna',25),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7892548307425','Rebel Heart - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Rebel Heart é o décimo terceiro álbum de estúdio da artista musical americana Madonna. O seu lançamento ocorreu em 6 de março de 2015, através da editora discográfica Interscope.',0,0,0,'1999','Madonna',21),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7891815878205','Erotica - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Erotica é o quinto álbum de estúdio da artista musical estadunidense Madonna, lançado em 20 de outubro de 1992 através das gravadoras Maverick e Warner Bros. Foi lançado simultaneamente ao livro Sex, que contém fotografias explícitas da cantora.',0,0,0,'2016','Madonna',28),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7893591834164','Madonna (álbum) - Madonna',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Madonna é o álbum de estreia e homônimo da artista musical estadunidense Madonna. O seu lançamento ocorreu em 27 de julho de 1983, através das gravadoras Sire Records e Warner Bros. Records. Foi relançado em 1985 nos mercados europeus sob o título de Madonna: The First Album.',0,0,0,'1988','Madonna',49),
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
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7893831086025','Help! - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'NOVO','Help! é o quinto álbum do grupo The Beatles, que teve também um lançamento simultâneo de um filme com o mesmo nome. Lançado em agosto de 1965, no auge da beatlemania e das turnês do grupo, o álbum reflete algumas mudanças na música dos fab-four.',0,0,0,'1975','Os Beatles',16),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7895662912826','Magical Mystery Tour - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'NOVO','Magical Mystery Tour é um disco gravado pelos Beatles, lançado no formato EP duplo no Reino Unido e LP nos Estados Unidos. Produzidas por George Martin, ambas as versões incluem as seis canções da trilha sonora do filme homônimo de 1967.',0,0,0,'2017','Os Beatles',24),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7896344777104','With the Beatles - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','With the Beatles é o segundo álbum do grupo de rock inglês The Beatles, lançado em 22 de novembro de 1963. Gravado quatro meses após o lançamento do primeiro álbum, do qual repete a fórmula.',0,0,0,'2001','Os Beatles',46),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7890262627244','Let It Be - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Let It Be é o décimo terceiro e último álbum de estúdio lançado pelo grupo inglês de rock The Beatles. Gravado entre janeiro de 1969 e março/abril de 1970, o álbum foi somente lançado em 8 de maio de 1970, após o disco Abbey Road e juntamente com o documentário com o mesmo nome.',0,0,0,'2004','Os Beatles',30),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7899918021214','A Hard Day''s Night - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','A Hard Day''s Night é o terceiro álbum da banda britânica The Beatles, lançado em 1964 na Inglaterra, acompanhando o lançamento do filme homônimo.',0,0,0,'2016','Os Beatles',35),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7898203755837','Yellow Submarine - Os Beatles',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Yellow Submarine é o décimo primeiro álbum de estúdio da banda inglesa The Beatles, lançado em 13 de Janeiro de 1969 nos Estados Unidos e em 17 de Janeiro de 1969 no Reino Unido. Foi comercializado como banda sonora para o filme de animação de mesmo nome, que estreou em Londres em Julho de 1968.',0,0,0,'2020','Os Beatles',35)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7898157225798','Random Access Memories - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Random Access Memories é o quarto e último álbum de estúdio da dupla francesa de música eletrônica Daft Punk, lançado em 17 de maio de 2013, pela Columbia Records.',0,0,0,'1991','Daft Punk',23),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7894842177971','Discovery - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Discovery é o segundo álbum de estúdio da dupla de french house Daft Punk, lançado em 12 de março de 2001. Este marca uma mudança no som do Chicago house, que foram anteriormente conhecidos por disco e estilos synthpop.',0,0,0,'1976','Daft Punk',38),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7894821726167','Tron: Legacy - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Tron: Legacy é o álbum da trilha sonora do filme homônimo lançado em 2010. Disponibilizado em 6 de dezembro do mesmo ano pela Walt Disney Records, é o único álbum de trilha sonora composto pela dupla francesa Daft Punk.',0,0,0,'2016','Daft Punk',47),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7897822848031','Homework - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Homework é o álbum de estreia da dupla francesa de música eletrônica Daft Punk, primeiramente lançado em 20 de janeiro de 1997. O álbum é considerado uma mistura de house, techno, acid e funk. Este é notado por induzir o interesse ao toque musical francês com diversos artistas seguindo o estilo.',0,0,0,'1994','Daft Punk',49),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7898055857716','Alive 2007 - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Alive 2007 é um álbum ao vivo de Daft Punk, lançado inicialmente em 19 de novembro de 2007. É o segundo álbum gravado ao vivo pela dupla, seguido de Alive 1997. Alive 2007 apresenta sua performance em Bercy em Paris em 14 de junho de 2007.',0,0,0,'2021','Daft Punk',46),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7899883962321','Human After All - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Human After All é o terceiro álbum de estúdio da dupla francesa Daft Punk, primeiramente lançado em 14 de março de 2005 internacionalmente e um dia depois nos Estados Unidos. Com ele, Daft Punk aplica minimalismo e rock ao seu estilo francês de house music.',0,0,0,'1996','Daft Punk',35),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7897854441469','Greatest Hits - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Seu álbum de estreia, Homework (1997), rendeu-lhes ainda mais elogios na cena da dance music, e o single "Around the World" - que apresentava um vocal em loop e processado eletronicamente.',0,0,0,'2007','Daft Punk',25),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7898133388273','Daft Club - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'NOVO','Daft Club é o primeiro álbum de remixes da dupla francesa de música eletrônica Daft Punk, lançado em 1 de dezembro de 2003 pela Virgin Records. O álbum apresenta vários remixes de faixas de seu segundo álbum, Discovery, e um de sua estreia, Homework.',0,0,0,'1975','Daft Punk',15),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7892013850788','Deep Cuts - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','As versões alternativas e remixes de Daft Punk irão saciar os fãs de live house e grooves eletrônicos. Os Netunos levam "Mais Difícil, Melhor, Mais Rápido',0,0,0,'2021','Daft Punk',48),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7893952251796','Alive 1997 - Daft Punk',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'PRE-VENDA','Alive 1997 é o primeiro álbum ao vivo da dupla francesa de música eletrônica Daft Punk, lançado em 1 de outubro de 2001 pela Virgin Records. Ele contém um trecho de 45 minutos de uma apresentação ao vivo gravada durante Daftendirektour no Que Club de Birmingham em 8 de novembro de 1997.',0,0,0,'1979','Daft Punk',22)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7891120212247','Homecoming: The Live Album - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Homecoming: The Live Album é o quinto álbum ao vivo da cantora americana Beyoncé, lançado em 17 de abril de 2019. Foi gravado em 14 e 21 de abril de 2018 durante as apresentações da cantora no Coachella Valley Music and Arts Festival em Indio, na Califórnia.',0,0,0,'2006','Beyoncé',30),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7896067702047','B''Day - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','B''Day é o segundo álbum de estúdio da artista musical americana Beyoncé, lançado internacionalmente através da Sony BMG Music Entertainment a 4 de setembro de 2006 para que coincidisse com o 25.° aniversário da artista.',0,0,0,'2021','Beyoncé',18),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7890333696109','4 - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','4 é o quarto álbum de estúdio da artista musical estadunidense Beyoncé. Foi lançado em 24 de junho de 2011 pela Parkwood Entertainment e Columbia Records.',0,0,0,'2008','Beyoncé',41),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7893312597821','Lemonade - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Lemonade é o sexto álbum de estúdio da artista musical estadunidense Beyoncé. O seu lançamento ocorreu em 23 de abril de 2016, através das gravadoras Parkwoood e Columbia.',0,0,0,'1994','Beyoncé',36),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7893773614526','I Am… Sasha Fierce - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'PRE-VENDA','I Am... Sasha Fierce é o terceiro álbum de estúdio da artista musical estadunidense Beyoncé. Foi lançado em 12 de novembro de 2008 pela Columbia Records e pela Music World Entertainment.',0,0,0,'1976','Beyoncé',20),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7890563610353','Dangerously in Love - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'PRE-VENDA','Dangerously in Love é o álbum de estreia solo da artista musical estadunidense Beyoncé. Foi lançado em 23 de junho de 2003 pela Columbia Records e Music World Entertainment.',0,0,0,'1986','Beyoncé',47),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7893267624964','Renaissance - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Renaissance é o sétimo álbum de estúdio da cantora americana, Beyoncé, lançado em 29 de julho de 2022, através da Parkwood Entertainment e Columbia Records. É seu primeiro lançamento solo em estúdio desde Lemonade e serve como a primeira parte de uma trilogia.',0,0,0,'1995','Beyoncé',48),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'7897444973686','Beyoncé - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL POLIMERICO'),'','Beyoncé é o quinto álbum de estúdio e homônimo da artista musical estadunidense Beyoncé. O seu lançamento ocorreu em 13 de dezembro de 2013 sem qualquer aviso prévio na loja virtual iTunes Store, através das gravadoras Columbia Records e Parkwood Entertainment, seguido de uma distribuição física nos dias seguintes.',0,0,0,'1973','Beyoncé',33),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7895108628739','Cowboy Carter - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'','Cowboy Carter é o oitavo álbum de estúdio da cantora norte-americana Beyoncé. Lançado no dia 29 de março de 2024, através da Parkwood Entertainment e Columbia Records, o álbum é segunda parte de uma trilogia de projetos concebidos durante a pandemia de COVID-19, que começou com Renaissance.',0,0,0,'1973','Beyoncé',23),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7898152540388','The Lion King: The Gift - Beyoncé',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'NOVO','The Lion King: The Gift é uma trilha sonora produzida pela cantora norte-americana Beyoncé para o remake em renderização 3D The Lion King, e mais tarde para o filme musical Black Is King.',0,0,0,'1991','Beyoncé',40)

        INSERT INTO ECM_PRODUTOS (ID_PRECIFICACAO,CODIGO,NOME,PRECO,TIPO,DESCRICAO,DESCONTO,NOVO,PRE_VENDA,ANO,ARTISTA,QNT_DESCONTO)
        VALUES
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7891364108499','Sucka Free - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','Sucka Free é a segunda mixtape da rapper Nicki Minaj. Foi lançado em 12 de abril de 2008 pela Dirty Money Records. Sucka Free conta com participações especiais dos colegas rappers Lil Wayne, Gucci Mane, Jadakiss, Lil'' Kim e Ransom.',0,0,0,'1999','Nicki Minaj',27),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7898278373197','Barbie World - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','A parceria entre Nicki Minaj e Ice Spice, na música "Barbie World", faz parte da trilha sonora do live-action da Barbie',0,0,0,'1997','Nicki Minaj',36),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7894537718471','Queen - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Queen é o quarto álbum de estúdio da rapper Nicki Minaj. Foi lançado em 10 de agosto de 2018 pela Young Money Entertainment, Cash Money Records e Republic Records. Foi o primeiro álbum de Minaj em quase quatro anos após The Pinkprint (2014).',0,0,0,'2001','Nicki Minaj',16),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'7891255944715','Pink Friday: Roman Reloaded - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'VINIL MONOMERICO'),'','Pink Friday: Roman Reloaded é o segundo álbum de estúdio da rapper e compositora trinidiana Nicki Minaj, lançado em 2 de abril de 2012 pela Young Money Entertainment, Cash Money Records e Universal Republic Records.',0,0,0,'1992','Nicki Minaj',38),
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'7898443982862','Massive Attack - Nicki Minaj',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-R'),'NOVO','Massive Attack é o single de estreia da rapper de Trinidad Nicki Minaj, com participação de Sean Garrett. Foi lançado em 13 de abril de 2010 pela Young Money, Cash Money e Universal Motown.',0,0,0,'1970','Nicki Minaj',38),
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
        (1,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Batidão Tropical.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (2,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Não Para Não.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (3,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Noitada.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (4,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\After.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (5,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Batidão Tropical 2.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (6,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Anti-Herói.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (7,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lobos.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (8,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Back to Black.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (9,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Amy.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lioness Hidden Treasures.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Like a Virgin.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Rebel Heart.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Erotica.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Madonna.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Ray of Light.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Madame X.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\MDNA.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Like a Prayer.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (19,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Im Breathless.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Whos That Girl.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Abbey Road.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Beatles.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Revolver.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Please Please Me.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Help!.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Magical Mystery Tour.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\With the Beatles.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Let It Be.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\A Hard Days Night.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Yellow Submarine.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Random Access Memories.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Discovery.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Tron Legacy.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Homework.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alive 2007.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Human After All.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Greatest Hits.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Daft Club.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Deep Cuts.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alive 1997.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Homecoming The Live Album.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\BDay.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\4.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lemonade.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\I Am Sasha Fierce.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dangerously in Love.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Renaissance.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Beyoncé.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Cowboy Carter.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Lion King The Gift.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (51,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Sucka Free.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (52,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Barbie World.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (53,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Queen.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (54,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday Roman Reloaded.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (55,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Massive Attack.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (56,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Pinkprint.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (57,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Beam Me Up Scotty.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (58,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Playtime Is Over.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (59,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (60,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday 2.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (61,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Never Say Never The Remixes.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (62,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My World.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (63,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Journals.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (64,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Under the Mistletoe.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (65,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Believe.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (66,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My World 2.0.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (67,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Changes.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (68,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Justice.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (69,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Purpose.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (70,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Freedom.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (71,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pure Heroine.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (72,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Melodrama.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (73,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Solar Power.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (74,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Four Pink Walls.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (75,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Know-It-All.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (76,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Pains of Growing.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (77,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\This Summer.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (78,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\In The Meantime.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (79,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Cry Baby.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (80,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\K12.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (81,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\After School.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (82,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Portals.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (83,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Ao vivo.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (84,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\A Voz Do Samba.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (85,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Morte De Um Poeta.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (86,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Fogo da Vida.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (87,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Da Cor Do Brasil.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (88,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Profissão Cantora.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (89,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alerta geral.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (90,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\De Tudo Que eu Gosto.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (91,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Thank U, Next.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (92,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dangerous Woman.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (93,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Yours Truly.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (94,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My Everything.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (95,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Sweetener.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (96,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Positions.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (97,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Eternal Sunshine.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (98,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Reputation.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (99,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Tortured Poets Department.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (100,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\1989 Taylors Version.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (101,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Radical Optimism.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (102,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dont Say Love.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (1,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Batidão Tropical.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (2,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Não Para Não.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (3,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Noitada.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (4,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\After.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (5,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Batidão Tropical 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (6,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Anti-Herói.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (7,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lobos.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (8,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Back to Black.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (9,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Amy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lioness Hidden Treasures.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Like a Virgin.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Rebel Heart.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Erotica.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Madonna.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Ray of Light.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Madame X.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\MDNA.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Like a Prayer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (19,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Im Breathless.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Whos That Girl.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Abbey Road.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Revolver.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Please Please Me.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Help!.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Magical Mystery Tour.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\With the Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Let It Be.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\A Hard Days Night.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Yellow Submarine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Random Access Memories.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Discovery.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Tron Legacy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Homework.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alive 2007.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Human After All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Greatest Hits.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Daft Club.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Deep Cuts.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alive 1997.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Homecoming The Live Album.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\BDay.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\4.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lemonade.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\I Am Sasha Fierce.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dangerously in Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Renaissance.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Beyoncé.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Cowboy Carter.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Lion King The Gift.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (51,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Sucka Free.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (52,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Barbie World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (53,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Queen.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (54,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday Roman Reloaded.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (55,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Massive Attack.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (56,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Pinkprint.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (57,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Beam Me Up Scotty.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (58,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Playtime Is Over.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (59,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (60,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (61,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Never Say Never The Remixes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (62,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (63,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Journals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (64,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Under the Mistletoe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (65,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Believe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (66,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My World 2.0.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (67,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Changes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (68,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Justice.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (69,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Purpose.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (70,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Freedom.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (71,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pure Heroine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (72,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Melodrama.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (73,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Solar Power.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (74,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Four Pink Walls.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (75,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Know-It-All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (76,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Pains of Growing.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (77,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\This Summer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (78,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\In The Meantime.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (79,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Cry Baby.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (80,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\K12.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (81,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\After School.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (82,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Portals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (83,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Ao vivo.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (84,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\A Voz Do Samba.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (85,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Morte De Um Poeta.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (86,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Fogo da Vida.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (87,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Da Cor Do Brasil.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (88,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Profissão Cantora.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (89,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alerta geral.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (90,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\De Tudo Que eu Gosto.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (91,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Thank U, Next.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (92,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dangerous Woman.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (93,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Yours Truly.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (94,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My Everything.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (95,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Sweetener.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (96,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Positions.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (97,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Eternal Sunshine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (98,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Reputation.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (99,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Tortured Poets Department.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (100,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\1989 Taylors Version.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (101,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Radical Optimism.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1'),
        (102,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dont Say Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_1')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (1,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Batidão Tropical.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (2,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Não Para Não.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (3,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Noitada.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (4,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\After.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (5,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Batidão Tropical 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (6,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Anti-Herói.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (7,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lobos.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (8,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Back to Black.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (9,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Amy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lioness Hidden Treasures.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Like a Virgin.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Rebel Heart.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Erotica.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Madonna.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Ray of Light.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Madame X.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\MDNA.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Like a Prayer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (19,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Im Breathless.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Whos That Girl.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Abbey Road.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Revolver.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Please Please Me.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Help!.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Magical Mystery Tour.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\With the Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Let It Be.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\A Hard Days Night.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Yellow Submarine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Random Access Memories.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Discovery.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Tron Legacy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Homework.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alive 2007.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Human After All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Greatest Hits.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Daft Club.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Deep Cuts.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alive 1997.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Homecoming The Live Album.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\BDay.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\4.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lemonade.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\I Am Sasha Fierce.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dangerously in Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Renaissance.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Beyoncé.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Cowboy Carter.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Lion King The Gift.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (51,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Sucka Free.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (52,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Barbie World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (53,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Queen.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (54,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday Roman Reloaded.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (55,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Massive Attack.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (56,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Pinkprint.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (57,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Beam Me Up Scotty.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (58,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Playtime Is Over.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (59,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (60,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (61,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Never Say Never The Remixes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (62,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (63,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Journals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (64,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Under the Mistletoe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (65,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Believe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (66,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My World 2.0.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (67,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Changes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (68,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Justice.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (69,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Purpose.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (70,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Freedom.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (71,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pure Heroine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (72,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Melodrama.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (73,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Solar Power.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (74,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Four Pink Walls.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (75,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Know-It-All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (76,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Pains of Growing.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (77,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\This Summer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (78,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\In The Meantime.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (79,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Cry Baby.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (80,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\K12.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (81,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\After School.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (82,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Portals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (83,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Ao vivo.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (84,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\A Voz Do Samba.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (85,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Morte De Um Poeta.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (86,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Fogo da Vida.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (87,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Da Cor Do Brasil.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (88,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Profissão Cantora.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (89,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alerta geral.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (90,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\De Tudo Que eu Gosto.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (91,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Thank U, Next.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (92,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dangerous Woman.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (93,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Yours Truly.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (94,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My Everything.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (95,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Sweetener.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (96,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Positions.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (97,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Eternal Sunshine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (98,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Reputation.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (99,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Tortured Poets Department.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (100,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\1989 Taylors Version.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (101,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Radical Optimism.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2'),
        (102,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dont Say Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_2')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (1,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Batidão Tropical.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (2,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Não Para Não.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (3,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Noitada.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (4,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\After.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (5,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Batidão Tropical 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (6,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Anti-Herói.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (7,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lobos.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (8,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Back to Black.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (9,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Amy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lioness Hidden Treasures.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Like a Virgin.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Rebel Heart.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Erotica.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Madonna.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Ray of Light.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Madame X.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\MDNA.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Like a Prayer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (19,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Im Breathless.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Whos That Girl.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Abbey Road.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Revolver.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Please Please Me.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Help!.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Magical Mystery Tour.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\With the Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Let It Be.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\A Hard Days Night.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Yellow Submarine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Random Access Memories.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Discovery.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Tron Legacy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Homework.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alive 2007.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Human After All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Greatest Hits.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Daft Club.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Deep Cuts.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alive 1997.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Homecoming The Live Album.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\BDay.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\4.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lemonade.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\I Am Sasha Fierce.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dangerously in Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Renaissance.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Beyoncé.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Cowboy Carter.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Lion King The Gift.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (51,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Sucka Free.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (52,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Barbie World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (53,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Queen.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (54,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday Roman Reloaded.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (55,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Massive Attack.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (56,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Pinkprint.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (57,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Beam Me Up Scotty.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (58,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Playtime Is Over.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (59,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (60,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (61,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Never Say Never The Remixes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (62,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (63,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Journals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (64,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Under the Mistletoe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (65,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Believe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (66,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My World 2.0.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (67,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Changes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (68,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Justice.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (69,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Purpose.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (70,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Freedom.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (71,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pure Heroine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (72,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Melodrama.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (73,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Solar Power.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (74,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Four Pink Walls.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (75,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Know-It-All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (76,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Pains of Growing.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (77,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\This Summer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (78,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\In The Meantime.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (79,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Cry Baby.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (80,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\K12.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (81,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\After School.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (82,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Portals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (83,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Ao vivo.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (84,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\A Voz Do Samba.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (85,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Morte De Um Poeta.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (86,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Fogo da Vida.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (87,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Da Cor Do Brasil.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (88,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Profissão Cantora.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (89,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alerta geral.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (90,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\De Tudo Que eu Gosto.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (91,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Thank U, Next.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (92,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dangerous Woman.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (93,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Yours Truly.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (94,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My Everything.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (95,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Sweetener.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (96,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Positions.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (97,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Eternal Sunshine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (98,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Reputation.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (99,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Tortured Poets Department.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (100,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\1989 Taylors Version.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (101,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Radical Optimism.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3'),
        (102,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dont Say Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_3')

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (1,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Batidão Tropical.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (2,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Não Para Não.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (3,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Noitada.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (4,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\After.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (5,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Batidão Tropical 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (6,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Anti-Herói.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (7,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lobos.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (8,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Back to Black.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (9,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Amy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lioness Hidden Treasures.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Like a Virgin.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Rebel Heart.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Erotica.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Madonna.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Ray of Light.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Madame X.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\MDNA.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Like a Prayer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (19,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Im Breathless.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Whos That Girl.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Abbey Road.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Revolver.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Please Please Me.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Help!.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Magical Mystery Tour.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\With the Beatles.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Let It Be.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\A Hard Days Night.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Yellow Submarine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Random Access Memories.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Discovery.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Tron Legacy.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Homework.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alive 2007.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Human After All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Greatest Hits.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Daft Club.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Deep Cuts.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alive 1997.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Homecoming The Live Album.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\BDay.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\4.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Lemonade.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\I Am Sasha Fierce.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dangerously in Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Renaissance.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Beyoncé.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Cowboy Carter.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Lion King The Gift.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (51,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Sucka Free.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (52,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Barbie World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (53,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Queen.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (54,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday Roman Reloaded.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (55,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Massive Attack.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (56,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Pinkprint.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (57,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Beam Me Up Scotty.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (58,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Playtime Is Over.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (59,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (60,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pink Friday 2.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (61,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Never Say Never The Remixes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (62,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My World.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (63,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Journals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (64,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Under the Mistletoe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (65,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Believe.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (66,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My World 2.0.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (67,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Changes.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (68,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Justice.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (69,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Purpose.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (70,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Freedom.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (71,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Pure Heroine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (72,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Melodrama.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (73,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Solar Power.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (74,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Four Pink Walls.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (75,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Know-It-All.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (76,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Pains of Growing.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (77,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\This Summer.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (78,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\In The Meantime.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (79,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Cry Baby.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (80,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\K12.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (81,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\After School.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (82,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Portals.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (83,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Ao vivo.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (84,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\A Voz Do Samba.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (85,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Morte De Um Poeta.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (86,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Fogo da Vida.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (87,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Da Cor Do Brasil.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (88,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Profissão Cantora.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (89,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Alerta geral.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (90,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\De Tudo Que eu Gosto.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (91,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Thank U, Next.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (92,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dangerous Woman.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (93,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Yours Truly.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (94,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\My Everything.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (95,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Sweetener.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (96,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Positions.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (97,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Eternal Sunshine.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (98,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Reputation.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (99,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\The Tortured Poets Department.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (100,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\1989 Taylors Version.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (101,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Radical Optimism.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4'),
        (102,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\imagens\Dont Say Love.jpg', SINGLE_BLOB) AS IMAGE),'PRODUTO_4')

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (1,'7899673881858',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',148.87,'','120mm','SONY','WARNER MUSIC',1.3),
        (2,'7893513377117',14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',119.07,'','120mm','MAKETECH','VIRGIN MUSIC',1.3),
        (3,'7898734244027',12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',136.26,'','17.50cm','ELGIN','TODAH MUSIC',1.6),
        (4,'7895511388953',22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',120.37,'','17.50cm','MAXPRINT','SONY MUSIC',1.6),
        (5,'7892907498215',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',125.43,'','120mm','VERBATIM','SPOTLIGHT RECORDS',2.3),
        (6,'7898650158417',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',160.25,'','120mm','CIS','SINEWAVE',2.3),
        (7,'7898985117888',21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',130.92,'','17.50cm','MULTILASER','POLYSOM',1.3),
        (8,'7897820505246',50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',93.92,'','17.50cm','SONY','ONIMUSIC',1.3),
        (9,'7895558082712',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',85.60,'','120mm','MAKETECH','NOVO TEMPO',1.6),
        (10,'7890446177526',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',144.72,'','120mm','ELGIN','MOVIEPLAY',1.6)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (11,'7896562109621',40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',166.41,'','17.50cm','MAXPRINT','MONSTRO DISCOS',2.3),
        (12,'7892548307425',32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',153.28,'','17.50cm','VERBATIM','MK MUSIC',2.3),
        (13,'7891815878205',35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',121.97,'','120mm','CIS','MIDSUMMER MADNESS',1.3),
        (14,'7893591834164',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',79.46,'','120mm','MULTILASER','FURACÃO 2000',1.3),
        (15,'7898851074796',10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',111.86,'','17.50cm','SONY','ELO MUSIC',1.6),
        (16,'7894308575425',33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',149.00,'','17.50cm','MAKETECH','WARNER MUSIC',1.6),
        (17,'7898497558619',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',135.00,'','120mm','ELGIN','VIRGIN MUSIC',2.3),
        (18,'7893105862273',27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',151.56,'','120mm','MAXPRINT','TODAH MUSIC',2.3),
        (19,'7893993032295',12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',133.51,'','17.50cm','VERBATIM','SONY MUSIC',1.3),
        (20,'7893352238356',40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',157.24,'','17.50cm','CIS','SPOTLIGHT RECORDS',1.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (21,'7898198862433',13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',143.76,'','120mm','MULTILASER','SINEWAVE',1.6),
        (22,'7898486861674',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',129.99,'','120mm','SONY','POLYSOM',1.6),
        (23,'7892215238255',36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',75.29,'','17.50cm','MAKETECH','ONIMUSIC',2.3),
        (24,'7898082255445',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',107.20,'','17.50cm','ELGIN','NOVO TEMPO',2.3),
        (25,'7893831086025',35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',95.48,'','120mm','MAXPRINT','MOVIEPLAY',1.3),
        (26,'7895662912826',32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',88.97,'','120mm','VERBATIM','MONSTRO DISCOS',1.3),
        (27,'7896344777104',33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',115.48,'','17.50cm','CIS','MK MUSIC',1.6),
        (28,'7890262627244',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',139.36,'','17.50cm','MULTILASER','MIDSUMMER MADNESS',1.6),
        (29,'7899918021214',22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',158.91,'','120mm','SONY','FURACÃO 2000',2.3),
        (30,'7898203755837',17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',119.02,'','120mm','MAKETECH','ELO MUSIC',2.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (31,'7898157225798',34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',82.96,'','17.50cm','ELGIN','WARNER MUSIC',1.3),
        (32,'7894842177971',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',149.92,'','17.50cm','MAXPRINT','VIRGIN MUSIC',1.3),
        (33,'7894821726167',16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',125.72,'','120mm','VERBATIM','TODAH MUSIC',1.6),
        (34,'7897822848031',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',104.41,'','120mm','CIS','SONY MUSIC',1.6),
        (35,'7898055857716',38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',144.05,'','17.50cm','MULTILASER','SPOTLIGHT RECORDS',2.3),
        (36,'7899883962321',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',128.37,'','17.50cm','SONY','SINEWAVE',2.3),
        (37,'7897854441469',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',80.12,'','120mm','MAKETECH','POLYSOM',1.3),
        (38,'7898133388273',11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',165.57,'','120mm','ELGIN','ONIMUSIC',1.3),
        (39,'7892013850788',39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',157.00,'','17.50cm','MAXPRINT','NOVO TEMPO',1.6),
        (40,'7893952251796',26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',93.13,'','17.50cm','VERBATIM','MOVIEPLAY',1.6)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (41,'7891120212247',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',101.75,'','120mm','CIS','MONSTRO DISCOS',2.3),
        (42,'7896067702047',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',90.66,'','120mm','MULTILASER','MK MUSIC',2.3),
        (43,'7890333696109',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',126.39,'','17.50cm','SONY','MIDSUMMER MADNESS',1.3),
        (44,'7893312597821',38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',174.42,'','17.50cm','MAKETECH','FURACÃO 2000',1.3),
        (45,'7893773614526',27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',160.39,'','120mm','ELGIN','ELO MUSIC',1.6),
        (46,'7890563610353',22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',149.18,'','120mm','MAXPRINT','WARNER MUSIC',1.6),
        (47,'7893267624964',23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',155.70,'','17.50cm','VERBATIM','VIRGIN MUSIC',2.3),
        (48,'7897444973686',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',118.29,'','17.50cm','CIS','TODAH MUSIC',2.3),
        (49,'7895108628739',43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',125.29,'','120mm','MULTILASER','SONY MUSIC',1.3),
        (50,'7898152540388',11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',134.66,'','120mm','SONY','SPOTLIGHT RECORDS',1.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (51,'7891364108499',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',111.84,'','17.50cm','MAKETECH','SINEWAVE',1.6),
        (52,'7898278373197',34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',113.61,'','17.50cm','ELGIN','POLYSOM',1.6),
        (53,'7894537718471',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',162.62,'','120mm','MAXPRINT','ONIMUSIC',2.3),
        (54,'7891255944715',41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',129.97,'','120mm','VERBATIM','NOVO TEMPO',2.3),
        (55,'7898443982862',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',92.35,'','17.50cm','CIS','MOVIEPLAY',1.3),
        (56,'7891990168344',29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',75.98,'','17.50cm','MULTILASER','MONSTRO DISCOS',1.3),
        (57,'7895863872504',16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',166.96,'','120mm','SONY','MK MUSIC',1.6),
        (58,'7896588238767',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',142.40,'','120mm','MAKETECH','MIDSUMMER MADNESS',1.6),
        (59,'7898473648573',43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',161.24,'','17.50cm','ELGIN','FURACÃO 2000',2.3),
        (60,'7892855743156',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',163.63,'','17.50cm','MAXPRINT','ELO MUSIC',2.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (61,'7891536597171',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',148.30,'','120mm','VERBATIM','WARNER MUSIC',1.3),
        (62,'7895753631524',48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',88.06,'','120mm','CIS','VIRGIN MUSIC',1.3),
        (63,'7892127026034',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',90.15,'','17.50cm','MULTILASER','TODAH MUSIC',1.6),
        (64,'7897078338688',47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',92.67,'','17.50cm','SONY','SONY MUSIC',1.6),
        (65,'7895047129002',32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',150.20,'','120mm','MAKETECH','SPOTLIGHT RECORDS',2.3),
        (66,'7894489960232',25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',158.76,'','120mm','ELGIN','SINEWAVE',2.3),
        (67,'7895742873341',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',112.45,'','17.50cm','MAXPRINT','POLYSOM',1.3),
        (68,'7898465442563',21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',105.32,'','17.50cm','VERBATIM','ONIMUSIC',1.3),
        (69,'7891446171705',17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',133.39,'','120mm','CIS','NOVO TEMPO',1.6),
        (70,'7895141126289',25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',99.56,'','120mm','MULTILASER','MOVIEPLAY',1.6)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (71,'7892686492735',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',162.79,'','17.50cm','SONY','MONSTRO DISCOS',2.3),
        (72,'7898322306344',50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',87.43,'','17.50cm','MAKETECH','MK MUSIC',2.3),
        (73,'7893454775381',38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',92.78,'','120mm','ELGIN','MIDSUMMER MADNESS',1.3),
        (74,'7898013317471',30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',149.73,'','120mm','MAXPRINT','FURACÃO 2000',1.3),
        (75,'7895188034351',27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',133.89,'','17.50cm','VERBATIM','ELO MUSIC',1.6),
        (76,'7895918641511',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',96.73,'','17.50cm','CIS','WARNER MUSIC',1.6),
        (77,'7892441277852',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',114.56,'','120mm','MULTILASER','VIRGIN MUSIC',2.3),
        (78,'7896312505121',37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',148.31,'','120mm','SONY','TODAH MUSIC',2.3),
        (79,'7895513908516',46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',169.51,'','17.50cm','MAKETECH','SONY MUSIC',1.3),
        (80,'7899654075376',25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',130.12,'','17.50cm','ELGIN','SPOTLIGHT RECORDS',1.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (81,'7897678458077',21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',150.18,'','120mm','MAXPRINT','SINEWAVE',1.6),
        (82,'7893652936623',34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',159.30,'','120mm','VERBATIM','POLYSOM',1.6),
        (83,'7895482566767',18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',123.11,'','17.50cm','CIS','ONIMUSIC',2.3),
        (84,'7893761887414',46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',86.31,'','17.50cm','MULTILASER','NOVO TEMPO',2.3),
        (85,'7896445316131',37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',138.29,'','120mm','SONY','MOVIEPLAY',1.3),
        (86,'7895444833694',40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',159.87,'','120mm','MAKETECH','MONSTRO DISCOS',1.3),
        (87,'7899534735787',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',88.48,'','17.50cm','ELGIN','MK MUSIC',1.6),
        (88,'7898280083382',43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',129.22,'','17.50cm','MAXPRINT','MIDSUMMER MADNESS',1.6),
        (89,'7898362186063',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',95.33,'','120mm','VERBATIM','FURACÃO 2000',2.3),
        (90,'7891762824510',31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',160.10,'','120mm','CIS','ELO MUSIC',2.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (91,'7897611486763',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',114.37,'','17.50cm','MULTILASER','WARNER MUSIC',1.3),
        (92,'7896532792674',16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',129.63,'','17.50cm','SONY','VIRGIN MUSIC',1.3),
        (93,'7893490466362',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',126.94,'','120mm','MAKETECH','TODAH MUSIC',1.6),
        (94,'7892817494146',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',147.85,'','120mm','ELGIN','SONY MUSIC',1.6),
        (95,'7894693011184',26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',129.80,'','17.50cm','MAXPRINT','SPOTLIGHT RECORDS',2.3),
        (96,'7897420564268',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',116.15,'','17.50cm','VERBATIM','SINEWAVE',2.3),
        (97,'7893672436219',44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',163.37,'','120mm','CIS','POLYSOM',1.3),
        (98,'7896210284033',33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',89.13,'','120mm','MULTILASER','ONIMUSIC',1.3),
        (99,'7897985628068',18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',107.59,'','17.50cm','SONY','NOVO TEMPO',1.6),
        (100,'7896514521745',31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',102.57,'','17.50cm','MAKETECH','MOVIEPLAY',1.6),
        (101,'7896514521745',31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',102.57,'','17.50cm','MAKETECH','MOVIEPLAY',1.6),
        (102,'7896514521745',31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\Ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',102.57,'','17.50cm','MAKETECH','MOVIEPLAY',1.6)
  
        INSERT INTO [ECM_CAT_PRO] (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (1,48),
        (2,2),
        (3,8),
        (4,34),
        (5,22),
        (6,15),
        (7,31),
        (8,25),
        (9,9),
        (10,29),
        (11,10),
        (12,32),
        (13,44),
        (14,12),
        (15,52)

        INSERT INTO [ECM_CAT_PRO] (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (16,24),
        (17,33),
        (18,16),
        (19,10),
        (20,23),
        (21,37),
        (22,44),
        (23,41),
        (24,36),
        (25,40),
        (26,8),
        (27,40),
        (28,45),
        (29,18),
        (30,18)

        INSERT INTO [ECM_CAT_PRO] (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (31,17),
        (32,34),
        (33,18),
        (34,51),
        (35,15),
        (36,40),
        (37,41),
        (38,50),
        (39,44),
        (40,40),
        (41,29),
        (42,40),
        (43,3),
        (44,49),
        (45,31)

        INSERT INTO [ECM_CAT_PRO] (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (46,48),
        (47,23),
        (48,48),
        (49,28),
        (50,23)

        INSERT INTO [ECM_CAT_PRO] (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (51,28),
        (52,3),
        (53,43),
        (54,21),
        (55,13),
        (56,4),
        (57,52),
        (58,31),
        (59,9),
        (60,5),
        (61,29),
        (62,9),
        (63,18),
        (64,37),
        (65,3)

        INSERT INTO [ECM_CAT_PRO] (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (66,25),
        (67,48),
        (68,54),
        (69,3),
        (70,4),
        (71,11),
        (72,24),
        (73,49),
        (74,53),
        (75,46),
        (76,23),
        (77,5),
        (78,3),
        (79,20),
        (80,28)

        INSERT INTO [ECM_CAT_PRO] (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (81,41),
        (82,6),
        (83,42),
        (84,52),
        (85,41),
        (86,3),
        (87,39),
        (88,5),
        (89,20),
        (90,38),
        (91,8),
        (92,49),
        (93,35),
        (94,11),
        (95,48)

        INSERT INTO [ECM_CAT_PRO] (ID_PRODUTO,ID_CATEGORIA)
        VALUES
        (96,22),
        (97,11),
        (98,40),
        (99,54),
        (100,38),
        (101,32),
        (102,3)
    END
GO