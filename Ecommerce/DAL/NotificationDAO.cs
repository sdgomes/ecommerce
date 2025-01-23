using Ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.DAL
{
    public class NotificationDAO : BaseDAO
    {
        public static List<Notification> SelectAllChatByGrupoCodigo(int GrupoCodigo)
        {
            try
            {
                string query = @$"SELECT
	                                EN.ID_NOTIFICACAO,
	                                EN.GRUPO_CODIGO, 
	                                EN.MENSAGEM, 
	                                EN.CRIACAO, 
                                    EN.ID_FUNCIONARIO,
	                                CASE
		                                WHEN EC.NOME IS NOT NULL THEN CONCAT(EC.NOME, ' ', EC.SOBRENOME)
		                                ELSE EF.NOME_COMPLETO
	                                END AS NOME_COMPLETO
                                FROM ECM_NOTIFICACOES EN
	                                LEFT JOIN ECM_CLIENTES EC ON EC.ID_CLIENTE = EN.ID_CLIENTE
	                                LEFT JOIN ECM_FUNCIONARIOS EF ON EF.ID_FUNCIONARIO = EN.ID_FUNCIONARIO
                                WHERE
	                                EN.GRUPO_CODIGO = @GRUPO_CODIGO
                                ORDER BY EN.ID_NOTIFICACAO ASC;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@GRUPO_CODIGO", GrupoCodigo)
                };

                return DatabaseProgramas().Select<Notification>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Notification> SelectAllChatByGrupoCodigoSequencia(int GrupoCodigo, long IdNotificacao)
        {
            try
            {
                string query = @$"SELECT
	                                EN.ID_NOTIFICACAO,
	                                EN.GRUPO_CODIGO, 
	                                EN.MENSAGEM, 
	                                EN.CRIACAO, 
                                    EN.ID_FUNCIONARIO,
	                                CASE
		                                WHEN EC.NOME IS NOT NULL THEN CONCAT(EC.NOME, ' ', EC.SOBRENOME)
		                                ELSE EF.NOME_COMPLETO
	                                END AS NOME_COMPLETO
                                FROM ECM_NOTIFICACOES EN
	                                LEFT JOIN ECM_CLIENTES EC ON EC.ID_CLIENTE = EN.ID_CLIENTE
	                                LEFT JOIN ECM_FUNCIONARIOS EF ON EF.ID_FUNCIONARIO = EN.ID_FUNCIONARIO
                                WHERE
	                                EN.GRUPO_CODIGO = @GRUPO_CODIGO
	                                AND EN.ID_NOTIFICACAO > @ID_NOTIFICACAO
                                ORDER BY EN.ID_NOTIFICACAO DESC;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@GRUPO_CODIGO", GrupoCodigo),
                    new SqlParameter("@ID_NOTIFICACAO", IdNotificacao)
                };

                return DatabaseProgramas().Select<Notification>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static long CreateChat(Notification chat)
        {
            try
            {
                string query = @$"INSERT INTO ECM_NOTIFICACOES
                                (MENSAGEM, GRUPO_CODIGO, ID_CLIENTE, ID_FUNCIONARIO, TITULO, ENVIADO)
                                OUTPUT Inserted.ID_NOTIFICACAO
                                VALUES (@MENSAGEM, @GRUPO_CODIGO, @ID_CLIENTE, @ID_FUNCIONARIO, '', '')";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@MENSAGEM", I(chat.Mensagem)),
                    new SqlParameter("@GRUPO_CODIGO", I(chat.GrupoCodigo)),
                    new SqlParameter("@ID_CLIENTE", I(chat.IdCliente == 0 ? null : chat.IdCliente)),
                    new SqlParameter("@ID_FUNCIONARIO", I(chat.IdFuncionario == 0 ? null : chat.IdFuncionario)),
                };

                return DatabaseProgramas().ChoosePrimitiveType<long>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
