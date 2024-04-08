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
        ('DINERS'), ('JCB'), ('DISCOVER'), ('ENROUTE')

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

        INSERT INTO ECM_ETAPAS (ETAPA)
        VALUES ('PROCESSANDO PAGAMENTO'), ('EM PREPARAÇÃO'), ('A CAMINHO'), ('ENTREGUE'), ('DEVOLVIDO')

        INSERT INTO ECM_PRECIFICACOES (SUBCATEGORIA,TIPO,PRECO_MINIMO,PRECO_MAXIMO)
        VALUES ('CD','CD-R',297.08,882.81),
        ('CD','CD-RW',251.09,716.10),
        ('VINIL','VINIL MONOMERICO',281.58,837.56),
        ('VINIL','VINIL POLIMERICO',226.94,616.13)    

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
        ((SELECT ID_PRECIFICACAO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'7896514521745','1989: Taylor''s Version - Taylor Swift',(SELECT RAND() * (PRECO_MAXIMO - PRECO_MINIMO) + PRECO_MINIMO FROM ECM_PRECIFICACOES WHERE TIPO = 'CD-RW'),'','Taylor Swift é o álbum de estreia homônimo da cantora e compositora estadunidense Taylor Swift, lançado através da Big Machine Records em 24 de outubro de 2006.',0,0,0,'1981','Taylor Swift',44)

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
        (60,1,''), (70,1,''), (80,1,''), (90,1,''), (100,1,'')

        UPDATE ECM_PRODUTOS SET PRE_VENDA = 1 WHERE TIPO = 'PRE-VENDA'

        UPDATE ECM_PRODUTOS SET NOVO = 1 WHERE TIPO = 'NOVO'

        UPDATE ECM_PRODUTOS SET DESCONTO = 1 WHERE ID_PRODUTO IN (6, 7, 13, 14, 23, 26, 27, 2, 3, 4, 20, 21, 22, 29, 30, 31, 32, 33, 57, 58, 59, 70, 71, 72, 92, 93, 94)

        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (1,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Batidão Tropical.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (2,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Não Para Não.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (3,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Noitada.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (4,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\After.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (5,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Batidão Tropical 2.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (6,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Anti-Herói.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (7,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Lobos.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (8,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Back to Black.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (9,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Amy.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Lioness Hidden Treasures.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Like a Virgin.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Rebel Heart.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Erotica.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Madonna.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Ray of Light.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Madame X.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\MDNA.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Like a Prayer.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (19,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Im Breathless.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Whos That Girl.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Abbey Road.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\The Beatles.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Revolver.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Please Please Me.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Help!.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Magical Mystery Tour.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\With the Beatles.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Let It Be.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\A Hard Days Night.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Yellow Submarine.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Random Access Memories.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Discovery.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Tron Legacy.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Homework.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Alive 2007.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Human After All.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Greatest Hits.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Daft Club.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Deep Cuts.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Alive 1997.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Homecoming The Live Album.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\BDay.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\4.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Lemonade.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\I Am Sasha Fierce.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Dangerously in Love.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Renaissance.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Beyoncé.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Cowboy Carter.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\The Lion King The Gift.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (51,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Sucka Free.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (52,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Barbie World.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (53,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Queen.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (54,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Pink Friday Roman Reloaded.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (55,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Massive Attack.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (56,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\The Pinkprint.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (57,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Beam Me Up Scotty.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (58,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Playtime Is Over.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (59,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Pink Friday.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (60,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Pink Friday 2.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (61,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Never Say Never The Remixes.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (62,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\My World.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (63,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Journals.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (64,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Under the Mistletoe.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (65,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Believe.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (66,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\My World 2.0.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (67,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Changes.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (68,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Justice.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (69,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Purpose.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (70,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Freedom.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (71,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Pure Heroine.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (72,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Melodrama.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (73,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Solar Power.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (74,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Four Pink Walls.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (75,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Know-It-All.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (76,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\The Pains of Growing.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (77,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\This Summer.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (78,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\In The Meantime.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (79,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Cry Baby.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (80,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\K12.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (81,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\After School.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (82,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Portals.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (83,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Ao vivo.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (84,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\A Voz Do Samba.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (85,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Morte De Um Poeta.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (86,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Fogo da Vida.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (87,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Da Cor Do Brasil.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (88,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Profissão Cantora.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (89,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Alerta geral.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (90,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\De Tudo Que eu Gosto.jpg', SINGLE_BLOB) AS IMAGE),'COVER')
        
        INSERT INTO ECM_IMAGENS (ID_PRODUTO,IMAGEM,NOME)
        VALUES
        (91,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Thank U, Next.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (92,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Dangerous Woman.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (93,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Yours Truly.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (94,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\My Everything.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (95,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Sweetener.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (96,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Positions.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (97,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Eternal Sunshine.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (98,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\Reputation.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (99,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\The Tortured Poets Department.jpg', SINGLE_BLOB) AS IMAGE),'COVER'),
        (100,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\imagens\1989 Taylors Version.jpg', SINGLE_BLOB) AS IMAGE),'COVER')

        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (1,'7899673881858',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',148.87,'','120mm','SONY','WARNER MUSIC',1.3),
        (2,'7893513377117',14,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',119.07,'','120mm','MAKETECH','VIRGIN MUSIC',1.3),
        (3,'7898734244027',12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',136.26,'','17.50cm','ELGIN','TODAH MUSIC',1.6),
        (4,'7895511388953',22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',120.37,'','17.50cm','MAXPRINT','SONY MUSIC',1.6),
        (5,'7892907498215',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',125.43,'','120mm','VERBATIM','SPOTLIGHT RECORDS',2.3),
        (6,'7898650158417',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',160.25,'','120mm','CIS','SINEWAVE',2.3),
        (7,'7898985117888',21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',130.92,'','17.50cm','MULTILASER','POLYSOM',1.3),
        (8,'7897820505246',50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',93.92,'','17.50cm','SONY','ONIMUSIC',1.3),
        (9,'7895558082712',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',85.60,'','120mm','MAKETECH','NOVO TEMPO',1.6),
        (10,'7890446177526',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',144.72,'','120mm','ELGIN','MOVIEPLAY',1.6)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (11,'7896562109621',40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',166.41,'','17.50cm','MAXPRINT','MONSTRO DISCOS',2.3),
        (12,'7892548307425',32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',153.28,'','17.50cm','VERBATIM','MK MUSIC',2.3),
        (13,'7891815878205',35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',121.97,'','120mm','CIS','MIDSUMMER MADNESS',1.3),
        (14,'7893591834164',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',79.46,'','120mm','MULTILASER','FURACÃO 2000',1.3),
        (15,'7898851074796',10,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',111.86,'','17.50cm','SONY','ELO MUSIC',1.6),
        (16,'7894308575425',33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',149.00,'','17.50cm','MAKETECH','WARNER MUSIC',1.6),
        (17,'7898497558619',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',135.00,'','120mm','ELGIN','VIRGIN MUSIC',2.3),
        (18,'7893105862273',27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',151.56,'','120mm','MAXPRINT','TODAH MUSIC',2.3),
        (19,'7893993032295',12,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',133.51,'','17.50cm','VERBATIM','SONY MUSIC',1.3),
        (20,'7893352238356',40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',157.24,'','17.50cm','CIS','SPOTLIGHT RECORDS',1.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (21,'7898198862433',13,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',143.76,'','120mm','MULTILASER','SINEWAVE',1.6),
        (22,'7898486861674',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',129.99,'','120mm','SONY','POLYSOM',1.6),
        (23,'7892215238255',36,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',75.29,'','17.50cm','MAKETECH','ONIMUSIC',2.3),
        (24,'7898082255445',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',107.20,'','17.50cm','ELGIN','NOVO TEMPO',2.3),
        (25,'7893831086025',35,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',95.48,'','120mm','MAXPRINT','MOVIEPLAY',1.3),
        (26,'7895662912826',32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',88.97,'','120mm','VERBATIM','MONSTRO DISCOS',1.3),
        (27,'7896344777104',33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',115.48,'','17.50cm','CIS','MK MUSIC',1.6),
        (28,'7890262627244',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',139.36,'','17.50cm','MULTILASER','MIDSUMMER MADNESS',1.6),
        (29,'7899918021214',22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',158.91,'','120mm','SONY','FURACÃO 2000',2.3),
        (30,'7898203755837',17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',119.02,'','120mm','MAKETECH','ELO MUSIC',2.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (31,'7898157225798',34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',82.96,'','17.50cm','ELGIN','WARNER MUSIC',1.3),
        (32,'7894842177971',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',149.92,'','17.50cm','MAXPRINT','VIRGIN MUSIC',1.3),
        (33,'7894821726167',16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',125.72,'','120mm','VERBATIM','TODAH MUSIC',1.6),
        (34,'7897822848031',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',104.41,'','120mm','CIS','SONY MUSIC',1.6),
        (35,'7898055857716',38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',144.05,'','17.50cm','MULTILASER','SPOTLIGHT RECORDS',2.3),
        (36,'7899883962321',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',128.37,'','17.50cm','SONY','SINEWAVE',2.3),
        (37,'7897854441469',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',80.12,'','120mm','MAKETECH','POLYSOM',1.3),
        (38,'7898133388273',11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',165.57,'','120mm','ELGIN','ONIMUSIC',1.3),
        (39,'7892013850788',39,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',157.00,'','17.50cm','MAXPRINT','NOVO TEMPO',1.6),
        (40,'7893952251796',26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',93.13,'','17.50cm','VERBATIM','MOVIEPLAY',1.6)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (41,'7891120212247',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',101.75,'','120mm','CIS','MONSTRO DISCOS',2.3),
        (42,'7896067702047',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',90.66,'','120mm','MULTILASER','MK MUSIC',2.3),
        (43,'7890333696109',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',126.39,'','17.50cm','SONY','MIDSUMMER MADNESS',1.3),
        (44,'7893312597821',38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',174.42,'','17.50cm','MAKETECH','FURACÃO 2000',1.3),
        (45,'7893773614526',27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',160.39,'','120mm','ELGIN','ELO MUSIC',1.6),
        (46,'7890563610353',22,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',149.18,'','120mm','MAXPRINT','WARNER MUSIC',1.6),
        (47,'7893267624964',23,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',155.70,'','17.50cm','VERBATIM','VIRGIN MUSIC',2.3),
        (48,'7897444973686',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',118.29,'','17.50cm','CIS','TODAH MUSIC',2.3),
        (49,'7895108628739',43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',125.29,'','120mm','MULTILASER','SONY MUSIC',1.3),
        (50,'7898152540388',11,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',134.66,'','120mm','SONY','SPOTLIGHT RECORDS',1.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (51,'7891364108499',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',111.84,'','17.50cm','MAKETECH','SINEWAVE',1.6),
        (52,'7898278373197',34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',113.61,'','17.50cm','ELGIN','POLYSOM',1.6),
        (53,'7894537718471',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',162.62,'','120mm','MAXPRINT','ONIMUSIC',2.3),
        (54,'7891255944715',41,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',129.97,'','120mm','VERBATIM','NOVO TEMPO',2.3),
        (55,'7898443982862',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',92.35,'','17.50cm','CIS','MOVIEPLAY',1.3),
        (56,'7891990168344',29,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',75.98,'','17.50cm','MULTILASER','MONSTRO DISCOS',1.3),
        (57,'7895863872504',16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',166.96,'','120mm','SONY','MK MUSIC',1.6),
        (58,'7896588238767',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',142.40,'','120mm','MAKETECH','MIDSUMMER MADNESS',1.6),
        (59,'7898473648573',43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',161.24,'','17.50cm','ELGIN','FURACÃO 2000',2.3),
        (60,'7892855743156',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',163.63,'','17.50cm','MAXPRINT','ELO MUSIC',2.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (61,'7891536597171',49,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',148.30,'','120mm','VERBATIM','WARNER MUSIC',1.3),
        (62,'7895753631524',48,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',88.06,'','120mm','CIS','VIRGIN MUSIC',1.3),
        (63,'7892127026034',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',90.15,'','17.50cm','MULTILASER','TODAH MUSIC',1.6),
        (64,'7897078338688',47,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',92.67,'','17.50cm','SONY','SONY MUSIC',1.6),
        (65,'7895047129002',32,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',150.20,'','120mm','MAKETECH','SPOTLIGHT RECORDS',2.3),
        (66,'7894489960232',25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',158.76,'','120mm','ELGIN','SINEWAVE',2.3),
        (67,'7895742873341',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',112.45,'','17.50cm','MAXPRINT','POLYSOM',1.3),
        (68,'7898465442563',21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',105.32,'','17.50cm','VERBATIM','ONIMUSIC',1.3),
        (69,'7891446171705',17,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',133.39,'','120mm','CIS','NOVO TEMPO',1.6),
        (70,'7895141126289',25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',99.56,'','120mm','MULTILASER','MOVIEPLAY',1.6)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (71,'7892686492735',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',162.79,'','17.50cm','SONY','MONSTRO DISCOS',2.3),
        (72,'7898322306344',50,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',87.43,'','17.50cm','MAKETECH','MK MUSIC',2.3),
        (73,'7893454775381',38,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',92.78,'','120mm','ELGIN','MIDSUMMER MADNESS',1.3),
        (74,'7898013317471',30,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',149.73,'','120mm','MAXPRINT','FURACÃO 2000',1.3),
        (75,'7895188034351',27,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',133.89,'','17.50cm','VERBATIM','ELO MUSIC',1.6),
        (76,'7895918641511',24,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',96.73,'','17.50cm','CIS','WARNER MUSIC',1.6),
        (77,'7892441277852',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',114.56,'','120mm','MULTILASER','VIRGIN MUSIC',2.3),
        (78,'7896312505121',37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',148.31,'','120mm','SONY','TODAH MUSIC',2.3),
        (79,'7895513908516',46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',169.51,'','17.50cm','MAKETECH','SONY MUSIC',1.3),
        (80,'7899654075376',25,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',130.12,'','17.50cm','ELGIN','SPOTLIGHT RECORDS',1.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (81,'7897678458077',21,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',150.18,'','120mm','MAXPRINT','SINEWAVE',1.6),
        (82,'7893652936623',34,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',159.30,'','120mm','VERBATIM','POLYSOM',1.6),
        (83,'7895482566767',18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',123.11,'','17.50cm','CIS','ONIMUSIC',2.3),
        (84,'7893761887414',46,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BEGE',86.31,'','17.50cm','MULTILASER','NOVO TEMPO',2.3),
        (85,'7896445316131',37,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',138.29,'','120mm','SONY','MOVIEPLAY',1.3),
        (86,'7895444833694',40,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERDE',159.87,'','120mm','MAKETECH','MONSTRO DISCOS',1.3),
        (87,'7899534735787',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',88.48,'','17.50cm','ELGIN','MK MUSIC',1.6),
        (88,'7898280083382',43,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'CINZA',129.22,'','17.50cm','MAXPRINT','MIDSUMMER MADNESS',1.6),
        (89,'7898362186063',42,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',95.33,'','120mm','VERBATIM','FURACÃO 2000',2.3),
        (90,'7891762824510',31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AMARELO',160.10,'','120mm','CIS','ELO MUSIC',2.3)
        
        INSERT INTO ECM_ESTOQUES (ID_PRODUTO,CODIGO,SALDO,NOTA_FISCAL,COR,PRECO_UNITARIO,TIPO,TAMANHO,MARCA,GRAVADORA,PESO)
        VALUES
        (91,'7897611486763',45,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',114.37,'','17.50cm','MULTILASER','WARNER MUSIC',1.3),
        (92,'7896532792674',16,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'PRETO',129.63,'','17.50cm','SONY','VIRGIN MUSIC',1.3),
        (93,'7893490466362',20,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',126.94,'','120mm','MAKETECH','TODAH MUSIC',1.6),
        (94,'7892817494146',15,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'BRANCO',147.85,'','120mm','ELGIN','SONY MUSIC',1.6),
        (95,'7894693011184',26,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',129.80,'','17.50cm','MAXPRINT','SPOTLIGHT RECORDS',2.3),
        (96,'7897420564268',28,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'AZUL',116.15,'','17.50cm','VERBATIM','SINEWAVE',2.3),
        (97,'7893672436219',44,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',163.37,'','120mm','CIS','POLYSOM',1.3),
        (98,'7896210284033',33,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'VERMELHO',89.13,'','120mm','MULTILASER','ONIMUSIC',1.3),
        (99,'7897985628068',18,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',107.59,'','17.50cm','SONY','NOVO TEMPO',1.6),
        (100,'7896514521745',31,(SELECT * FROM OPENROWSET(BULK N'C:\Users\Public\Documents\ecommerce\nota\exemplo-de-nota-fiscal.jpg', SINGLE_BLOB) AS IMAGE),'ROSA',102.57,'','17.50cm','MAKETECH','MOVIEPLAY',1.6)
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (26,34,4,'est. Nunc laoreet lectus quis','Theodore Cordeiro','nam.tempor@google.couk'),
        (78,32,4,'Maecenas mi felis, adipiscing fringilla,','Reece Almeida','inceptos.hymenaeos@outlook.ca'),
        (21,46,4,'molestie tellus. Aenean egestas hendrerit','Ulla Duarte','aliquam.adipiscing@google.ca'),
        (70,35,4,'accumsan sed, facilisis vitae, orci.','Ariana Lopes','metus.in@protonmail.couk'),
        (41,17,3,'egestas. Fusce aliquet magna a','Lenore Galdino','enim.nunc@icloud.net'),
        (22,56,1,'non, vestibulum nec, euismod in,','Peter Matias','blandit.congue@google.ca'),
        (83,64,1,'amet, consectetuer adipiscing elit. Curabitur','Nita de Lourdes','consectetuer.euismod@protonmail.net'),
        (24,21,5,'dictum eu, eleifend nec, malesuada','Roth Rosa','congue.elit@hotmail.net'),
        (66,47,2,'eget, venenatis a, magna. Lorem','Dalton da Cruz','velit@aol.org'),
        (87,10,3,'turpis egestas. Aliquam fringilla cursus','Duncan Carneiro','sit.amet@aol.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (72,20,1,'diam nunc, ullamcorper eu, euismod','Alvin Sales','eleifend@outlook.edu'),
        (98,60,1,'Donec non justo. Proin non','Lareina da Silva','aenean.eget@protonmail.ca'),
        (14,41,5,'lectus pede et risus. Quisque','Amanda de Moura','urna.nunc@google.couk'),
        (27,23,2,'ante. Nunc mauris sapien, cursus','Kay Xavier','nam.consequat@icloud.ca'),
        (65,43,4,'quis turpis vitae purus gravida','Courtney Xavier','phasellus.libero@hotmail.edu'),
        (46,35,2,'hendrerit a, arcu. Sed et','Hiroko Cunha','sagittis@aol.net'),
        (73,52,2,'ornare, elit elit fermentum risus,','Emerald Fonseca','vivamus@protonmail.edu'),
        (88,47,2,'Aenean euismod mauris eu elit.','Bruce de Lourdes','justo@aol.com'),
        (72,32,4,'fringilla cursus purus. Nullam scelerisque','Jasmine de Freitas','ornare.facilisis@yahoo.com'),
        (6,10,4,'Aliquam ultrices iaculis odio. Nam','Ebony dos Reis','turpis.nulla@icloud.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (70,13,1,'ultricies ligula. Nullam enim. Sed','Oscar Tavares','ultricies.dignissim@icloud.couk'),
        (87,43,5,'ante bibendum ullamcorper. Duis cursus,','Hadley de Moraes','odio.etiam.ligula@outlook.net'),
        (49,24,2,'nibh dolor, nonummy ac, feugiat','Gabriel Das Dores','nullam.feugiat@aol.com'),
        (24,7,3,'Pellentesque habitant morbi tristique senectus','Blake Correia','magnis@yahoo.net'),
        (11,24,4,'eget, venenatis a, magna. Lorem','Lee Mendes','ac.mattis@aol.ca'),
        (74,5,1,'Nunc lectus pede, ultrices a,','Salvador de Campos','interdum@icloud.edu'),
        (27,53,5,'et, rutrum non, hendrerit id,','Ocean Pacheco','libero.donec@hotmail.couk'),
        (69,17,4,'nonummy ac, feugiat non, lobortis','Sara de Oliveira','in.scelerisque@icloud.net'),
        (27,52,1,'at sem molestie sodales. Mauris','Shana Franca','ligula@google.edu'),
        (17,16,3,'in lobortis tellus justo sit','Belle Lemos','nonummy.ut@yahoo.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (13,16,3,'ante dictum mi, ac mattis','Dahlia Andrade','purus.maecenas@hotmail.couk'),
        (33,14,4,'quis urna. Nunc quis arcu','Ethan Batista','proin@protonmail.org'),
        (78,7,3,'justo sit amet nulla. Donec','Brody Castro','auctor.odio@icloud.couk'),
        (68,5,4,'tristique pharetra. Quisque ac libero','Diana Domingos','et@outlook.ca'),
        (5,27,1,'nec tempus scelerisque, lorem ipsum','Kasper Moura','enim.non@google.com'),
        (35,52,4,'lacus, varius et, euismod et,','Flavia Firmino','ipsum.dolor.sit@hotmail.edu'),
        (46,3,3,'ac sem ut dolor dapibus','Sylvester Das Neves','mauris.sapien@protonmail.edu'),
        (100,36,2,'Vivamus nibh dolor, nonummy ac,','Fay Das Chagas','lacinia.at.iaculis@icloud.com'),
        (75,14,5,'sit amet nulla. Donec non','Dillon da Rosa','purus.mauris.a@outlook.ca'),
        (57,65,3,'et, eros. Proin ultrices. Duis','Amal Garcia','curabitur@yahoo.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (10,41,2,'augue. Sed molestie. Sed id','Gavin Braz','duis.elementum@yahoo.edu'),
        (54,53,2,'nisl sem, consequat nec, mollis','Wylie Amaral','diam.nunc@hotmail.net'),
        (29,21,3,'dolor elit, pellentesque a, facilisis','Jakeem Fernandes','molestie.orci.tincidunt@outlook.couk'),
        (84,64,4,'orci. Ut semper pretium neque.','Kimberley Correa','sem@google.org'),
        (78,9,1,'eget metus eu erat semper','Colin Fagundes','tempor.arcu@aol.com'),
        (68,62,1,'Nam consequat dolor vitae dolor.','Zelenia de Moura','vivamus@yahoo.couk'),
        (45,64,3,'orci quis lectus. Nullam suscipit,','Constance da Cruz','mauris.ut@aol.net'),
        (10,26,2,'tincidunt nibh. Phasellus nulla. Integer','Brynn Sampaio','metus.aliquam@aol.ca'),
        (88,25,2,'Nulla facilisi. Sed neque. Sed','Madison Matias','sed.nec@yahoo.com'),
        (29,28,2,'facilisis facilisis, magna tellus faucibus','Josiah Monteiro','at.sem@outlook.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (97,33,3,'dui, semper et, lacinia vitae,','Slade Silva','vivamus.euismod@google.edu'),
        (10,8,2,'velit. Sed malesuada augue ut','Celeste Lemos','odio.nam@protonmail.org'),
        (100,53,4,'velit. Sed malesuada augue ut','Brittany de Melo','natoque.penatibus.et@google.couk'),
        (7,4,5,'nisi nibh lacinia orci, consectetuer','Noel do Nascimento','quis.pede@hotmail.ca'),
        (55,30,4,'felis purus ac tellus. Suspendisse','Fay Menezes','feugiat.placerat@outlook.couk'),
        (68,15,4,'Curabitur vel lectus. Cum sociis','Anjolie de Azevedo','litora.torquent.per@outlook.org'),
        (66,67,2,'amet ornare lectus justo eu','Stephanie Camargo','fringilla.porttitor@icloud.org'),
        (22,68,3,'faucibus lectus, a sollicitudin orci','Hector Siqueira','gravida.mauris@google.couk'),
        (92,33,5,'eu dolor egestas rhoncus. Proin','Noah Das Chagas','nisi.dictum@hotmail.org'),
        (72,25,4,'ipsum ac mi eleifend egestas.','Judith Magalhaes','iaculis.nec@aol.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (35,44,1,'Donec vitae erat vel pede','Seth Silva','nisi.aenean@aol.org'),
        (98,55,1,'rutrum eu, ultrices sit amet,','Ryan Mendes','aliquam.fringilla@protonmail.ca'),
        (53,23,1,'vitae, erat. Vivamus nisi. Mauris','Nash Messias','pellentesque.massa@hotmail.net'),
        (99,14,3,'hendrerit id, ante. Nunc mauris','Aaron Ferraz','penatibus.et.magnis@outlook.edu'),
        (55,28,4,'ligula. Aenean euismod mauris eu','Gisela Rocha','nec.euismod@aol.edu'),
        (52,53,3,'semper et, lacinia vitae, sodales','Sydney Sousa','non.lacinia.at@hotmail.net'),
        (76,7,3,'placerat, orci lacus vestibulum lorem,','Reagan Mariano','sed@hotmail.com'),
        (35,26,3,'sem egestas blandit. Nam nulla','Bell de Lourdes','et.magna@google.ca'),
        (77,17,2,'rhoncus. Proin nisl sem, consequat','Fallon dos Anjos','posuere.cubilia.curae@hotmail.net'),
        (58,27,3,'vulputate, risus a ultricies adipiscing,','Tiger Simoes','aenean.egestas@outlook.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (90,69,4,'Donec non justo. Proin non','Davis Domingues','dapibus@aol.edu'),
        (3,3,3,'felis. Donec tempor, est ac','Kibo Cabral','ultrices.duis@outlook.com'),
        (76,54,2,'vel, convallis in, cursus et,','Demetria de Souza','cum@yahoo.couk'),
        (86,3,1,'vehicula et, rutrum eu, ultrices','Priscilla Aguiar','augue.porttitor@protonmail.edu'),
        (87,15,4,'ac mattis ornare, lectus ante','Melanie Coelho','dictum.eu@google.edu'),
        (51,35,1,'sem eget massa. Suspendisse eleifend.','Dalton Barbosa','nisl@icloud.couk'),
        (87,28,3,'ullamcorper. Duis cursus, diam at','Rina Coelho','adipiscing@outlook.edu'),
        (94,51,2,'ut mi. Duis risus odio,','Wesley dos Reis','sed.dui@google.edu'),
        (9,36,2,'cursus et, magna. Praesent interdum','Buckminster Custodio','aliquam.auctor@protonmail.edu'),
        (67,4,4,'velit eget laoreet posuere, enim','Lars Cabral','arcu.ac@hotmail.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (27,21,2,'erat neque non quam. Pellentesque','Imelda Peixoto','cras.vehicula.aliquet@yahoo.edu'),
        (98,6,1,'ante blandit viverra. Donec tempus,','Hu Chaves','cras@aol.edu'),
        (21,30,3,'justo faucibus lectus, a sollicitudin','Marny da Cruz','donec@aol.ca'),
        (46,34,3,'et risus. Quisque libero lacus,','Tanek da Conceiçao','mauris@icloud.com'),
        (49,45,4,'sed, hendrerit a, arcu. Sed','Yen Dias','sit.amet@hotmail.edu'),
        (16,11,4,'natoque penatibus et magnis dis','Avye Leite','purus@google.couk'),
        (71,58,4,'arcu. Morbi sit amet massa.','Mercedes Gomes','pellentesque.ultricies@aol.couk'),
        (59,60,2,'quis, pede. Suspendisse dui. Fusce','Jocelyn Andrade','dignissim.magna@hotmail.edu'),
        (36,16,4,'lorem lorem, luctus ut, pellentesque','Carl Amorim','proin@aol.net'),
        (53,29,4,'a, malesuada id, erat. Etiam','Oliver Das Chagas','rhoncus@google.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (48,9,1,'primis in faucibus orci luctus','Alec de Paula','malesuada@outlook.net'),
        (74,21,3,'feugiat. Lorem ipsum dolor sit','Sierra Teles','ac@hotmail.com'),
        (35,30,2,'Aenean eget metus. In nec','Cyrus Ribeiro','fusce.mi@yahoo.ca'),
        (24,56,2,'sit amet metus. Aliquam erat','Tanner da Luz','hendrerit@aol.ca'),
        (8,47,3,'ante ipsum primis in faucibus','Christopher Muniz','sem.pellentesque.ut@google.org'),
        (58,50,5,'urna. Nullam lobortis quam a','Murphy Domingues','mauris@google.couk'),
        (94,16,4,'egestas. Aliquam nec enim. Nunc','Julie de Andrade','integer.sem.elit@yahoo.ca'),
        (76,33,2,'nisi sem semper erat, in','Merritt Garcia','rutrum.justo@google.couk'),
        (84,60,4,'consectetuer rhoncus. Nullam velit dui,','Alden Bento','egestas.aliquam@icloud.com'),
        (63,31,5,'sodales at, velit. Pellentesque ultricies','Cassady Muniz','vulputate.eu@protonmail.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (16,3,5,'nec, diam. Duis mi enim,','Caleb dos Anjos','arcu.sed@yahoo.ca'),
        (21,67,3,'amet diam eu dolor egestas','Harding Marinho','eu.dolor.egestas@outlook.com'),
        (90,42,4,'ipsum dolor sit amet, consectetuer','Anthony de Moura','lobortis.ultrices@outlook.org'),
        (83,18,4,'orci. Donec nibh. Quisque nonummy','Honorato Alves','sem.semper@yahoo.ca'),
        (14,49,2,'dolor. Fusce feugiat. Lorem ipsum','Eve Aparecido','elit.fermentum@yahoo.edu'),
        (79,70,2,'ante dictum cursus. Nunc mauris','Angela Martins','risus.varius.orci@hotmail.ca'),
        (15,46,1,'Maecenas libero est, congue a,','Elvis da Rosa','id.magna.et@outlook.edu'),
        (90,58,1,'ligula. Aenean gravida nunc sed','Cairo Moraes','aliquam.tincidunt@outlook.org'),
        (57,31,5,'magnis dis parturient montes, nascetur','Galena Mariano','nascetur.ridiculus@outlook.couk'),
        (78,62,1,'In scelerisque scelerisque dui. Suspendisse','Sharon Lima','vel.lectus@outlook.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (60,8,1,'sodales elit erat vitae risus.','Faith Bispo','malesuada.vel@aol.com'),
        (86,62,3,'diam nunc, ullamcorper eu, euismod','Chadwick Franca','vitae@outlook.couk'),
        (93,9,4,'euismod urna. Nullam lobortis quam','Amy Amorim','venenatis.vel.faucibus@aol.net'),
        (67,42,3,'a, enim. Suspendisse aliquet, sem','Nissim Sales','eget.magna@aol.ca'),
        (1,62,3,'nostra, per inceptos hymenaeos. Mauris','Yuri Freire','risus@hotmail.couk'),
        (26,29,2,'at sem molestie sodales. Mauris','Lev Bezerra','rhoncus.donec@yahoo.net'),
        (47,12,1,'Cras vehicula aliquet libero. Integer','Irma Neves','nam.consequat@icloud.edu'),
        (94,18,3,'semper cursus. Integer mollis. Integer','Malachi Peixoto','luctus.et@yahoo.couk'),
        (25,14,3,'neque. Nullam ut nisi a','Rae Franco','non.justo.proin@icloud.couk'),
        (59,12,4,'eu augue porttitor interdum. Sed','Summer da Cruz','neque.non@icloud.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (70,57,2,'Lorem ipsum dolor sit amet,','Wyatt Teixeira','ante.lectus@aol.ca'),
        (13,61,2,'Quisque tincidunt pede ac urna.','Tasha Dias','ut@icloud.edu'),
        (62,23,2,'ipsum primis in faucibus orci','Mollie Melo','malesuada.fringilla.est@icloud.com'),
        (53,59,4,'commodo ipsum. Suspendisse non leo.','Brady Mendonca','non@aol.edu'),
        (70,13,5,'rutrum magna. Cras convallis convallis','Hu Moura','commodo.tincidunt@aol.edu'),
        (98,22,5,'mauris sit amet lorem semper','Rajah Simoes','mauris.erat@google.net'),
        (30,10,4,'ipsum dolor sit amet, consectetuer','Kristen Teixeira','dis.parturient@icloud.ca'),
        (63,4,5,'et netus et malesuada fames','Elton Bento','lacus.quisque@hotmail.edu'),
        (89,44,4,'et, rutrum non, hendrerit id,','Cooper Pinheiro','fermentum.fermentum@hotmail.edu'),
        (64,18,2,'a, arcu. Sed et libero.','Melanie Amaral','molestie.arcu@outlook.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (20,17,1,'non, lacinia at, iaculis quis,','Ian Cabral','non.leo@icloud.edu'),
        (28,28,4,'libero. Morbi accumsan laoreet ipsum.','Dominic dos Santos','vestibulum.ut@icloud.net'),
        (40,53,1,'rhoncus. Proin nisl sem, consequat','Alika Guimaraes','tellus.lorem.eu@outlook.net'),
        (11,17,3,'eget, volutpat ornare, facilisis eget,','Fritz Fagundes','dictum.cursus@aol.ca'),
        (72,51,1,'Fusce mi lorem, vehicula et,','Coby Galdino','interdum.enim.non@outlook.couk'),
        (2,29,4,'imperdiet ornare. In faucibus. Morbi','Driscoll Marques','non.hendrerit@hotmail.ca'),
        (2,20,2,'tellus eu augue porttitor interdum.','Dustin de Abreu','arcu.morbi@protonmail.org'),
        (52,7,4,'lorem lorem, luctus ut, pellentesque','Daquan Miranda','sed.nulla@yahoo.net'),
        (64,62,3,'egestas a, scelerisque sed, sapien.','Jasper Guimaraes','metus@google.couk'),
        (38,37,3,'ut mi. Duis risus odio,','Mollie Candido','egestas.ligula@icloud.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (38,7,4,'nulla at sem molestie sodales.','Aiko Marques','dictum.phasellus.in@outlook.couk'),
        (44,4,2,'ipsum primis in faucibus orci','Hamilton Bezerra','lectus@hotmail.edu'),
        (98,55,2,'metus facilisis lorem tristique aliquet.','Walker de Lourdes','ut.mi@protonmail.org'),
        (10,62,3,'risus odio, auctor vitae, aliquet','Ivy Matias','consectetuer.euismod@protonmail.com'),
        (87,12,3,'libero lacus, varius et, euismod','Blossom Trindade','sit@google.couk'),
        (55,49,1,'adipiscing fringilla, porttitor vulputate, posuere','Ezra Azevedo','suspendisse.aliquet@hotmail.com'),
        (36,50,2,'Cras lorem lorem, luctus ut,','Neve Trindade','curae@protonmail.couk'),
        (84,20,5,'mauris. Integer sem elit, pharetra','Bianca Santos','risus.in@yahoo.ca'),
        (71,16,3,'nunc nulla vulputate dui, nec','Kameko Pinheiro','ipsum.ac@yahoo.net'),
        (84,9,4,'varius ultrices, mauris ipsum porta','Xyla Gomes','lorem.semper@hotmail.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (3,43,4,'consectetuer, cursus et, magna. Praesent','Elton Viana','nulla@hotmail.net'),
        (9,28,2,'mi lorem, vehicula et, rutrum','Deacon Das Dores','rhoncus.nullam@protonmail.edu'),
        (29,6,3,'Cras pellentesque. Sed dictum. Proin','Rachel da Conceiçao','morbi@aol.couk'),
        (68,2,1,'ipsum ac mi eleifend egestas.','Alexander Cunha','aliquam.arcu@yahoo.ca'),
        (56,66,1,'malesuada fames ac turpis egestas.','Lael Pinheiro','orci.adipiscing.non@yahoo.ca'),
        (28,26,4,'id enim. Curabitur massa. Vestibulum','Troy Das Gracas','phasellus.ornare@outlook.couk'),
        (42,12,1,'orci, consectetuer euismod est arcu','Martha Barreto','dictum.magna@outlook.org'),
        (80,22,2,'imperdiet dictum magna. Ut tincidunt','Gregory Moura','rutrum.justo@protonmail.com'),
        (16,13,1,'quis, tristique ac, eleifend vitae,','Jakeem Nogueira','donec.dignissim@outlook.org'),
        (89,10,3,'nec, leo. Morbi neque tellus,','Yoshi Diniz','malesuada.fames.ac@yahoo.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (55,14,4,'ac sem ut dolor dapibus','Walker Antunes','a.purus.duis@aol.ca'),
        (3,63,5,'dolor egestas rhoncus. Proin nisl','Nicholas Feitosa','aenean.sed@yahoo.org'),
        (80,55,4,'Fusce mi lorem, vehicula et,','Breanna de Azevedo','per.conubia.nostra@google.couk'),
        (83,54,4,'libero at auctor ullamcorper, nisl','Gareth Mendonca','donec.sollicitudin@aol.couk'),
        (98,30,2,'non, sollicitudin a, malesuada id,','Janna Mendonca','morbi.sit@icloud.com'),
        (29,37,3,'sem ut dolor dapibus gravida.','Demetrius Leal','phasellus@protonmail.ca'),
        (58,69,4,'vestibulum, neque sed dictum eleifend,','Hayden Campos','cursus.et@protonmail.net'),
        (34,5,4,'neque tellus, imperdiet non, vestibulum','Meghan da Rosa','tellus.lorem.eu@aol.couk'),
        (91,58,3,'ultricies sem magna nec quam.','Shelley Freitas','sed@hotmail.com'),
        (36,32,3,'massa non ante bibendum ullamcorper.','Evelyn dos Reis','quis.pede.praesent@yahoo.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (31,57,2,'convallis convallis dolor. Quisque tincidunt','Lev Das Neves','eget.metus.eu@icloud.com'),
        (8,24,1,'a, auctor non, feugiat nec,','Ashely Carvalho','non.enim@aol.org'),
        (36,26,1,'amet, consectetuer adipiscing elit. Etiam','Astra Sántos','lacus.pede@yahoo.ca'),
        (91,26,4,'sem egestas blandit. Nam nulla','Elvis Maia','ipsum@outlook.edu'),
        (38,21,3,'quam. Curabitur vel lectus. Cum','Ignatius Vaz','cursus.vestibulum@yahoo.com'),
        (99,11,4,'a sollicitudin orci sem eget','Silas Gomes','vulputate.ullamcorper@outlook.net'),
        (52,9,5,'arcu. Vestibulum ante ipsum primis','Mariam Paiva','dapibus.rutrum@yahoo.net'),
        (39,39,5,'Duis mi enim, condimentum eget,','Karen Duarte','erat.sed@google.net'),
        (55,49,5,'magna. Nam ligula elit, pretium','Colin Domingos','neque.sed@outlook.ca'),
        (45,28,5,'Nam nulla magna, malesuada vel,','Rosalyn Galdino','velit@aol.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (56,18,3,'nonummy. Fusce fermentum fermentum arcu.','Sade Bezerra','phasellus.vitae@icloud.org'),
        (55,55,3,'Nullam vitae diam. Proin dolor.','Paki Dantas','ullamcorper.nisl.arcu@hotmail.org'),
        (36,57,3,'orci, adipiscing non, luctus sit','Kuame Teodoro','proin.mi@protonmail.com'),
        (64,41,4,'congue turpis. In condimentum. Donec','Jared Vasconcelos','ligula.nullam@hotmail.ca'),
        (65,18,4,'elit, a feugiat tellus lorem','Dolan Oliveira','nulla.integer.vulputate@icloud.ca'),
        (78,25,1,'at, egestas a, scelerisque sed,','Zenia Antunes','velit.sed@yahoo.org'),
        (94,11,3,'et arcu imperdiet ullamcorper. Duis','Neville Cruz','sociis.natoque.penatibus@yahoo.com'),
        (10,28,2,'Sed id risus quis diam','Kirsten Miranda','gravida.mauris.ut@yahoo.com'),
        (34,55,2,'semper auctor. Mauris vel turpis.','Calista Ribeiro','sed@protonmail.net'),
        (91,42,2,'diam dictum sapien. Aenean massa.','Thor Oliveira','aliquam.eu@icloud.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (77,36,4,'semper rutrum. Fusce dolor quam,','Audra Diniz','sit@protonmail.net'),
        (1,46,4,'sit amet, consectetuer adipiscing elit.','Echo Medeiros','ipsum.sodales.purus@protonmail.net'),
        (17,60,4,'Nunc laoreet lectus quis massa.','Aladdin Teodoro','in@hotmail.ca'),
        (34,55,1,'hymenaeos. Mauris ut quam vel','Shoshana Menezes','mus.proin.vel@hotmail.net'),
        (14,15,2,'Phasellus ornare. Fusce mollis. Duis','Linus Dutra','dolor.sit@icloud.couk'),
        (63,38,3,'Sed eu nibh vulputate mauris','Joy de Campos','cursus@google.edu'),
        (39,61,2,'nulla vulputate dui, nec tempus','Neil Sampaio','nullam.lobortis.quam@yahoo.couk'),
        (20,23,5,'nunc id enim. Curabitur massa.','Quinn de Lourdes','quis@aol.ca'),
        (60,66,1,'aliquam eros turpis non enim.','Octavius Chagas','posuere.cubilia@hotmail.org'),
        (11,10,1,'augue, eu tempor erat neque','Kaseem Ferreira','pretium.aliquet@icloud.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (97,24,4,'semper auctor. Mauris vel turpis.','Raymond Leite','nonummy@icloud.edu'),
        (86,21,4,'rutrum urna, nec luctus felis','Chaim Pinheiro','porta.elit@icloud.net'),
        (81,67,3,'imperdiet non, vestibulum nec, euismod','Daryl Duarte','luctus.lobortis@hotmail.couk'),
        (42,57,3,'at lacus. Quisque purus sapien,','Cullen Feitosa','hendrerit.a@icloud.net'),
        (89,34,2,'id, erat. Etiam vestibulum massa','Jasper Dias','nibh.quisque@google.com'),
        (34,15,4,'magna sed dui. Fusce aliquam,','Lareina Sousa','nisi.magna@hotmail.com'),
        (34,9,2,'malesuada vel, venenatis vel, faucibus','Tanisha de Paula','urna.et@aol.ca'),
        (37,51,4,'semper erat, in consectetuer ipsum','Laura Carneiro','est@hotmail.ca'),
        (31,58,5,'eleifend egestas. Sed pharetra, felis','Dahlia Torres','ornare.lectus.ante@icloud.org'),
        (90,59,3,'dis parturient montes, nascetur ridiculus','Ella Camargo','eget.laoreet@protonmail.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (89,63,2,'risus a ultricies adipiscing, enim','Honorato Miranda','orci.lacus@protonmail.edu'),
        (88,4,2,'Cras sed leo. Cras vehicula','Harding Chagas','lobortis.nisi.nibh@yahoo.com'),
        (96,35,3,'enim diam vel arcu. Curabitur','Erica Rodrigues','magna.sed@aol.ca'),
        (44,39,3,'orci. Donec nibh. Quisque nonummy','Ariana Andrade','per.inceptos@aol.org'),
        (100,62,4,'vel, venenatis vel, faucibus id,','Erich Inacio','bibendum.fermentum@aol.ca'),
        (46,26,3,'Nullam suscipit, est ac facilisis','Shannon Soares','at.pretium@yahoo.couk'),
        (86,53,2,'risus. In mi pede, nonummy','Pearl Dantas','risus@yahoo.ca'),
        (24,7,4,'ullamcorper. Duis cursus, diam at','Hilary Leite','sapien.imperdiet.ornare@outlook.com'),
        (62,17,3,'Mauris vel turpis. Aliquam adipiscing','Rhea Simoes','class.aptent@hotmail.couk'),
        (4,45,2,'Sed molestie. Sed id risus','Maxwell Soares','congue.in@yahoo.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (73,17,4,'euismod est arcu ac orci.','Kathleen Mota','convallis.in@google.com'),
        (49,40,4,'dolor, tempus non, lacinia at,','Lionel Rocha','aenean.egestas@icloud.edu'),
        (57,25,5,'quam. Curabitur vel lectus. Cum','Carolyn de Assis','nec.ante@hotmail.edu'),
        (61,36,3,'natoque penatibus et magnis dis','Laura Barboza','tellus.lorem@aol.net'),
        (52,28,4,'Integer eu lacus. Quisque imperdiet,','Echo Cordeiro','cursus@yahoo.couk'),
        (61,53,3,'consequat enim diam vel arcu.','Eugenia Coelho','imperdiet.dictum@aol.net'),
        (40,53,1,'egestas nunc sed libero. Proin','Emery Farias','non.ante@protonmail.edu'),
        (51,4,3,'elit. Aliquam auctor, velit eget','Karyn Cabral','augue.sed@protonmail.com'),
        (1,59,2,'lectus ante dictum mi, ac','Arsenio Henrique','eros.nec@protonmail.ca'),
        (57,54,2,'lacus. Etiam bibendum fermentum metus.','Hanae Viana','ut.lacus.nulla@google.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (77,15,2,'eros nec tellus. Nunc lectus','Yuli Reis','arcu.eu@google.edu'),
        (39,27,3,'feugiat nec, diam. Duis mi','Flynn Guedes','lorem.semper@google.org'),
        (50,38,2,'Fusce aliquam, enim nec tempus','Iliana Silveira','malesuada@hotmail.couk'),
        (28,23,4,'ultricies sem magna nec quam.','Lawrence Pereira','at.auctor.ullamcorper@google.org'),
        (71,22,5,'Donec luctus aliquet odio. Etiam','Glenna Souza','suspendisse@google.ca'),
        (33,28,2,'a, aliquet vel, vulputate eu,','Mari Marinho','urna@protonmail.ca'),
        (6,52,5,'scelerisque sed, sapien. Nunc pulvinar','Iris Carneiro','nam.ligula@icloud.ca'),
        (50,50,5,'Etiam laoreet, libero et tristique','Bruce da Cunha','natoque.penatibus@protonmail.org'),
        (33,68,2,'odio tristique pharetra. Quisque ac','Reese Morais','suspendisse.dui@protonmail.net'),
        (32,53,2,'vel, mauris. Integer sem elit,','Addison de Lima','tellus.id@google.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (92,27,2,'porttitor scelerisque neque. Nullam nisl.','Reuben Bispo','integer.id@icloud.ca'),
        (86,17,2,'malesuada fames ac turpis egestas.','Raphael Cabral','nullam.velit@icloud.edu'),
        (13,48,3,'Suspendisse sed dolor. Fusce mi','Jelani Maciel','eu.nibh.vulputate@aol.org'),
        (55,61,1,'inceptos hymenaeos. Mauris ut quam','Darrel Pires','semper@outlook.net'),
        (40,60,5,'sed, est. Nunc laoreet lectus','Zenia Das Neves','quisque.libero@hotmail.org'),
        (97,46,3,'ipsum ac mi eleifend egestas.','Erica Amaral','semper.rutrum.fusce@google.ca'),
        (20,9,3,'eu, accumsan sed, facilisis vitae,','Jenette de Paula','consectetuer.mauris@google.com'),
        (62,42,4,'tempor augue ac ipsum. Phasellus','Quemby de Araujo','malesuada.malesuada@hotmail.ca'),
        (79,44,4,'dolor dapibus gravida. Aliquam tincidunt,','Carl Simoes','ullamcorper.nisl@icloud.edu'),
        (49,36,4,'sem eget massa. Suspendisse eleifend.','Tarik da Silveira','faucibus.lectus.a@icloud.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (12,51,4,'magnis dis parturient montes, nascetur','Sylvia Melo','duis.risus.odio@outlook.edu'),
        (52,60,1,'montes, nascetur ridiculus mus. Proin','Cynthia Farias','donec.porttitor@outlook.edu'),
        (33,42,5,'ultrices. Duis volutpat nunc sit','Harper Menezes','eleifend@yahoo.com'),
        (23,18,3,'sapien molestie orci tincidunt adipiscing.','Ashely Bispo','tellus@outlook.couk'),
        (46,57,2,'erat eget ipsum. Suspendisse sagittis.','Jack Carneiro','ornare.placerat@outlook.net'),
        (71,40,2,'varius orci, in consequat enim','Melvin Leite','dictum.eleifend@yahoo.net'),
        (38,42,2,'diam dictum sapien. Aenean massa.','India da Cunha','euismod.est.arcu@icloud.net'),
        (60,59,3,'Proin non massa non ante','Otto de Freitas','neque@hotmail.edu'),
        (21,20,1,'rhoncus id, mollis nec, cursus','Chava dos Santos','blandit.congue@protonmail.edu'),
        (67,28,2,'mauris sit amet lorem semper','Melinda Sales','orci.consectetuer@protonmail.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (57,43,2,'elementum purus, accumsan interdum libero','Unity Sampaio','felis@outlook.net'),
        (32,37,2,'Proin mi. Aliquam gravida mauris','Kenyon Braz','sem.molestie@google.net'),
        (10,41,4,'id nunc interdum feugiat. Sed','Paki Marques','phasellus.dapibus.quam@yahoo.com'),
        (6,24,2,'adipiscing. Mauris molestie pharetra nibh.','Kelsey Bastos','magna.a@icloud.ca'),
        (95,7,1,'nunc sed pede. Cum sociis','Erica dos Anjos','class.aptent@yahoo.edu'),
        (62,46,2,'In mi pede, nonummy ut,','Reed Sousa','nisi.nibh@protonmail.org'),
        (37,7,3,'orci quis lectus. Nullam suscipit,','Barry de Matos','ullamcorper.duis@icloud.org'),
        (48,67,4,'lectus pede et risus. Quisque','Julian Castro','augue.id@hotmail.com'),
        (10,47,2,'Etiam ligula tortor, dictum eu,','Len Paiva','odio.a.purus@google.net'),
        (39,60,5,'Nam porttitor scelerisque neque. Nullam','Kalia Pereira','vestibulum@icloud.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (59,9,2,'non, bibendum sed, est. Nunc','Debra Custodio','et.euismod@protonmail.edu'),
        (14,18,1,'Duis gravida. Praesent eu nulla','Howard de Jesus','semper.dui@yahoo.net'),
        (51,40,1,'Cras eu tellus eu augue','Evan Muniz','quam@icloud.couk'),
        (13,7,1,'pharetra, felis eget varius ultrices,','Dustin Bento','feugiat@yahoo.edu'),
        (31,6,4,'nulla. Integer vulputate, risus a','Orson Bento','orci@hotmail.couk'),
        (69,60,2,'cursus purus. Nullam scelerisque neque','Ali da Silveira','pellentesque.ut@hotmail.com'),
        (55,14,4,'dolor. Quisque tincidunt pede ac','Hanae Maia','semper@google.edu'),
        (7,23,1,'enim. Etiam imperdiet dictum magna.','Hadassah da Conceiçao','velit@aol.ca'),
        (75,6,3,'elit elit fermentum risus, at','Geoffrey Carvalho','augue.sed.molestie@outlook.edu'),
        (4,41,4,'Quisque nonummy ipsum non arcu.','Aquila Martins','a.purus@outlook.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (91,12,5,'Morbi neque tellus, imperdiet non,','Tamara Batista','pharetra.quisque@icloud.net'),
        (11,50,3,'Fusce mollis. Duis sit amet','Eugenia Monteiro','magnis@icloud.edu'),
        (2,6,4,'pede, nonummy ut, molestie in,','Evan Silva','arcu.vestibulum@google.edu'),
        (41,65,5,'Donec est mauris, rhoncus id,','Tatyana Mendonca','natoque.penatibus@outlook.net'),
        (67,34,2,'consectetuer euismod est arcu ac','Thomas Amaral','donec.tincidunt@google.edu'),
        (48,20,3,'magna sed dui. Fusce aliquam,','Audrey da Rosa','quis@hotmail.couk'),
        (67,3,2,'Nunc sed orci lobortis augue','Zorita Campos','volutpat@icloud.ca'),
        (33,43,4,'quis urna. Nunc quis arcu','Kelsie Dantas','auctor.vitae.aliquet@outlook.edu'),
        (100,13,2,'In condimentum. Donec at arcu.','Cheyenne Pinto','iaculis.enim.sit@icloud.org'),
        (6,29,3,'Suspendisse aliquet molestie tellus. Aenean','Lois Moura','lorem.donec@aol.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (87,14,2,'libero. Integer in magna. Phasellus','Benedict Braga','tincidunt@aol.ca'),
        (20,63,4,'turpis egestas. Fusce aliquet magna','Stewart Maia','nam.consequat@google.org'),
        (52,24,2,'at, egestas a, scelerisque sed,','Nathaniel da Silveira','eu.dui@yahoo.org'),
        (68,23,4,'Donec dignissim magna a tortor.','Florence de Andrade','nec.quam.curabitur@protonmail.couk'),
        (22,20,4,'Praesent eu dui. Cum sociis','Nyssa de Campos','libero.mauris@outlook.net'),
        (29,49,1,'consequat nec, mollis vitae, posuere','Damian Rezende','fusce.fermentum@yahoo.org'),
        (67,11,2,'id, mollis nec, cursus a,','Howard de Campos','arcu.et@google.net'),
        (29,33,1,'eu, eleifend nec, malesuada ut,','TaShya Leal','hendrerit.consectetuer@yahoo.org'),
        (31,23,3,'pellentesque, tellus sem mollis dui,','Chancellor Torres','varius@yahoo.ca'),
        (29,24,4,'Cras dolor dolor, tempus non,','Stuart Pinheiro','purus@icloud.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (29,34,2,'Vivamus non lorem vitae odio','Victor Henrique','ante.ipsum@yahoo.net'),
        (94,37,5,'Mauris eu turpis. Nulla aliquet.','Virginia Gonçalves','donec.feugiat.metus@aol.org'),
        (61,66,3,'quis turpis vitae purus gravida','Derek Silva','sed@yahoo.org'),
        (86,28,4,'iaculis aliquet diam. Sed diam','Xyla Vieira','tellus.non@google.couk'),
        (64,6,2,'Mauris vel turpis. Aliquam adipiscing','Tyrone Menezes','convallis.in@yahoo.com'),
        (93,61,2,'quis diam. Pellentesque habitant morbi','Eleanor Inacio','accumsan.convallis.ante@google.ca'),
        (20,12,4,'nunc. Quisque ornare tortor at','Brenden Muniz','leo.elementum@hotmail.org'),
        (83,14,1,'turpis nec mauris blandit mattis.','Madeline de Matos','mattis.ornare.lectus@outlook.edu'),
        (96,9,3,'rutrum magna. Cras convallis convallis','Kieran Dantas','egestas.nunc@protonmail.org'),
        (3,35,4,'a sollicitudin orci sem eget','Hedy Figueiredo','fusce@outlook.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (75,59,5,'quam dignissim pharetra. Nam ac','Hop de Fatima','aliquam.enim@hotmail.ca'),
        (37,29,5,'vehicula. Pellentesque tincidunt tempus risus.','Grady Carvalho','nam.tempor@protonmail.com'),
        (47,31,4,'sed, facilisis vitae, orci. Phasellus','Quintessa Ferreira','mauris.aliquam@icloud.net'),
        (42,54,4,'arcu. Vivamus sit amet risus.','Anthony de Andrade','ligula.nullam@icloud.org'),
        (50,15,5,'quis, pede. Suspendisse dui. Fusce','Nelle Cardoso','et@yahoo.ca'),
        (60,2,4,'fringilla, porttitor vulputate, posuere vulputate,','Mercedes Trindade','turpis@aol.couk'),
        (60,18,2,'eu, euismod ac, fermentum vel,','Sade Galdino','lobortis.ultrices@outlook.com'),
        (84,69,5,'mauris sapien, cursus in, hendrerit','Bertha Camargo','egestas.blandit.nam@outlook.ca'),
        (31,58,3,'ut lacus. Nulla tincidunt, neque','Amber Franco','nullam.feugiat.placerat@aol.edu'),
        (73,36,4,'In mi pede, nonummy ut,','Jamalia de Moura','vestibulum@outlook.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (49,30,2,'eu erat semper rutrum. Fusce','Griffith Santiago','eros.turpis@aol.couk'),
        (96,4,5,'adipiscing ligula. Aenean gravida nunc','Adam Nascimento','at@google.com'),
        (77,62,3,'malesuada id, erat. Etiam vestibulum','Tatiana Braga','iaculis@google.net'),
        (98,30,3,'diam. Pellentesque habitant morbi tristique','Kenyon Henrique','eget.massa.suspendisse@hotmail.com'),
        (78,20,3,'tempus non, lacinia at, iaculis','Barclay Paiva','ornare@icloud.edu'),
        (70,21,3,'rhoncus. Donec est. Nunc ullamcorper,','Matthew Farias','proin.dolor.nulla@icloud.ca'),
        (79,10,3,'sem mollis dui, in sodales','John Barreto','duis@outlook.com'),
        (75,29,2,'amet ultricies sem magna nec','Justina Fonseca','velit.eu.sem@outlook.couk'),
        (49,33,1,'ornare, facilisis eget, ipsum. Donec','Imani de Castro','nisi@protonmail.ca'),
        (85,55,3,'faucibus orci luctus et ultrices','Chloe Matos','sem@hotmail.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (89,65,2,'diam nunc, ullamcorper eu, euismod','Russell de Campos','lacus@google.com'),
        (46,54,2,'mauris, rhoncus id, mollis nec,','Byron Teixeira','nunc.sit.amet@hotmail.ca'),
        (37,11,2,'suscipit nonummy. Fusce fermentum fermentum','Germaine Cardoso','sit.amet@aol.org'),
        (5,23,3,'sed turpis nec mauris blandit','Serina dos Anjos','lobortis.quam@protonmail.couk'),
        (61,59,2,'pretium neque. Morbi quis urna.','Calvin da Luz','curae.phasellus.ornare@outlook.com'),
        (76,15,3,'nascetur ridiculus mus. Aenean eget','Yoshio Barboza','et@google.com'),
        (17,66,3,'auctor. Mauris vel turpis. Aliquam','Octavius Coelho','enim.curabitur@google.net'),
        (71,25,4,'facilisis vitae, orci. Phasellus dapibus','Warren de Melo','per.conubia.nostra@yahoo.ca'),
        (87,22,2,'vestibulum, neque sed dictum eleifend,','Shannon de Freitas','nonummy.fusce@outlook.edu'),
        (56,59,3,'pellentesque massa lobortis ultrices. Vivamus','Beatrice Lima','turpis.vitae@icloud.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (100,57,3,'luctus et ultrices posuere cubilia','Cole Domingos','curabitur@yahoo.couk'),
        (19,63,3,'nunc sit amet metus. Aliquam','Colby Moreira','morbi.non@google.ca'),
        (69,68,2,'turpis egestas. Aliquam fringilla cursus','Julie de Campos','pede.blandit.congue@outlook.org'),
        (12,62,3,'eget varius ultrices, mauris ipsum','Shelly Santana','mauris@aol.ca'),
        (92,37,3,'dictum eleifend, nunc risus varius','Hadley Mendonca','aliquet.phasellus.fermentum@protonmail.couk'),
        (18,18,4,'Donec feugiat metus sit amet','Jelani Correa','etiam@hotmail.edu'),
        (45,17,4,'a, scelerisque sed, sapien. Nunc','Olympia de Brito','mus.proin@hotmail.com'),
        (85,20,2,'ipsum primis in faucibus orci','Liberty Trindade','velit@google.org'),
        (84,56,5,'bibendum sed, est. Nunc laoreet','Callie Inacio','vel.arcu.curabitur@aol.edu'),
        (31,34,4,'dapibus id, blandit at, nisi.','Idona Chagas','turpis@protonmail.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (33,56,1,'fermentum risus, at fringilla purus','Neve Guimaraes','diam.pellentesque@google.org'),
        (16,1,4,'dolor, nonummy ac, feugiat non,','Kaye Alves','enim@icloud.com'),
        (40,27,4,'scelerisque scelerisque dui. Suspendisse ac','Genevieve Barboza','pharetra.nibh@google.couk'),
        (45,56,4,'lectus ante dictum mi, ac','Zachary Moraes','orci.consectetuer@outlook.com'),
        (98,7,5,'orci lobortis augue scelerisque mollis.','Urielle Felix','ut.tincidunt.vehicula@protonmail.net'),
        (66,39,4,'faucibus id, libero. Donec consectetuer','Yoshio de Oliveira','ornare.placerat.orci@aol.edu'),
        (14,41,2,'est ac mattis semper, dui','Joseph Guimaraes','sit@outlook.org'),
        (55,8,1,'ac, eleifend vitae, erat. Vivamus','Ali Marinho','morbi.tristique@aol.org'),
        (85,46,4,'Cras vehicula aliquet libero. Integer','Wesley Figueiredo','lobortis@icloud.org'),
        (30,64,2,'purus ac tellus. Suspendisse sed','Beck Antunes','et.euismod.et@icloud.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (15,4,1,'auctor velit. Aliquam nisl. Nulla','Bruce Paiva','quam.a@outlook.com'),
        (45,33,4,'Fusce aliquam, enim nec tempus','Griffin Coutinho','arcu.sed@google.edu'),
        (87,6,3,'sodales at, velit. Pellentesque ultricies','Illiana Marques','ante.bibendum.ullamcorper@hotmail.couk'),
        (42,35,3,'auctor quis, tristique ac, eleifend','Devin Braga','enim.gravida.sit@protonmail.org'),
        (26,40,4,'eget nisi dictum augue malesuada','Hilda Ferraz','ultricies.sem@icloud.edu'),
        (90,10,5,'cursus a, enim. Suspendisse aliquet,','Vera dos Anjos','curabitur.ut@icloud.net'),
        (39,20,4,'Integer tincidunt aliquam arcu. Aliquam','Herman Vasconcelos','diam.lorem@outlook.com'),
        (97,34,3,'blandit. Nam nulla magna, malesuada','Asher Faria','nascetur.ridiculus@google.com'),
        (95,65,2,'mauris sagittis placerat. Cras dictum','Joelle Dantas','eu.elit.nulla@icloud.net'),
        (18,64,2,'est. Nunc laoreet lectus quis','Nicole Pacheco','nec.ante@google.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (74,20,4,'amet nulla. Donec non justo.','Castor Rezende','eget.ipsum@aol.org'),
        (24,64,3,'Curae Donec tincidunt. Donec vitae','Hilel Santiago','consectetuer.mauris@yahoo.com'),
        (10,19,3,'vulputate, posuere vulputate, lacus. Cras','Riley Ferreira','pede.blandit@protonmail.net'),
        (99,37,2,'magna a neque. Nullam ut','Theodore de Moraes','fusce.feugiat.lorem@yahoo.couk'),
        (84,9,4,'turpis vitae purus gravida sagittis.','Amir Rodrigues','non.dapibus@aol.couk'),
        (48,8,4,'ligula. Nullam feugiat placerat velit.','Dustin Diniz','et.nunc@yahoo.net'),
        (34,2,2,'suscipit nonummy. Fusce fermentum fermentum','Macey da Silveira','eget.laoreet.posuere@outlook.couk'),
        (14,17,4,'purus gravida sagittis. Duis gravida.','Lydia Medeiros','scelerisque.scelerisque@outlook.couk'),
        (87,50,5,'vel quam dignissim pharetra. Nam','Clark dos Reis','mauris.sagittis@protonmail.couk'),
        (29,19,3,'pede. Nunc sed orci lobortis','Jocelyn Martins','non@protonmail.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (41,46,3,'Suspendisse sed dolor. Fusce mi','Trevor Pinto','vel@protonmail.couk'),
        (52,34,4,'ultrices a, auctor non, feugiat','Wallace Galdino','dui.quis@outlook.com'),
        (68,28,3,'Donec elementum, lorem ut aliquam','Cedric Braga','odio.a.purus@hotmail.net'),
        (9,47,1,'primis in faucibus orci luctus','Blythe Simoes','lorem.donec@google.ca'),
        (99,52,4,'Vivamus non lorem vitae odio','Andrew Felix','mauris.a.nunc@protonmail.ca'),
        (68,61,4,'tristique senectus et netus et','Evan Figueiredo','et@aol.net'),
        (69,63,4,'auctor non, feugiat nec, diam.','Meghan Rezende','pede.nonummy@icloud.com'),
        (9,56,3,'quam a felis ullamcorper viverra.','Minerva Garcia','sed.pede@yahoo.couk'),
        (59,15,4,'sem eget massa. Suspendisse eleifend.','Hall Amaral','sagittis.lobortis.mauris@yahoo.ca'),
        (26,7,3,'libero. Proin mi. Aliquam gravida','Rebecca Dantas','donec@icloud.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (42,15,2,'euismod enim. Etiam gravida molestie','Mariko Gonzaga','justo.proin.non@aol.org'),
        (98,28,1,'lacus. Quisque purus sapien, gravida','Rebekah Matias','quis@protonmail.org'),
        (86,36,3,'nulla at sem molestie sodales.','Darius Almeida','magna@yahoo.com'),
        (13,51,2,'nisl elementum purus, accumsan interdum','Ira Cabral','consectetuer.mauris@aol.edu'),
        (26,44,3,'ultrices. Vivamus rhoncus. Donec est.','Austin Gomes','euismod.enim.etiam@google.org'),
        (71,17,4,'dis parturient montes, nascetur ridiculus','Jacqueline Guedes','elementum.sem@protonmail.ca'),
        (2,13,3,'at fringilla purus mauris a','Oscar de Paula','amet.metus@icloud.net'),
        (77,13,1,'eu, odio. Phasellus at augue','Lisandra Queiroz','porttitor.tellus.non@protonmail.com'),
        (28,34,4,'ac arcu. Nunc mauris. Morbi','Brennan Messias','in.at@aol.net'),
        (14,53,2,'velit egestas lacinia. Sed congue,','Nolan Castro','integer.vulputate@icloud.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (35,57,3,'erat vel pede blandit congue.','Adam Santiago','non.luctus@aol.com'),
        (31,26,5,'nisi. Cum sociis natoque penatibus','Sebastian Dantas','id@aol.ca'),
        (28,57,5,'auctor, velit eget laoreet posuere,','Fritz Tavares','neque.sed.sem@aol.couk'),
        (34,54,4,'dictum eu, placerat eget, venenatis','Nathaniel Custodio','mauris.erat.eget@google.org'),
        (56,42,2,'Nulla interdum. Curabitur dictum. Phasellus','Kenyon Trindade','dui.semper.et@hotmail.org'),
        (65,42,3,'cursus purus. Nullam scelerisque neque','Stacy Muniz','cursus.vestibulum@protonmail.org'),
        (5,30,1,'et risus. Quisque libero lacus,','Marny Melo','ipsum.suspendisse@icloud.couk'),
        (94,45,3,'Cras interdum. Nunc sollicitudin commodo','Aidan Macedo','ac.arcu@yahoo.com'),
        (71,5,1,'tellus eu augue porttitor interdum.','Myles Brito','turpis@yahoo.couk'),
        (36,1,5,'vulputate eu, odio. Phasellus at','Priscilla Maia','aliquam.erat@outlook.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (14,48,2,'hendrerit consectetuer, cursus et, magna.','Tasha Camargo','risus.a@yahoo.net'),
        (14,11,3,'massa lobortis ultrices. Vivamus rhoncus.','Breanna Firmino','adipiscing.lacus@google.org'),
        (49,45,1,'non, feugiat nec, diam. Duis','Byron Camargo','vitae.aliquam@outlook.edu'),
        (64,14,5,'libero. Proin sed turpis nec','Melvin Carvalho','nisl@aol.couk'),
        (20,10,5,'laoreet lectus quis massa. Mauris','Josiah Neves','vehicula@hotmail.com'),
        (7,4,4,'amet ante. Vivamus non lorem','Yardley Bezerra','tempor.est.ac@hotmail.edu'),
        (59,55,2,'risus. Nulla eget metus eu','Colton Simoes','scelerisque.neque.nullam@hotmail.ca'),
        (65,20,5,'malesuada vel, venenatis vel, faucibus','Mia Azevedo','ut@outlook.edu'),
        (73,25,4,'magnis dis parturient montes, nascetur','Regina Magalhaes','dictum.mi@aol.couk'),
        (45,24,4,'amet, consectetuer adipiscing elit. Aliquam','Norman Brito','id.enim@aol.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (77,32,2,'dui. Fusce diam nunc, ullamcorper','Derek Inacio','nulla.aliquet.proin@google.ca'),
        (78,43,2,'est. Nunc ullamcorper, velit in','Chanda Mariano','nisl.nulla.eu@yahoo.net'),
        (59,7,2,'ac mattis ornare, lectus ante','Barclay de Carvalho','morbi@icloud.edu'),
        (60,1,5,'Duis mi enim, condimentum eget,','Morgan Sousa','eu.elit.nulla@google.couk'),
        (71,37,3,'tellus faucibus leo, in lobortis','Bree Furtado','sed.nec@protonmail.couk'),
        (34,21,2,'Integer mollis. Integer tincidunt aliquam','Alan da Luz','vitae.purus@yahoo.net'),
        (23,45,4,'sagittis semper. Nam tempor diam','Galena Reis','sed.nec.metus@protonmail.edu'),
        (36,66,3,'ut mi. Duis risus odio,','Katell Moreira','lobortis@aol.net'),
        (10,44,4,'accumsan neque et nunc. Quisque','Hayes Magalhaes','ac@icloud.com'),
        (11,23,5,'augue, eu tempor erat neque','Jayme Pinheiro','auctor@icloud.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (24,28,2,'quis turpis vitae purus gravida','Alec Carvalho','mollis.non@google.edu'),
        (11,16,3,'sed, sapien. Nunc pulvinar arcu','Macey Das Dores','eu.ligula@yahoo.net'),
        (8,65,4,'orci lacus vestibulum lorem, sit','Jane Teixeira','tortor.dictum@yahoo.net'),
        (67,16,2,'id sapien. Cras dolor dolor,','Julie Pinheiro','magna.sed@yahoo.net'),
        (36,10,4,'dui, in sodales elit erat','Daphne Rocha','massa.non@aol.edu'),
        (98,48,1,'felis, adipiscing fringilla, porttitor vulputate,','Elmo de Carvalho','mauris.morbi@hotmail.com'),
        (41,24,1,'pede. Cum sociis natoque penatibus','Jennifer Galdino','nisi@outlook.couk'),
        (51,38,1,'at auctor ullamcorper, nisl arcu','Ahmed Cunha','fringilla.cursus.purus@outlook.edu'),
        (94,46,3,'egestas, urna justo faucibus lectus,','Vladimir Peixoto','sed.orci@icloud.com'),
        (55,53,3,'sem, vitae aliquam eros turpis','Myra Xavier','fringilla@icloud.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (16,36,3,'mauris id sapien. Cras dolor','Xanthus Nogueira','nulla.facilisi@yahoo.couk'),
        (2,5,2,'Nam ligula elit, pretium et,','Levi Torres','adipiscing.elit.etiam@protonmail.edu'),
        (84,23,4,'egestas. Sed pharetra, felis eget','Cameran Diniz','vulputate.velit@hotmail.com'),
        (49,35,3,'lacus. Etiam bibendum fermentum metus.','Gray Marinho','odio.sagittis@aol.net'),
        (73,5,3,'a, malesuada id, erat. Etiam','Lyle Lopes','vestibulum.ut@protonmail.com'),
        (92,54,3,'ligula. Aenean gravida nunc sed','Lesley Santana','ornare@google.edu'),
        (64,30,4,'mauris id sapien. Cras dolor','Raya Figueiredo','nec@icloud.ca'),
        (59,16,2,'felis. Nulla tempor augue ac','Dean Pacheco','sed@yahoo.org'),
        (20,67,1,'eget, volutpat ornare, facilisis eget,','Malachi Rosa','placerat@hotmail.org'),
        (58,22,1,'non, dapibus rutrum, justo. Praesent','Demetrius Pinheiro','eleifend.nunc@aol.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (90,8,4,'lorem, auctor quis, tristique ac,','Robert Felix','id.ante.dictum@hotmail.net'),
        (38,50,1,'risus quis diam luctus lobortis.','Grady da Rocha','blandit@yahoo.edu'),
        (27,14,3,'euismod est arcu ac orci.','Prescott Amaral','duis.ac@outlook.couk'),
        (46,64,4,'Nulla eu neque pellentesque massa','Basil da Silva','ultrices.posuere@aol.org'),
        (57,2,2,'mollis. Duis sit amet diam','Lamar Queiroz','dolor.quisque.tincidunt@protonmail.couk'),
        (25,1,1,'Nullam velit dui, semper et,','Ramona Ferreira','viverra.maecenas.iaculis@yahoo.couk'),
        (44,66,4,'malesuada fringilla est. Mauris eu','Mikayla Figueiredo','luctus.felis@hotmail.org'),
        (25,30,3,'congue a, aliquet vel, vulputate','Kiara Castro','pretium.neque.morbi@yahoo.edu'),
        (64,52,2,'per conubia nostra, per inceptos','Kimberly de Matos','tristique@icloud.ca'),
        (37,20,3,'eget tincidunt dui augue eu','Aaron Marinho','laoreet.lectus@google.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (86,18,5,'Curabitur consequat, lectus sit amet','Victor Fonseca','ut.aliquam@yahoo.couk'),
        (46,19,1,'cursus in, hendrerit consectetuer, cursus','Gillian Pinheiro','magna.sed@outlook.ca'),
        (49,5,4,'Suspendisse sagittis. Nullam vitae diam.','Laurel de Jesus','sapien.aenean.massa@icloud.com'),
        (95,18,4,'facilisis, magna tellus faucibus leo,','Kylan Menezes','non.ante.bibendum@yahoo.com'),
        (65,15,3,'nunc sit amet metus. Aliquam','Kathleen Furtado','convallis@aol.edu'),
        (88,27,4,'lobortis quam a felis ullamcorper','Maris de Sousa','ut.tincidunt@google.com'),
        (36,50,2,'Sed nulla ante, iaculis nec,','Marah Moreira','euismod.mauris@aol.com'),
        (73,18,2,'eu dui. Cum sociis natoque','Chava Ferraz','odio.semper@protonmail.com'),
        (48,43,4,'dolor. Quisque tincidunt pede ac','Avye Marinho','non.quam@google.org'),
        (86,5,5,'Proin mi. Aliquam gravida mauris','Channing Reis','enim.etiam@google.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (43,45,3,'eget metus. In nec orci.','Madaline Santana','lectus.quis.massa@hotmail.net'),
        (31,29,2,'dui, semper et, lacinia vitae,','Tarik Gonzaga','imperdiet@icloud.org'),
        (43,14,1,'et ipsum cursus vestibulum. Mauris','Wanda Paiva','lorem@protonmail.couk'),
        (92,59,2,'consequat auctor, nunc nulla vulputate','Zachery Garcia','urna.nec.luctus@hotmail.net'),
        (91,26,4,'massa. Vestibulum accumsan neque et','Fitzgerald Ribeiro','enim@aol.org'),
        (98,41,1,'sem molestie sodales. Mauris blandit','Virginia Mendes','gravida.sagittis@icloud.com'),
        (38,21,3,'tellus lorem eu metus. In','Kelly Gonzaga','phasellus.nulla@hotmail.ca'),
        (94,9,1,'adipiscing ligula. Aenean gravida nunc','Coby Evangelista','cras.vehicula.aliquet@aol.ca'),
        (11,23,4,'Curabitur vel lectus. Cum sociis','Wanda Bueno','sem@yahoo.edu'),
        (75,48,2,'turpis egestas. Aliquam fringilla cursus','Cyrus do Nascimento','feugiat.tellus@protonmail.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (3,9,2,'at augue id ante dictum','Desirae Evangelista','aliquam.fringilla.cursus@icloud.ca'),
        (79,4,2,'mauris blandit mattis. Cras eget','Ifeoma Guedes','nisl.nulla@protonmail.ca'),
        (12,25,4,'justo nec ante. Maecenas mi','Ursula Maciel','habitant.morbi@yahoo.edu'),
        (45,17,1,'felis purus ac tellus. Suspendisse','Chaney Alves','cubilia.curae.phasellus@yahoo.net'),
        (17,27,2,'Duis cursus, diam at pretium','Piper Felix','lectus.rutrum@protonmail.edu'),
        (95,19,5,'arcu. Curabitur ut odio vel','Kadeem Miranda','sed@icloud.couk'),
        (15,16,1,'lorem, sit amet ultricies sem','Ignatius Costa','ut@aol.couk'),
        (2,25,2,'ut, pharetra sed, hendrerit a,','Tiger de Lourdes','nec@outlook.edu'),
        (3,22,4,'dui lectus rutrum urna, nec','Cameran Medeiros','elementum@hotmail.net'),
        (42,51,5,'justo faucibus lectus, a sollicitudin','Zachary Mota','aliquam.arcu.aliquam@icloud.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (88,47,5,'urna convallis erat, eget tincidunt','Linda Maia','vulputate.velit@yahoo.com'),
        (85,33,3,'elit. Nulla facilisi. Sed neque.','Raja de Campos','massa.suspendisse@yahoo.edu'),
        (1,49,3,'risus. Morbi metus. Vivamus euismod','Demetrius Menezes','luctus@outlook.org'),
        (40,42,2,'Sed et libero. Proin mi.','Jacqueline Melo','interdum@outlook.net'),
        (94,62,4,'dui. Fusce diam nunc, ullamcorper','Britanney Azevedo','facilisis.magna@aol.net'),
        (31,65,3,'lacinia mattis. Integer eu lacus.','Hiroko dos Anjos','dui.semper@icloud.edu'),
        (75,67,5,'sapien molestie orci tincidunt adipiscing.','Logan Brandao','cubilia.curae.donec@outlook.edu'),
        (2,2,4,'orci sem eget massa. Suspendisse','Cathleen Barros','enim.curabitur@yahoo.org'),
        (23,67,2,'sagittis lobortis mauris. Suspendisse aliquet','Cadman de Campos','nunc.lectus@icloud.com'),
        (26,67,5,'dui augue eu tellus. Phasellus','Maxwell Chagas','nulla.at@yahoo.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (11,24,3,'nec tempus scelerisque, lorem ipsum','Andrew Siqueira','ut.aliquam@protonmail.org'),
        (32,38,2,'commodo hendrerit. Donec porttitor tellus','Jin Messias','in.sodales@icloud.net'),
        (6,69,2,'nonummy ipsum non arcu. Vivamus','Dylan Brito','elit.sed.consequat@hotmail.net'),
        (80,55,2,'Cum sociis natoque penatibus et','Riley Leal','ac@protonmail.ca'),
        (24,39,2,'quam vel sapien imperdiet ornare.','Brittany Maia','blandit.congue@hotmail.edu'),
        (92,67,4,'non, hendrerit id, ante. Nunc','Roth Batista','semper.auctor@outlook.net'),
        (83,9,1,'sed pede nec ante blandit','Wallace Mendonca','curae@hotmail.org'),
        (95,52,1,'justo faucibus lectus, a sollicitudin','Rogan Bueno','mi.tempor@aol.ca'),
        (15,30,4,'pede sagittis augue, eu tempor','Orlando Franca','rutrum.eu@icloud.org'),
        (13,42,4,'auctor velit. Aliquam nisl. Nulla','Kelly Ferraz','aliquam.eros.turpis@icloud.couk')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (14,47,5,'magna. Cras convallis convallis dolor.','Hashim Andrade','cras.interdum.nunc@yahoo.net'),
        (46,3,2,'lacinia orci, consectetuer euismod est','Grant de Castro','sit@icloud.couk'),
        (14,57,1,'lectus, a sollicitudin orci sem','Shelly Galdino','et.pede@outlook.ca'),
        (55,52,2,'sem. Pellentesque ut ipsum ac','Nicole Candido','quam@google.com'),
        (85,4,1,'dui, semper et, lacinia vitae,','Aurelia Bastos','sit.amet@icloud.org'),
        (61,55,1,'massa rutrum magna. Cras convallis','Violet Nascimento','odio.auctor@protonmail.org'),
        (24,57,1,'nonummy ut, molestie in, tempus','Nero Moreira','purus.sapien.gravida@aol.net'),
        (58,22,4,'adipiscing elit. Etiam laoreet, libero','Cairo Silva','cras@protonmail.org'),
        (44,59,5,'enim commodo hendrerit. Donec porttitor','Shad Brito','in.molestie@outlook.couk'),
        (49,50,4,'nec urna et arcu imperdiet','Hasad Freitas','in.molestie.tortor@protonmail.ca')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (10,9,2,'velit in aliquet lobortis, nisi','Chaim de Almeida','cras.eget.nisi@icloud.edu'),
        (72,11,4,'Nunc quis arcu vel quam','Clark Fonseca','hymenaeos.mauris.ut@yahoo.com'),
        (71,16,4,'Proin ultrices. Duis volutpat nunc','Daphne Araujo','cras.dictum@yahoo.couk'),
        (26,29,1,'euismod enim. Etiam gravida molestie','Ahmed Pires','cum.sociis.natoque@google.edu'),
        (92,30,5,'sociis natoque penatibus et magnis','Justin Figueiredo','massa.mauris@hotmail.com'),
        (74,47,3,'feugiat tellus lorem eu metus.','Walker Gonçalves','amet.risus.donec@icloud.org'),
        (11,39,3,'mus. Proin vel nisl. Quisque','Duncan Das Neves','quis.diam@aol.com'),
        (93,69,5,'nibh sit amet orci. Ut','Sacha Cruz','arcu@icloud.edu'),
        (20,64,5,'in, dolor. Fusce feugiat. Lorem','Fay da Conceiçao','rutrum.eu@google.ca'),
        (36,30,3,'orci luctus et ultrices posuere','Luke Carneiro','a.nunc.in@protonmail.couk')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (57,50,4,'faucibus id, libero. Donec consectetuer','Breanna Correa','vulputate@aol.ca'),
        (40,59,5,'Lorem ipsum dolor sit amet,','Camille Campos','donec.fringilla@protonmail.com'),
        (23,61,2,'Nulla aliquet. Proin velit. Sed','April Vieira','nisi.nibh.lacinia@hotmail.com'),
        (53,18,5,'diam. Pellentesque habitant morbi tristique','September Ferreira','ut@google.ca'),
        (90,48,1,'porttitor tellus non magna. Nam','Xyla Domingues','tortor.integer.aliquam@aol.couk'),
        (76,50,2,'lobortis ultrices. Vivamus rhoncus. Donec','Martina Teles','quisque.nonummy@hotmail.couk'),
        (42,58,4,'adipiscing lacus. Ut nec urna','Shaine Bispo','sed.tortor.integer@icloud.ca'),
        (31,30,4,'eleifend, nunc risus varius orci,','Colby Pires','sem.elit@outlook.couk'),
        (51,63,3,'volutpat ornare, facilisis eget, ipsum.','Calista Brito','nulla.vulputate@protonmail.net'),
        (98,4,5,'Donec egestas. Duis ac arcu.','Hayley Carneiro','est.mauris.rhoncus@icloud.ca')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (21,56,2,'gravida non, sollicitudin a, malesuada','Vivian de Abreu','feugiat.non@yahoo.org'),
        (49,12,1,'ac turpis egestas. Fusce aliquet','Aileen Carneiro','mi.felis.adipiscing@outlook.edu'),
        (18,58,3,'nunc interdum feugiat. Sed nec','Aaron da Rosa','gravida.non@yahoo.org'),
        (80,54,1,'parturient montes, nascetur ridiculus mus.','Stone Cardoso','molestie.orci.tincidunt@outlook.edu'),
        (29,17,1,'Integer mollis. Integer tincidunt aliquam','Len Chagas','ipsum.primis.in@hotmail.com'),
        (83,43,1,'erat neque non quam. Pellentesque','Jemima de Lourdes','at.sem@aol.net'),
        (25,54,2,'iaculis, lacus pede sagittis augue,','Mark Coelho','elit.curabitur.sed@protonmail.edu'),
        (4,68,1,'malesuada fames ac turpis egestas.','Susan Muniz','fringilla@aol.couk'),
        (88,70,4,'felis. Donec tempor, est ac','Victoria Ramos','dignissim@protonmail.com'),
        (22,3,4,'libero mauris, aliquam eu, accumsan','Xander Santos','nunc.lectus@yahoo.com')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (25,67,3,'porttitor scelerisque neque. Nullam nisl.','Chandler Aparecido','condimentum.donec@yahoo.com'),
        (23,34,4,'sem semper erat, in consectetuer','Leandra Cavalcante','vivamus.molestie@google.net'),
        (91,14,5,'montes, nascetur ridiculus mus. Donec','Hakeem Sántos','eu.dolor.egestas@protonmail.ca'),
        (49,58,3,'Sed eu nibh vulputate mauris','Keith Camargo','sollicitudin@hotmail.couk'),
        (98,57,4,'nibh lacinia orci, consectetuer euismod','Zane Siqueira','nec.leo@icloud.com'),
        (17,44,5,'et, rutrum non, hendrerit id,','William de Moraes','sed.hendrerit.a@hotmail.com'),
        (67,69,5,'id, mollis nec, cursus a,','Honorato Simoes','congue.a.aliquet@google.ca'),
        (33,23,3,'Duis mi enim, condimentum eget,','Xandra Costa','nulla.ante@outlook.net'),
        (58,20,4,'pede, ultrices a, auctor non,','Aretha de Souza','vitae.risus@hotmail.net'),
        (71,53,2,'sagittis. Nullam vitae diam. Proin','Jonah Rocha','risus@icloud.net')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (58,25,2,'Sed nec metus facilisis lorem','Cecilia Vieira','velit@google.net'),
        (32,50,4,'Suspendisse non leo. Vivamus nibh','Celeste Paulino','a.mi.fringilla@google.ca'),
        (76,45,3,'est ac mattis semper, dui','Brian Silva','non.dui.nec@outlook.edu'),
        (15,25,4,'pede. Suspendisse dui. Fusce diam','Roary de Assis','sed.malesuada@protonmail.org'),
        (98,53,1,'amet diam eu dolor egestas','Kasimir de Melo','tincidunt.congue.turpis@aol.com'),
        (17,31,5,'Aliquam nec enim. Nunc ut','Trevor Pacheco','nibh@aol.edu'),
        (68,2,3,'sit amet diam eu dolor','Kennan Rezende','purus.ac@icloud.ca'),
        (96,6,2,'lorem semper auctor. Mauris vel','Melyssa Vieira','molestie.in@hotmail.com'),
        (57,5,2,'Donec tempus, lorem fringilla ornare','Bell Dantas','dictum.eu@protonmail.ca'),
        (50,4,5,'tellus eu augue porttitor interdum.','Meghan Soares','dui@icloud.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (75,26,4,'sagittis. Nullam vitae diam. Proin','Kim Barros','malesuada.id@outlook.ca'),
        (35,33,4,'magna. Ut tincidunt orci quis','Steven Henrique','ullamcorper.duis@icloud.com'),
        (28,69,1,'metus. Aliquam erat volutpat. Nulla','Igor Brandao','ligula.aliquam@aol.org'),
        (53,62,1,'Proin dolor. Nulla semper tellus','Cheyenne Borges','scelerisque.sed@hotmail.edu'),
        (16,34,2,'nonummy ac, feugiat non, lobortis','Miriam Maciel','blandit@aol.edu'),
        (94,20,5,'et netus et malesuada fames','Henry Trindade','leo.cras.vehicula@outlook.net'),
        (88,12,2,'montes, nascetur ridiculus mus. Aenean','Paki Araujo','semper.et@yahoo.net'),
        (11,50,2,'sapien. Aenean massa. Integer vitae','Carly Neves','hendrerit.a@aol.ca'),
        (28,28,2,'Integer urna. Vivamus molestie dapibus','Reese de Jesus','sed.eu@hotmail.com'),
        (91,43,2,'Aenean euismod mauris eu elit.','Gemma Barreto','magnis.dis@aol.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (1,25,2,'et pede. Nunc sed orci','Jemima Dias','mi.duis.risus@yahoo.net'),
        (86,13,5,'euismod ac, fermentum vel, mauris.','Kato Pinheiro','nulla.cras@hotmail.couk'),
        (13,1,4,'Pellentesque habitant morbi tristique senectus','Ila Miranda','egestas.duis@yahoo.couk'),
        (63,33,2,'Vivamus nibh dolor, nonummy ac,','Jaquelyn Silva','sociis.natoque.penatibus@icloud.edu'),
        (29,29,3,'egestas. Aliquam nec enim. Nunc','Quinn Custodio','tellus@google.couk'),
        (89,27,4,'ornare, libero at auctor ullamcorper,','Kyle Rocha','non.hendrerit@hotmail.edu'),
        (60,45,5,'lobortis risus. In mi pede,','Amber Chagas','lectus.nullam@aol.ca'),
        (92,13,2,'nunc risus varius orci, in','Joseph da Silva','lorem.vehicula.et@outlook.ca'),
        (94,10,4,'sit amet metus. Aliquam erat','Danielle Moreira','tincidunt.tempus@icloud.edu'),
        (4,52,3,'molestie pharetra nibh. Aliquam ornare,','Melanie Garcia','dolor.fusce.feugiat@aol.net')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (80,39,2,'elit. Curabitur sed tortor. Integer','Kasper Das Neves','scelerisque@yahoo.couk'),
        (43,38,1,'fermentum metus. Aenean sed pede','Levi Abreu','in@icloud.com'),
        (26,52,4,'Nullam ut nisi a odio','Stephanie Andrade','non.lobortis@icloud.com'),
        (80,52,2,'vel est tempor bibendum. Donec','Veda Brandao','auctor.nunc.nulla@aol.couk'),
        (99,63,2,'ullamcorper viverra. Maecenas iaculis aliquet','Neville Camargo','praesent.interdum.ligula@protonmail.org'),
        (81,27,4,'semper egestas, urna justo faucibus','Hiroko Guedes','libero.donec.consectetuer@aol.ca'),
        (46,50,4,'Mauris quis turpis vitae purus','Jonah de Azevedo','libero.et.tristique@yahoo.net'),
        (7,61,3,'Morbi non sapien molestie orci','Burke Pires','vitae.mauris@icloud.net'),
        (58,25,4,'urna convallis erat, eget tincidunt','Wing Carvalho','integer.vitae@google.net'),
        (84,52,3,'quis diam. Pellentesque habitant morbi','Maxwell Macedo','dui.nec@icloud.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (59,9,2,'velit. Cras lorem lorem, luctus','Azalia Vaz','erat.sed@outlook.edu'),
        (77,9,5,'mi. Aliquam gravida mauris ut','Shelley Lima','litora@hotmail.net'),
        (14,6,5,'leo, in lobortis tellus justo','Hayden Silva','neque.vitae@google.net'),
        (68,40,3,'neque et nunc. Quisque ornare','Octavius Simoes','nec.eleifend@aol.org'),
        (67,20,3,'Morbi sit amet massa. Quisque','Geoffrey Leal','pharetra.nam@hotmail.com'),
        (36,52,5,'nunc nulla vulputate dui, nec','McKenzie Pinheiro','interdum.ligula@aol.couk'),
        (87,33,2,'rutrum eu, ultrices sit amet,','Maisie Das Chagas','taciti@protonmail.ca'),
        (7,32,2,'tincidunt, nunc ac mattis ornare,','Channing Miranda','mi.lacinia@aol.edu'),
        (33,57,4,'ultricies dignissim lacus. Aliquam rutrum','Dillon Rezende','pellentesque@outlook.com'),
        (48,28,3,'quis urna. Nunc quis arcu','Victoria Bastos','vestibulum@outlook.org')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (96,26,4,'adipiscing fringilla, porttitor vulputate, posuere','Noel Sántos','amet@yahoo.ca'),
        (48,18,3,'tellus, imperdiet non, vestibulum nec,','Jameson Reis','cum.sociis.natoque@protonmail.org'),
        (54,43,2,'Morbi neque tellus, imperdiet non,','Penelope Marques','fringilla@aol.com'),
        (37,47,2,'purus, in molestie tortor nibh','Harding Ramos','phasellus.elit@yahoo.net'),
        (54,61,5,'Mauris magna. Duis dignissim tempor','Ruby Franco','et.rutrum@google.couk'),
        (84,29,1,'est mauris, rhoncus id, mollis','Hyatt Franco','sagittis.duis@hotmail.edu'),
        (80,49,1,'tellus. Phasellus elit pede, malesuada','Cassady Mendonca','dictum.augue@aol.edu'),
        (32,31,5,'Sed et libero. Proin mi.','Lee Inacio','amet@aol.net'),
        (2,4,5,'Phasellus dapibus quam quis diam.','Isadora de Fatima','urna.nullam.lobortis@outlook.net'),
        (75,6,2,'aliquet nec, imperdiet nec, leo.','Maxwell Dias','varius.et@aol.org')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (43,53,4,'mollis. Phasellus libero mauris, aliquam','Hayes Chaves','ac.arcu@protonmail.com'),
        (12,2,2,'mauris ut mi. Duis risus','Dieter Trindade','ornare.sagittis.felis@aol.org'),
        (72,67,2,'ligula. Aenean gravida nunc sed','Carla Abreu','magnis@protonmail.org'),
        (39,21,4,'lobortis augue scelerisque mollis. Phasellus','Idona Azevedo','quisque.porttitor@aol.net'),
        (51,50,2,'amet, consectetuer adipiscing elit. Etiam','Marshall Guimaraes','luctus.vulputate.nisi@hotmail.edu'),
        (56,49,2,'turpis egestas. Aliquam fringilla cursus','Gillian da Silva','dui.nec@hotmail.edu'),
        (55,6,5,'sem mollis dui, in sodales','Tucker Xavier','augue.id@yahoo.edu'),
        (69,51,3,'Duis ac arcu. Nunc mauris.','Yuri Domingos','arcu.curabitur@icloud.org'),
        (53,45,2,'tellus. Phasellus elit pede, malesuada','Ebony Sampaio','nullam.velit@yahoo.org'),
        (57,12,3,'Nam interdum enim non nisi.','Yeo dos Anjos','diam.proin@yahoo.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (89,31,4,'sagittis lobortis mauris. Suspendisse aliquet','Eliana Custodio','lobortis.quis.pede@hotmail.couk'),
        (14,16,5,'Etiam bibendum fermentum metus. Aenean','Chancellor Alves','consectetuer.adipiscing@hotmail.org'),
        (28,18,2,'posuere cubilia Curae Donec tincidunt.','Noelani Faria','ipsum.dolor@hotmail.net'),
        (42,4,4,'diam lorem, auctor quis, tristique','Austin Magalhaes','adipiscing@hotmail.com'),
        (40,26,2,'montes, nascetur ridiculus mus. Proin','Astra Peixoto','malesuada.vel@google.ca'),
        (91,25,2,'amet ante. Vivamus non lorem','Kessie Leite','dolor.fusce@aol.com'),
        (63,44,2,'sit amet, faucibus ut, nulla.','Elmo Queiroz','quisque.varius@protonmail.edu'),
        (48,69,3,'sit amet luctus vulputate, nisi','Yuri de Assis','ac.mattis.velit@protonmail.com'),
        (43,51,2,'Donec vitae erat vel pede','Aaron Garcia','eu@google.com'),
        (78,61,2,'Mauris eu turpis. Nulla aliquet.','Jescie de Campos','ipsum.dolor@aol.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (81,4,1,'dignissim lacus. Aliquam rutrum lorem','Gregory dos Anjos','neque.tellus.imperdiet@aol.net'),
        (25,13,2,'et nunc. Quisque ornare tortor','Octavia Cruz','erat.vitae@icloud.ca'),
        (56,24,2,'augue eu tellus. Phasellus elit','Velma Moreira','id.libero@outlook.org'),
        (4,29,3,'metus. Aliquam erat volutpat. Nulla','Sade Domingos','eu.enim@aol.couk'),
        (61,54,4,'vulputate dui, nec tempus mauris','Halla Nonato','sem.vitae.aliquam@google.ca'),
        (61,11,1,'egestas. Sed pharetra, felis eget','Sonia dos Santos','molestie.tellus.aenean@outlook.org'),
        (69,24,2,'arcu imperdiet ullamcorper. Duis at','Benjamin da Cruz','dui.augue.eu@hotmail.couk'),
        (5,9,2,'Pellentesque habitant morbi tristique senectus','Vanna Evangelista','orci.tincidunt@outlook.couk'),
        (85,27,5,'Nunc ullamcorper, velit in aliquet','Mia Domingos','tellus.nunc@icloud.org'),
        (77,19,3,'feugiat nec, diam. Duis mi','Clementine Moraes','sed.dui.fusce@protonmail.ca')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (69,9,4,'feugiat tellus lorem eu metus.','Noah Santos','semper@hotmail.com'),
        (81,15,3,'Aliquam ornare, libero at auctor','Jermaine Santana','nisi.cum@icloud.com'),
        (7,68,4,'ac risus. Morbi metus. Vivamus','Latifah Borges','vel@aol.ca'),
        (4,52,4,'Proin velit. Sed malesuada augue','Camille Abreu','lacus@outlook.ca'),
        (90,9,4,'vel, mauris. Integer sem elit,','Norman Almeida','amet@aol.ca'),
        (29,68,3,'augue scelerisque mollis. Phasellus libero','Adena Martins','dolor.egestas.rhoncus@icloud.org'),
        (35,32,3,'sed orci lobortis augue scelerisque','Blaze Campos','lacus.aliquam@google.com'),
        (14,43,4,'pharetra. Nam ac nulla. In','Caryn Reis','nulla@hotmail.net'),
        (64,11,5,'enim, gravida sit amet, dapibus','Luke de Freitas','odio.phasellus@outlook.net'),
        (40,50,3,'nulla at sem molestie sodales.','Xenos Peixoto','pellentesque.eget.dictum@outlook.com')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (19,36,3,'diam. Pellentesque habitant morbi tristique','Timothy Sántos','morbi.vehicula@yahoo.ca'),
        (51,58,3,'Donec at arcu. Vestibulum ante','Arthur de Freitas','eu.enim.etiam@icloud.com'),
        (61,10,3,'Donec luctus aliquet odio. Etiam','Colt Santiago','at.risus.nunc@google.couk'),
        (92,3,3,'Duis at lacus. Quisque purus','Malachi Trindade','ac.turpis.egestas@protonmail.edu'),
        (59,16,3,'senectus et netus et malesuada','Axel Braz','mauris@aol.org'),
        (95,18,5,'enim. Sed nulla ante, iaculis','Ella de Melo','vestibulum.ut@icloud.ca'),
        (1,8,2,'Mauris non dui nec urna','Grant Cunha','mi.fringilla@protonmail.org'),
        (73,62,3,'malesuada fames ac turpis egestas.','Nicholas Cunha','neque.vitae@google.org'),
        (18,27,2,'Aliquam fringilla cursus purus. Nullam','Remedios Cabral','aliquet@icloud.couk'),
        (96,42,5,'pharetra, felis eget varius ultrices,','Steven Neves','lectus.cum@icloud.ca')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (77,35,2,'eu erat semper rutrum. Fusce','Jasper Leal','dictum.phasellus.in@outlook.couk'),
        (82,42,2,'ac nulla. In tincidunt congue','Ryder Chagas','risus.donec@icloud.net'),
        (81,36,5,'vitae mauris sit amet lorem','Daria de Araujo','dictum.cursus@yahoo.org'),
        (55,32,3,'Nullam suscipit, est ac facilisis','Sierra dos Reis','nisl.nulla@yahoo.couk'),
        (49,31,2,'tristique senectus et netus et','Elton Oliveira','eu.dolor@hotmail.com'),
        (35,51,2,'ridiculus mus. Aenean eget magna.','Hermione Mendonca','molestie@icloud.net'),
        (86,11,4,'penatibus et magnis dis parturient','Harrison Pinto','cras.lorem.lorem@yahoo.com'),
        (19,67,2,'sodales. Mauris blandit enim consequat','Denise de Sousa','sed.consequat@hotmail.edu'),
        (59,3,3,'Nullam feugiat placerat velit. Quisque','Arsenio de Araujo','lorem.eu@outlook.net'),
        (88,17,4,'diam eu dolor egestas rhoncus.','Raymond Das Gracas','ligula.elit@protonmail.net')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (17,41,5,'nunc sit amet metus. Aliquam','Tatum Araujo','malesuada.fringilla@aol.net'),
        (25,23,2,'metus facilisis lorem tristique aliquet.','Louis do Nascimento','etiam@protonmail.edu'),
        (94,1,4,'ligula tortor, dictum eu, placerat','Gillian Candido','laoreet@aol.ca'),
        (14,14,5,'Aliquam nisl. Nulla eu neque','Jin Bueno','neque.in@aol.edu'),
        (11,33,4,'dui. Fusce aliquam, enim nec','Lucius Oliveira','rhoncus.nullam@yahoo.org'),
        (59,25,1,'ligula. Donec luctus aliquet odio.','Zenia Chagas','donec@google.com'),
        (14,62,4,'tellus. Nunc lectus pede, ultrices','James de Paula','dolor.nulla.semper@hotmail.ca'),
        (33,30,2,'ac sem ut dolor dapibus','Zeph do Carmo','pellentesque.ultricies@icloud.com'),
        (70,33,2,'eu, euismod ac, fermentum vel,','Dawn Machado','suspendisse.commodo@icloud.ca'),
        (40,22,2,'vulputate, lacus. Cras interdum. Nunc','Miriam Maia','turpis.in@yahoo.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (74,20,2,'cursus, diam at pretium aliquet,','Guy Sántos','sapien@outlook.com'),
        (38,31,1,'Mauris quis turpis vitae purus','Odysseus Xavier','vitae.aliquam@aol.ca'),
        (26,66,2,'orci, in consequat enim diam','Richard Evangelista','dapibus.rutrum.justo@outlook.edu'),
        (93,16,2,'magna. Ut tincidunt orci quis','Orlando Fernandes','bibendum@google.ca'),
        (30,67,4,'massa. Integer vitae nibh. Donec','Bertha Maciel','dis.parturient@outlook.org'),
        (94,28,2,'hymenaeos. Mauris ut quam vel','Henry Soares','tortor.dictum.eu@aol.couk'),
        (60,30,4,'dis parturient montes, nascetur ridiculus','Lucas Teixeira','non.dui@protonmail.com'),
        (10,21,2,'est. Nunc laoreet lectus quis','Darrel Bastos','imperdiet@hotmail.com'),
        (66,54,2,'ultricies sem magna nec quam.','Calvin Marques','varius.orci.in@aol.edu'),
        (17,66,4,'Suspendisse eleifend. Cras sed leo.','Xander Souza','risus.duis.a@aol.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (33,50,3,'ridiculus mus. Donec dignissim magna','Jada Cavalcante','amet.consectetuer.adipiscing@aol.couk'),
        (75,48,4,'fermentum fermentum arcu. Vestibulum ante','Nash de Jesus','interdum@yahoo.com'),
        (75,34,3,'primis in faucibus orci luctus','Jarrod Barros','aliquam.arcu@hotmail.ca'),
        (76,27,3,'arcu. Vestibulum ante ipsum primis','Walter Furtado','ornare.elit.elit@hotmail.edu'),
        (19,15,3,'Vivamus non lorem vitae odio','Teagan Costa','erat.volutpat.nulla@aol.couk'),
        (29,56,4,'at, velit. Cras lorem lorem,','Anthony de Barros','mi.felis@aol.com'),
        (13,57,3,'sit amet, faucibus ut, nulla.','Kibo do Nascimento','nam.porttitor@outlook.org'),
        (58,14,5,'Donec porttitor tellus non magna.','Ralph Cordeiro','adipiscing.lobortis.risus@outlook.edu'),
        (89,43,3,'at pede. Cras vulputate velit','Wallace Simoes','amet.orci@yahoo.ca'),
        (49,12,4,'non enim. Mauris quis turpis','Calvin Rodrigues','amet.ornare@aol.org')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (57,23,5,'fermentum convallis ligula. Donec luctus','Rogan Maciel','arcu.vivamus@protonmail.org'),
        (87,25,4,'Vivamus nisi. Mauris nulla. Integer','Raya Das Dores','facilisis.magna@yahoo.org'),
        (67,29,4,'non, sollicitudin a, malesuada id,','Timothy de Oliveira','amet.lorem.semper@outlook.com'),
        (11,30,5,'sapien, cursus in, hendrerit consectetuer,','Hector Teles','aliquam.ornare@google.edu'),
        (28,50,3,'et, rutrum eu, ultrices sit','Hunter Amorim','proin.ultrices.duis@icloud.couk'),
        (12,20,3,'urna. Nullam lobortis quam a','Xantha Moura','vestibulum@outlook.couk'),
        (19,66,3,'nunc. Quisque ornare tortor at','Iris Chagas','cursus.et.eros@icloud.com'),
        (8,28,5,'nibh. Aliquam ornare, libero at','Eric Matos','non.vestibulum@google.couk'),
        (32,44,4,'dignissim pharetra. Nam ac nulla.','Merrill Bueno','euismod@protonmail.com'),
        (91,22,1,'rutrum, justo. Praesent luctus. Curabitur','Hayes Moraes','arcu.vestibulum@outlook.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (46,54,3,'In lorem. Donec elementum, lorem','Lacey Chaves','libero@aol.ca'),
        (35,16,4,'ridiculus mus. Donec dignissim magna','Maris Rezende','dolor.dolor@icloud.couk'),
        (73,51,3,'Nam ac nulla. In tincidunt','Kasper Messias','id.erat@outlook.com'),
        (14,1,4,'Donec est. Nunc ullamcorper, velit','Odette Figueiredo','eros.nam@icloud.couk'),
        (84,66,2,'magna. Lorem ipsum dolor sit','Lesley Tavares','penatibus.et.magnis@outlook.edu'),
        (72,5,3,'nascetur ridiculus mus. Proin vel','Tyler Gonçalves','gravida.nunc.sed@aol.edu'),
        (88,42,5,'Nulla semper tellus id nunc','Yvonne Lima','gravida.nunc@aol.org'),
        (84,41,4,'tortor at risus. Nunc ac','Aspen Duarte','nulla.tempor@hotmail.ca'),
        (64,66,3,'sociis natoque penatibus et magnis','Lee Teles','ipsum.dolor.sit@aol.couk'),
        (18,67,4,'dolor. Nulla semper tellus id','Kathleen Rosa','sit.amet.metus@google.ca')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (92,17,1,'pellentesque eget, dictum placerat, augue.','Kiona Melo','aliquam@hotmail.com'),
        (31,1,3,'ornare tortor at risus. Nunc','Derek Coutinho','dolor.fusce.feugiat@protonmail.net'),
        (96,50,4,'Curabitur sed tortor. Integer aliquam','Baxter Sántos','lectus.sit@outlook.ca'),
        (58,66,5,'vestibulum. Mauris magna. Duis dignissim','Heidi Freire','neque@yahoo.com'),
        (77,48,1,'non, vestibulum nec, euismod in,','Kevyn Custodio','vitae.erat.vivamus@google.org'),
        (65,42,3,'ornare egestas ligula. Nullam feugiat','Ian Cabral','egestas.duis@protonmail.org'),
        (73,43,3,'condimentum eget, volutpat ornare, facilisis','Tanner Domingos','tristique.pellentesque@google.net'),
        (13,56,5,'magna. Sed eu eros. Nam','Scott de Lima','non@yahoo.couk'),
        (85,57,2,'imperdiet, erat nonummy ultricies ornare,','Lee Miranda','massa@hotmail.com'),
        (47,4,3,'magnis dis parturient montes, nascetur','Giacomo Faria','nulla.magna@outlook.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (14,49,4,'rutrum non, hendrerit id, ante.','Hop Bento','vivamus.molestie.dapibus@icloud.org'),
        (96,45,4,'nulla ante, iaculis nec, eleifend','Shad do Nascimento','odio.aliquam@yahoo.net'),
        (27,27,3,'imperdiet ullamcorper. Duis at lacus.','Yvette Bueno','tincidunt@hotmail.couk'),
        (25,44,2,'Donec feugiat metus sit amet','Moses Galdino','odio.nam@hotmail.net'),
        (91,38,3,'tempus non, lacinia at, iaculis','Regan de Carvalho','mollis.lectus.pede@google.com'),
        (32,9,4,'in, dolor. Fusce feugiat. Lorem','Amery Pinto','vulputate@google.net'),
        (44,41,2,'amet, dapibus id, blandit at,','Len Evangelista','pede@yahoo.com'),
        (2,5,1,'ipsum. Donec sollicitudin adipiscing ligula.','James Gonçalves','at.fringilla.purus@outlook.net'),
        (72,45,1,'habitant morbi tristique senectus et','Thomas Soares','faucibus.id@google.com'),
        (29,4,4,'sed consequat auctor, nunc nulla','Anthony Campos','sed@google.couk')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (67,3,3,'eros non enim commodo hendrerit.','Byron Mariano','mattis.semper.dui@protonmail.net'),
        (97,48,2,'sapien, gravida non, sollicitudin a,','Galvin Felix','donec.est.mauris@hotmail.net'),
        (7,13,2,'vehicula. Pellentesque tincidunt tempus risus.','Todd Coelho','nulla.vulputate@hotmail.edu'),
        (35,58,1,'a purus. Duis elementum, dui','Violet Guedes','duis.ac.arcu@yahoo.com'),
        (88,64,2,'Donec dignissim magna a tortor.','Aaron da Cruz','ante.maecenas@protonmail.net'),
        (99,39,3,'et netus et malesuada fames','Xanthus Carneiro','dis.parturient@protonmail.com'),
        (79,15,1,'consequat enim diam vel arcu.','Alika de Freitas','egestas.blandit@google.edu'),
        (96,27,3,'mi felis, adipiscing fringilla, porttitor','Yardley Das Gracas','aliquet@outlook.couk'),
        (26,12,3,'orci quis lectus. Nullam suscipit,','Harrison da Cunha','auctor.quis.tristique@google.com'),
        (83,52,2,'tempus risus. Donec egestas. Duis','Ima Cunha','at.egestas.a@hotmail.net')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (56,4,3,'Curabitur consequat, lectus sit amet','Mira de Sousa','sit.amet.risus@outlook.couk'),
        (34,14,2,'congue, elit sed consequat auctor,','Ainsley Silveira','non.sapien@protonmail.org'),
        (83,40,3,'amet orci. Ut sagittis lobortis','Austin Mota','vel.arcu@protonmail.org'),
        (33,64,4,'Sed nulla ante, iaculis nec,','Dolan Caetano','lacinia@hotmail.ca'),
        (86,26,3,'velit dui, semper et, lacinia','Benedict Sales','diam@google.ca'),
        (31,25,1,'eu eros. Nam consequat dolor','Leroy Dantas','rhoncus@protonmail.com'),
        (28,65,1,'augue malesuada malesuada. Integer id','Larissa Carneiro','mauris.ut@google.net'),
        (80,70,3,'erat semper rutrum. Fusce dolor','Fleur Araujo','vitae.semper@outlook.edu'),
        (77,45,5,'vulputate dui, nec tempus mauris','Kathleen Rezende','vel.sapien@icloud.org'),
        (40,20,1,'lobortis augue scelerisque mollis. Phasellus','Noel Sántos','pretium.aliquet@google.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (77,3,4,'Nullam suscipit, est ac facilisis','Adrian Barboza','quis.pede.praesent@hotmail.edu'),
        (42,68,3,'dignissim pharetra. Nam ac nulla.','Kadeem Antunes','aenean.massa@icloud.net'),
        (71,4,3,'Morbi sit amet massa. Quisque','Inga Barros','lorem.ac.risus@hotmail.ca'),
        (63,26,4,'nisi a odio semper cursus.','Nigel de Melo','nulla.ante.iaculis@google.couk'),
        (81,59,2,'consectetuer adipiscing elit. Aliquam auctor,','Alika Chagas','nulla@yahoo.couk'),
        (84,35,3,'ultrices a, auctor non, feugiat','Jessica Siqueira','lorem.ac@outlook.org'),
        (84,56,4,'consectetuer rhoncus. Nullam velit dui,','Chastity de Moraes','tristique.senectus@aol.ca'),
        (61,67,5,'vehicula et, rutrum eu, ultrices','Justin Barreto','in.faucibus@google.com'),
        (9,7,2,'mauris erat eget ipsum. Suspendisse','Karly Barreto','fringilla.mi@icloud.edu'),
        (18,23,1,'rutrum eu, ultrices sit amet,','Sylvia Fagundes','duis@hotmail.com')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (63,28,5,'Donec est mauris, rhoncus id,','Dai Mendes','vitae@google.edu'),
        (51,20,2,'vulputate, nisi sem semper erat,','Ferdinand dos Anjos','lectus.nullam.suscipit@hotmail.com'),
        (51,46,5,'et, rutrum eu, ultrices sit','Ivory Evangelista','pharetra.sed@protonmail.org'),
        (13,69,2,'porttitor eros nec tellus. Nunc','Talon Sántos','metus@icloud.couk'),
        (54,53,1,'sapien. Aenean massa. Integer vitae','Aquila Matias','risus.at.fringilla@google.net'),
        (70,26,2,'pede ac urna. Ut tincidunt','Ciara de Assis','congue.elit.sed@yahoo.couk'),
        (85,53,4,'a nunc. In at pede.','Maris Silva','mollis.dui@aol.com'),
        (33,47,1,'condimentum eget, volutpat ornare, facilisis','Griffith Souza','vel@outlook.com'),
        (47,59,4,'Fusce aliquam, enim nec tempus','Brenda Chaves','felis.donec@yahoo.couk'),
        (93,12,4,'at arcu. Vestibulum ante ipsum','Ivory Firmino','tellus.eu@protonmail.ca')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (78,41,1,'arcu. Curabitur ut odio vel','Tanisha Borges','nunc.sed@icloud.com'),
        (24,53,4,'sem. Pellentesque ut ipsum ac','Idona Oliveira','blandit@icloud.edu'),
        (48,20,5,'in aliquet lobortis, nisi nibh','Petra de Sousa','tincidunt.nibh@protonmail.couk'),
        (10,33,2,'augue malesuada malesuada. Integer id','Lester da Rocha','urna.et@protonmail.org'),
        (65,66,2,'ac turpis egestas. Fusce aliquet','Moses Fernandes','sociis@outlook.edu'),
        (80,69,3,'at arcu. Vestibulum ante ipsum','Tanisha Camargo','dis@hotmail.edu'),
        (68,9,4,'est. Nunc ullamcorper, velit in','Kamal Vieira','in.consequat@outlook.edu'),
        (49,26,3,'Ut sagittis lobortis mauris. Suspendisse','Genevieve Brandao','fames.ac@icloud.couk'),
        (61,48,5,'Proin sed turpis nec mauris','Palmer Bento','ornare.lectus.justo@hotmail.couk'),
        (73,53,3,'arcu. Sed eu nibh vulputate','Melodie de Jesus','non@icloud.com')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (75,24,1,'facilisis non, bibendum sed, est.','Jaquelyn Moura','scelerisque.neque@icloud.com'),
        (57,31,2,'lorem, vehicula et, rutrum eu,','Daquan Pacheco','cum.sociis@yahoo.edu'),
        (59,35,1,'Donec nibh. Quisque nonummy ipsum','Moses Mendes','dui.lectus@protonmail.com'),
        (59,11,5,'arcu. Vestibulum ante ipsum primis','Quinlan Teles','nisi@yahoo.net'),
        (67,66,4,'ridiculus mus. Proin vel nisl.','Venus da Rosa','diam@yahoo.org'),
        (98,20,2,'nunc id enim. Curabitur massa.','Isaac Pereira','integer@google.org'),
        (12,61,4,'semper erat, in consectetuer ipsum','Talon Amorim','phasellus.libero.mauris@yahoo.edu'),
        (32,7,3,'in, tempus eu, ligula. Aenean','Colby da Silveira','ante.ipsum@icloud.couk'),
        (8,55,2,'aliquam, enim nec tempus scelerisque,','Damian Rocha','egestas@icloud.ca'),
        (95,33,5,'eros. Nam consequat dolor vitae','September Matias','velit.pellentesque@protonmail.net')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (24,20,4,'lorem eu metus. In lorem.','Stacey do Nascimento','risus.nulla@icloud.couk'),
        (5,6,2,'non, vestibulum nec, euismod in,','Ina Garcia','dolor@protonmail.couk'),
        (16,61,5,'scelerisque scelerisque dui. Suspendisse ac','Salvador Ferraz','lorem.tristique.aliquet@outlook.ca'),
        (25,27,2,'mi felis, adipiscing fringilla, porttitor','Wade de Araujo','magnis.dis@protonmail.couk'),
        (8,18,1,'erat volutpat. Nulla dignissim. Maecenas','Sophia Magalhaes','integer@protonmail.couk'),
        (33,42,4,'luctus vulputate, nisi sem semper','Shaeleigh Chagas','a.auctor@icloud.org'),
        (99,63,4,'nec quam. Curabitur vel lectus.','Flynn Guimaraes','elit@protonmail.couk'),
        (55,40,4,'sit amet metus. Aliquam erat','Dolan de Moura','vitae@outlook.edu'),
        (2,15,3,'magna. Cras convallis convallis dolor.','Mohammad Costa','arcu.imperdiet@hotmail.couk'),
        (13,21,4,'facilisi. Sed neque. Sed eget','Mallory Andrade','nullam.scelerisque@hotmail.couk')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (25,29,2,'a tortor. Nunc commodo auctor','Oleg Xavier','magna.duis.dignissim@google.ca'),
        (41,6,3,'primis in faucibus orci luctus','Myles Oliveira','varius.nam@yahoo.ca'),
        (96,63,1,'Aenean euismod mauris eu elit.','Tarik Felix','euismod@google.couk'),
        (44,34,4,'Cum sociis natoque penatibus et','Shad Vieira','suspendisse.commodo.tincidunt@aol.ca'),
        (4,59,4,'nec ante blandit viverra. Donec','Harriet Ramos','montes.nascetur.ridiculus@google.com'),
        (85,5,2,'dignissim lacus. Aliquam rutrum lorem','Hanna de Melo','nibh.sit.amet@aol.net'),
        (11,40,3,'consectetuer adipiscing elit. Aliquam auctor,','Tarik Gonzaga','augue.sed@icloud.org'),
        (47,34,4,'Quisque tincidunt pede ac urna.','Cassady Freire','ullamcorper@icloud.org'),
        (73,70,4,'a, facilisis non, bibendum sed,','Dale Dantas','magnis@hotmail.couk'),
        (29,57,2,'ipsum dolor sit amet, consectetuer','Rylee do Carmo','ut@aol.couk')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (7,30,4,'Nunc sed orci lobortis augue','Rhonda Campos','quis@yahoo.org'),
        (40,37,3,'Aliquam gravida mauris ut mi.','Uta de Sousa','rutrum.urna@outlook.com'),
        (71,66,3,'non enim commodo hendrerit. Donec','Jaden Caetano','nisl@yahoo.com'),
        (38,61,3,'est ac mattis semper, dui','Mark Rezende','adipiscing@aol.couk'),
        (41,4,1,'facilisi. Sed neque. Sed eget','Violet Domingos','mi.lacinia.mattis@outlook.edu'),
        (84,3,2,'eu tellus eu augue porttitor','Berk Neves','sit.amet@hotmail.com'),
        (6,17,1,'quis accumsan convallis, ante lectus','Ramona Mariano','aliquam.gravida.mauris@icloud.net'),
        (65,64,5,'velit dui, semper et, lacinia','Shannon Domingues','at.velit.cras@outlook.ca'),
        (6,8,1,'Donec non justo. Proin non','Paki Santana','vulputate.mauris.sagittis@google.ca'),
        (53,19,4,'metus. Vivamus euismod urna. Nullam','Hector Farias','dui.in@google.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (8,53,3,'Vivamus rhoncus. Donec est. Nunc','Brianna Menezes','at.iaculis@protonmail.ca'),
        (32,34,4,'Vestibulum ante ipsum primis in','Deirdre Sampaio','tincidunt.aliquam.arcu@protonmail.com'),
        (59,45,2,'et ultrices posuere cubilia Curae','Whilemina Felix','dapibus.rutrum@protonmail.com'),
        (40,6,5,'lorem, vehicula et, rutrum eu,','Burton Chagas','vel@aol.edu'),
        (19,19,3,'et, magna. Praesent interdum ligula','Candice de Andrade','ultrices@google.org'),
        (40,10,4,'velit eu sem. Pellentesque ut','Callum Vaz','nulla.in@google.net'),
        (68,64,4,'pede nec ante blandit viverra.','Fay Amaral','nulla@aol.couk'),
        (18,44,1,'bibendum. Donec felis orci, adipiscing','Vivian de Castro','nisl.nulla@aol.org'),
        (20,21,1,'aliquam eros turpis non enim.','Walter Batista','nulla@protonmail.org'),
        (13,10,4,'a, magna. Lorem ipsum dolor','Brenna Nogueira','nam@hotmail.couk')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (92,19,3,'consequat dolor vitae dolor. Donec','Indigo Figueiredo','aliquam.eu@yahoo.net'),
        (95,47,1,'Sed dictum. Proin eget odio.','Fritz Caetano','elit@hotmail.edu'),
        (12,42,3,'Cras dictum ultricies ligula. Nullam','Walker de Castro','adipiscing.elit@yahoo.couk'),
        (29,57,5,'ante ipsum primis in faucibus','Nicole Ribeiro','nullam.vitae@aol.couk'),
        (93,19,1,'nunc ac mattis ornare, lectus','Tanya Gonçalves','ullamcorper.eu.euismod@aol.couk'),
        (24,39,2,'eget mollis lectus pede et','Sylvester Xavier','sed.tortor.integer@icloud.net'),
        (94,15,3,'interdum feugiat. Sed nec metus','Kirby Matos','libero.at@protonmail.couk'),
        (14,35,2,'ipsum primis in faucibus orci','Amir de Moraes','justo.faucibus@google.couk'),
        (81,47,2,'nec, diam. Duis mi enim,','Xanthus Correa','eu.turpis@aol.ca'),
        (47,5,4,'egestas, urna justo faucibus lectus,','Rylee Pereira','id.mollis@google.edu')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (59,34,1,'magna et ipsum cursus vestibulum.','Paki Leite','pellentesque@yahoo.couk'),
        (35,15,3,'scelerisque mollis. Phasellus libero mauris,','Inga Dantas','sem.pellentesque.ut@outlook.org'),
        (47,10,3,'massa lobortis ultrices. Vivamus rhoncus.','Brandon Morais','justo.praesent.luctus@google.net'),
        (7,36,3,'cursus non, egestas a, dui.','George Aparecido','fames.ac@hotmail.net'),
        (26,63,2,'vitae purus gravida sagittis. Duis','Dolan Franca','nulla.dignissim.maecenas@outlook.couk'),
        (67,57,1,'volutpat. Nulla dignissim. Maecenas ornare','Marvin de Brito','ipsum@icloud.com'),
        (37,3,4,'libero. Integer in magna. Phasellus','Kimberley de Castro','lacus@icloud.org'),
        (3,12,4,'orci, consectetuer euismod est arcu','Jael de Campos','praesent.eu@hotmail.net'),
        (63,34,2,'Nunc ut erat. Sed nunc','Igor Moura','vel.convallis.in@icloud.org'),
        (99,21,2,'Duis at lacus. Quisque purus','Elijah Teixeira','id@yahoo.couk')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (13,25,5,'a ultricies adipiscing, enim mi','Emma do Nascimento','eget.laoreet@icloud.net'),
        (29,14,4,'quis diam luctus lobortis. Class','Jeanette Queiroz','vehicula@protonmail.edu'),
        (100,17,3,'lorem ipsum sodales purus, in','Ava Torres','non.lacinia@yahoo.org'),
        (39,25,2,'turpis. Aliquam adipiscing lobortis risus.','Chadwick Borges','metus.sit@yahoo.ca'),
        (38,16,4,'nibh. Aliquam ornare, libero at','Dora Abreu','semper.dui@protonmail.ca'),
        (95,63,4,'fermentum arcu. Vestibulum ante ipsum','Dacey dos Reis','congue.in@outlook.org'),
        (59,35,3,'interdum ligula eu enim. Etiam','Cole de Brito','euismod.enim@aol.edu'),
        (42,67,5,'ullamcorper, nisl arcu iaculis enim,','Iona de Brito','magnis@hotmail.couk'),
        (96,8,2,'Nunc laoreet lectus quis massa.','Brody da Silva','amet@yahoo.com'),
        (17,55,2,'gravida nunc sed pede. Cum','Camilla de Moraes','lorem.ipsum.dolor@protonmail.ca')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (1,35,2,'molestie tortor nibh sit amet','Thor Peixoto','eleifend.nec.malesuada@yahoo.couk'),
        (37,25,5,'sollicitudin adipiscing ligula. Aenean gravida','Jakeem Moura','mi.duis.risus@hotmail.couk'),
        (89,21,1,'Donec vitae erat vel pede','Charlotte Cavalcante','sed.eu.nibh@protonmail.edu'),
        (47,20,4,'metus eu erat semper rutrum.','Jordan Rosa','vel.est@hotmail.ca'),
        (49,38,3,'non, hendrerit id, ante. Nunc','Daniel Custodio','dolor.tempus@hotmail.couk'),
        (42,23,4,'ante ipsum primis in faucibus','Brynn Franco','nullam@hotmail.com'),
        (87,47,3,'auctor vitae, aliquet nec, imperdiet','Malik Batista','natoque.penatibus@protonmail.ca'),
        (10,18,2,'lacus pede sagittis augue, eu','Dominic Camargo','et.arcu.imperdiet@outlook.couk'),
        (56,67,4,'dapibus rutrum, justo. Praesent luctus.','Wang Souza','sit@yahoo.org'),
        (83,38,5,'scelerisque, lorem ipsum sodales purus,','Sylvester Faria','egestas.duis@hotmail.net')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (4,46,1,'dui, nec tempus mauris erat','Macy Pinheiro','quis.urna.nunc@yahoo.couk'),
        (88,10,2,'neque sed sem egestas blandit.','Clarke Andrade','dolor.quam.elementum@icloud.com'),
        (34,15,3,'nisl sem, consequat nec, mollis','Troy Monteiro','nunc.laoreet.lectus@yahoo.couk'),
        (85,62,3,'velit. Pellentesque ultricies dignissim lacus.','Asher de Araujo','nec@hotmail.com'),
        (82,15,2,'Aliquam adipiscing lobortis risus. In','Dominique Felix','ipsum.primis@yahoo.org'),
        (59,59,2,'imperdiet ornare. In faucibus. Morbi','Jana Fagundes','ante@icloud.couk'),
        (77,20,1,'Donec porttitor tellus non magna.','Nero Bastos','maecenas.malesuada.fringilla@yahoo.org'),
        (56,45,3,'Phasellus vitae mauris sit amet','Adena Camargo','et@hotmail.org'),
        (32,49,2,'augue. Sed molestie. Sed id','Denton Das Neves','sem.elit@hotmail.ca'),
        (34,25,4,'ullamcorper, nisl arcu iaculis enim,','Nadine Messias','sapien@yahoo.org')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (68,62,2,'commodo ipsum. Suspendisse non leo.','Robert Barreto','et.netus.et@icloud.com'),
        (3,45,3,'adipiscing lobortis risus. In mi','Flynn Silva','quisque.imperdiet@google.org'),
        (38,14,2,'Mauris ut quam vel sapien','Ifeoma Santiago','nunc.risus@aol.net'),
        (64,38,4,'lacus vestibulum lorem, sit amet','Ulric Magalhaes','maecenas@icloud.org'),
        (77,57,4,'nec metus facilisis lorem tristique','Cyrus Campos','dictum@outlook.ca'),
        (78,12,2,'ultrices sit amet, risus. Donec','Prescott Coutinho','porttitor.eros@protonmail.net'),
        (55,17,5,'ullamcorper eu, euismod ac, fermentum','Claudia de Jesus','mauris.nulla@yahoo.net'),
        (43,67,3,'Duis ac arcu. Nunc mauris.','Nevada Queiroz','dui.quis@icloud.org'),
        (14,64,4,'consectetuer adipiscing elit. Curabitur sed','Rama de Almeida','sodales.nisi.magna@protonmail.net'),
        (27,35,1,'nibh. Phasellus nulla. Integer vulputate,','Ginger Lemos','ut.sagittis.lobortis@hotmail.ca')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (42,37,3,'urna. Nunc quis arcu vel','Cade Lopes','ligula.donec.luctus@hotmail.couk'),
        (1,28,5,'dui. Cras pellentesque. Sed dictum.','Hilda Muniz','ornare.in@yahoo.org'),
        (11,41,4,'Fusce aliquet magna a neque.','Shellie de Castro','donec.non.justo@yahoo.couk'),
        (42,24,5,'gravida. Aliquam tincidunt, nunc ac','Channing Xavier','cras.interdum@icloud.ca'),
        (30,7,4,'In faucibus. Morbi vehicula. Pellentesque','Evan da Luz','vestibulum.neque.sed@hotmail.couk'),
        (1,36,4,'Nunc lectus pede, ultrices a,','Jael de Sousa','eros.nec@protonmail.net'),
        (60,55,5,'luctus et ultrices posuere cubilia','Tatyana Borges','elementum.lorem@yahoo.edu'),
        (9,42,2,'Integer vitae nibh. Donec est','Ingrid Ferraz','dui@aol.edu'),
        (50,60,2,'felis. Nulla tempor augue ac','Katelyn Fernandes','nunc.est@google.couk'),
        (82,49,2,'pede. Nunc sed orci lobortis','Nelle Trindade','id@hotmail.net')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (61,53,2,'Duis sit amet diam eu','Sydnee Teles','in.magna@protonmail.org'),
        (48,45,2,'Etiam vestibulum massa rutrum magna.','Alika Soares','magna@yahoo.net'),
        (91,65,3,'accumsan neque et nunc. Quisque','Carl Mariano','at.iaculis.quis@protonmail.ca'),
        (5,6,1,'nec enim. Nunc ut erat.','Martin Leal','vestibulum.nec.euismod@yahoo.edu'),
        (68,3,3,'dictum cursus. Nunc mauris elit,','Clarke Batista','laoreet.libero@yahoo.org'),
        (92,65,4,'Proin non massa non ante','Courtney Bispo','quis.accumsan@hotmail.com'),
        (45,54,2,'venenatis vel, faucibus id, libero.','Griffin de Barros','nec.diam.duis@protonmail.edu'),
        (53,25,3,'ante dictum cursus. Nunc mauris','Ariana Barboza','non@google.edu'),
        (55,36,2,'magnis dis parturient montes, nascetur','Nicholas de Fatima','enim.etiam@hotmail.com'),
        (47,43,3,'Donec luctus aliquet odio. Etiam','Hector de Campos','aliquet.magna@outlook.org')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (75,10,5,'erat, eget tincidunt dui augue','Magee Carvalho','mi.eleifend@protonmail.net'),
        (25,20,4,'a, malesuada id, erat. Etiam','Ivan Antunes','gravida.aliquam.tincidunt@protonmail.ca'),
        (98,57,2,'Praesent eu nulla at sem','Remedios Trindade','elit.sed.consequat@protonmail.couk'),
        (83,3,4,'elit sed consequat auctor, nunc','Nasim Silveira','hendrerit@protonmail.edu'),
        (46,26,3,'molestie arcu. Sed eu nibh','Curran Lemos','orci.lobortis@aol.com'),
        (97,8,4,'nunc sed pede. Cum sociis','Honorato de Almeida','egestas.nunc.sed@protonmail.net'),
        (90,43,5,'dui augue eu tellus. Phasellus','Virginia Miranda','eu.sem@aol.edu'),
        (87,59,4,'Mauris vestibulum, neque sed dictum','Hunter Guimaraes','metus.vivamus.euismod@outlook.edu'),
        (60,1,5,'ipsum non arcu. Vivamus sit','Ebony Camargo','elit.nulla@yahoo.net'),
        (38,36,1,'sed, facilisis vitae, orci. Phasellus','Dylan Antunes','et@icloud.org')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (85,60,4,'et ultrices posuere cubilia Curae','Tanisha Cordeiro','donec.dignissim@icloud.ca'),
        (98,62,3,'non enim commodo hendrerit. Donec','Kelly Marques','ipsum.porta@hotmail.com'),
        (78,29,4,'dui. Fusce aliquam, enim nec','Gray Fagundes','lobortis.risus.in@hotmail.edu'),
        (37,27,2,'tincidunt aliquam arcu. Aliquam ultrices','Meredith Vasconcelos','curabitur.dictum@aol.couk'),
        (57,14,3,'Nullam velit dui, semper et,','Peter Leal','quisque@hotmail.edu'),
        (41,62,4,'malesuada augue ut lacus. Nulla','Belle de Campos','et.ultrices@google.couk'),
        (48,19,3,'nisi sem semper erat, in','Kathleen Xavier','imperdiet.ullamcorper@aol.edu'),
        (38,15,2,'luctus sit amet, faucibus ut,','Zane de Moura','velit.eu@outlook.edu'),
        (98,64,3,'tincidunt vehicula risus. Nulla eget','Phoebe Rocha','in.dolor@icloud.net'),
        (63,53,4,'vulputate dui, nec tempus mauris','Sarah da Costa','sed.pharetra@protonmail.com')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (76,42,4,'Sed congue, elit sed consequat','Quail Chaves','aenean.eget.magna@protonmail.ca'),
        (62,5,5,'quis, pede. Suspendisse dui. Fusce','Maggie Caetano','enim.mi@outlook.couk'),
        (54,40,3,'varius ultrices, mauris ipsum porta','Candice Peixoto','vivamus@protonmail.org'),
        (69,10,1,'nunc sed libero. Proin sed','Alexa de Castro','volutpat@protonmail.net'),
        (79,5,3,'eros turpis non enim. Mauris','Sierra Fernandes','donec.felis.orci@icloud.couk'),
        (81,10,3,'nec, leo. Morbi neque tellus,','Lael dos Reis','vitae.erat@protonmail.edu'),
        (48,22,2,'laoreet ipsum. Curabitur consequat, lectus','Francesca Santiago','donec.consectetuer@outlook.couk'),
        (65,56,3,'tempus, lorem fringilla ornare placerat,','Kay Dutra','netus.et@protonmail.ca'),
        (73,49,2,'gravida molestie arcu. Sed eu','Winifred Teodoro','tempus@aol.org'),
        (86,27,2,'eros turpis non enim. Mauris','Maia Soares','per@hotmail.ca')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (30,62,4,'convallis ligula. Donec luctus aliquet','Brynne Castro','in.magna@yahoo.com'),
        (40,11,2,'nibh. Donec est mauris, rhoncus','Rhonda Brito','in.felis.nulla@outlook.org'),
        (19,63,3,'risus. Donec nibh enim, gravida','Brent da Luz','a.magna.lorem@google.com'),
        (51,63,5,'rutrum urna, nec luctus felis','Hayden Oliveira','non.ante.bibendum@hotmail.edu'),
        (35,4,4,'eget odio. Aliquam vulputate ullamcorper','Porter Siqueira','suscipit.est@google.ca'),
        (38,69,4,'molestie orci tincidunt adipiscing. Mauris','Eleanor Das Dores','mauris.sagittis.placerat@icloud.com'),
        (79,51,3,'primis in faucibus orci luctus','Malik Martins','fringilla.purus@icloud.ca'),
        (4,12,3,'lectus sit amet luctus vulputate,','Hyatt Viana','sed.congue.elit@icloud.edu'),
        (35,39,4,'dolor elit, pellentesque a, facilisis','India Das Neves','aliquam.tincidunt@aol.net'),
        (84,13,5,'lacus vestibulum lorem, sit amet','Kay de Moraes','egestas.rhoncus.proin@hotmail.net')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (11,2,3,'vitae, posuere at, velit. Cras','Theodore de Melo','velit.eget@icloud.org'),
        (14,10,4,'Pellentesque tincidunt tempus risus. Donec','Ayanna Silveira','consequat.dolor.vitae@protonmail.net'),
        (94,40,4,'Suspendisse sed dolor. Fusce mi','Jerome Campos','non.quam.pellentesque@outlook.ca'),
        (72,42,4,'Aenean gravida nunc sed pede.','Mira Sampaio','orci.sem.eget@hotmail.net'),
        (30,57,4,'accumsan interdum libero dui nec','Barrett Figueiredo','enim.nisl@yahoo.ca'),
        (65,45,2,'Integer sem elit, pharetra ut,','Benjamin Simoes','consectetuer.euismod.est@hotmail.net'),
        (20,4,3,'Donec at arcu. Vestibulum ante','Emery Xavier','erat.semper@aol.edu'),
        (38,24,2,'et magnis dis parturient montes,','Arden Galdino','tortor.nunc@hotmail.couk'),
        (50,46,1,'velit in aliquet lobortis, nisi','Marah Nunes','augue.ac@google.couk'),
        (61,24,5,'ullamcorper magna. Sed eu eros.','Christian Menezes','nunc.mauris@protonmail.com')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (38,46,3,'a, aliquet vel, vulputate eu,','Clarke Moraes','eu.lacus@icloud.edu'),
        (56,42,3,'elementum purus, accumsan interdum libero','Hamilton Macedo','augue.sed@yahoo.org'),
        (87,12,3,'eu, placerat eget, venenatis a,','Murphy Pires','nunc.lectus@icloud.com'),
        (88,54,2,'Ut tincidunt vehicula risus. Nulla','Tiger de Matos','curabitur@yahoo.org'),
        (43,54,1,'magna sed dui. Fusce aliquam,','Wylie de Melo','lobortis.ultrices@hotmail.org'),
        (66,60,1,'nibh. Donec est mauris, rhoncus','Scarlet Vaz','dolor@hotmail.com'),
        (74,17,2,'ligula. Aenean gravida nunc sed','Rebecca Furtado','rutrum.fusce@hotmail.ca'),
        (49,8,2,'eleifend non, dapibus rutrum, justo.','Willa Castro','id.sapien.cras@aol.ca'),
        (67,65,3,'egestas, urna justo faucibus lectus,','Gil Sampaio','vitae.posuere.at@icloud.net'),
        (27,69,5,'sociis natoque penatibus et magnis','Cedric de Morais','egestas.rhoncus@yahoo.org')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (81,24,1,'ipsum dolor sit amet, consectetuer','Keefe do Carmo','pede.ultrices.a@hotmail.com'),
        (38,1,2,'amet metus. Aliquam erat volutpat.','Raya dos Anjos','ornare.libero@icloud.net'),
        (30,5,1,'vehicula aliquet libero. Integer in','Lionel de Moraes','bibendum.sed@google.net'),
        (4,57,4,'semper. Nam tempor diam dictum','Steven Almeida','risus@hotmail.org'),
        (83,61,4,'eget odio. Aliquam vulputate ullamcorper','Prescott Reis','eleifend.egestas.sed@protonmail.couk'),
        (39,48,1,'nec tellus. Nunc lectus pede,','Jayme de Fatima','turpis.nulla@google.org'),
        (53,32,3,'ut, sem. Nulla interdum. Curabitur','Stephen Henrique','eu.sem@google.com'),
        (37,23,2,'Donec est. Nunc ullamcorper, velit','Ivor de Araujo','neque.nullam@aol.org'),
        (47,65,2,'lorem, sit amet ultricies sem','Summer Nonato','nec.enim.nunc@outlook.org'),
        (32,35,3,'dictum sapien. Aenean massa. Integer','Emi Evangelista','sit.amet@protonmail.org')
        
        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (93,69,4,'lectus justo eu arcu. Morbi','Omar Magalhaes','tincidunt.nunc@google.net'),
        (12,45,4,'posuere cubilia Curae Phasellus ornare.','Sonya da Silveira','facilisis.facilisis@outlook.ca'),
        (21,64,4,'venenatis lacus. Etiam bibendum fermentum','Colette Reis','ante.iaculis@hotmail.edu'),
        (100,9,4,'malesuada vel, convallis in, cursus','Petra Silva','sagittis.semper@aol.com'),
        (37,57,4,'purus mauris a nunc. In','Arden Das Chagas','proin.eget@icloud.com'),
        (12,16,4,'quis, pede. Praesent eu dui.','Dale de Castro','risus.quis.diam@icloud.com'),
        (35,46,4,'mauris sagittis placerat. Cras dictum','Karen Vieira','adipiscing.elit@protonmail.edu'),
        (75,59,5,'at, iaculis quis, pede. Praesent','Leigh Firmino','enim.nunc@outlook.net'),
        (38,66,5,'faucibus leo, in lobortis tellus','Wylie da Rosa','urna.et@aol.org'),
        (71,29,4,'enim, sit amet ornare lectus','Todd Das Chagas','dolor.fusce.feugiat@yahoo.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (33,36,5,'lacus vestibulum lorem, sit amet','Azalia Carvalho','sed.et@google.net'),
        (78,8,3,'gravida non, sollicitudin a, malesuada','Kasimir Gonçalves','consequat@outlook.com'),
        (82,3,4,'orci luctus et ultrices posuere','Nero Caetano','eget.tincidunt@icloud.org'),
        (79,38,3,'lectus pede et risus. Quisque','Aladdin Medeiros','a@outlook.couk'),
        (88,61,3,'imperdiet ullamcorper. Duis at lacus.','Jaquelyn de Azevedo','ad.litora.torquent@icloud.ca'),
        (4,61,5,'vestibulum massa rutrum magna. Cras','Brock Brandao','tempus.non.lacinia@google.edu'),
        (74,49,5,'adipiscing elit. Aliquam auctor, velit','Hedley Chagas','sem@aol.ca'),
        (6,12,4,'ac nulla. In tincidunt congue','Ralph Monteiro','donec.tempor@icloud.org'),
        (39,35,4,'In ornare sagittis felis. Donec','Drake Barreto','duis.gravida@google.ca'),
        (64,9,4,'In at pede. Cras vulputate','Astra Pacheco','tristique.senectus.et@protonmail.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (39,15,4,'nec urna suscipit nonummy. Fusce','Kelsey Mariano','donec.sollicitudin@aol.com'),
        (56,57,4,'Mauris nulla. Integer urna. Vivamus','Xantha Marinho','nunc.pulvinar@icloud.com'),
        (13,37,4,'dolor sit amet, consectetuer adipiscing','Elvis de Morais','quis.urna@protonmail.com'),
        (72,63,4,'Proin dolor. Nulla semper tellus','Minerva Matos','in.sodales.elit@aol.edu'),
        (88,60,4,'dui. Suspendisse ac metus vitae','Oren Leal','non.leo@hotmail.couk'),
        (91,17,5,'turpis egestas. Aliquam fringilla cursus','Bernard de Brito','mus.donec@aol.net'),
        (89,69,4,'adipiscing, enim mi tempor lorem,','Whoopi Fonseca','ipsum.primis@hotmail.com'),
        (58,49,4,'ut, pellentesque eget, dictum placerat,','Thor de Brito','facilisis.vitae@aol.ca'),
        (97,54,5,'turpis. Aliquam adipiscing lobortis risus.','Aurelia Simoes','consequat.auctor@yahoo.com'),
        (27,16,5,'sed turpis nec mauris blandit','Imani Barboza','vulputate.nisi.sem@protonmail.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (17,5,4,'aliquam eros turpis non enim.','Upton Messias','ligula.nullam.feugiat@icloud.couk'),
        (8,11,3,'lectus. Nullam suscipit, est ac','Tatiana Franco','imperdiet.nec@hotmail.org'),
        (96,19,5,'vestibulum. Mauris magna. Duis dignissim','Jerome Correia','lorem.semper@protonmail.org'),
        (52,56,5,'nec, eleifend non, dapibus rutrum,','Brendan Lemos','nec.malesuada@google.com'),
        (7,32,3,'mauris, aliquam eu, accumsan sed,','Paki Pires','nunc@aol.ca'),
        (51,54,4,'eu augue porttitor interdum. Sed','Tamekah Inacio','cursus.integer@icloud.org'),
        (39,9,4,'facilisis vitae, orci. Phasellus dapibus','Evan Freitas','est@google.couk'),
        (6,41,4,'nisl. Nulla eu neque pellentesque','Evan de Carvalho','ipsum.nunc@outlook.edu'),
        (24,59,5,'viverra. Maecenas iaculis aliquet diam.','Laith Rocha','dignissim.pharetra@hotmail.edu'),
        (98,19,5,'scelerisque scelerisque dui. Suspendisse ac','Callie Silva','natoque.penatibus.et@google.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (44,30,4,'aliquam eros turpis non enim.','Michael Barros','quis.turpis.vitae@protonmail.org'),
        (49,17,3,'eu tellus. Phasellus elit pede,','Jamal Moreira','ridiculus.mus@google.edu'),
        (80,36,4,'et nunc. Quisque ornare tortor','Alfonso de Barros','est.mauris@hotmail.ca'),
        (52,6,5,'Nullam feugiat placerat velit. Quisque','Samson Machado','eu.neque@aol.org'),
        (63,24,4,'tellus. Nunc lectus pede, ultrices','Maite de Lima','auctor.vitae.aliquet@hotmail.ca'),
        (36,18,4,'amet risus. Donec egestas. Aliquam','Dylan Rezende','sit.amet@protonmail.couk'),
        (11,8,5,'id magna et ipsum cursus','Leandra Freire','ante.dictum@outlook.ca'),
        (49,6,5,'nibh vulputate mauris sagittis placerat.','James Moraes','interdum@yahoo.com'),
        (74,11,3,'erat. Sed nunc est, mollis','Ella Barbosa','penatibus@yahoo.com'),
        (79,32,3,'amet orci. Ut sagittis lobortis','Wesley de Assis','nulla.integer@hotmail.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (37,37,4,'in molestie tortor nibh sit','Griffin Das Chagas','ornare.in@google.net'),
        (57,43,3,'convallis, ante lectus convallis est,','Oleg Santos','gravida@icloud.org'),
        (76,45,3,'nunc sed pede. Cum sociis','Oprah Dias','phasellus.in@google.edu'),
        (58,61,5,'a felis ullamcorper viverra. Maecenas','Tate Firmino','eleifend@outlook.net'),
        (97,18,3,'Nunc mauris elit, dictum eu,','Brynn Castro','tincidunt.orci.quis@hotmail.org'),
        (51,28,5,'penatibus et magnis dis parturient','Brian dos Reis','consectetuer@protonmail.ca'),
        (88,46,4,'id, ante. Nunc mauris sapien,','Zena Siqueira','scelerisque.dui@google.edu'),
        (94,26,5,'Sed eu eros. Nam consequat','Colin Nogueira','scelerisque@hotmail.couk'),
        (27,48,5,'amet diam eu dolor egestas','Halla Lima','nec.mauris.blandit@aol.couk'),
        (14,39,3,'gravida molestie arcu. Sed eu','Calvin Das Dores','augue@hotmail.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (86,59,4,'quis turpis vitae purus gravida','Donna Dantas','massa.quisque@icloud.org'),
        (60,19,4,'dolor. Fusce feugiat. Lorem ipsum','Shay de Santana','vitae@icloud.net'),
        (23,16,3,'pede ac urna. Ut tincidunt','Gillian de Barros','erat.vitae@hotmail.org'),
        (23,39,3,'Phasellus dapibus quam quis diam.','Allistair Almeida','pede@icloud.couk'),
        (68,53,4,'tellus justo sit amet nulla.','Herrod Leal','duis@hotmail.edu'),
        (7,15,4,'montes, nascetur ridiculus mus. Aenean','Dalton de Moura','morbi.sit.amet@aol.org'),
        (46,24,3,'porttitor tellus non magna. Nam','Driscoll do Carmo','enim.sit@hotmail.edu'),
        (17,18,4,'luctus. Curabitur egestas nunc sed','Gloria Muniz','maecenas.iaculis@icloud.com'),
        (55,41,3,'convallis dolor. Quisque tincidunt pede','Andrew Neves','lorem.vitae@outlook.edu'),
        (36,38,3,'aliquet libero. Integer in magna.','Cruz Leite','vehicula@protonmail.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (72,42,4,'ipsum porta elit, a feugiat','Briar Carvalho','sagittis@google.com'),
        (67,1,3,'nibh lacinia orci, consectetuer euismod','Michael Simoes','quis.diam@outlook.net'),
        (12,60,4,'velit dui, semper et, lacinia','Shelby da Silveira','non.hendrerit@hotmail.edu'),
        (68,50,4,'pharetra. Nam ac nulla. In','Patricia de Moraes','nunc.risus@hotmail.net'),
        (34,8,5,'Fusce fermentum fermentum arcu. Vestibulum','Wade Candido','et.euismod@aol.ca'),
        (91,2,4,'consectetuer euismod est arcu ac','Olga Cavalcante','bibendum.fermentum.metus@protonmail.com'),
        (30,45,4,'magna. Duis dignissim tempor arcu.','Winter Aguiar','aenean.gravida@aol.edu'),
        (33,6,3,'Donec nibh enim, gravida sit','Damian da Rosa','egestas.rhoncus.proin@icloud.ca'),
        (70,64,4,'nisi nibh lacinia orci, consectetuer','Elizabeth Siqueira','donec.vitae@hotmail.org'),
        (26,28,5,'Pellentesque tincidunt tempus risus. Donec','Merritt Castro','per.inceptos@outlook.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (57,24,4,'in faucibus orci luctus et','Shad Aguiar','pharetra@google.couk'),
        (48,55,4,'Sed malesuada augue ut lacus.','Sebastian de Lourdes','convallis.dolor@google.couk'),
        (63,17,5,'erat, in consectetuer ipsum nunc','Robin Almeida','egestas.duis@aol.couk'),
        (96,42,4,'imperdiet ullamcorper. Duis at lacus.','Juliet Lopes','sociosqu.ad@yahoo.org'),
        (87,24,4,'consequat nec, mollis vitae, posuere','Alan Vaz','habitant.morbi.tristique@icloud.edu'),
        (27,67,3,'at arcu. Vestibulum ante ipsum','Arthur Paulino','aliquet.vel@icloud.edu'),
        (64,10,4,'tortor nibh sit amet orci.','Connor de Morais','volutpat@protonmail.ca'),
        (30,62,5,'Etiam laoreet, libero et tristique','Samuel Moreira','est.vitae@google.couk'),
        (66,62,4,'vehicula. Pellentesque tincidunt tempus risus.','Uriah Bento','ut.sagittis@outlook.edu'),
        (24,47,5,'fringilla ornare placerat, orci lacus','Roth Cordeiro','interdum.libero@hotmail.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (99,9,4,'sit amet ornare lectus justo','Maxine Rezende','vitae.mauris@google.net'),
        (37,53,4,'Curabitur egestas nunc sed libero.','Magee Inacio','erat.semper@aol.org'),
        (95,30,4,'luctus et ultrices posuere cubilia','Henry Cardoso','nec.euismod@icloud.couk'),
        (46,41,5,'magna sed dui. Fusce aliquam,','Oliver de Moraes','purus.accumsan.interdum@yahoo.edu'),
        (21,65,3,'ipsum dolor sit amet, consectetuer','Ciaran Chaves','pede.suspendisse@yahoo.couk'),
        (41,45,5,'blandit mattis. Cras eget nisi','Anne Correia','velit@aol.com'),
        (39,31,4,'est, congue a, aliquet vel,','Ingrid Reis','ante@aol.couk'),
        (34,44,4,'sagittis felis. Donec tempor, est','Lillian Moura','aliquet.phasellus@protonmail.edu'),
        (64,5,3,'morbi tristique senectus et netus','Jamal da Silveira','ultrices.a@outlook.ca'),
        (44,47,5,'penatibus et magnis dis parturient','Mannix Messias','molestie.tortor.nibh@icloud.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (99,31,4,'iaculis enim, sit amet ornare','Maisie Fagundes','cursus@icloud.net'),
        (56,17,4,'lectus ante dictum mi, ac','Yardley Cardoso','ipsum.donec@outlook.ca'),
        (87,10,4,'est, mollis non, cursus non,','Mari Das Gracas','sagittis.duis@outlook.edu'),
        (25,12,4,'ut, pharetra sed, hendrerit a,','Vielka de Morais','tempus.non@google.ca'),
        (59,48,4,'eu tempor erat neque non','Hayes Camargo','convallis.erat@yahoo.net'),
        (26,18,4,'amet lorem semper auctor. Mauris','Cassady Nunes','fusce.feugiat.lorem@hotmail.couk'),
        (57,57,4,'Phasellus fermentum convallis ligula. Donec','Bradley de Abreu','non@aol.org'),
        (9,12,4,'magna. Suspendisse tristique neque venenatis','Velma Freitas','dolor.elit@google.org'),
        (25,48,3,'luctus lobortis. Class aptent taciti','Jocelyn Mendes','luctus@hotmail.net'),
        (73,61,5,'consequat nec, mollis vitae, posuere','Olivia Santos','sit.amet@icloud.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (25,3,3,'vel, convallis in, cursus et,','Jameson dos Reis','fusce@protonmail.net'),
        (58,40,4,'sit amet massa. Quisque porttitor','Eugenia Martins','nisl.elementum@yahoo.net'),
        (84,30,3,'magna, malesuada vel, convallis in,','Cailin Bueno','etiam@yahoo.com'),
        (78,30,3,'malesuada fames ac turpis egestas.','Brett Faria','et.magnis@outlook.ca'),
        (81,20,4,'a, magna. Lorem ipsum dolor','Fulton Firmino','mauris.ipsum@icloud.edu'),
        (60,50,4,'euismod et, commodo at, libero.','Autumn de Fatima','lacus@outlook.ca'),
        (86,28,4,'rutrum non, hendrerit id, ante.','Marcia de Araujo','sed.malesuada.augue@protonmail.com'),
        (57,30,3,'dolor, nonummy ac, feugiat non,','Zorita do Carmo','eu.neque@yahoo.ca'),
        (82,40,4,'pede. Cras vulputate velit eu','Steel dos Santos','curae.phasellus.ornare@outlook.ca'),
        (21,25,4,'Duis cursus, diam at pretium','Fulton Matias','vel@aol.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (87,12,3,'eu neque pellentesque massa lobortis','Barry Fonseca','semper@protonmail.com'),
        (53,62,5,'ante dictum mi, ac mattis','Desirae Bispo','aliquet.libero@icloud.couk'),
        (59,4,4,'sodales elit erat vitae risus.','Stuart de Sousa','quis.accumsan.convallis@google.ca'),
        (75,36,5,'lorem, eget mollis lectus pede','Alisa Torres','semper.pretium.neque@aol.edu'),
        (34,64,5,'consequat dolor vitae dolor. Donec','Mark Soares','ac.libero.nec@hotmail.org'),
        (94,44,4,'netus et malesuada fames ac','Blythe Marques','augue.id@icloud.com'),
        (24,24,5,'Nullam velit dui, semper et,','Malcolm Das Neves','pede.ac@hotmail.com'),
        (81,35,3,'facilisis vitae, orci. Phasellus dapibus','Rosalyn Evangelista','nisl.arcu@icloud.ca'),
        (94,12,5,'nulla vulputate dui, nec tempus','Rachel Freire','elit.pede.malesuada@protonmail.ca'),
        (79,38,4,'ultricies adipiscing, enim mi tempor','Hu do Carmo','ut.nisi@yahoo.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (17,9,4,'odio vel est tempor bibendum.','Conan de Freitas','consequat.purus.maecenas@outlook.com'),
        (98,29,5,'nec luctus felis purus ac','Dale Feitosa','tempor.augue@protonmail.edu'),
        (41,9,5,'scelerisque neque sed sem egestas','Fiona Felix','egestas@hotmail.net'),
        (20,4,5,'sapien imperdiet ornare. In faucibus.','Elvis Amaral','mauris.sit@aol.net'),
        (46,5,5,'sit amet, consectetuer adipiscing elit.','Zephr Cabral','faucibus@outlook.com'),
        (57,59,4,'mus. Aenean eget magna. Suspendisse','Joseph Morais','ultrices.a@protonmail.com'),
        (5,7,3,'nisi. Cum sociis natoque penatibus','Reece da Silveira','venenatis@yahoo.org'),
        (41,14,3,'vulputate velit eu sem. Pellentesque','Acton Gomes','commodo.auctor.velit@protonmail.com'),
        (30,55,4,'vel pede blandit congue. In','Nathan Soares','ac.fermentum.vel@protonmail.ca'),
        (83,16,3,'enim, sit amet ornare lectus','Wynter Bueno','et@icloud.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (83,50,5,'Nam interdum enim non nisi.','Cassady Cavalcante','erat@aol.ca'),
        (56,50,3,'porttitor eros nec tellus. Nunc','Lucas Lima','vitae.posuere@yahoo.ca'),
        (36,31,3,'in lobortis tellus justo sit','Echo Santos','nunc@hotmail.couk'),
        (3,45,4,'Nam ligula elit, pretium et,','Noelani Guedes','lectus.pede.et@icloud.couk'),
        (74,53,3,'Phasellus nulla. Integer vulputate, risus','Kiona Vaz','ullamcorper.velit@aol.edu'),
        (59,56,4,'Etiam bibendum fermentum metus. Aenean','Hedwig Matos','primis.in.faucibus@outlook.net'),
        (42,6,4,'lorem eu metus. In lorem.','Quinlan de Souza','non.lobortis@aol.ca'),
        (28,37,5,'primis in faucibus orci luctus','Hilel da Costa','ac.tellus.suspendisse@outlook.ca'),
        (78,25,4,'eleifend egestas. Sed pharetra, felis','Simone Das Dores','sed.sapien.nunc@yahoo.com'),
        (94,8,5,'facilisis vitae, orci. Phasellus dapibus','Ariel Pinheiro','in.ornare.sagittis@google.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (100,42,4,'diam vel arcu. Curabitur ut','Blaze Andrade','sed@yahoo.ca'),
        (66,44,4,'Nunc mauris. Morbi non sapien','Nadine Franco','pede@hotmail.couk'),
        (73,68,4,'eget laoreet posuere, enim nisl','Joan Trindade','cursus.a@outlook.ca'),
        (61,14,5,'metus vitae velit egestas lacinia.','Derek Franca','donec.dignissim.magna@aol.net'),
        (71,45,4,'sit amet lorem semper auctor.','Edward Bispo','orci.in@yahoo.edu'),
        (97,26,4,'et, commodo at, libero. Morbi','Ariana Morais','velit.aliquam.nisl@icloud.org'),
        (50,20,4,'in magna. Phasellus dolor elit,','Geraldine de Santana','nec.malesuada.ut@google.edu'),
        (83,24,5,'egestas a, dui. Cras pellentesque.','Jaime Cardoso','a.tortor.nunc@icloud.org'),
        (86,17,4,'vulputate, nisi sem semper erat,','Victor de Araujo','faucibus.lectus.a@protonmail.org'),
        (25,42,4,'ullamcorper magna. Sed eu eros.','Meredith Santana','quam@protonmail.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (27,46,4,'convallis in, cursus et, eros.','Catherine de Fatima','maecenas.libero.est@icloud.edu'),
        (78,53,4,'purus. Maecenas libero est, congue','Ignacia Guimaraes','cursus.in@outlook.couk'),
        (44,26,4,'ullamcorper, velit in aliquet lobortis,','Ella Gonçalves','in@outlook.com'),
        (35,58,4,'magna tellus faucibus leo, in','Cara Cordeiro','euismod.in@protonmail.ca'),
        (70,12,4,'ullamcorper. Duis at lacus. Quisque','Phillip de Moura','ornare@aol.org'),
        (27,64,3,'nunc nulla vulputate dui, nec','Clayton Evangelista','pharetra.quisque@hotmail.net'),
        (73,12,5,'enim nisl elementum purus, accumsan','Marsden Viana','rutrum.justo@yahoo.couk'),
        (2,28,3,'eget magna. Suspendisse tristique neque','Geraldine de Castro','cursus@hotmail.edu'),
        (33,27,5,'pede, nonummy ut, molestie in,','Wilma Chagas','interdum.libero@google.edu'),
        (11,61,5,'odio tristique pharetra. Quisque ac','Lionel Felix','etiam.vestibulum@google.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (64,50,4,'magna, malesuada vel, convallis in,','Larissa Furtado','nascetur.ridiculus@yahoo.edu'),
        (30,61,4,'Donec consectetuer mauris id sapien.','Conan de Sousa','proin.ultrices@aol.edu'),
        (20,9,5,'lectus. Cum sociis natoque penatibus','Mariko Furtado','malesuada.fames@yahoo.org'),
        (48,6,5,'ornare sagittis felis. Donec tempor,','Medge Garcia','urna.suscipit.nonummy@icloud.edu'),
        (36,16,4,'lorem vitae odio sagittis semper.','Keaton Carneiro','donec.vitae@outlook.net'),
        (70,69,4,'in consectetuer ipsum nunc id','Joshua Domingues','gravida.sagittis.duis@protonmail.net'),
        (19,19,4,'lacus. Aliquam rutrum lorem ac','Violet Pereira','quam@google.edu'),
        (60,19,4,'Cras dictum ultricies ligula. Nullam','Hedda Garcia','nibh.quisque@google.edu'),
        (89,50,4,'auctor, velit eget laoreet posuere,','Russell Candido','nec.tellus.nunc@outlook.org'),
        (5,7,4,'Etiam gravida molestie arcu. Sed','Dante Das Neves','egestas.sed.pharetra@icloud.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (70,31,3,'in consequat enim diam vel','Shana Silveira','tincidunt.aliquam.arcu@icloud.couk'),
        (61,19,4,'ut eros non enim commodo','Aileen Fonseca','risus@aol.org'),
        (77,22,4,'Mauris magna. Duis dignissim tempor','Isadora da Luz','vitae.velit@protonmail.net'),
        (54,23,3,'id, libero. Donec consectetuer mauris','Jayme Oliveira','non.enim@outlook.couk'),
        (53,60,4,'mollis vitae, posuere at, velit.','Lucian dos Santos','eu@aol.couk'),
        (87,61,5,'Etiam laoreet, libero et tristique','Acton Reis','turpis.aliquam@aol.edu'),
        (54,15,5,'cursus. Integer mollis. Integer tincidunt','Reed Pacheco','molestie.dapibus@hotmail.com'),
        (61,21,3,'tempor, est ac mattis semper,','Emmanuel da Luz','lorem.vehicula.et@outlook.couk'),
        (11,41,4,'vestibulum, neque sed dictum eleifend,','Athena Nogueira','vulputate.risus@outlook.net'),
        (85,18,4,'netus et malesuada fames ac','Sacha de Azevedo','vivamus.sit@aol.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (69,60,4,'turpis vitae purus gravida sagittis.','Aimee Carvalho','donec.vitae@protonmail.org'),
        (91,21,4,'leo. Vivamus nibh dolor, nonummy','Avram de Morais','eget.ipsum@aol.ca'),
        (68,21,5,'ante bibendum ullamcorper. Duis cursus,','Kaye Aguiar','per.conubia@yahoo.net'),
        (7,58,4,'Cras vehicula aliquet libero. Integer','Ray Bento','proin.dolor@outlook.com'),
        (12,3,4,'vel est tempor bibendum. Donec','Winter Fagundes','sem.nulla@outlook.ca'),
        (34,24,5,'odio. Phasellus at augue id','Kibo Bento','montes.nascetur.ridiculus@hotmail.couk'),
        (70,19,4,'sit amet ultricies sem magna','Iliana Guedes','scelerisque@protonmail.com'),
        (20,48,5,'pede ac urna. Ut tincidunt','Jolie Mendes','pretium.aliquet.metus@outlook.org'),
        (80,4,5,'nunc sed pede. Cum sociis','Destiny Sampaio','et.libero@google.couk'),
        (39,7,4,'nonummy ac, feugiat non, lobortis','Ariana Correa','etiam.imperdiet@aol.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (90,4,3,'Nunc mauris elit, dictum eu,','Lester de Campos','gravida.non.sollicitudin@aol.net'),
        (27,37,4,'lectus rutrum urna, nec luctus','Leilani de Freitas','in.nec@hotmail.ca'),
        (69,44,3,'tristique pharetra. Quisque ac libero','Phillip Galdino','a.scelerisque@hotmail.ca'),
        (59,12,4,'vulputate, risus a ultricies adipiscing,','Ahmed Das Dores','tincidunt.aliquam@hotmail.ca'),
        (61,44,4,'diam. Proin dolor. Nulla semper','Halla Leal','et.pede@aol.com'),
        (37,29,4,'mauris sapien, cursus in, hendrerit','Elizabeth Simoes','curabitur.vel@icloud.ca'),
        (45,27,3,'Duis at lacus. Quisque purus','Brooke Camargo','libero.lacus@outlook.ca'),
        (97,65,4,'elit sed consequat auctor, nunc','Malik Barreto','non.leo@aol.edu'),
        (57,33,5,'faucibus. Morbi vehicula. Pellentesque tincidunt','Clio de Assis','purus@hotmail.couk'),
        (41,6,4,'varius ultrices, mauris ipsum porta','Ashely da Silva','felis.purus@outlook.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (56,51,4,'eu elit. Nulla facilisi. Sed','Lenore Moura','lectus.convallis.est@hotmail.org'),
        (98,33,5,'rutrum lorem ac risus. Morbi','Hyatt Bezerra','varius.nam@yahoo.net'),
        (27,37,3,'Ut semper pretium neque. Morbi','Andrew Batista','cubilia.curae.donec@icloud.net'),
        (17,57,5,'tincidunt, nunc ac mattis ornare,','Clarke Cruz','pede.ac.urna@aol.ca'),
        (52,16,3,'Ut tincidunt vehicula risus. Nulla','Keefe Firmino','augue.ac@google.couk'),
        (85,52,4,'imperdiet ornare. In faucibus. Morbi','Yoshio Das Chagas','feugiat.metus@hotmail.com'),
        (85,38,5,'odio. Aliquam vulputate ullamcorper magna.','Ciara Sales','aenean@google.org'),
        (67,8,5,'eget, volutpat ornare, facilisis eget,','Lawrence Farias','mus.aenean@google.ca'),
        (97,57,4,'iaculis aliquet diam. Sed diam','Hadassah Gomes','odio@protonmail.edu'),
        (44,56,4,'diam vel arcu. Curabitur ut','Candace Furtado','et@google.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (85,40,5,'lacinia orci, consectetuer euismod est','Ian Santana','nunc@aol.couk'),
        (83,57,5,'orci tincidunt adipiscing. Mauris molestie','Ulric Matias','in.felis.nulla@aol.couk'),
        (70,35,4,'lobortis. Class aptent taciti sociosqu','Marsden Nonato','ut@hotmail.org'),
        (73,26,4,'urna. Vivamus molestie dapibus ligula.','Noble Monteiro','mus.donec@aol.net'),
        (1,6,4,'aliquam iaculis, lacus pede sagittis','Cailin Barros','orci.lacus.vestibulum@aol.edu'),
        (10,33,5,'turpis egestas. Fusce aliquet magna','Deanna Ramos','ultricies.sem@protonmail.ca'),
        (41,19,3,'enim nisl elementum purus, accumsan','Edward Bento','non.quam.pellentesque@icloud.ca'),
        (67,12,3,'primis in faucibus orci luctus','Veronica Pereira','sem.mollis@protonmail.com'),
        (61,34,3,'enim, gravida sit amet, dapibus','Jerome Martins','sem.molestie@outlook.ca'),
        (8,28,4,'volutpat. Nulla dignissim. Maecenas ornare','Conan Coelho','dignissim.tempor@aol.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (28,61,4,'rutrum eu, ultrices sit amet,','Emery Ramos','ligula@icloud.com'),
        (64,23,3,'sapien. Aenean massa. Integer vitae','Nola Mariano','sed@outlook.com'),
        (25,46,3,'orci. Phasellus dapibus quam quis','Stephen de Moura','nunc.ac@protonmail.couk'),
        (11,17,4,'porttitor vulputate, posuere vulputate, lacus.','Jonah Fernandes','metus.eu@google.ca'),
        (43,63,4,'felis, adipiscing fringilla, porttitor vulputate,','Genevieve de Souza','nullam.feugiat.placerat@aol.edu'),
        (65,64,4,'eu nibh vulputate mauris sagittis','Arsenio Barros','enim.condimentum@yahoo.com'),
        (19,22,4,'nonummy. Fusce fermentum fermentum arcu.','Zoe Correa','egestas.rhoncus@hotmail.edu'),
        (94,48,5,'mauris, aliquam eu, accumsan sed,','Brenda de Castro','per.conubia@google.edu'),
        (52,17,3,'adipiscing lobortis risus. In mi','Damian Caetano','ligula@yahoo.couk'),
        (52,29,4,'orci, adipiscing non, luctus sit','Jolie Duarte','turpis.nec@outlook.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (28,45,4,'Fusce feugiat. Lorem ipsum dolor','Isadora Domingues','inceptos.hymenaeos@yahoo.org'),
        (97,54,3,'consequat auctor, nunc nulla vulputate','Hedda Monteiro','mauris@google.org'),
        (77,13,3,'aliquet. Proin velit. Sed malesuada','Emma Henrique','felis@hotmail.ca'),
        (44,30,5,'nascetur ridiculus mus. Donec dignissim','Leo Barros','vitae.sodales.at@google.net'),
        (77,60,4,'felis. Nulla tempor augue ac','Shelby Torres','quis.diam@google.org'),
        (96,15,3,'cursus et, magna. Praesent interdum','Kathleen Barreto','urna@aol.ca'),
        (22,53,3,'egestas ligula. Nullam feugiat placerat','Yael Mariano','velit.egestas@icloud.net'),
        (81,61,4,'quis, pede. Praesent eu dui.','Ayanna Gonzaga','augue@outlook.couk'),
        (47,67,3,'auctor non, feugiat nec, diam.','Nero Faria','et@hotmail.edu'),
        (87,64,4,'mi lacinia mattis. Integer eu','Summer Silveira','leo.morbi.neque@yahoo.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (11,34,4,'ut eros non enim commodo','Marvin Diniz','tempus@aol.ca'),
        (15,45,5,'velit. Pellentesque ultricies dignissim lacus.','Malcolm da Costa','elit.fermentum@protonmail.edu'),
        (36,9,4,'a neque. Nullam ut nisi','Omar Soares','aliquet.libero@aol.edu'),
        (91,44,3,'primis in faucibus orci luctus','Lilah Mota','vivamus.nibh@hotmail.org'),
        (44,65,5,'a tortor. Nunc commodo auctor','Zahir de Carvalho','integer.tincidunt@protonmail.org'),
        (73,67,3,'ut dolor dapibus gravida. Aliquam','Kameko Maia','maecenas@aol.com'),
        (45,32,4,'aliquam arcu. Aliquam ultrices iaculis','Quail Firmino','dolor@google.couk'),
        (49,23,4,'Nunc sollicitudin commodo ipsum. Suspendisse','Guy Leal','luctus@hotmail.edu'),
        (83,30,3,'mus. Proin vel nisl. Quisque','Emery de Lima','parturient@protonmail.com'),
        (95,57,4,'mus. Proin vel arcu eu','Karyn Alves','sed.nunc.est@aol.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (76,18,4,'luctus sit amet, faucibus ut,','Allistair Cardoso','scelerisque@hotmail.couk'),
        (51,67,4,'quam dignissim pharetra. Nam ac','John da Rosa','nascetur.ridiculus@outlook.org'),
        (82,16,5,'vulputate ullamcorper magna. Sed eu','Elvis Bento','est.mauris@outlook.net'),
        (63,70,4,'purus. Nullam scelerisque neque sed','Jordan Cardoso','ligula.nullam@icloud.net'),
        (79,42,3,'sociis natoque penatibus et magnis','Quamar de Morais','urna.nec@protonmail.com'),
        (35,63,4,'leo. Morbi neque tellus, imperdiet','Camden Nunes','aliquet.sem.ut@outlook.ca'),
        (88,4,5,'magna. Praesent interdum ligula eu','Louis Moraes','magna.praesent@yahoo.edu'),
        (29,57,3,'nunc risus varius orci, in','Mari do Nascimento','sagittis@yahoo.ca'),
        (96,47,4,'at pede. Cras vulputate velit','Wesley de Souza','duis.sit@hotmail.edu'),
        (39,16,3,'erat vel pede blandit congue.','Leila Cavalcante','tempus@protonmail.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (46,13,4,'neque venenatis lacus. Etiam bibendum','April de Freitas','dolor@yahoo.org'),
        (53,13,5,'dui. Cum sociis natoque penatibus','Stone Galdino','non@google.org'),
        (71,64,4,'lobortis tellus justo sit amet','Dalton Henrique','aliquet@google.org'),
        (35,45,3,'magna. Cras convallis convallis dolor.','Athena Teixeira','cum.sociis.natoque@hotmail.net'),
        (76,39,4,'est. Mauris eu turpis. Nulla','Ima Teodoro','sit.amet.risus@hotmail.couk'),
        (18,15,4,'urna. Nunc quis arcu vel','Austin Monteiro','et.risus@google.edu'),
        (47,12,4,'faucibus orci luctus et ultrices','Kane de Moraes','scelerisque@hotmail.com'),
        (24,6,4,'Donec nibh enim, gravida sit','Jaime Freitas','ultrices.vivamus@icloud.net'),
        (81,46,5,'molestie sodales. Mauris blandit enim','Jaime Pacheco','et@aol.ca'),
        (34,23,4,'est arcu ac orci. Ut','Karly Santiago','vitae.sodales@protonmail.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (83,50,3,'nec, mollis vitae, posuere at,','Marshall Abreu','pede.sagittis@yahoo.org'),
        (93,47,5,'Nunc mauris sapien, cursus in,','Mark de Castro','tortor.at@icloud.org'),
        (45,62,4,'lectus, a sollicitudin orci sem','Leslie Matias','ac@icloud.ca'),
        (60,16,5,'vulputate mauris sagittis placerat. Cras','Carl Lopes','mi@icloud.org'),
        (82,66,5,'accumsan interdum libero dui nec','Elmo Correia','tempus.non.lacinia@hotmail.com'),
        (35,26,5,'luctus et ultrices posuere cubilia','Lunea Mariano','cursus.et.eros@google.net'),
        (47,63,3,'risus varius orci, in consequat','Leah Mendes','eget.metus@hotmail.couk'),
        (3,57,4,'Praesent eu dui. Cum sociis','Jasper da Conceiçao','dui.lectus.rutrum@protonmail.ca'),
        (38,7,5,'mauris. Integer sem elit, pharetra','Richard Macedo','consequat@aol.net'),
        (86,49,5,'at risus. Nunc ac sem','Tatiana Pereira','malesuada.vel.venenatis@icloud.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (16,30,4,'magnis dis parturient montes, nascetur','Oren de Moraes','metus.aliquam@hotmail.org'),
        (74,58,4,'turpis egestas. Aliquam fringilla cursus','Hoyt Teixeira','diam.lorem@yahoo.edu'),
        (12,52,3,'porttitor scelerisque neque. Nullam nisl.','Madeson de Azevedo','faucibus.orci@google.ca'),
        (22,54,4,'Phasellus vitae mauris sit amet','Zephr Cardoso','ut.mi@aol.edu'),
        (68,3,4,'risus quis diam luctus lobortis.','David Alves','a.facilisis@google.couk'),
        (78,14,3,'Donec elementum, lorem ut aliquam','Fiona Sales','ipsum.suspendisse@aol.ca'),
        (17,9,4,'justo. Proin non massa non','Ivan Figueiredo','posuere.cubilia@protonmail.com'),
        (54,59,4,'quis diam. Pellentesque habitant morbi','Louis Magalhaes','felis.adipiscing@outlook.couk'),
        (95,22,4,'purus, in molestie tortor nibh','Brendan Das Chagas','nullam.velit.dui@outlook.com'),
        (62,17,5,'sed libero. Proin sed turpis','Cassandra Bispo','nascetur@yahoo.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (71,48,5,'dolor, tempus non, lacinia at,','Xena Mendes','nulla.vulputate@outlook.ca'),
        (50,42,4,'ligula. Nullam enim. Sed nulla','Wade da Costa','amet.ornare@google.com'),
        (5,29,5,'nonummy ipsum non arcu. Vivamus','Germane Messias','in.faucibus.morbi@icloud.org'),
        (76,9,5,'Donec felis orci, adipiscing non,','Patience Candido','mauris@hotmail.net'),
        (29,68,4,'neque venenatis lacus. Etiam bibendum','Todd Gonzaga','nunc.commodo@icloud.org'),
        (98,16,4,'gravida mauris ut mi. Duis','Elijah Caetano','diam.nunc.ullamcorper@yahoo.edu'),
        (52,32,5,'Aliquam auctor, velit eget laoreet','Cailin Leal','libero.proin.mi@google.org'),
        (17,49,5,'purus gravida sagittis. Duis gravida.','Mohammad Simoes','et@icloud.couk'),
        (7,13,4,'feugiat non, lobortis quis, pede.','Kiayada do Carmo','nisi.aenean.eget@protonmail.couk'),
        (98,34,3,'molestie dapibus ligula. Aliquam erat','Emerald Pinto','nullam.enim@outlook.couk')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (19,49,3,'iaculis nec, eleifend non, dapibus','Frances Santos','faucibus.orci.luctus@hotmail.com'),
        (34,42,4,'augue id ante dictum cursus.','Ulla Gonçalves','lacinia.at@outlook.ca'),
        (94,26,4,'sit amet metus. Aliquam erat','Clinton Freire','semper.rutrum.fusce@google.com'),
        (53,4,3,'nec tellus. Nunc lectus pede,','Victoria de Brito','sagittis.semper.nam@yahoo.org'),
        (98,47,5,'cubilia Curae Donec tincidunt. Donec','Michael Trindade','pellentesque@hotmail.net'),
        (36,60,4,'eget, ipsum. Donec sollicitudin adipiscing','Camille Duarte','nisi.mauris.nulla@hotmail.couk'),
        (56,4,4,'commodo hendrerit. Donec porttitor tellus','Paki Duarte','urna.nec@outlook.ca'),
        (93,59,4,'purus. Duis elementum, dui quis','Joan Dias','mauris.quis@protonmail.ca'),
        (81,6,4,'arcu vel quam dignissim pharetra.','Igor Franco','nec.leo.morbi@outlook.com'),
        (68,58,5,'dignissim tempor arcu. Vestibulum ut','Roary Bento','nec.diam@google.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (87,35,4,'ac metus vitae velit egestas','Connor Felix','quisque.ac@google.couk'),
        (11,14,4,'elit fermentum risus, at fringilla','Calvin Araujo','nulla.eget.metus@outlook.net'),
        (36,54,3,'imperdiet, erat nonummy ultricies ornare,','Benjamin Almeida','a@hotmail.edu'),
        (31,39,4,'Donec felis orci, adipiscing non,','Austin Brito','nostra.per@aol.net'),
        (99,12,5,'accumsan neque et nunc. Quisque','Alana Aguiar','nullam.ut@icloud.org'),
        (40,41,5,'enim, gravida sit amet, dapibus','Jordan Queiroz','aliquet.libero.integer@google.couk'),
        (3,67,3,'auctor vitae, aliquet nec, imperdiet','Teegan da Rosa','ligula.nullam@protonmail.ca'),
        (88,45,4,'sem. Nulla interdum. Curabitur dictum.','Naomi Custodio','libero@hotmail.org'),
        (78,67,5,'ac nulla. In tincidunt congue','Claudia Andrade','at.auctor@icloud.org'),
        (34,45,5,'at arcu. Vestibulum ante ipsum','George Freitas','eget.metus@icloud.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (99,49,4,'Vestibulum ante ipsum primis in','Tarik Braz','in.magna@google.edu'),
        (95,28,4,'faucibus lectus, a sollicitudin orci','Kylan de Souza','vitae@aol.com'),
        (81,68,5,'aliquam arcu. Aliquam ultrices iaculis','Sopoline Silveira','fermentum.arcu@protonmail.edu'),
        (1,41,5,'justo sit amet nulla. Donec','Kylan Pinto','nam@outlook.com'),
        (46,45,4,'Vivamus nibh dolor, nonummy ac,','Yetta Antunes','nascetur.ridiculus@outlook.com'),
        (57,56,5,'adipiscing ligula. Aenean gravida nunc','Hashim Reis','mauris.sit.amet@aol.ca'),
        (18,24,4,'nibh sit amet orci. Ut','Blythe Menezes','non.ante@icloud.couk'),
        (3,31,5,'vel quam dignissim pharetra. Nam','Heather Reis','per@yahoo.org'),
        (25,64,4,'cursus, diam at pretium aliquet,','Talon Ferraz','fames.ac@icloud.org'),
        (24,24,4,'auctor, velit eget laoreet posuere,','Kylan Dias','adipiscing.fringilla@yahoo.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (83,25,4,'scelerisque scelerisque dui. Suspendisse ac','Charissa Ramos','ut@yahoo.couk'),
        (46,52,4,'egestas, urna justo faucibus lectus,','Erin de Campos','ante.dictum@aol.com'),
        (87,34,4,'blandit enim consequat purus. Maecenas','Bruno Marques','lectus@icloud.com'),
        (27,39,4,'adipiscing. Mauris molestie pharetra nibh.','Brian Lopes','sed.malesuada@icloud.com'),
        (38,35,5,'sit amet ultricies sem magna','Paula da Cruz','curabitur.massa@hotmail.com'),
        (99,48,4,'at, libero. Morbi accumsan laoreet','Sybill Bispo','sed@outlook.com'),
        (68,58,4,'dui. Suspendisse ac metus vitae','Carly da Luz','molestie.pharetra@google.ca'),
        (95,45,4,'ipsum primis in faucibus orci','Isadora Sousa','felis.eget@hotmail.net'),
        (64,8,4,'Aliquam tincidunt, nunc ac mattis','Aidan Candido','nulla@icloud.ca'),
        (69,22,3,'dolor egestas rhoncus. Proin nisl','Hedwig Braz','erat@aol.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (17,44,5,'volutpat. Nulla facilisis. Suspendisse commodo','William Nunes','faucibus@outlook.edu'),
        (67,59,4,'aliquam, enim nec tempus scelerisque,','Lawrence Teixeira','urna.nullam@google.org'),
        (51,37,5,'Curabitur dictum. Phasellus in felis.','Chadwick Rocha','lorem.ut.aliquam@icloud.org'),
        (50,42,4,'turpis nec mauris blandit mattis.','Vincent Ribeiro','est.mollis@outlook.edu'),
        (74,69,4,'et arcu imperdiet ullamcorper. Duis','Mary Nogueira','convallis.erat@yahoo.edu'),
        (74,33,5,'egestas ligula. Nullam feugiat placerat','Melvin Caetano','lobortis.tellus@google.couk'),
        (50,31,3,'sit amet nulla. Donec non','James Barbosa','amet@icloud.org'),
        (54,14,5,'imperdiet ornare. In faucibus. Morbi','Curran Camargo','et.magnis.dis@protonmail.org'),
        (90,35,5,'eget ipsum. Suspendisse sagittis. Nullam','Violet Coelho','diam.dictum@google.edu'),
        (89,9,4,'Nulla tincidunt, neque vitae semper','Roth Das Gracas','condimentum.donec.at@aol.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (47,44,4,'elit, pretium et, rutrum non,','Peter Ramos','arcu.nunc@aol.edu'),
        (8,43,5,'fermentum arcu. Vestibulum ante ipsum','Tallulah Rocha','aliquam.arcu.aliquam@protonmail.couk'),
        (25,47,4,'justo nec ante. Maecenas mi','Jamal da Conceiçao','maecenas.malesuada@hotmail.org'),
        (55,9,4,'Quisque imperdiet, erat nonummy ultricies','Jakeem Abreu','ac.feugiat@hotmail.couk'),
        (8,51,4,'arcu vel quam dignissim pharetra.','Desirae Rocha','sapien.imperdiet.ornare@protonmail.edu'),
        (61,57,3,'et arcu imperdiet ullamcorper. Duis','Hiram Teodoro','fringilla.euismod@yahoo.ca'),
        (25,6,5,'Aenean massa. Integer vitae nibh.','Mara Medeiros','dictum.cursus@hotmail.edu'),
        (82,69,5,'sit amet, consectetuer adipiscing elit.','Miranda Amaral','eu@hotmail.org'),
        (17,14,4,'Nunc sollicitudin commodo ipsum. Suspendisse','Elliott Amaral','tellus.sem@outlook.com'),
        (26,27,4,'massa. Suspendisse eleifend. Cras sed','Tallulah Das Neves','est.ac@hotmail.edu')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (38,57,4,'posuere vulputate, lacus. Cras interdum.','Jayme Matos','purus@icloud.com'),
        (11,64,4,'vel turpis. Aliquam adipiscing lobortis','Basil Coelho','lacinia.orci@outlook.couk'),
        (61,48,4,'eu nibh vulputate mauris sagittis','Ignacia Barreto','lacus.etiam@icloud.ca'),
        (60,38,3,'purus, accumsan interdum libero dui','Sonia dos Reis','id.risus.quis@protonmail.com'),
        (2,14,4,'sapien, cursus in, hendrerit consectetuer,','Gray Castro','cursus@icloud.edu'),
        (23,6,3,'orci lobortis augue scelerisque mollis.','Harlan Matias','amet.ante@protonmail.com'),
        (62,39,3,'velit. Aliquam nisl. Nulla eu','Alice Lemos','sollicitudin.a.malesuada@yahoo.org'),
        (17,16,3,'magna. Suspendisse tristique neque venenatis','Vernon Amorim','lectus.justo@protonmail.ca'),
        (55,28,3,'Integer sem elit, pharetra ut,','Stacy Vaz','nulla@google.org'),
        (63,27,3,'eu tellus. Phasellus elit pede,','Zachery Santana','mollis.non.cursus@aol.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (56,68,3,'feugiat. Sed nec metus facilisis','Germane do Carmo','magna.nec@outlook.ca'),
        (9,46,4,'odio sagittis semper. Nam tempor','Castor da Luz','nec@hotmail.couk'),
        (65,31,5,'fermentum metus. Aenean sed pede','Samuel Siqueira','dolor.sit.amet@icloud.com'),
        (93,44,4,'elit erat vitae risus. Duis','Steel da Rosa','magna.lorem@outlook.com'),
        (55,69,4,'sollicitudin orci sem eget massa.','Penelope de Lourdes','eu.tellus.phasellus@yahoo.com'),
        (52,10,4,'molestie sodales. Mauris blandit enim','Sawyer de Abreu','in.hendrerit.consectetuer@outlook.net'),
        (80,18,5,'Curae Phasellus ornare. Fusce mollis.','Alfonso de Castro','leo.in@icloud.net'),
        (12,46,4,'et libero. Proin mi. Aliquam','Camden de Fatima','in.cursus@hotmail.org'),
        (17,15,4,'ipsum. Curabitur consequat, lectus sit','Buffy Nascimento','quisque.varius.nam@google.com'),
        (81,57,4,'mus. Proin vel arcu eu','Abra Tavares','enim.diam.vel@aol.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (62,35,4,'varius ultrices, mauris ipsum porta','Garrison de Assis','magna@google.net'),
        (2,36,4,'vitae velit egestas lacinia. Sed','Whitney Paulino','velit.pellentesque@hotmail.net'),
        (89,7,4,'magnis dis parturient montes, nascetur','Jennifer Azevedo','in.sodales.elit@google.org'),
        (33,41,3,'faucibus leo, in lobortis tellus','Willow Lima','nibh@aol.ca'),
        (37,63,4,'nisl. Maecenas malesuada fringilla est.','Fitzgerald Firmino','elit.pede@outlook.edu'),
        (46,17,4,'Nullam feugiat placerat velit. Quisque','Lillian dos Santos','fermentum.fermentum.arcu@google.edu'),
        (53,31,5,'a, malesuada id, erat. Etiam','Fallon de Almeida','proin.non@icloud.ca'),
        (88,48,4,'mollis. Duis sit amet diam','Maite Andrade','molestie@yahoo.org'),
        (49,54,4,'ipsum cursus vestibulum. Mauris magna.','Randall de Barros','cursus.in@aol.edu'),
        (10,5,4,'turpis. Aliquam adipiscing lobortis risus.','Amelia Teixeira','nibh@aol.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (65,65,3,'et, rutrum non, hendrerit id,','Rajah Maciel','molestie.pharetra.nibh@yahoo.com'),
        (73,37,3,'lectus rutrum urna, nec luctus','Mark Xavier','mus.aenean@google.com'),
        (90,23,3,'elit. Curabitur sed tortor. Integer','Gregory Viana','diam.duis@google.edu'),
        (46,34,4,'pede et risus. Quisque libero','Madeline Pinheiro','lorem@hotmail.edu'),
        (74,14,5,'augue eu tellus. Phasellus elit','Clinton Pires','nisi@aol.couk'),
        (58,49,4,'mattis velit justo nec ante.','Kevin Cabral','varius.orci@hotmail.couk'),
        (83,31,4,'Aliquam rutrum lorem ac risus.','Price da Rosa','inceptos.hymenaeos.mauris@icloud.org'),
        (96,10,4,'erat volutpat. Nulla facilisis. Suspendisse','Keaton Torres','iaculis.enim@google.com'),
        (44,19,4,'ut eros non enim commodo','Logan Mendonca','tempor@yahoo.com'),
        (61,69,5,'ipsum dolor sit amet, consectetuer','Brady Menezes','enim.gravida@google.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (39,4,3,'ligula. Aenean euismod mauris eu','Conan Macedo','sociis.natoque@outlook.ca'),
        (98,13,4,'Quisque ac libero nec ligula','Amy de Morais','vitae.purus.gravida@google.edu'),
        (89,45,4,'Etiam imperdiet dictum magna. Ut','Jaden Pereira','eros.nec@google.ca'),
        (89,2,5,'odio sagittis semper. Nam tempor','Jasper Vasconcelos','magna.praesent@hotmail.com'),
        (38,59,3,'aliquet magna a neque. Nullam','Leigh Das Gracas','orci@aol.org'),
        (40,63,4,'urna et arcu imperdiet ullamcorper.','Victoria dos Santos','ut.sem@yahoo.com'),
        (9,27,4,'nisi dictum augue malesuada malesuada.','Cadman Fonseca','congue.turpis.in@hotmail.com'),
        (34,2,3,'Vivamus non lorem vitae odio','Ulric Gonçalves','duis@outlook.net'),
        (53,29,3,'velit. Sed malesuada augue ut','Hadassah de Oliveira','ultrices.duis@google.org'),
        (62,35,4,'tincidunt congue turpis. In condimentum.','Veronica Rezende','neque.non.quam@icloud.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (62,32,4,'pharetra sed, hendrerit a, arcu.','Samuel Dias','montes@aol.org'),
        (1,17,4,'amet, dapibus id, blandit at,','Magee de Assis','urna.justo.faucibus@icloud.com'),
        (10,15,4,'lorem vitae odio sagittis semper.','Hammett Domingos','orci.adipiscing@yahoo.edu'),
        (20,50,4,'urna. Nullam lobortis quam a','Chiquita Barros','orci.ut.semper@hotmail.edu'),
        (1,67,4,'facilisis lorem tristique aliquet. Phasellus','Fuller dos Santos','arcu.morbi@outlook.edu'),
        (76,22,4,'Duis gravida. Praesent eu nulla','Asher Rocha','velit.in@hotmail.org'),
        (88,12,4,'dapibus ligula. Aliquam erat volutpat.','Amena Moraes','tempor@aol.ca'),
        (65,57,4,'natoque penatibus et magnis dis','Briar Fonseca','ipsum@protonmail.org'),
        (54,38,3,'nulla. Integer vulputate, risus a','Callie Das Neves','blandit.congue.in@protonmail.ca'),
        (3,41,4,'tellus sem mollis dui, in','Melinda da Conceiçao','curabitur.massa@aol.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (83,25,4,'eleifend, nunc risus varius orci,','Veronica Sales','bibendum.donec@icloud.org'),
        (31,35,4,'ac mattis velit justo nec','Fiona Cunha','cras.sed@aol.com'),
        (32,11,3,'auctor quis, tristique ac, eleifend','Alvin Cavalcante','mi.duis.risus@outlook.ca'),
        (22,31,4,'Quisque varius. Nam porttitor scelerisque','Lance Nonato','et.commodo@protonmail.com'),
        (53,50,5,'parturient montes, nascetur ridiculus mus.','Quinlan Campos','parturient.montes.nascetur@icloud.couk'),
        (93,4,5,'euismod urna. Nullam lobortis quam','Tatyana de Oliveira','ligula.aliquam.erat@hotmail.com'),
        (16,32,3,'metus. In nec orci. Donec','Nathaniel Correia','fusce.diam.nunc@hotmail.couk'),
        (95,45,5,'dui. Fusce aliquam, enim nec','Patience da Rosa','leo.in@icloud.com'),
        (86,6,5,'semper cursus. Integer mollis. Integer','Jasmine dos Reis','rutrum.lorem@outlook.edu'),
        (25,21,3,'libero lacus, varius et, euismod','Gage Costa','placerat.eget@google.org')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (68,32,4,'at augue id ante dictum','Teagan Sampaio','vivamus.non.lorem@yahoo.ca'),
        (15,19,4,'eu sem. Pellentesque ut ipsum','Vaughan Firmino','felis.orci@aol.ca'),
        (56,56,4,'sem elit, pharetra ut, pharetra','Kyle Figueiredo','velit.pellentesque@aol.com'),
        (16,3,5,'imperdiet nec, leo. Morbi neque','Matthew Fernandes','felis.purus@icloud.edu'),
        (80,17,3,'laoreet ipsum. Curabitur consequat, lectus','Henry Paulino','mollis.vitae.posuere@google.org'),
        (57,62,4,'Praesent eu dui. Cum sociis','Fleur Teles','eu.enim@google.com'),
        (1,33,4,'Morbi accumsan laoreet ipsum. Curabitur','Slade Cardoso','odio.a.purus@outlook.net'),
        (96,41,5,'mattis. Integer eu lacus. Quisque','James Das Chagas','mauris.eu.elit@outlook.com'),
        (38,2,4,'sed, sapien. Nunc pulvinar arcu','Honorato de Sousa','libero.et@protonmail.net'),
        (59,6,5,'erat volutpat. Nulla dignissim. Maecenas','Tobias Moura','neque.tellus.imperdiet@yahoo.ca')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (84,65,4,'sem elit, pharetra ut, pharetra','Dexter de Paula','eu.euismod.ac@hotmail.couk'),
        (30,69,3,'eu, euismod ac, fermentum vel,','Aidan Correia','lacus.nulla@yahoo.ca'),
        (76,69,4,'sapien, gravida non, sollicitudin a,','McKenzie Domingos','neque.morbi.quis@hotmail.ca'),
        (13,58,5,'Sed pharetra, felis eget varius','Darius Pereira','sapien.aenean@protonmail.net'),
        (78,14,4,'molestie arcu. Sed eu nibh','Orli Rosa','eu.elit@protonmail.edu'),
        (58,28,4,'dui. Cras pellentesque. Sed dictum.','Virginia Miranda','cum.sociis.natoque@outlook.ca'),
        (27,28,4,'Suspendisse tristique neque venenatis lacus.','Connor Franco','nullam.nisl@yahoo.couk'),
        (31,8,5,'commodo at, libero. Morbi accumsan','Vaughan Marques','in.tempus.eu@aol.couk'),
        (89,18,4,'laoreet lectus quis massa. Mauris','Francesca Lemos','primis.in@hotmail.org'),
        (49,19,5,'ipsum leo elementum sem, vitae','Axel Gonçalves','feugiat.nec@outlook.net')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (59,47,3,'magna sed dui. Fusce aliquam,','Henry Marinho','velit@yahoo.couk'),
        (88,47,4,'Etiam gravida molestie arcu. Sed','Merrill Lopes','sit.amet@google.couk'),
        (19,31,3,'sagittis. Nullam vitae diam. Proin','Kennedy Paulino','eget.ipsum@hotmail.net'),
        (84,36,3,'sodales. Mauris blandit enim consequat','Louis Sousa','cras.sed@hotmail.net'),
        (82,9,3,'Proin sed turpis nec mauris','Jolie do Carmo','lacus.quisque.purus@outlook.ca'),
        (97,43,4,'Sed pharetra, felis eget varius','Ferris Peixoto','sit.amet@hotmail.com'),
        (14,42,3,'pede et risus. Quisque libero','Liberty Menezes','velit.egestas.lacinia@icloud.org'),
        (94,37,5,'dolor quam, elementum at, egestas','Kaye de Carvalho','eleifend@hotmail.com'),
        (65,63,4,'lobortis ultrices. Vivamus rhoncus. Donec','Tanner Ferreira','elit@hotmail.com'),
        (58,25,5,'justo faucibus lectus, a sollicitudin','Ralph Neves','lorem.ipsum@icloud.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (36,45,4,'aliquet vel, vulputate eu, odio.','Holmes Henrique','aliquam.enim@yahoo.ca'),
        (50,32,4,'nec quam. Curabitur vel lectus.','Theodore de Morais','eros@aol.com'),
        (74,55,3,'sed, est. Nunc laoreet lectus','MacKenzie Mendes','nibh.phasellus@google.couk'),
        (34,19,4,'lectus. Nullam suscipit, est ac','Walter Machado','pretium@aol.com'),
        (6,15,4,'dolor. Fusce mi lorem, vehicula','Mannix de Azevedo','justo.sit.amet@yahoo.edu'),
        (47,52,4,'Duis ac arcu. Nunc mauris.','Rae Barros','neque.nullam.nisl@outlook.com'),
        (96,43,4,'odio semper cursus. Integer mollis.','Tana Amaral','sed.orci@outlook.org'),
        (30,10,3,'Aliquam vulputate ullamcorper magna. Sed','Cecilia Machado','ut.pharetra.sed@outlook.ca'),
        (2,25,3,'eu dolor egestas rhoncus. Proin','Dominique Mendonca','ut.nec@hotmail.com'),
        (7,60,5,'faucibus orci luctus et ultrices','Juliet Guimaraes','ullamcorper.magna@icloud.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (24,63,3,'penatibus et magnis dis parturient','Jerry Inacio','at.auctor.ullamcorper@hotmail.edu'),
        (42,68,5,'ante dictum cursus. Nunc mauris','Kylie Mota','neque.nullam@google.net'),
        (9,7,3,'faucibus lectus, a sollicitudin orci','Aquila Rosa','justo.praesent@protonmail.org'),
        (93,56,4,'habitant morbi tristique senectus et','Philip Dias','quisque.ornare.tortor@protonmail.couk'),
        (27,43,5,'sed, sapien. Nunc pulvinar arcu','Hannah Braga','sed.id.risus@hotmail.couk'),
        (49,44,3,'pulvinar arcu et pede. Nunc','Willow Chagas','dui.augue.eu@outlook.ca'),
        (67,4,3,'blandit at, nisi. Cum sociis','Burton Sampaio','duis.elementum.dui@hotmail.edu'),
        (17,54,4,'nisi magna sed dui. Fusce','Wyoming Cordeiro','ut.cursus@hotmail.com'),
        (71,24,4,'enim mi tempor lorem, eget','Forrest de Almeida','hendrerit@icloud.org'),
        (88,41,3,'orci. Ut semper pretium neque.','Axel Das Dores','tellus.non@outlook.com')

        INSERT INTO ECM_AVALIACOES (ID_PRODUTO,ID_CLIENTE,NOTA,MENSAGEM,NOME,EMAIL)
        VALUES
        (87,51,4,'Suspendisse ac metus vitae velit','Jane Freitas','est.tempor@yahoo.net'),
        (66,46,4,'sed pede. Cum sociis natoque','Upton Nascimento','mauris.molestie.pharetra@outlook.couk'),
        (90,35,3,'eget massa. Suspendisse eleifend. Cras','Wing Soares','tellus@google.couk'),
        (41,54,4,'mi enim, condimentum eget, volutpat','Courtney Neves','vel.arcu.curabitur@google.com'),
        (89,67,4,'ipsum. Suspendisse sagittis. Nullam vitae','Stone Guedes','magna.suspendisse@google.couk'),
        (71,64,4,'ullamcorper viverra. Maecenas iaculis aliquet','Daria Fagundes','sed.facilisis.vitae@hotmail.couk'),
        (14,7,4,'dolor quam, elementum at, egestas','Phillip Henrique','lectus.sit@protonmail.edu'),
        (19,50,3,'mauris sapien, cursus in, hendrerit','Linus Barros','cras.convallis@protonmail.couk'),
        (96,18,5,'mauris eu elit. Nulla facilisi.','Connor Faria','molestie.arcu@aol.net'),
        (19,9,3,'est, congue a, aliquet vel,','Dacey Queiroz','parturient@outlook.edu')
    END
GO