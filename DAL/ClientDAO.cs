using ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DAL
{
    public class ClientDAO : BaseDAO
    {
        public static long CreateClient(Client client)
        {
            try
            {
                string query = @$"BEGIN
	                                IF NOT EXISTS (SELECT ID_CLIENTE FROM ECM_CLIENTE WHERE CPF = @CPF OR EMAIL = @EMAIL)
	                                BEGIN
		                                INSERT INTO ECM_CLIENTE (NOME, SOBRENOME, CPF, DATA_NASCIMENTO, EMAIL, RG, GENERO)
                                        OUTPUT Inserted.ID_CLIENTE
		                                VALUES (@NOME, @SOBRENOME, @CPF, @DATA_NASCIMENTO, @EMAIL, @RG, @GENERO)
	                                END
                                END;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@NOME", client.Nome.ToUpper()),
                    new SqlParameter("@SOBRENOME", client.Sobrenome.ToUpper()),
                    new SqlParameter("@CPF", client.CPF),
                    new SqlParameter("@DATA_NASCIMENTO", client.DataNascimento),
                    new SqlParameter("@EMAIL", client.Email),
                    new SqlParameter("@RG", client.RG),
                    new SqlParameter("@GENERO", client.Genero),
                };

                return DatabaseProgramas().ChoosePrimitiveType<long>(query, parameters);
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
                string query = @$"UPDATE ECM_CLIENTE SET NOME = @NOME, SOBRENOME = @SOBRENOME, CPF = @CPF, SITUACAO = @SITUACAO,
                                DATA_NASCIMENTO = @DATA_NASCIMENTO, EMAIL = @EMAIL, RG = @RG, GENERO = @GENERO, DATA_EDICAO = GETDATE()
                                WHERE ID_CLIENTE = @ID_CLIENTE;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@NOME", client.Nome.ToUpper()),
                    new SqlParameter("@SOBRENOME", client.Sobrenome.ToUpper()),
                    new SqlParameter("@CPF", client.CPF),
                    new SqlParameter("@DATA_NASCIMENTO", client.DataNascimento),
                    new SqlParameter("@EMAIL", client.Email),
                    new SqlParameter("@RG", client.RG),
                    new SqlParameter("@GENERO", client.Genero),
                    new SqlParameter("@SITUACAO", client.Situacao),
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void DeleteClient(long IdCliente)
        {
            try
            {
                string query = @$"UPDATE ECM_CLIENTE SET D_E_L_E_T_ = '*', DATA_EDICAO = GETDATE() WHERE ID_CLIENTE = @ID_CLIENTE;";

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
                string query = @$"DELETE FROM ECM_CLIENTE WHERE ID_CLIENTE = @ID_CLIENTE;";

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

        public static Client SearchForClientBy(string Name, string RG, string CPF, string Email, DateTime DataNascimento)
        {
            try
            {
                string query = $@"SELECT 
	                                ID_CLIENTE,NOME,SOBRENOME,CPF,
	                                DATA_NASCIMENTO,EMAIL,RG,GENERO,
                                DATA_CRIACAO,DATA_EDICAO
                                FROM ECM_CLIENTE
                                WHERE D_E_L_E_T_ <> '*' AND SITUACAO = 0 AND 
	                                (CPF = @CPF OR RG = @RG OR EMAIL = @EMAIL OR
	                                CONCAT(NOME, ' ', SOBRENOME) = @NAME OR
	                                DATA_NASCIMENTO = @DATA_NASCIMENTO);";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@CPF", CPF),
                    new SqlParameter("@RG", RG),
                    new SqlParameter("@EMAIL", Email),
                    new SqlParameter("@NAME", Name.ToUpper()),
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
	                                ID_CLIENTE,NOME,SOBRENOME,CPF,
	                                DATA_NASCIMENTO,EMAIL,RG,GENERO,
	                                DATA_CRIACAO,DATA_EDICAO
                                FROM ECM_CLIENTE
                                WHERE D_E_L_E_T_ <> '*' AND SITUACAO = 0;";

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
	                                ID_CLIENTE,NOME,SOBRENOME,CPF,
	                                DATA_NASCIMENTO,EMAIL,RG,GENERO,
	                                DATA_CRIACAO,DATA_EDICAO
                                FROM ECM_CLIENTE
                                WHERE D_E_L_E_T_ <> '*' AND SITUACAO = 1;";

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
	                                ID_CLIENTE, NOME, SOBRENOME, CPF, SITUACAO
	                                DATA_NASCIMENTO, EMAIL, RG, GENERO,
	                                DATA_CRIACAO, DATA_EDICAO
                                FROM ECM_CLIENTE
                                WHERE D_E_L_E_T_ <> '*'";

                return DatabaseProgramas().Select<Client>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
