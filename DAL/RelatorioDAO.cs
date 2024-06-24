using crm.DTO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace crm.DAL
{
    public class RelatorioDAO : BaseDAO
    {
        public static List<RelatorioDTO> Geral()
        {
            try
            {
                string query = $@"SELECT TOP 45 
	                    SUM(EPT.QUANTIDADE) AS QUANTIDADE,
	                    FORMAT(ET.CRIACAO, 'd') AS DATA_VENDA  
                    FROM ECM_TRANSACOES ET
	                    INNER JOIN ECM_PRO_TRA EPT ON EPT.ID_TRANSACAO = ET.ID_TRANSACAO
                    WHERE ET.PAGAMENTO = 'APROVADO'
                    AND ET.D_E_L_E_T_ <> '*'
                    GROUP BY ET.CRIACAO
                    ORDER BY ET.CRIACAO DESC";

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
	                SUM(EPT.QUANTIDADE) AS QUANTIDADE,
	                FORMAT(ET.CRIACAO, 'd') AS DATA_VENDA  
                FROM ECM_TRANSACOES ET
	                INNER JOIN ECM_PRO_TRA EPT ON EPT.ID_TRANSACAO = ET.ID_TRANSACAO
                WHERE ET.PAGAMENTO = 'APROVADO'
                AND ET.D_E_L_E_T_ <> '*' AND
                (
	                FORMAT(ET.CRIACAO, 'd') BETWEEN 
	                FORMAT(@INICIO, 'd') AND 
	                FORMAT(@FIM, 'd')
                )
                GROUP BY ET.CRIACAO
                ORDER BY ET.CRIACAO DESC";

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
                string query = $@"SELECT TOP 5
	                EP.NOME,
	                EP.ID_PRODUTO
                FROM ECM_TRANSACOES ET
	                INNER JOIN ECM_PRO_TRA EPT ON EPT.ID_TRANSACAO = ET.ID_TRANSACAO
	                INNER JOIN ECM_PRODUTOS EP ON EP.ID_PRODUTO = EPT.ID_PRODUTO
                WHERE ET.PAGAMENTO = 'APROVADO'
                AND ET.D_E_L_E_T_ <> '*'
                GROUP BY EP.NOME,EP.ID_PRODUTO
                ORDER BY NEWID()";

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
	                EP.NOME,
	                EP.ID_PRODUTO
                FROM ECM_TRANSACOES ET
	                INNER JOIN ECM_PRO_TRA EPT ON EPT.ID_TRANSACAO = ET.ID_TRANSACAO
	                INNER JOIN ECM_PRODUTOS EP ON EP.ID_PRODUTO = EPT.ID_PRODUTO
                WHERE ET.PAGAMENTO = 'APROVADO'
                AND ET.D_E_L_E_T_ <> '*'
                AND (
	                FORMAT(ET.CRIACAO, 'd') BETWEEN 
	                FORMAT(@INICIO, 'd') AND 
	                FORMAT(@FIM, 'd')
                )
                GROUP BY EP.NOME,EP.ID_PRODUTO";

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

        public static List<RelatorioDTO> VendaPorProdutosId(long IdProduto)
        {
            try
            {
                string query = $@"SELECT
	                SUM(EPT.QUANTIDADE) AS QUANTIDADE,
	                FORMAT(ET.CRIACAO, 'd') AS DATA_VENDA
                FROM ECM_TRANSACOES ET
	                INNER JOIN ECM_PRO_TRA EPT ON EPT.ID_TRANSACAO = ET.ID_TRANSACAO
	                INNER JOIN ECM_PRODUTOS EP ON EP.ID_PRODUTO = EPT.ID_PRODUTO
		                AND EP.ID_PRODUTO = @ID_PRODUTO
                WHERE ET.PAGAMENTO = 'APROVADO'
                AND ET.D_E_L_E_T_ <> '*'
                GROUP BY ET.CRIACAO";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_PRODUTO", IdProduto)
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
