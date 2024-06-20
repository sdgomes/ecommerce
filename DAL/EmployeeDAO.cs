using crm.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace crm.DAL
{
    public class EmployeeDAO : BaseDAO
    {
        public static List<Solicitation> SelectGrupoSolicitacoes(string Tipo)
        {
            try
            {
                string query = @$"SELECT
	                                ES.GRUPO_CODIGO,
	                                EE.ETAPA,
	                                EE.COR,
	                                ET.CODIGO AS CODIGO_TRANSACAO,
	                                DATEADD(dd, 0, DATEDIFF(dd, 0, ET.CRIACAO)) AS CRIACAO,
	                                ES.MOTIVO_SOLICITACAO,
	                                DATEADD(dd, 0, DATEDIFF(dd, 0, ES.DATA_SOLICITACAO)) AS DATA_SOLICITACAO
                                FROM ECM_SOLICITACOES ES
	                                INNER JOIN ECM_ETAPAS EE ON EE.ID_ETAPA = ES.ID_ETAPA
	                                INNER JOIN ECM_TRANSACOES ET ON ET.ID_TRANSACAO = ES.ID_TRANSACAO
                                WHERE
	                                ES.TIPO = @TIPO
                                GROUP BY ES.GRUPO_CODIGO,
	                                EE.ETAPA, EE.COR,
	                                ET.CODIGO, 
									DATEADD(dd, 0, DATEDIFF(dd, 0, ET.CRIACAO)),
	                                ES.MOTIVO_SOLICITACAO,
	                                DATEADD(dd, 0, DATEDIFF(dd, 0, ES.DATA_SOLICITACAO))
                                ORDER BY ES.GRUPO_CODIGO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@TIPO", I(Tipo)),
                };

                return DatabaseProgramas().Select<Solicitation>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Employee SearchForEmployeeByCodigo(string Codigo)
        {
            try
            {
                string query = $@"SELECT
	                                USU.EMAIL, FUN.CODIGO, USU.ID_USUARIO,
	                                FUN.ID_FUNCIONARIO, FUN.NOME_COMPLETO, FUN.CARGO
                                FROM ECM_FUNCIONARIOS FUN
	                                INNER JOIN ECM_USUARIOS USU ON USU.ID_USUARIO = FUN.ID_USUARIO
		                                AND USU.D_E_L_E_T_ <> '*'
                                WHERE FUN.D_E_L_E_T_ <> '*' AND FUN.CODIGO = @CODIGO;";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@CODIGO", Codigo),
                };

                return DatabaseProgramas().Choose<Employee>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
