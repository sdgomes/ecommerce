using crm.Models;
using crm.Utility;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Crypt = BCrypt.Net.BCrypt;

namespace crm.DAL
{
    public class ClientDAO : BaseDAO
    {
        public static List<Discount> SelectDiscountByClient(string Codigo)
        {
            try
            {
                string query = @$"SELECT 
	                    ED.ID_DESCONTO, ED.ID_DESCONTO,
	                    ED.CODIGO, ED.RESGATADO, ED.TIPO,
	                    ED.ATIVO, ED.CRIACAO, 
	                    CASE
		                    WHEN ES.ID_SOLICITACAO IS NULL THEN ED.DESCONTO
		                    ELSE ES.PRECO
	                    END AS DESCONTO,
	                    ES.ID_SOLICITACAO
                    FROM ECM_DESCONTOS ED
                    LEFT JOIN  ECM_SOLICITACOES ES ON ES.ID_DESCONTO = ED.ID_DESCONTO
                    WHERE ED.ID_CLIENTE = 
                    (SELECT EC.ID_CLIENTE FROM ECM_CLIENTES EC WHERE EC.CODIGO = @CODIGO)
                    AND ED.D_E_L_E_T_ <> '*'";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CODIGO", Codigo)
                };

                return DatabaseProgramas().Select<Discount>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static long CreateSolicitacao(Solicitation solicitation)
        {
            try
            {
                string query = @$"BEGIN
		                                IF NOT EXISTS (SELECT * FROM ECM_SOLICITACOES WHERE ID_TRANSACAO = @ID_TRANSACAO AND CODIGO = @CODIGO)
		                                BEGIN
                                            INSERT INTO ECM_SOLICITACOES
                                            (CODIGO, ID_PRODUTO, ID_TRANSACAO, ID_ETAPA, TIPO, PRECO, MOTIVO_SOLICITACAO, GRUPO_CODIGO)
                                            OUTPUT Inserted.ID_SOLICITACAO
                                            VALUES (@CODIGO, @ID_PRODUTO, @ID_TRANSACAO, 
                                            (SELECT ID_ETAPA FROM ECM_ETAPAS WHERE 
                                            ETAPA = CASE WHEN @TIPO = 'TROCA' THEN 'TROCA SOLICITADA' 
                                            WHEN @TIPO = 'DEVOLUÇÃO' THEN 'DEVOLUÇÃO SOLICITADA' 
                                            ELSE @TIPO END), @TIPO, @PRECO, @MOTIVO_SOLICITACAO, @GRUPO_CODIGO)
                                        END
                                    END;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CODIGO", I(solicitation.Codigo)),
                    new SqlParameter("@ID_TRANSACAO", I(solicitation.IdTransacao)),
                    new SqlParameter("@TIPO", I(solicitation.Tipo)),
                    new SqlParameter("@PRECO", I(solicitation.Preco)),
                    new SqlParameter("@MOTIVO_SOLICITACAO", I(solicitation.MotivoSolicitacao)),
                    new SqlParameter("@GRUPO_CODIGO", I(solicitation.GrupoCodigo)),
                    new SqlParameter("@ID_PRODUTO", I(solicitation.IdProduto)),
                };

                return DatabaseProgramas().ChoosePrimitiveType<long>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static long CreateClient(Client client)
        {
            try
            {
                string query = @$"BEGIN
	                                IF NOT EXISTS (SELECT ID_USUARIO FROM ECM_USUARIOS WHERE EMAIL = @EMAIL) 
	                                BEGIN
		                                IF NOT EXISTS (SELECT ID_CLIENTE FROM ECM_CLIENTES WHERE CPF = @CPF)
		                                BEGIN
			                                INSERT INTO ECM_USUARIOS (EMAIL, SENHA, TIPO)
			                                VALUES (@EMAIL, @SENHA, @TIPO);

			                                INSERT INTO ECM_CLIENTES (ID_USUARIO, CODIGO, NOME, SOBRENOME, CPF, DATA_NASCIMENTO, RG, TELEFONE, CELULAR, GENERO)
			                                OUTPUT Inserted.ID_CLIENTE
			                                VALUES ((SELECT SCOPE_IDENTITY() AS ID_USUARIO), @CODIGO, UPPER(@NOME), UPPER(@SOBRENOME), @CPF, @DATA_NASCIMENTO, @RG, @TELEFONE, @CELULAR, @GENERO);
		                                END
	                                END
                                END;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CODIGO", Util.Codigo(5)),
                    new SqlParameter("@NOME", I(client.Nome)),
                    new SqlParameter("@SOBRENOME", I(client.Sobrenome)),
                    new SqlParameter("@CPF", I(client.CPF)),
                    new SqlParameter("@DATA_NASCIMENTO", I(client.DataNascimento.ToString("yyyy-MM-dd"))),
                    new SqlParameter("@RG", I(client.RG)),
                    new SqlParameter("@TELEFONE", I(client.Telefone)),
                    new SqlParameter("@CELULAR", I(client.Celular)),
                    new SqlParameter("@GENERO", I(client.Genero)),
                    new SqlParameter("@EMAIL", I(client.Email)),
                    new SqlParameter("@SENHA", I(Crypt.HashPassword(client.Senha))),
                    new SqlParameter("@TIPO",  "CLIENTE"),
                };

                return DatabaseProgramas().ChoosePrimitiveType<long>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void UpdatePassword(string Codigo, string Senha)
        {
            try
            {
                string query = @$"UPDATE ECM_USUARIOS SET SENHA = @SENHA WHERE CODIGO = @CODIGO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@SENHA", Crypt.HashPassword(Senha)),
                    new SqlParameter("@CODIGO", Codigo),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void UpdateClient(long IdCliente, Client client)
        {
            try
            {
                string query = @$"UPDATE ECM_CLIENTES SET NOME = UPPER(@NOME), SOBRENOME = UPPER(@SOBRENOME), CPF = @CPF, DATA_NASCIMENTO = @DATA_NASCIMENTO,
                                RG = @RG, TELEFONE = @TELEFONE, CELULAR = @CELULAR, SITUACAO = @SITUACAO, GENERO = @GENERO
                                WHERE ID_CLIENTE = @ID_CLIENTE;

                                UPDATE ECM_USUARIOS SET EMAIL = @EMAIL WHERE ID_USUARIO = (SELECT ID_USUARIO FROM ECM_CLIENTES WHERE ID_CLIENTE = @ID_CLIENTE);";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@NOME", I(client.Nome)),
                    new SqlParameter("@SOBRENOME", I(client.Sobrenome)),
                    new SqlParameter("@CPF", I(client.CPF)),
                    new SqlParameter("@DATA_NASCIMENTO", I(client.DataNascimento)),
                    new SqlParameter("@RG", I(client.RG)),
                    new SqlParameter("@TELEFONE", I(client.Telefone)),
                    new SqlParameter("@CELULAR", I(client.Celular)),
                    new SqlParameter("@SITUACAO", I(client.Situacao)),
                    new SqlParameter("@GENERO", I(client.Genero)),
                    new SqlParameter("@EMAIL", I(client.Email)),
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void UpdateClientSituacao(string Codigo, bool Situacao)
        {
            try
            {
                string query = @$"UPDATE ECM_CLIENTES SET SITUACAO = @SITUACAO WHERE CODIGO = @CODIGO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CODIGO", Codigo),
                    new SqlParameter("@SITUACAO", Situacao),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void DeleteClientByCodigo(string Codigo)
        {
            try
            {
                string query = @$"UPDATE ECM_CLIENTES SET D_E_L_E_T_ = '*' WHERE CODIGO = @CODIGO;
                                UPDATE ECM_USUARIOS SET D_E_L_E_T_ = '*' WHERE ID_USUARIO = 
                                (SELECT ID_USUARIO FROM ECM_CLIENTES WHERE CODIGO = @CODIGO)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CODIGO", Codigo),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void DeleteClientById(long IdCliente)
        {
            try
            {
                string query = @$"UPDATE ECM_CLIENTES SET D_E_L_E_T_ = '*' WHERE ID_CLIENTE = @ID_CLIENTE;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void RemoveClient(long IdCliente)
        {
            try
            {
                string query = @$"DELETE FROM ECM_CLIENTES WHERE ID_CLIENTE = @ID_CLIENTE;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Client SearchClientByLoginSenha(string Email)
        {
            try
            {
                string query = $@"SELECT
	                                CLI.CODIGO, USU.SENHA
                                FROM ECM_CLIENTES CLI
	                                INNER JOIN ECM_USUARIOS USU ON USU.ID_USUARIO = CLI.ID_USUARIO
		                                AND USU.D_E_L_E_T_ <> '*'
                                WHERE CLI.D_E_L_E_T_ <> '*' AND USU.EMAIL = @EMAIL;";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@EMAIL", Email),
                };

                return DatabaseProgramas().Choose<Client>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }


        public static Client SearchForClientByCodigo(string Codigo)
        {
            try
            {
                string query = $@"SELECT
	                                USU.EMAIL, CLI.CODIGO, USU.ID_USUARIO,
	                                CLI.ID_CLIENTE, CLI.NOME, CLI.SOBRENOME, CLI.CPF,
	                                CLI.DATA_NASCIMENTO, CLI.RG, CLI.GENERO,
	                                CLI.CRIACAO, CLI.TELEFONE, CLI.CELULAR, CLI.SITUACAO
                                FROM ECM_CLIENTES CLI
	                                INNER JOIN ECM_USUARIOS USU ON USU.ID_USUARIO = CLI.ID_USUARIO
		                                AND USU.D_E_L_E_T_ <> '*'
                                WHERE CLI.D_E_L_E_T_ <> '*' AND CLI.CODIGO = @CODIGO;";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@CODIGO", Codigo),
                };

                return DatabaseProgramas().Choose<Client>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Client SearchForClientById(long IdCliente)
        {
            try
            {
                string query = $@"SELECT
	                                USU.EMAIL, CLI.CODIGO, USU.SENHA,
	                                CLI.ID_CLIENTE, CLI.NOME, CLI.SOBRENOME, CLI.CPF,
	                                CLI.DATA_NASCIMENTO, CLI.RG, CLI.GENERO,
	                                CLI.CRIACAO, CLI.TELEFONE, CLI.CELULAR
                                FROM ECM_CLIENTES CLI
	                                INNER JOIN ECM_USUARIOS USU ON USU.ID_USUARIO = CLI.ID_USUARIO
		                                AND USU.D_E_L_E_T_ <> '*'
                                WHERE CLI.D_E_L_E_T_ <> '*' AND ID_CLIENTE = @ID_CLIENTE;";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                };

                return DatabaseProgramas().Choose<Client>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Client SearchForClientBy(string Name, string RG, string CPF, string Email, DateTime DataNascimento)
        {
            try
            {
                string query = $@"SELECT
	                                USU.EMAIL, CLI.CODIGO,
	                                CLI.ID_CLIENTE, CLI.NOME, CLI.SOBRENOME, CLI.CPF,
	                                CLI.DATA_NASCIMENTO, CLI.RG, CLI.GENERO,
	                                CLI.CRIACAO, CLI.TELEFONE, CLI.CELULAR
                                FROM ECM_CLIENTES CLI
	                                INNER JOIN ECM_USUARIOS USU ON USU.ID_USUARIO = CLI.ID_USUARIO
		                                AND USU.D_E_L_E_T_ <> '*'
                                WHERE CLI.D_E_L_E_T_ <> '*' AND SITUACAO = 0 AND 
	                                (CPF = @CPF OR RG = @RG OR EMAIL = @EMAIL OR
	                                CONCAT(NOME, ' ', SOBRENOME) = @NAME OR
	                                DATA_NASCIMENTO = @DATA_NASCIMENTO);";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@CPF", CPF),
                    new SqlParameter("@RG", RG),
                    new SqlParameter("@EMAIL", Email),
                    new SqlParameter("@NAME", Name),
                    new SqlParameter("@DATA_NASCIMENTO", DataNascimento.ToString("yyyy-MM-dd")),
                };

                return DatabaseProgramas().Choose<Client>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Client> SelectAllActiveClients()
        {
            try
            {
                string query = $@"SELECT
	                                USU.EMAIL, CLI.CODIGO,
	                                CLI.ID_CLIENTE, CLI.NOME, CLI.SOBRENOME, CLI.CPF,
	                                CLI.DATA_NASCIMENTO, CLI.RG, CLI.GENERO,
	                                CLI.CRIACAO, CLI.TELEFONE, CLI.CELULAR
                                FROM ECM_CLIENTES CLI
	                                INNER JOIN ECM_USUARIOS USU ON USU.ID_USUARIO = CLI.ID_USUARIO
		                                AND USU.D_E_L_E_T_ <> '*'
                                WHERE CLI.D_E_L_E_T_ <> '*' AND SITUACAO = 0;";

                return DatabaseProgramas().Select<Client>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Client> SelectAllInactiveClients()
        {
            try
            {
                string query = $@"SELECT
	                                USU.EMAIL, CLI.CODIGO,
	                                CLI.ID_CLIENTE, CLI.NOME, CLI.SOBRENOME, CLI.CPF,
	                                CLI.DATA_NASCIMENTO, CLI.RG, CLI.GENERO,
	                                CLI.CRIACAO, CLI.TELEFONE, CLI.CELULAR
                                FROM ECM_CLIENTES CLI
	                                INNER JOIN ECM_USUARIOS USU ON USU.ID_USUARIO = CLI.ID_USUARIO
		                                AND USU.D_E_L_E_T_ <> '*'
                                WHERE CLI.D_E_L_E_T_ <> '*' AND SITUACAO = 1;";

                return DatabaseProgramas().Select<Client>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Client> SelectAllClients()
        {
            try
            {
                string query = $@"SELECT
	                                USU.EMAIL, CLI.CODIGO, SITUACAO,
	                                CLI.ID_CLIENTE, CLI.NOME, CLI.SOBRENOME, CLI.CPF,
	                                CLI.DATA_NASCIMENTO, CLI.RG, CLI.GENERO,
	                                CLI.CRIACAO, CLI.TELEFONE, CLI.CELULAR
                                FROM ECM_CLIENTES CLI
	                                INNER JOIN ECM_USUARIOS USU ON USU.ID_USUARIO = CLI.ID_USUARIO
		                                AND USU.D_E_L_E_T_ <> '*'
                                WHERE CLI.D_E_L_E_T_ <> '*';";

                return DatabaseProgramas().Select<Client>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
