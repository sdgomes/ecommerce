USE [PROGRAMAS]
GO

DROP PROCEDURE IF EXISTS dbo.createEcommerce
GO

CREATE PROCEDURE dbo.createEcommerce
AS
    BEGIN
        CREATE TABLE ECM_AVALIACOES
        (
            ID_AVALIACAO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_PRODUTO BIGINT NOT NULL,
            ID_CLIENTE BIGINT NOT NULL,
            NOTA INTEGER,
            MENSAGEM VARCHAR(520),
            NOME VARCHAR(255),
            EMAIL VARCHAR(255),
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_AVALIACOES
        ADD CONSTRAINT ECM_AVALIACOES_PK
            PRIMARY KEY CLUSTERED (ID_AVALIACAO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_BANDEIRAS
        (
            ID_BANDEIRA BIGINT IDENTITY(1, 1) NOT NULL,
            NOME VARCHAR(255) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_BANDEIRAS
        ADD CONSTRAINT ECM_BANDEIRAS_PK
            PRIMARY KEY CLUSTERED (ID_BANDEIRA)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_CARRINHOS
        (
            ID_CARRINHO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_CLIENTE BIGINT NOT NULL,
            ID_PRODUTO BIGINT NOT NULL,
            EXPIRA BIT DEFAULT 0 NOT NULL,
            REMOVIDO BIT DEFAULT 0 NOT NULL,
            DATA_EXPIRACAO DATETIME DEFAULT DATEADD(day, 15, GETDATE()) NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_CARRINHOS
        ADD CONSTRAINT ECM_CARRINHOS_PK
            PRIMARY KEY CLUSTERED (ID_CARRINHO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_CARTOES
        (
            ID_CARTAO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_CLIENTE BIGINT NOT NULL,
            ID_BANDEIRA BIGINT NOT NULL,
            NOME_TITULAR VARCHAR(255) NOT NULL,
            NOME_CARTAO VARCHAR(255) NOT NULL,
            PRINCIPAL BIT DEFAULT 0 NOT NULL,
            CPF_TITULAR VARCHAR(14) NOT NULL,
            NUMERO VARCHAR(19) NOT NULL,
            DATA_VALIDADE VARCHAR(7) NOT NULL,
            CODIGO_SEGURANCA VARCHAR(4) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_CARTOES
        ADD CONSTRAINT ECM_CARTOES_PK
            PRIMARY KEY CLUSTERED (ID_CARTAO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_CAT_PRO
        (
            ID_CATEGORIA_PRODUTO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_PRODUTO BIGINT NOT NULL,
            ID_CATEGORIA BIGINT NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_CAT_PRO
        ADD CONSTRAINT ECM_CAT_PRO_PK
            PRIMARY KEY CLUSTERED (ID_CATEGORIA_PRODUTO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_CATEGORIAS
        (
            ID_CATEGORIA BIGINT IDENTITY(1, 1) NOT NULL,
            ID_CATEGORIA_PAI BIGINT,
            SUBCATEGORIA BIT DEFAULT 0,
            NOME VARCHAR(255) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_CATEGORIAS
        ADD CONSTRAINT ECM_CATEGORIAS_PK
            PRIMARY KEY CLUSTERED (ID_CATEGORIA)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_CLIENTES
        (
            ID_CLIENTE BIGINT IDENTITY(1, 1) NOT NULL,
            ID_USUARIO BIGINT NOT NULL,
            CODIGO VARCHAR(45) NOT NULL,
            NOME VARCHAR(255) NOT NULL,
            SOBRENOME VARCHAR(255) NOT NULL,
            CPF VARCHAR(14) NOT NULL,
            DATA_NASCIMENTO DATE NOT NULL,
            RG VARCHAR(12) NOT NULL,
            TELEFONE VARCHAR(14) NOT NULL,
            CELULAR VARCHAR(15) NOT NULL,
            SITUACAO BIT DEFAULT 0 NOT NULL,
            GENERO VARCHAR(255) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_CLIENTES
        ADD CONSTRAINT ECM_CLIENTE_PK
            PRIMARY KEY CLUSTERED (ID_CLIENTE)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_DESCONTOS
        (
            ID_DESCONTO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_CLIENTE BIGINT,
            CODIGO VARCHAR(64) NOT NULL,
            DESCONTO INTEGER NOT NULL,
            RESGATADO BIT DEFAULT 0 NOT NULL,
            TIPO VARCHAR(25) NOT NULL,
            ATIVO BIT DEFAULT 0 NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_DESCONTOS
        ADD CONSTRAINT ECM_DESCONTOS_PK
            PRIMARY KEY CLUSTERED (ID_DESCONTO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_DEVOLUCOES
        (
            ID_DEVOLUCAO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_CLIENTE BIGINT NOT NULL,
            ID_DESCONTO BIGINT,
            ID_FUNCIONARIO BIGINT NOT NULL,
            MOTIVO VARCHAR(255),
            STATUS VARCHAR(125),
            APROVADO BIT DEFAULT 0 NOT NULL,
            OBSERVACAO VARCHAR(520),
            DATA_SOLICITACAO DATETIME DEFAULT GETDATE() NOT NULL,
            DATA_ENVIO DATETIME,
            DATA_RECEBIMENTO DATETIME,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_DEVOLUCOES
        ADD CONSTRAINT ECM_DEVOLUCOES_PK
            PRIMARY KEY CLUSTERED (ID_DEVOLUCAO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_ENDERECOS
        (
            ID_ENDERECO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_CLIENTE BIGINT NOT NULL,
            CEP VARCHAR(9) NOT NULL,
            TIPO_LOGRADOURO VARCHAR(25) NOT NULL,
            TIPO_ENDERECO VARCHAR(25),
            TIPO_RESIDENCIA VARCHAR(255) NOT NULL,
            LOGRADOURO VARCHAR(520) NOT NULL,
            BAIRRO VARCHAR(255) NOT NULL,
            CIDADE VARCHAR(255) NOT NULL,
            ESTADO VARCHAR(2) NOT NULL,
            NOME_ENDERECO VARCHAR(255) NOT NULL,
            FRASE VARCHAR(255),    
            PRINCIPAL BIT DEFAULT 0 NOT NULL,
            COBRANCA BIT DEFAULT 0 NOT NULL,    
            COMPLEMENTO VARCHAR(255),
            NUMERO VARCHAR(25) DEFAULT 'S/N' NOT NULL,
            PAIS VARCHAR(52) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_ENDERECOS
        ADD CONSTRAINT ECM_ENDERECO_PK
            PRIMARY KEY CLUSTERED (ID_ENDERECO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_ENTREGAS
        (
            ID_ENTREGA BIGINT IDENTITY(1, 1) NOT NULL,
            ID_TRANSACAO BIGINT NOT NULL,
            ID_ENDERECO BIGINT NOT NULL,
            ENTREGUE BIT DEFAULT 0,
            RECEPTIOR VARCHAR(255),
            OBSERVACAO VARCHAR(520),
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_ENTREGAS
        ADD CONSTRAINT ECM_ENTREGAS_PK
            PRIMARY KEY CLUSTERED (ID_ENTREGA)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_ESTOQUES
        (
            ID_ESTOQUE BIGINT IDENTITY(1, 1) NOT NULL,
            ID_PRODUTO BIGINT NOT NULL,
            CODIGO VARCHAR(255),
            SALDO INTEGER,
            ULTIMA_MOVIMENTACAO DATETIME DEFAULT GETDATE(),
            NOTA_FISCAL VARBINARY(MAX),
            COR VARCHAR(25),
            PRECO_UNITARIO FLOAT NOT NULL,
            TIPO VARCHAR(25),
            TAMANHO VARCHAR(25),
            MARCA VARCHAR(255),
            GRAVADORA VARCHAR(125),
            PESO FLOAT,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_ESTOQUES
        ADD CONSTRAINT ECM_ESTOQUES_PK
            PRIMARY KEY CLUSTERED (ID_ESTOQUE)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_ETAPAS
        (
            ID_ETAPA BIGINT IDENTITY(1, 1) NOT NULL,
            ETAPA VARCHAR(255) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_ETAPAS
        ADD CONSTRAINT ECM_ETAPAS_PK
            PRIMARY KEY CLUSTERED (ID_ETAPA)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_FAVORITOS
        (
            ID_FAVORITO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_CLIENTE BIGINT NOT NULL,
            ID_PRODUTO BIGINT NOT NULL,
            REMOVIDO BIT DEFAULT 0,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_FAVORITOS
        ADD CONSTRAINT ECM_FAVORITOS_PK
            PRIMARY KEY CLUSTERED (ID_FAVORITO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_FRETES
        (
            ID_FRETE BIGINT IDENTITY(1, 1) NOT NULL,
            ESTADO VARCHAR(2) NOT NULL,
            PRECO FLOAT NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_FRETES
        ADD CONSTRAINT ECM_FRETES_PK
            PRIMARY KEY CLUSTERED (ID_FRETE)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_FUNCIONARIOS
        (
            ID_FUNCIONARIO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_USUARIO BIGINT NOT NULL,
            NOME_COMPLETO VARCHAR(255) NOT NULL,
            CODIGO VARCHAR(45) NOT NULL,
            CARGO VARCHAR(255) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_FUNCIONARIOS
        ADD CONSTRAINT ECM_FUNCIONARIOS_PK
            PRIMARY KEY CLUSTERED (ID_FUNCIONARIO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_HISTORICOS
        (
            ID_HISTORICO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_TRANSACAO BIGINT NOT NULL,
            MENSAGEM VARCHAR(520),
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_HISTORICOS
        ADD CONSTRAINT ECM_HISTORICOS_PK
            PRIMARY KEY CLUSTERED (ID_HISTORICO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_HISTORICOS_MOVIMENTACOES
        (
            ID_HISTORICO_MOVIMENTACAO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_ESTOQUE BIGINT NOT NULL,
            ID_USUARIO BIGINT,
            TIPO_MOVIMENTO VARCHAR(125) NOT NULL,
            QNT_MOVIMENTADA INTEGER NOT NULL,
            DESCRICAO VARCHAR(1500),
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_HISTORICOS_MOVIMENTACOES
        ADD CONSTRAINT ECM_HISTORICOS_MOVIMENTACOES_PK
            PRIMARY KEY CLUSTERED (ID_HISTORICO_MOVIMENTACAO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_IMAGENS
        (
            ID_IMAGEM BIGINT IDENTITY(1, 1) NOT NULL,
            ID_PRODUTO BIGINT NOT NULL,
            IMAGEM VARBINARY(MAX),
            NOME VARCHAR(255) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_IMAGENS
        ADD CONSTRAINT ECM_IMAGENS_PK
            PRIMARY KEY CLUSTERED (ID_IMAGEM)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_NOTIFICACOES
        (
            ID_NOTIFICACAO BIGINT IDENTITY(1, 1) NOT NULL,
            TITULO VARCHAR(255) NOT NULL,
            MENSAGEM VARCHAR(520) NOT NULL,
            ENVIADO VARCHAR(125) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_NOTIFICACOES
        ADD CONSTRAINT ECM_NOTIFICACOES_PK
            PRIMARY KEY CLUSTERED (ID_NOTIFICACAO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_PRECIFICACOES
        (
            ID_PRECIFICACAO BIGINT IDENTITY(1, 1) NOT NULL,
            TIPO VARCHAR(125) NOT NULL,
            SUBCATEGORIA VARCHAR(125) NOT NULL,
            PRECO_MINIMO FLOAT NOT NULL,
            PRECO_MAXIMO FLOAT NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_PRECIFICACOES
        ADD CONSTRAINT ECM_PRECIFICACOES_PK
            PRIMARY KEY CLUSTERED (ID_PRECIFICACAO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_PRO_TRA
        (
            ID_PRODUTO_TRANSACAO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_TRANSACAO BIGINT NOT NULL,
            ID_PRODUTO BIGINT NOT NULL,
            QUANTIDADE INTEGER NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_PRO_TRA
        ADD CONSTRAINT ECM_PRO_TRA_PK
            PRIMARY KEY CLUSTERED (ID_PRODUTO_TRANSACAO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_PRODUTOS
        (
            ID_PRODUTO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_PRECIFICACAO BIGINT NOT NULL,
            CODIGO VARCHAR(45) NOT NULL,
            NOME VARCHAR(255) NOT NULL,
            PRECO FLOAT NOT NULL,
            TIPO VARCHAR(25) NOT NULL,
            DESCRICAO VARCHAR(1500) NOT NULL,
            DESCONTO BIT DEFAULT 0,
            NOVO BIT DEFAULT 0,
            PRE_VENDA BIT DEFAULT 0,
            ANO VARCHAR(4) NOT NULL,
            ARTISTA VARCHAR(255) NOT NULL,
            QNT_DESCONTO INTEGER DEFAULT 0,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_PRODUTOS
        ADD CONSTRAINT ECM_PRODUTOS_PK
            PRIMARY KEY CLUSTERED (ID_PRODUTO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_RANKINGS
        (
            ID_RANKING BIGINT IDENTITY(1, 1) NOT NULL,
            ID_CLIENTE BIGINT NOT NULL,
            QNT_COMPRAS INTEGER DEFAULT 0,
            NOTA INTEGER NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_RANKINGS
        ADD CONSTRAINT ECM_RANKINGS_PK
            PRIMARY KEY CLUSTERED (ID_RANKING)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_STATUS
        (
            ID_STATUS BIGINT IDENTITY(1, 1) NOT NULL,
            ID_PRODUTO BIGINT NOT NULL,
            ID_FUNCIONARIO BIGINT,
            ATIVO BIT DEFAULT 1,
            OBSERVACAO VARCHAR(520),
            DATA_VALIDADE DATETIME DEFAULT DATEADD(day, 60, GETDATE()),
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_STATUS
        ADD CONSTRAINT ECM_DESATIVADOS_PK
            PRIMARY KEY CLUSTERED (ID_STATUS)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_TRA_CAR
        (
            ID_TRANSACAO_CARTAO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_TRANSACAO BIGINT NOT NULL,
            ID_CARTAO BIGINT NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_TRA_CAR
        ADD CONSTRAINT ECM_TRA_CAR_PK
            PRIMARY KEY CLUSTERED (ID_TRANSACAO_CARTAO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_TRANSACOES
        (
            ID_TRANSACAO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_CLIENTE BIGINT NOT NULL,
            ID_ENDERECO BIGINT NOT NULL,
            ID_ETAPA BIGINT DEFAULT 1,
            TIPO VARCHAR(255) NOT NULL,
            PAGAMENTO VARCHAR(125) NOT NULL,
            SUBTOTAL FLOAT,
            FRETE FLOAT,
            DESCONTOS FLOAT,
            TOTAL FLOAT,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_TRANSACOES
        ADD CONSTRAINT ECM_TRANSACOES_PK
            PRIMARY KEY CLUSTERED (ID_TRANSACAO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_TROCAS
        (
            ID_TROCA BIGINT IDENTITY(1, 1) NOT NULL,
            ID_CLIENTE BIGINT NOT NULL,
            ID_FUNCIONARIO BIGINT NOT NULL,
            ID_DESCONTO BIGINT,
            DATA_SOLICITACAO DATETIME DEFAULT GETDATE() NOT NULL,
            DATA_ENVIO DATETIME,
            MOTIVO VARCHAR(255) NOT NULL,
            STATUS VARCHAR(125) NOT NULL,
            APROVADO BIT DEFAULT 0 NOT NULL,
            OBSERVACAO VARCHAR(520) NOT NULL,
            DATA_RECEBIMENTO DATETIME,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_TROCAS
        ADD CONSTRAINT ECM_TROCAS_PK
            PRIMARY KEY CLUSTERED (ID_TROCA)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_USU_NOT
        (
            ID_USUARIO_NOTIFICACAO BIGINT IDENTITY(1, 1) NOT NULL,
            ID_USUARIO BIGINT NOT NULL,
            ID_NOTIFICACAO BIGINT NOT NULL,
            VISUALIZADO BIT DEFAULT 0 NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_USU_NOT
        ADD CONSTRAINT ECM_USU_NOT_PK
            PRIMARY KEY CLUSTERED (ID_USUARIO_NOTIFICACAO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);
            
        CREATE TABLE ECM_USUARIOS
        (
            ID_USUARIO BIGINT IDENTITY(1, 1) NOT NULL,
            EMAIL VARCHAR(520) NOT NULL,
            SENHA VARCHAR(255) NOT NULL,
            TIPO VARCHAR(25) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );
        
        ALTER TABLE ECM_USUARIOS
        ADD CONSTRAINT ECM_USUARIOS_PK
            PRIMARY KEY CLUSTERED (ID_USUARIO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);

        CREATE TABLE ECM_TIPOS_LOGRADOURO
        (
            ID_TIPO_LOGRADOURO BIGINT IDENTITY(1, 1) NOT NULL,
            NOME VARCHAR(255) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );

        ALTER TABLE ECM_TIPOS_LOGRADOURO
        ADD CONSTRAINT ECM_TIPOS_LOGRADOURO_PK
            PRIMARY KEY CLUSTERED (ID_TIPO_LOGRADOURO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);

        CREATE TABLE ECM_TIPOS_RESIDENCIA
        (
            ID_TIPO_RESIDENCIA BIGINT IDENTITY(1, 1) NOT NULL,
            NOME VARCHAR(255) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );

        ALTER TABLE ECM_TIPOS_RESIDENCIA
        ADD CONSTRAINT ECM_TIPOS_RESIDENCIA_PK
            PRIMARY KEY CLUSTERED (ID_TIPO_RESIDENCIA)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);

        CREATE TABLE ECM_ESTADOS
        (
            ID_ESTADO BIGINT IDENTITY(1, 1) NOT NULL,
            NOME VARCHAR(255) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );

        ALTER TABLE ECM_ESTADOS
        ADD CONSTRAINT ECM_ESTADOS_PK
            PRIMARY KEY CLUSTERED (ID_ESTADO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);

        CREATE TABLE ECM_GENEROS
        (
            ID_GENERO BIGINT IDENTITY(1, 1) NOT NULL,
            NOME VARCHAR(255) NOT NULL,
            CHAVE VARCHAR(255) NOT NULL,
            CRIACAO DATETIME DEFAULT GETDATE() NULL,
            D_E_L_E_T_ CHAR(1) DEFAULT '' NULL
        );

        ALTER TABLE ECM_GENEROS
        ADD CONSTRAINT ECM_GENEROS_PK
            PRIMARY KEY CLUSTERED (ID_GENERO)
            WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON);

        ALTER TABLE ECM_AVALIACOES
        ADD CONSTRAINT FK_AVALIACOES_TO_CLIENTES_ECM
            FOREIGN KEY (ID_CLIENTE)
            REFERENCES ECM_CLIENTES (ID_CLIENTE) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_AVALIACOES
        ADD CONSTRAINT FK_AVALIACOES_TO_PRODUTOS_ECM
            FOREIGN KEY (ID_PRODUTO)
            REFERENCES ECM_PRODUTOS (ID_PRODUTO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_CARRINHOS
        ADD CONSTRAINT FK_CARRINHOS_TO_CLIENTES_ECM
            FOREIGN KEY (ID_CLIENTE)
            REFERENCES ECM_CLIENTES (ID_CLIENTE) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_CARRINHOS
        ADD CONSTRAINT FK_CARRINHOS_TO_PRODUTOS_ECM
            FOREIGN KEY (ID_PRODUTO)
            REFERENCES ECM_PRODUTOS (ID_PRODUTO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_CARTOES
        ADD CONSTRAINT FK_CARTAO_TO_CLIENTE_ECM
            FOREIGN KEY (ID_CLIENTE)
            REFERENCES ECM_CLIENTES (ID_CLIENTE) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_CARTOES
        ADD CONSTRAINT FK_CARTOES_TO_BANDEIRAS_ECM
            FOREIGN KEY (ID_BANDEIRA)
            REFERENCES ECM_BANDEIRAS (ID_BANDEIRA) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_CAT_PRO
        ADD CONSTRAINT FK_CAT_PRO_TO_CATEGORIAS_ECM
            FOREIGN KEY (ID_CATEGORIA)
            REFERENCES ECM_CATEGORIAS (ID_CATEGORIA) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_CAT_PRO
        ADD CONSTRAINT FK_CAT_PRO_TO_PRODUTOS_ECM
            FOREIGN KEY (ID_PRODUTO)
            REFERENCES ECM_PRODUTOS (ID_PRODUTO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_CATEGORIAS
        ADD CONSTRAINT FK_CATEGORIAS_TO_CATEGORIAS_ECM
            FOREIGN KEY (ID_CATEGORIA_PAI)
            REFERENCES ECM_CATEGORIAS (ID_CATEGORIA) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_CLIENTES
        ADD CONSTRAINT FK_CLIENTES_TO_USUARIOS_ECM
            FOREIGN KEY (ID_USUARIO)
            REFERENCES ECM_USUARIOS (ID_USUARIO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_STATUS
        ADD CONSTRAINT FK_DESATIVADOS_TO_PRODUTOS_ECM
            FOREIGN KEY (ID_PRODUTO)
            REFERENCES ECM_PRODUTOS (ID_PRODUTO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_DESCONTOS
        ADD CONSTRAINT FK_DESCONTOS_TO_CLIENTES_ECM
            FOREIGN KEY (ID_CLIENTE)
            REFERENCES ECM_CLIENTES (ID_CLIENTE) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_DEVOLUCOES
        ADD CONSTRAINT FK_DEVOLUCOES_TO_CLIENTES_ECM
            FOREIGN KEY (ID_CLIENTE)
            REFERENCES ECM_CLIENTES (ID_CLIENTE) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_DEVOLUCOES
        ADD CONSTRAINT FK_DEVOLUCOES_TO_DESCONTOS_ECM
            FOREIGN KEY (ID_DESCONTO)
            REFERENCES ECM_DESCONTOS (ID_DESCONTO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_DEVOLUCOES
        ADD CONSTRAINT FK_DEVOLUCOES_TO_FUNCIONARIOS_ECM
            FOREIGN KEY (ID_FUNCIONARIO)
            REFERENCES ECM_FUNCIONARIOS (ID_FUNCIONARIO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_ENDERECOS
        ADD CONSTRAINT FK_ENDERECO_TO_CLIENTE_ECM
            FOREIGN KEY (ID_CLIENTE)
            REFERENCES ECM_CLIENTES (ID_CLIENTE) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_ENTREGAS
        ADD CONSTRAINT FK_ENTREGAS_TO_ENDERECOS_ECM
            FOREIGN KEY (ID_ENDERECO)
            REFERENCES ECM_ENDERECOS (ID_ENDERECO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_ENTREGAS
        ADD CONSTRAINT FK_ENTREGAS_TO_TRANSACOES_ECM
            FOREIGN KEY (ID_TRANSACAO)
            REFERENCES ECM_TRANSACOES (ID_TRANSACAO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_ESTOQUES
        ADD CONSTRAINT FK_ESTOQUES_TO_PRODUTOS_ECM
            FOREIGN KEY (ID_PRODUTO)
            REFERENCES ECM_PRODUTOS (ID_PRODUTO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_FAVORITOS
        ADD CONSTRAINT FK_FAVORITOS_TO_CLIENTES_ECM
            FOREIGN KEY (ID_CLIENTE)
            REFERENCES ECM_CLIENTES (ID_CLIENTE) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_FAVORITOS
        ADD CONSTRAINT FK_FAVORITOS_TO_PRODUTOS_ECM
            FOREIGN KEY (ID_PRODUTO)
            REFERENCES ECM_PRODUTOS (ID_PRODUTO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_FUNCIONARIOS
        ADD CONSTRAINT FK_FUNCIONARIOS_TO_USUARIOS_ECM
            FOREIGN KEY (ID_USUARIO)
            REFERENCES ECM_USUARIOS (ID_USUARIO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_HISTORICOS_MOVIMENTACOES
        ADD CONSTRAINT FK_HISTORICOS_MOVIMENTACOES_TO_ESTOQUES_ECM
            FOREIGN KEY (ID_ESTOQUE)
            REFERENCES ECM_ESTOQUES (ID_ESTOQUE) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_HISTORICOS_MOVIMENTACOES
        ADD CONSTRAINT FK_HISTORICOS_MOVIMENTACOES_TO_USUARIOS_ECM
            FOREIGN KEY (ID_USUARIO)
            REFERENCES ECM_USUARIOS (ID_USUARIO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_HISTORICOS
        ADD CONSTRAINT FK_HISTORICOS_TO_TRANSACOES_ECM
            FOREIGN KEY (ID_TRANSACAO)
            REFERENCES ECM_TRANSACOES (ID_TRANSACAO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_IMAGENS
        ADD CONSTRAINT FK_IMAGENS_TO_PRODUTOS_ECM
            FOREIGN KEY (ID_PRODUTO)
            REFERENCES ECM_PRODUTOS (ID_PRODUTO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_PRO_TRA
        ADD CONSTRAINT FK_PRO_TRA_TO_PRODUTOS_ECM
            FOREIGN KEY (ID_PRODUTO)
            REFERENCES ECM_PRODUTOS (ID_PRODUTO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_PRO_TRA
        ADD CONSTRAINT FK_PRO_TRA_TO_TRANSACOES_ECM
            FOREIGN KEY (ID_TRANSACAO)
            REFERENCES ECM_TRANSACOES (ID_TRANSACAO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_PRODUTOS
        ADD CONSTRAINT FK_PRODUTOS_TO_PRECIFICACOES_ECM
            FOREIGN KEY (ID_PRECIFICACAO)
            REFERENCES ECM_PRECIFICACOES (ID_PRECIFICACAO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_RANKINGS
        ADD CONSTRAINT FK_RANKINGS_TO_CLIENTES_ECM
            FOREIGN KEY (ID_CLIENTE)
            REFERENCES ECM_CLIENTES (ID_CLIENTE) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_STATUS
        ADD CONSTRAINT FK_STATUS_TO_FUNCIONARIOS_ECM
            FOREIGN KEY (ID_FUNCIONARIO)
            REFERENCES ECM_FUNCIONARIOS (ID_FUNCIONARIO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_TRA_CAR
        ADD CONSTRAINT FK_TRA_CAR_TO_CARTOES_ECM
            FOREIGN KEY (ID_CARTAO)
            REFERENCES ECM_CARTOES (ID_CARTAO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_TRA_CAR
        ADD CONSTRAINT FK_TRA_CAR_TO_TRANSACOES_ECM
            FOREIGN KEY (ID_TRANSACAO)
            REFERENCES ECM_TRANSACOES (ID_TRANSACAO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_TRANSACOES
        ADD CONSTRAINT FK_TRANSACOES_TO_CLIENTES_ECM
            FOREIGN KEY (ID_CLIENTE)
            REFERENCES ECM_CLIENTES (ID_CLIENTE) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_TRANSACOES
        ADD CONSTRAINT FK_TRANSACOES_TO_ETAPAS_ECM
            FOREIGN KEY (ID_ETAPA)
            REFERENCES ECM_ETAPAS (ID_ETAPA) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_TROCAS
        ADD CONSTRAINT FK_TROCAS_TO_CLIENTES_ECM
            FOREIGN KEY (ID_CLIENTE)
            REFERENCES ECM_CLIENTES (ID_CLIENTE) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_TROCAS
        ADD CONSTRAINT FK_TROCAS_TO_FUNCIONARIOS_ECM
            FOREIGN KEY (ID_FUNCIONARIO)
            REFERENCES ECM_FUNCIONARIOS (ID_FUNCIONARIO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_USU_NOT
        ADD CONSTRAINT FK_USU_NOT_TO_NOTIFICACOES_ECM
            FOREIGN KEY (ID_NOTIFICACAO)
            REFERENCES ECM_NOTIFICACOES (ID_NOTIFICACAO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_USU_NOT
        ADD CONSTRAINT FK_USU_NOT_TO_USUARIOS_ECM
            FOREIGN KEY (ID_USUARIO)
            REFERENCES ECM_USUARIOS (ID_USUARIO) ON DELETE NO ACTION ON UPDATE NO ACTION;
            
        ALTER TABLE ECM_TROCAS
        ADD CONSTRAINT PK_TROCAS_TO_DESCONTOS_ECM
            FOREIGN KEY (ID_DESCONTO)
            REFERENCES ECM_DESCONTOS (ID_DESCONTO) ON DELETE NO ACTION ON UPDATE NO ACTION;
    END
GO