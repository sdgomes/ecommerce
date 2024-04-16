using ecommerce.DTO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DAL
{
    public class TransactionDAO : BaseDAO
    {
        public static long Create(TransactionDTO transaction)
        {
            try
            {
                string query = @$" INSERT INTO ECM_TRANSACOES (ID_CLIENTE, ID_ENDERECO, TIPO, SUBTOTAL, FRETE, DESCONTOS, TOTAL, PAGAMENTO)
		                                OUTPUT Inserted.ID_TRANSACAO
		                                VALUES (@ID_CLIENTE, @ID_ENDERECO, UPPER(@TIPO), @SUBTOTAL, @FRETE, @DESCONTOS, @TOTAL, '')";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CLIENTE", I(transaction.IdCliente)),
                    new SqlParameter("@ID_ENDERECO", I(transaction.IdEndereco)),
                    new SqlParameter("@TIPO", I(transaction.Tipo)),
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

        public static void AssociateProducts(long IdTransaction, long IdProduto)
        {
            try
            {
                string query = @$" INSERT INTO ECM_PRO_TRA (ID_TRANSACAO, ID_PRODUTO)
		                                VALUES (@ID_TRANSACAO, @ID_PRODUTO)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", I(IdTransaction)),
                    new SqlParameter("@ID_PRODUTO", I(IdProduto)),
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
