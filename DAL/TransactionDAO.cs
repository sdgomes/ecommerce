using crm.DTO;
using crm.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace crm.DAL
{
    public class TransactionDAO : BaseDAO
    {
        public static TransactionDTO SearchById(long IdTransaction)
        {
            try
            {
                string query = @$"SELECT * FROM ECM_TRANSACOES TR
                                    INNER JOIN ECM_ETAPAS ET ON ET.ID_ETAPA = TR.ID_ETAPA
	                                    AND ET.D_E_L_E_T_ <> '*'
                                    INNER JOIN ECM_ENDERECOS EN ON EN.ID_ENDERECO = TR.ID_ENDERECO
	                                    AND EN.D_E_L_E_T_ <> '*'
                                WHERE TR.D_E_L_E_T_ <> '*' AND TR.ID_TRANSACAO = @ID_TRANSACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", I(IdTransaction)),
                };

                return DatabaseProgramas().Choose<TransactionDTO>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Transaction> SelectByIdTransaction(long IdTransacao, string Etapa, string Tipo)
        {
            try
            {
                string query = @$"SELECT 
	                                EPT.QUANTIDADE,
	                                EPT.ID_PRODUTO,
	                                PR.NOME,
	                                PR.DESCRICAO,
	                                EPT.ID_TRANSACAO, 
	                                @ETAPA AS ETAPA, 
	                                @TIPO AS TIPO
                                FROM ECM_PRO_TRA EPT
	                                INNER JOIN ECM_PRODUTOS PR ON PR.ID_PRODUTO = EPT.ID_PRODUTO
                                WHERE EPT.ID_TRANSACAO = @ID_TRANSACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", IdTransacao),
                    new SqlParameter("@ETAPA", I(Etapa)),
                    new SqlParameter("@TIPO", I(Tipo)),
                };

                return DatabaseProgramas().Select<Transaction>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Transaction> SelectByCodigoData(DateTime Data, long IdCliente)
        {
            try
            {
                string query = @$"SELECT
	                                ET.ETAPA, 
	                                TR.TIPO,
	                                ID_TRANSACAO
                                FROM ECM_TRANSACOES TR
	                                INNER JOIN ECM_ETAPAS ET ON ET.ID_ETAPA = TR.ID_ETAPA
                                WHERE TR.ID_CLIENTE = @ID_CLIENTE AND 
                                CONVERT(CHAR(10), TR.CRIACAO, 126) = CONVERT(CHAR(10), @CRIACAO, 126)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CRIACAO", I(Data)),
                    new SqlParameter("@ID_CLIENTE", I(IdCliente)),
                };

                return DatabaseProgramas().Select<Transaction>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<TransactionDTO> SelectByClient(long IdCliente)
        {
            try
            {
                string query = @$"SELECT 
	                                CAST(CONVERT(CHAR(10), TR.CRIACAO, 126) AS DATE) AS CRIACAO
                                FROM ECM_TRANSACOES TR
                                    INNER JOIN ECM_ETAPAS ET ON ET.ID_ETAPA = TR.ID_ETAPA
	                                    AND ET.D_E_L_E_T_ <> '*'
                                    INNER JOIN ECM_ENDERECOS EN ON EN.ID_ENDERECO = TR.ID_ENDERECO
	                                    AND EN.D_E_L_E_T_ <> '*'
                                WHERE TR.D_E_L_E_T_ <> '*' AND TR.ID_CLIENTE = @ID_CLIENTE
                                GROUP BY CONVERT(CHAR(10), TR.CRIACAO, 126)
                                ORDER BY CRIACAO DESC";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CLIENTE", I(IdCliente)),
                };

                return DatabaseProgramas().Select<TransactionDTO>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static long Create(TransactionDTO transaction)
        {
            try
            {
                string query = @$" INSERT INTO ECM_TRANSACOES (ID_CLIENTE, ID_ENDERECO, TIPO, SUBTOTAL, FRETE, DESCONTOS, TOTAL, PAGAMENTO)
		                                OUTPUT Inserted.ID_TRANSACAO
		                                VALUES (@ID_CLIENTE, @ID_ENDERECO, 'COMPRA', @SUBTOTAL, @FRETE, @DESCONTOS, @TOTAL, '')";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CLIENTE", I(transaction.IdCliente)),
                    new SqlParameter("@ID_ENDERECO", I(transaction.IdEndereco)),
                    new SqlParameter("@SUBTOTAL", I(transaction.Subtotal)),
                    new SqlParameter("@FRETE ", I(transaction.Frete)),
                    new SqlParameter("@DESCONTOS", I(transaction.Descontos)),
                    new SqlParameter("@TOTAL", I(transaction.Total)),
                };

                return DatabaseProgramas().ChoosePrimitiveType<long>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AssociateCards(long IdTransaction, long IdCard)
        {
            try
            {
                string query = @$" INSERT INTO ECM_TRA_CAR (ID_TRANSACAO, ID_CARTAO)
		                                VALUES (@ID_TRANSACAO, @ID_CARTAO)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", I(IdTransaction)),
                    new SqlParameter("@ID_CARTAO", I(IdCard)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AssociateProducts(long IdTransaction, Product Produto)
        {
            try
            {
                string query = @$" INSERT INTO ECM_PRO_TRA (ID_TRANSACAO, ID_PRODUTO, QUANTIDADE)
		                                VALUES (@ID_TRANSACAO, @ID_PRODUTO, @QUANTIDADE)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", I(IdTransaction)),
                    new SqlParameter("@ID_PRODUTO", I(Produto.IdProduto)),
                    new SqlParameter("@QUANTIDADE", I(Produto.QntCompra)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
