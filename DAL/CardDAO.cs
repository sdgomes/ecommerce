using crm.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace crm.DAL
{
    public class CardDAO : BaseDAO
    {
        public static long CreateCard(long IdCliente, Card card)
        {
            try
            {
                string query = @$"BEGIN
	                                IF NOT EXISTS (SELECT ID_CARTAO FROM ECM_CARTOES WHERE NUMERO = @NUMERO)
	                                BEGIN
		                                INSERT INTO ECM_CARTOES (ID_CLIENTE, ID_BANDEIRA, NOME_TITULAR, NOME_CARTAO, PRINCIPAL, CPF_TITULAR, NUMERO, DATA_VALIDADE, CODIGO_SEGURANCA)
		                                OUTPUT Inserted.ID_CARTAO
		                                VALUES (@ID_CLIENTE, @ID_BANDEIRA, UPPER(@NOME_TITULAR), UPPER(@NOME_CARTAO), @PRINCIPAL, @CPF_TITULAR, @NUMERO, @DATA_VALIDADE, @CODIGO_SEGURANCA)
	                                END
                                END;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                    new SqlParameter("@ID_BANDEIRA", I(card.IdBandeira)),
                    new SqlParameter("@NOME_TITULAR", I(card.NomeTitular)),
                    new SqlParameter("@NOME_CARTAO", I(card.NomeCartao)),
                    new SqlParameter("@PRINCIPAL", I(card.Principal)),
                    new SqlParameter("@CPF_TITULAR", I(card.CPFTitular)),
                    new SqlParameter("@NUMERO", I(card.Numero)),
                    new SqlParameter("@DATA_VALIDADE", I(card.DataValidade)),
                    new SqlParameter("@CODIGO_SEGURANCA", I(card.CodigoSeguranca)),
                };

                return DatabaseProgramas().ChoosePrimitiveType<long>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void RemoveCard(long IdCartao)
        {
            try
            {
                string query = @$"DELETE FROM ECM_CARTOES WHERE ID_CARTAO = @ID_CARTAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CARTAO", IdCartao)
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Card SearchCardById(long IdCartao)
        {
            try
            {
                string query = $@"SELECT
	                                CAR.ID_CARTAO,CAR.ID_CLIENTE,CAR.ID_BANDEIRA,CAR.NOME_CARTAO,
	                                CAR.NOME_TITULAR,CAR.PRINCIPAL,CAR.CPF_TITULAR,CAR.NUMERO,
	                                CAR.DATA_VALIDADE,CAR.CODIGO_SEGURANCA,CAR.CRIACAO, BAN.NOME
                                FROM ECM_CARTOES CAR
                                    INNER JOIN ECM_BANDEIRAS BAN ON BAN.ID_BANDEIRA = CAR.ID_BANDEIRA
                                        AND BAN.D_E_L_E_T_ <> '*'
                                WHERE CAR.D_E_L_E_T_ <> '*' AND CAR.ID_CARTAO = @ID_CARTAO;";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ID_CARTAO", IdCartao),
                };

                return DatabaseProgramas().Choose<Card>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Card> SelectClientCard(long IdCliente)
        {
            try
            {
                string query = $@"SELECT BAN.COR, BAN.IMAGEM,
	                                CAR.ID_CARTAO,CAR.ID_CLIENTE,CAR.ID_BANDEIRA,CAR.NOME_CARTAO,
	                                CAR.NOME_TITULAR,CAR.PRINCIPAL,CAR.CPF_TITULAR,CAR.NUMERO,
	                                CAR.DATA_VALIDADE,CAR.CODIGO_SEGURANCA,CAR.CRIACAO, BAN.NOME
                                FROM ECM_CARTOES CAR
                                    INNER JOIN ECM_BANDEIRAS BAN ON BAN.ID_BANDEIRA = CAR.ID_BANDEIRA
                                        AND BAN.D_E_L_E_T_ <> '*'
                                WHERE CAR.D_E_L_E_T_ <> '*' AND CAR.ID_CLIENTE = @ID_CLIENTE;";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                };

                return DatabaseProgramas().Select<Card>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Card> SelectAllCardSTransactions(long IdTransacao)
        {
            try
            {
                string query = $@"SELECT 
	                                ETC.TOTAL,
	                                EC.NOME_TITULAR,
	                                EC.NOME_CARTAO,
	                                EB.NOME,
	                                EB.ID_BANDEIRA,
	                                ETC.PAGAMENTO,
	                                EC.CRIACAO
                                FROM ECM_TRA_CAR ETC
	                                INNER JOIN ECM_CARTOES EC ON EC.ID_CARTAO = ETC.ID_CARTAO
	                                INNER JOIN ECM_BANDEIRAS EB ON EB.ID_BANDEIRA = EC.ID_BANDEIRA
                                WHERE 
	                                ETC.ID_TRANSACAO = @ID_TRANSACAO 
                                ORDER BY ETC.ID_TRANSACAO_CARTAO DESC;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", IdTransacao)
                };

                return DatabaseProgramas().Select<Card>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Card> SelectAllCardBrands()
        {
            try
            {
                string query = $@"SELECT ID_BANDEIRA, NOME, IMAGEM FROM ECM_BANDEIRAS WHERE D_E_L_E_T_ <> '*' ORDER BY NOME ASC;";

                return DatabaseProgramas().Select<Card>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
