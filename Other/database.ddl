-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2024-03-25 16:46:19 BRT
--   site:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE ECM_AVALIACOES 
    (
     ID_AVALIACAO BIGINT NOT NULL , 
     ID_PRODUTO BIGINT NOT NULL , 
     ID_CLIENTE BIGINT NOT NULL , 
     NOTA INTEGER , 
     MENSAGEM VARCHAR (520) , 
     NOME VARCHAR (255) , 
     EMAIL VARCHAR (255) , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_AVALIACOES ADD CONSTRAINT ECM_AVALIACOES_PK PRIMARY KEY CLUSTERED (ID_AVALIACAO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_BANDEIRAS 
    (
     ID_BANDEIRA BIGINT NOT NULL , 
     NOME VARCHAR (255) NOT NULL , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_BANDEIRAS ADD CONSTRAINT ECM_BANDEIRAS_PK PRIMARY KEY CLUSTERED (ID_BANDEIRA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_CARRINHOS 
    (
     ID_CARRINHO BIGINT NOT NULL , 
     ID_CLIENTE BIGINT NOT NULL , 
     ID_PRODUTO BIGINT NOT NULL , 
     EXPIRA BIT NOT NULL , 
     REMOVIDO BIT , 
     DATA_EXPIRACAO DATETIME , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_CARRINHOS ADD CONSTRAINT ECM_CARRINHOS_PK PRIMARY KEY CLUSTERED (ID_CARRINHO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_CARTOES 
    (
     ID_CARTAO BIGINT NOT NULL , 
     ID_CLIENTE BIGINT NOT NULL , 
     ID_BANDEIRA BIGINT NOT NULL , 
     NOME_TITULAR VARCHAR (255) NOT NULL , 
     TIPO VARCHAR (10) NOT NULL , 
     CPF_TITULAR VARCHAR (11) NOT NULL , 
     NUMERO VARCHAR (20) NOT NULL , 
     DATA_VALIDADE VARCHAR (6) NOT NULL , 
     CODIGO_SEGURANCA VARCHAR (5) NOT NULL , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_CARTOES ADD CONSTRAINT ECM_CARTOES_PK PRIMARY KEY CLUSTERED (ID_CARTAO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_CAT_PRO 
    (
     ID_CATEGORIA_PRODUTO BIGINT NOT NULL , 
     ID_PRODUTO BIGINT NOT NULL , 
     ID_CATEGORIA BIGINT NOT NULL , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_CAT_PRO ADD CONSTRAINT ECM_CAT_PRO_PK PRIMARY KEY CLUSTERED (ID_CATEGORIA_PRODUTO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_CATEGORIAS 
    (
     ID_CATEGORIA BIGINT NOT NULL , 
     ID_CATEGORIA_PAI BIGINT , 
     SUBCATEGORIA BIT , 
     NOME VARCHAR (255) , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_CATEGORIAS ADD CONSTRAINT ECM_CATEGORIAS_PK PRIMARY KEY CLUSTERED (ID_CATEGORIA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_CLIENTES 
    (
     ID_CLIENTE BIGINT NOT NULL , 
     ID_USUARIOS BIGINT NOT NULL , 
     CODIGO VARCHAR (45) NOT NULL , 
     NOME VARCHAR (255) NOT NULL , 
     SOBRENOME VARCHAR (255) NOT NULL , 
     CPF VARCHAR (11) , 
     DATA_NASCIMENTO DATE , 
     RG VARCHAR (9) , 
     TELEFONE VARCHAR (10) , 
     CELULAR VARCHAR (11) , 
     SITUACAO BIT , 
     GENERO VARCHAR (255) , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_CLIENTES ADD CONSTRAINT ECM_CLIENTE_PK PRIMARY KEY CLUSTERED (ID_CLIENTE)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_DESCONTOS 
    (
     ID_DESCONTO BIGINT NOT NULL , 
     ID_CLIENTE BIGINT NOT NULL , 
     CODIGO VARCHAR (64) NOT NULL , 
     DESCONTO INTEGER NOT NULL , 
     RESGATADO BIT , 
     TIPO VARCHAR (25) NOT NULL , 
     ATIVO BIT NOT NULL , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_DESCONTOS ADD CONSTRAINT ECM_DESCONTOS_PK PRIMARY KEY CLUSTERED (ID_DESCONTO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_DEVOLUCOES 
    (
     ID_DEVOLUCAO BIGINT NOT NULL , 
     ID_CLIENTE BIGINT NOT NULL , 
     ID_DESCONTO BIGINT , 
     ID_FUNCIONARIO BIGINT NOT NULL , 
     MOTIVO VARCHAR (255) , 
     STATUS VARCHAR (125) , 
     APROVADO BIT , 
     OBSERVACAO VARCHAR (520) , 
     DATA_SOLICITACAO DATETIME , 
     DATA_ENVIO DATETIME , 
     DATA_RECEBIMENTO DATETIME , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_DEVOLUCOES ADD CONSTRAINT ECM_DEVOLUCOES_PK PRIMARY KEY CLUSTERED (ID_DEVOLUCAO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_ENDERECOS 
    (
     ID_ENDERECO BIGINT NOT NULL , 
     ID_CLIENTE BIGINT NOT NULL , 
     CEP VARCHAR (8) , 
     TIPO_LOGRADOURO VARCHAR (25) , 
     LOGRADOURO VARCHAR (520) NOT NULL , 
     BAIRRO VARCHAR (255) , 
     CIDADE VARCHAR (255) , 
     ESTADO VARCHAR (2) , 
     NOME_ENDERECO VARCHAR (255) , 
     FRASE VARCHAR (255) , 
     TIPO_ENDERECO VARCHAR (25) , 
     PRINCIPAL BIT NOT NULL , 
     COBRANCA BIT NOT NULL , 
     TIPO_RESIDENCIA VARCHAR (255) , 
     COMPLEMENTO VARCHAR (255) , 
     NUMERO VARCHAR (25) , 
     PAIS VARCHAR (52) , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_ENDERECOS ADD CONSTRAINT ECM_ENDERECO_PK PRIMARY KEY CLUSTERED (ID_ENDERECO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_ENTREGAS 
    (
     ID_ENTREGA BIGINT NOT NULL , 
     ID_TRANSACAO BIGINT NOT NULL , 
     ID_ENDERECO BIGINT NOT NULL , 
     ENTREGUE BIT , 
     RECEPTIOR VARCHAR (255) , 
     OBSERVACAO VARCHAR (520) , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_ENTREGAS ADD CONSTRAINT ECM_ENTREGAS_PK PRIMARY KEY CLUSTERED (ID_ENTREGA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_ESTOQUES 
    (
     ID_ESTOQUE BIGINT NOT NULL , 
     ID_PRODUTO BIGINT NOT NULL , 
     CODIGO VARCHAR (255) , 
     SALDO INTEGER , 
     ULTIMA_MOVIMENTACAO DATETIME , 
     NOTA_FISCAL BINARY , 
     COR VARCHAR (25) , 
     PRECO_UNITARIO FLOAT , 
     TIPO VARCHAR (25) , 
     TAMANHO VARCHAR (25) , 
     MARCA VARCHAR (255) , 
     GRAVADORA VARCHAR (125) , 
     PESO FLOAT , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_ESTOQUES ADD CONSTRAINT ECM_ESTOQUES_PK PRIMARY KEY CLUSTERED (ID_ESTOQUE)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_ETAPAS 
    (
     ID_ETAPA BIGINT NOT NULL , 
     ETAPA VARCHAR (255) , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_ETAPAS ADD CONSTRAINT ECM_ETAPAS_PK PRIMARY KEY CLUSTERED (ID_ETAPA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_FAVORITOS 
    (
     ID_FAVORITO BIGINT NOT NULL , 
     ID_CLIENTE BIGINT NOT NULL , 
     ID_PRODUTO BIGINT NOT NULL , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_FAVORITOS ADD CONSTRAINT ECM_FAVORITOS_PK PRIMARY KEY CLUSTERED (ID_FAVORITO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_FRETES 
    (
     ID_FRETE BIGINT NOT NULL , 
     ESTADO VARCHAR (2) NOT NULL , 
     PRECO FLOAT NOT NULL , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_FRETES ADD CONSTRAINT ECM_FRETES_PK PRIMARY KEY CLUSTERED (ID_FRETE)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_FUNCIONARIOS 
    (
     ID_FUNCIONARIO BIGINT NOT NULL , 
     ID_USUARIO BIGINT NOT NULL , 
     NOME_COMPLETO VARCHAR (255) NOT NULL , 
     CODIGO VARCHAR (45) NOT NULL , 
     CARGO VARCHAR (255) NOT NULL , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_FUNCIONARIOS ADD CONSTRAINT ECM_FUNCIONARIOS_PK PRIMARY KEY CLUSTERED (ID_FUNCIONARIO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_HISTORICOS 
    (
     ID_HISTORICO BIGINT NOT NULL , 
     ID_TRANSACAO BIGINT NOT NULL , 
     MENSAGEM VARCHAR (520) , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_HISTORICOS ADD CONSTRAINT ECM_HISTORICOS_PK PRIMARY KEY CLUSTERED (ID_HISTORICO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_HISTORICOS_MOVIMENTACOES 
    (
     ID_HISTORICO_MOVIMENTACAO BIGINT NOT NULL , 
     ID_ESTOQUE BIGINT NOT NULL , 
     ID_USUARIOS BIGINT , 
     TIPO_MOVIMENTO VARCHAR (125) , 
     QNT_MOVIMENTADA INTEGER , 
     DESCRICAO VARCHAR (520) , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_HISTORICOS_MOVIMENTACOES ADD CONSTRAINT ECM_HISTORICOS_MOVIMENTACOES_PK PRIMARY KEY CLUSTERED (ID_HISTORICO_MOVIMENTACAO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_IMAGENS 
    (
     ID_IMAGEM BIGINT NOT NULL , 
     ID_PRODUTO BIGINT NOT NULL , 
     IMAGEM IMAGE , 
     NOME VARCHAR (255) , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_IMAGENS ADD CONSTRAINT ECM_IMAGENS_PK PRIMARY KEY CLUSTERED (ID_IMAGEM)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_NOTIFICACOES 
    (
     ID_NOTIFICACAO BIGINT NOT NULL , 
     TITULO VARCHAR (255) , 
     MENSAGEM VARCHAR (520) , 
     ENVIADO VARCHAR (125) , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_NOTIFICACOES ADD CONSTRAINT ECM_NOTIFICACOES_PK PRIMARY KEY CLUSTERED (ID_NOTIFICACAO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_PRECIFICACOES 
    (
     ID_PRECIFICACAO BIGINT NOT NULL , 
     PRODUTO VARCHAR (125) , 
     TIPO VARCHAR (125) , 
     PRECO_MINIMO FLOAT , 
     PRECO_MAXIMO FLOAT , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_PRECIFICACOES ADD CONSTRAINT ECM_PRECIFICACOES_PK PRIMARY KEY CLUSTERED (ID_PRECIFICACAO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_PRO_TRA 
    (
     ID_PRODUTO_TRANSACAO BIGINT NOT NULL , 
     ID_TRANSACAO BIGINT NOT NULL , 
     ID_PRODUTO BIGINT NOT NULL , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_PRO_TRA ADD CONSTRAINT ECM_PRO_TRA_PK PRIMARY KEY CLUSTERED (ID_PRODUTO_TRANSACAO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_PRODUTOS 
    (
     ID_PRODUTO BIGINT NOT NULL , 
     ID_PRECIFICACAO BIGINT NOT NULL , 
     CODIGO VARCHAR (45) NOT NULL , 
     NOME VARCHAR (255) , 
     PRECO FLOAT , 
     TIPO VARCHAR (25) , 
     DESCRICAO VARCHAR (255) , 
     DESCONTO BIT , 
     NOVO BIT , 
     PRE_VENDA BIT , 
     ANO VARCHAR (4) , 
     ARTISTA VARCHAR (255) , 
     QNT_DESCONTO INTEGER , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_PRODUTOS ADD CONSTRAINT ECM_PRODUTOS_PK PRIMARY KEY CLUSTERED (ID_PRODUTO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_RANKINGS 
    (
     ID_RANKING BIGINT NOT NULL , 
     ID_CLIENTE BIGINT NOT NULL , 
     QNT_COMPRAS INTEGER , 
     NOTA INTEGER NOT NULL , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_RANKINGS ADD CONSTRAINT ECM_RANKINGS_PK PRIMARY KEY CLUSTERED (ID_RANKING)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_STATUS 
    (
     ID_STATUS BIGINT NOT NULL , 
     ID_PRODUTO BIGINT NOT NULL , 
     ID_FUNCIONARIO BIGINT , 
     ATIVO BIT , 
     OBSERVACAO VARCHAR (520) , 
     DATA_VALIDADE DATETIME , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_STATUS ADD CONSTRAINT ECM_DESATIVADOS_PK PRIMARY KEY CLUSTERED (ID_STATUS)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_TRA_CAR 
    (
     ID_TRANSACAO_CARTAO BIGINT NOT NULL , 
     ID_TRANSACAO BIGINT NOT NULL , 
     ID_CARTAO BIGINT NOT NULL , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_TRA_CAR ADD CONSTRAINT ECM_TRA_CAR_PK PRIMARY KEY CLUSTERED (ID_TRANSACAO_CARTAO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_TRANSACOES 
    (
     ID_TRANSACAO BIGINT NOT NULL , 
     ID_CLIENTE BIGINT NOT NULL , 
     ID_ETAPA BIGINT NOT NULL , 
     TIPO VARCHAR (255) , 
     PAGAMENTO VARCHAR (125) , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_TRANSACOES ADD CONSTRAINT ECM_TRANSACOES_PK PRIMARY KEY CLUSTERED (ID_TRANSACAO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_TROCAS 
    (
     ID_TROCA BIGINT NOT NULL , 
     ID_CLIENTE BIGINT NOT NULL , 
     ID_FUNCIONARIO BIGINT NOT NULL , 
     ID_DESCONTO BIGINT , 
     DATA_SOLICITACAO DATETIME , 
     DATA_ENVIO DATETIME , 
     MOTIVO VARCHAR (255) , 
     STATUS VARCHAR (125) , 
     APROVADO BIT , 
     OBSERVACAO VARCHAR (520) , 
     DATA_RECEBIMENTO DATETIME , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_TROCAS ADD CONSTRAINT ECM_TROCAS_PK PRIMARY KEY CLUSTERED (ID_TROCA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_USU_NOT 
    (
     ID_USUARIO_NOTIFICACAO BIGINT NOT NULL , 
     ID_USUARIO BIGINT NOT NULL , 
     ID_NOTIFICACAO BIGINT NOT NULL , 
     VISUALIZADO BIT , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_USU_NOT ADD CONSTRAINT ECM_USU_NOT_PK PRIMARY KEY CLUSTERED (ID_USUARIO_NOTIFICACAO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE ECM_USUARIOS 
    (
     ID_USUARIOS BIGINT NOT NULL , 
     EMAIL VARCHAR (520) NOT NULL , 
     SENHA VARCHAR (255) NOT NULL , 
     TIPO VARCHAR (25) NOT NULL , 
     CRIACAO DATETIME , 
     D_E_L_E_T_ BIT 
    )
GO

ALTER TABLE ECM_USUARIOS ADD CONSTRAINT ECM_USUARIOS_PK PRIMARY KEY CLUSTERED (ID_USUARIOS)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE ECM_AVALIACOES 
    ADD CONSTRAINT FK_AVALIACOES_TO_CLIENTES_ECM FOREIGN KEY 
    ( 
     ID_CLIENTE
    ) 
    REFERENCES ECM_CLIENTES 
    ( 
     ID_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_AVALIACOES 
    ADD CONSTRAINT FK_AVALIACOES_TO_PRODUTOS_ECM FOREIGN KEY 
    ( 
     ID_PRODUTO
    ) 
    REFERENCES ECM_PRODUTOS 
    ( 
     ID_PRODUTO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_CARRINHOS 
    ADD CONSTRAINT FK_CARRINHOS_TO_CLIENTES_ECM FOREIGN KEY 
    ( 
     ID_CLIENTE
    ) 
    REFERENCES ECM_CLIENTES 
    ( 
     ID_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_CARRINHOS 
    ADD CONSTRAINT FK_CARRINHOS_TO_PRODUTOS_ECM FOREIGN KEY 
    ( 
     ID_PRODUTO
    ) 
    REFERENCES ECM_PRODUTOS 
    ( 
     ID_PRODUTO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_CARTOES 
    ADD CONSTRAINT FK_CARTAO_TO_CLIENTE_ECM FOREIGN KEY 
    ( 
     ID_CLIENTE
    ) 
    REFERENCES ECM_CLIENTES 
    ( 
     ID_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_CARTOES 
    ADD CONSTRAINT FK_CARTOES_TO_BANDEIRAS_ECM FOREIGN KEY 
    ( 
     ID_BANDEIRA
    ) 
    REFERENCES ECM_BANDEIRAS 
    ( 
     ID_BANDEIRA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_CAT_PRO 
    ADD CONSTRAINT FK_CAT_PRO_TO_CATEGORIAS_ECM FOREIGN KEY 
    ( 
     ID_CATEGORIA
    ) 
    REFERENCES ECM_CATEGORIAS 
    ( 
     ID_CATEGORIA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_CAT_PRO 
    ADD CONSTRAINT FK_CAT_PRO_TO_PRODUTOS_ECM FOREIGN KEY 
    ( 
     ID_PRODUTO
    ) 
    REFERENCES ECM_PRODUTOS 
    ( 
     ID_PRODUTO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_CATEGORIAS 
    ADD CONSTRAINT FK_CATEGORIAS_TO_CATEGORIAS_ECM FOREIGN KEY 
    ( 
     ID_CATEGORIA_PAI
    ) 
    REFERENCES ECM_CATEGORIAS 
    ( 
     ID_CATEGORIA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_CLIENTES 
    ADD CONSTRAINT FK_CLIENTES_TO_USUARIOS_ECM FOREIGN KEY 
    ( 
     ID_USUARIOS
    ) 
    REFERENCES ECM_USUARIOS 
    ( 
     ID_USUARIOS 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_STATUS 
    ADD CONSTRAINT FK_DESATIVADOS_TO_PRODUTOS_ECM FOREIGN KEY 
    ( 
     ID_PRODUTO
    ) 
    REFERENCES ECM_PRODUTOS 
    ( 
     ID_PRODUTO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_DESCONTOS 
    ADD CONSTRAINT FK_DESCONTOS_TO_CLIENTES_ECM FOREIGN KEY 
    ( 
     ID_CLIENTE
    ) 
    REFERENCES ECM_CLIENTES 
    ( 
     ID_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_DEVOLUCOES 
    ADD CONSTRAINT FK_DEVOLUCOES_TO_CLIENTES_ECM FOREIGN KEY 
    ( 
     ID_CLIENTE
    ) 
    REFERENCES ECM_CLIENTES 
    ( 
     ID_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_DEVOLUCOES 
    ADD CONSTRAINT FK_DEVOLUCOES_TO_DESCONTOS_ECM FOREIGN KEY 
    ( 
     ID_DESCONTO
    ) 
    REFERENCES ECM_DESCONTOS 
    ( 
     ID_DESCONTO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_DEVOLUCOES 
    ADD CONSTRAINT FK_DEVOLUCOES_TO_FUNCIONARIOS_ECM FOREIGN KEY 
    ( 
     ID_FUNCIONARIO
    ) 
    REFERENCES ECM_FUNCIONARIOS 
    ( 
     ID_FUNCIONARIO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_ENDERECOS 
    ADD CONSTRAINT FK_ENDERECO_TO_CLIENTE_ECM FOREIGN KEY 
    ( 
     ID_CLIENTE
    ) 
    REFERENCES ECM_CLIENTES 
    ( 
     ID_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_ENTREGAS 
    ADD CONSTRAINT FK_ENTREGAS_TO_ENDERECOS_ECM FOREIGN KEY 
    ( 
     ID_ENDERECO
    ) 
    REFERENCES ECM_ENDERECOS 
    ( 
     ID_ENDERECO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_ENTREGAS 
    ADD CONSTRAINT FK_ENTREGAS_TO_TRANSACOES_ECM FOREIGN KEY 
    ( 
     ID_TRANSACAO
    ) 
    REFERENCES ECM_TRANSACOES 
    ( 
     ID_TRANSACAO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_ESTOQUES 
    ADD CONSTRAINT FK_ESTOQUES_TO_PRODUTOS_ECM FOREIGN KEY 
    ( 
     ID_PRODUTO
    ) 
    REFERENCES ECM_PRODUTOS 
    ( 
     ID_PRODUTO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_FAVORITOS 
    ADD CONSTRAINT FK_FAVORITOS_TO_CLIENTES_ECM FOREIGN KEY 
    ( 
     ID_CLIENTE
    ) 
    REFERENCES ECM_CLIENTES 
    ( 
     ID_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_FAVORITOS 
    ADD CONSTRAINT FK_FAVORITOS_TO_PRODUTOS_ECM FOREIGN KEY 
    ( 
     ID_PRODUTO
    ) 
    REFERENCES ECM_PRODUTOS 
    ( 
     ID_PRODUTO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_FUNCIONARIOS 
    ADD CONSTRAINT FK_FUNCIONARIOS_TO_USUARIOS_ECM FOREIGN KEY 
    ( 
     ID_USUARIO
    ) 
    REFERENCES ECM_USUARIOS 
    ( 
     ID_USUARIOS 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_HISTORICOS_MOVIMENTACOES 
    ADD CONSTRAINT FK_HISTORICOS_MOVIMENTACOES_TO_ESTOQUES_ECM FOREIGN KEY 
    ( 
     ID_ESTOQUE
    ) 
    REFERENCES ECM_ESTOQUES 
    ( 
     ID_ESTOQUE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_HISTORICOS_MOVIMENTACOES 
    ADD CONSTRAINT FK_HISTORICOS_MOVIMENTACOES_TO_USUARIOS_ECM FOREIGN KEY 
    ( 
     ID_USUARIOS
    ) 
    REFERENCES ECM_USUARIOS 
    ( 
     ID_USUARIOS 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_HISTORICOS 
    ADD CONSTRAINT FK_HISTORICOS_TO_TRANSACOES_ECM FOREIGN KEY 
    ( 
     ID_TRANSACAO
    ) 
    REFERENCES ECM_TRANSACOES 
    ( 
     ID_TRANSACAO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_IMAGENS 
    ADD CONSTRAINT FK_IMAGENS_TO_PRODUTOS_ECM FOREIGN KEY 
    ( 
     ID_PRODUTO
    ) 
    REFERENCES ECM_PRODUTOS 
    ( 
     ID_PRODUTO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_PRO_TRA 
    ADD CONSTRAINT FK_PRO_TRA_TO_PRODUTOS_ECM FOREIGN KEY 
    ( 
     ID_PRODUTO
    ) 
    REFERENCES ECM_PRODUTOS 
    ( 
     ID_PRODUTO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_PRO_TRA 
    ADD CONSTRAINT FK_PRO_TRA_TO_TRANSACOES_ECM FOREIGN KEY 
    ( 
     ID_TRANSACAO
    ) 
    REFERENCES ECM_TRANSACOES 
    ( 
     ID_TRANSACAO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_PRODUTOS 
    ADD CONSTRAINT FK_PRODUTOS_TO_PRECIFICACOES_ECM FOREIGN KEY 
    ( 
     ID_PRECIFICACAO
    ) 
    REFERENCES ECM_PRECIFICACOES 
    ( 
     ID_PRECIFICACAO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_RANKINGS 
    ADD CONSTRAINT FK_RANKINGS_TO_CLIENTES_ECM FOREIGN KEY 
    ( 
     ID_CLIENTE
    ) 
    REFERENCES ECM_CLIENTES 
    ( 
     ID_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_STATUS 
    ADD CONSTRAINT FK_STATUS_TO_FUNCIONARIOS_ECM FOREIGN KEY 
    ( 
     ID_FUNCIONARIO
    ) 
    REFERENCES ECM_FUNCIONARIOS 
    ( 
     ID_FUNCIONARIO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_TRA_CAR 
    ADD CONSTRAINT FK_TRA_CAR_TO_CARTOES_ECM FOREIGN KEY 
    ( 
     ID_CARTAO
    ) 
    REFERENCES ECM_CARTOES 
    ( 
     ID_CARTAO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_TRA_CAR 
    ADD CONSTRAINT FK_TRA_CAR_TO_TRANSACOES_ECM FOREIGN KEY 
    ( 
     ID_TRANSACAO
    ) 
    REFERENCES ECM_TRANSACOES 
    ( 
     ID_TRANSACAO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_TRANSACOES 
    ADD CONSTRAINT FK_TRANSACOES_TO_CLIENTES_ECM FOREIGN KEY 
    ( 
     ID_CLIENTE
    ) 
    REFERENCES ECM_CLIENTES 
    ( 
     ID_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_TRANSACOES 
    ADD CONSTRAINT FK_TRANSACOES_TO_ETAPAS_ECM FOREIGN KEY 
    ( 
     ID_ETAPA
    ) 
    REFERENCES ECM_ETAPAS 
    ( 
     ID_ETAPA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_TROCAS 
    ADD CONSTRAINT FK_TROCAS_TO_CLIENTES_ECM FOREIGN KEY 
    ( 
     ID_CLIENTE
    ) 
    REFERENCES ECM_CLIENTES 
    ( 
     ID_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_TROCAS 
    ADD CONSTRAINT FK_TROCAS_TO_FUNCIONARIOS_ECM FOREIGN KEY 
    ( 
     ID_FUNCIONARIO
    ) 
    REFERENCES ECM_FUNCIONARIOS 
    ( 
     ID_FUNCIONARIO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_USU_NOT 
    ADD CONSTRAINT FK_USU_NOT_TO_NOTIFICACOES_ECM FOREIGN KEY 
    ( 
     ID_NOTIFICACAO
    ) 
    REFERENCES ECM_NOTIFICACOES 
    ( 
     ID_NOTIFICACAO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_USU_NOT 
    ADD CONSTRAINT FK_USU_NOT_TO_USUARIOS_ECM FOREIGN KEY 
    ( 
     ID_USUARIO
    ) 
    REFERENCES ECM_USUARIOS 
    ( 
     ID_USUARIOS 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE ECM_TROCAS 
    ADD CONSTRAINT PK_TROCAS_TO_DESCONTOS_ECM FOREIGN KEY 
    ( 
     ID_DESCONTO
    ) 
    REFERENCES ECM_DESCONTOS 
    ( 
     ID_DESCONTO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            30
-- CREATE INDEX                             0
-- ALTER TABLE                             70
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
