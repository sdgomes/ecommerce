-- Retorna senha;
DECLARE @RE_FUNCIONARIO INT = 000000;
DECLARE @SENHA_SALVA VARBINARY(256) = (SELECT SENHA FROM ACS_HISTORICOSENHA WHERE ID_HISTORICO_SENHA = 1);
UPDATE ACS_LOGIN SET SENHA = @SENHA_SALVA WHERE RE_FUNCIONARIO = @RE_FUNCIONARIO;