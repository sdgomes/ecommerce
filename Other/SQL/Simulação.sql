USE [PROGRAMAS]
GO

INSERT INTO [dbo].[ECM_USUARIOS]
           ([EMAIL],[SENHA],[TIPO])
     VALUES
           ('oseias.gomes@gmail.com.br','$2a$12$xzO6AcRdQBMzd3PztTB69.mSzeSCIvC1JaW1esQlrDqSHYVz9oafq','CLIENTE'),
           ('oseias.gomes@purpleray.com.br','$2a$12$xzO6AcRdQBMzd3PztTB69.mSzeSCIvC1JaW1esQlrDqSHYVz9oafq','FUNCIONARIO')
GO

INSERT INTO [dbo].[ECM_CLIENTES]
           ([ID_USUARIO],[CODIGO],[NOME],[SOBRENOME],[CPF],[DATA_NASCIMENTO],[RG],[TELEFONE],[CELULAR],[SITUACAO],[GENERO])
     VALUES
           (1,	'PSPBI'	,'OSÉIAS',	'GOMES',	'525.222.217-45',	'2000-04-05',	'65.954.459-5',	'(66) 5959-5246',	'(49) 65464-5656',	1,	'FEMININO')
GO

INSERT INTO [dbo].[ECM_ENDERECOS]
           ([ID_CLIENTE],[CEP],[TIPO_LOGRADOURO],[TIPO_ENDERECO],[TIPO_RESIDENCIA],[LOGRADOURO],[BAIRRO],[CIDADE],
		   [ESTADO],[NOME_ENDERECO],[FRASE],[PRINCIPAL],[COBRANCA],[COMPLEMENTO],[NUMERO],[PAIS])
     VALUES
           (1, '08740-450', 'JARDIM', NULL, 'APARTAMENTO', 'Rua Prefeito Sebastião Cascardo', 'Jardim Universo', 'Mogi das Cruzes', 'SP', 'Casa', 'Pode cobrar', 1, 1, NULL, 'S/N', 'Brasil'),
		   (1, '83513-540', 'JARDIM', NULL, 'APARTAMENTO', 'Rua Luiz Cavalli', 'Venda Velha', 'Almirante Tamandaré', 'PR', 'Outro Endereço', NULL, 0, 0, NULL, '13', 'Brasil')
GO

INSERT INTO [dbo].[ECM_CARTOES]
           ([ID_CLIENTE], [ID_BANDEIRA], [NOME_TITULAR], [NOME_CARTAO], [PRINCIPAL], [CPF_TITULAR], [NUMERO], [DATA_VALIDADE], [CODIGO_SEGURANCA])
     VALUES
           (1, 6, 'OSEIAS D GOMES', 'MASTER 1', 0, '242.342.432-43', '4564 5645 6456 4564', '2024-12', '4324'),
		   (1, 2, 'OSEIAS MASTER GOMES', 'MASTER 2', 1, '232.342.343-23', '4586 1236 1258 5125', '2025-10', '123')
GO

INSERT INTO [dbo].[ECM_FUNCIONARIOS]
           ([ID_USUARIO], [NOME_COMPLETO], [CODIGO], [CARGO])
     VALUES
           (2, 'OSÉIAS GOMES ADMIN', 'grvoglvv', 'GERENTE GERAL')
GO

