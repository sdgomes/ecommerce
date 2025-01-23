using Ecommerce.DTO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.DAL
{
    public class RelatorioDAO : BaseDAO
    {
        public static List<RelatorioDTO> Geral()
        {
            try
            {
                string query = $@"SELECT TOP 700
	                FORMAT(ET.CRIACAO, 'yyyy-MM-dd') AS DATA_VENDA,
	                SUM(ETP.QUANTIDADE) AS QUANTIDADE
                FROM ECM_TRANSACOES ET
	                INNER JOIN ECM_PRO_TRA ETP ON ETP.ID_TRANSACAO = ET.ID_TRANSACAO
                WHERE ET.PAGAMENTO = 'APROVADO' AND ET.D_E_L_E_T_ <> '*'
                GROUP BY FORMAT(ET.CRIACAO, 'yyyy-MM-dd')
                ORDER BY FORMAT(ET.CRIACAO, 'yyyy-MM-dd') DESC";

                return DatabaseProgramas().Select<RelatorioDTO>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<RelatorioDTO> GeralComPeriodo(DateTime Inicio, DateTime Fim)
        {
            try
            {
                string query = $@"SELECT 
	                FORMAT(ET.CRIACAO, 'yyyy-MM-dd') AS DATA_VENDA,
	                SUM(ETP.QUANTIDADE) AS QUANTIDADE
                FROM ECM_TRANSACOES ET
	                INNER JOIN ECM_PRO_TRA ETP ON ETP.ID_TRANSACAO = ET.ID_TRANSACAO
                WHERE ET.PAGAMENTO = 'APROVADO' AND ET.D_E_L_E_T_ <> '*'
                    AND (FORMAT(ET.CRIACAO, 'yyyy-MM-dd') BETWEEN FORMAT(@INICIO, 'yyyy-MM-dd') AND FORMAT(@FIM, 'yyyy-MM-dd'))
                GROUP BY FORMAT(ET.CRIACAO, 'yyyy-MM-dd')
                ORDER BY FORMAT(ET.CRIACAO, 'yyyy-MM-dd') DESC";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@INICIO", Inicio),
                    new SqlParameter("@FIM", Fim),
                };

                return DatabaseProgramas().Select<RelatorioDTO>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<RelatorioDTO> VendaPorProdutos()
        {
            try
            {
                string query = $@"SELECT 
	                EC.NOME,
	                FORMAT(ET.CRIACAO, 'yyyy-MM-dd') AS DATA_VENDA,
	                SUM(ETP.QUANTIDADE) AS QUANTIDADE
                FROM ECM_CATEGORIAS EC
                INNER JOIN ECM_CAT_PRO ECP ON ECP.ID_CATEGORIA = EC.ID_CATEGORIA
                INNER JOIN ECM_PRO_TRA ETP ON ETP.ID_PRODUTO = ECP.ID_PRODUTO
                INNER JOIN ECM_TRANSACOES ET ON ET.ID_TRANSACAO = ETP.ID_TRANSACAO
	                AND ET.PAGAMENTO = 'APROVADO' AND ET.D_E_L_E_T_ <> '*'
                GROUP BY EC.NOME, FORMAT(ET.CRIACAO, 'yyyy-MM-dd')
                ORDER BY EC.NOME DESC";

                return DatabaseProgramas().Select<RelatorioDTO>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<RelatorioDTO> VendaPorProdutosPeriodo(DateTime Inicio, DateTime Fim)
        {
            try
            {
                string query = $@"SELECT 
	                EC.NOME,
	                FORMAT(ET.CRIACAO, 'yyyy-MM-dd') AS DATA_VENDA,
	                SUM(ETP.QUANTIDADE) AS QUANTIDADE
                FROM ECM_CATEGORIAS EC
                INNER JOIN ECM_CAT_PRO ECP ON ECP.ID_CATEGORIA = EC.ID_CATEGORIA
                INNER JOIN ECM_PRO_TRA ETP ON ETP.ID_PRODUTO = ECP.ID_PRODUTO
                INNER JOIN ECM_TRANSACOES ET ON ET.ID_TRANSACAO = ETP.ID_TRANSACAO
	                AND ET.PAGAMENTO = 'APROVADO' AND ET.D_E_L_E_T_ <> '*'
                    AND (FORMAT(ET.CRIACAO, 'yyyy-MM-dd') BETWEEN FORMAT(@INICIO, 'yyyy-MM-dd') AND FORMAT(@FIM, 'yyyy-MM-dd'))
                GROUP BY EC.NOME, FORMAT(ET.CRIACAO, 'yyyy-MM-dd')
                ORDER BY EC.NOME DESC";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@INICIO", Inicio),
                    new SqlParameter("@FIM", Fim),
                };

                return DatabaseProgramas().Select<RelatorioDTO>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
