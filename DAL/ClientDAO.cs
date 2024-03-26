﻿using ecommerce.Models;
using ecommerce.Utility;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Crypt = BCrypt.Net.BCrypt;

namespace ecommerce.DAL
{
    public class ClientDAO : BaseDAO
    {
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
			                                VALUES ((SELECT SCOPE_IDENTITY() AS ID_USUARIO), @CODIGO, @NOME, @SOBRENOME, @CPF, @DATA_NASCIMENTO, @RG, @TELEFONE, @CELULAR, @GENERO);
		                                END
	                                END
                                END;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CODIGO", Util.Codigo(5)),
                    new SqlParameter("@NOME", client.Nome.ToUpper()),
                    new SqlParameter("@SOBRENOME", client.Sobrenome.ToUpper()),
                    new SqlParameter("@CPF", client.CPF),
                    new SqlParameter("@DATA_NASCIMENTO", client.DataNascimento.ToString("yyyy-MM-dd")),
                    new SqlParameter("@RG", client.RG),
                    new SqlParameter("@TELEFONE", client.Telefone),
                    new SqlParameter("@CELULAR", client.Celular),
                    new SqlParameter("@GENERO", client.Genero),
                    new SqlParameter("@EMAIL", client.Email),
                    new SqlParameter("@SENHA", Crypt.HashPassword(client.Senha)),
                    new SqlParameter("@TIPO",  client.Tipo),
                };

                return DatabaseProgramas().ChoosePrimitiveType<long>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void UpdatePassword(long IdUsuario, string Senha)
        {
            try
            {
                string query = @$"UPDATE ECM_USUARIOS SET SENHA = @SENHA WHERE ID_USUARIO = @ID_USUARIO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@SENHA", Crypt.HashPassword(Senha)),
                    new SqlParameter("@ID_USUARIO", IdUsuario),
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
                string query = @$"UPDATE ECM_CLIENTES SET NOME = @NOME, SOBRENOME = @SOBRENOME, CPF = @CPF, DATA_NASCIMENTO = @DATA_NASCIMENTO,
                                RG = @RG, TELEFONE = @TELEFONE, CELULAR = @CELULAR, SITUACAO = @SITUACAO, GENERO = @GENERO
                                WHERE ID_CLIENTE = @ID_CLIENTE;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@NOME", client.Nome.ToUpper()),
                    new SqlParameter("@SOBRENOME", client.Sobrenome.ToUpper()),
                    new SqlParameter("@CPF", client.CPF),
                    new SqlParameter("@DATA_NASCIMENTO", client.DataNascimento),
                    new SqlParameter("@RG", client.RG),
                    new SqlParameter("@TELEFONE", client.Telefone),
                    new SqlParameter("@CELULAR", client.Celular),
                    new SqlParameter("@SITUACAO", client.Situacao),
                    new SqlParameter("@GENERO", client.Genero),
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
	                                USU.EMAIL, CLI.CODIGO,
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