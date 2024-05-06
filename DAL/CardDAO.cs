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

        public static void UpdateCard(long IdCartao, Card card)
        {
            try
            {
                string query = @$"UPDATE ECM_CARTOES SET ID_BANDEIRA = @ID_BANDEIRA, NOME_TITULAR = UPPER(@NOME_TITULAR), NOME_CARTAO = UPPER(@NOME_CARTAO),
                PRINCIPAL = @PRINCIPAL, CPF_TITULAR = @CPF_TITULAR, NUMERO = @NUMERO,
                DATA_VALIDADE = @DATA_VALIDADE, CODIGO_SEGURANCA = @CODIGO_SEGURANCA WHERE ID_CARTAO = @ID_CARTAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CARTAO", IdCartao),
                    new SqlParameter("@ID_BANDEIRA", card.IdBandeira),
                    new SqlParameter("@NOME_TITULAR", card.NomeTitular),
                    new SqlParameter("@NOME_CARTAO", card.NomeCartao),
                    new SqlParameter("@PRINCIPAL", card.Principal),
                    new SqlParameter("@CPF_TITULAR", card.CPFTitular),
                    new SqlParameter("@NUMERO", card.Numero),
                    new SqlParameter("@DATA_VALIDADE", card.DataValidade),
                    new SqlParameter("@CODIGO_SEGURANCA", card.CodigoSeguranca),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void DeleteCard(long IdCartao)
        {
            try
            {
                string query = @$"UPDATE ECM_CARTOES SET = D_E_L_E_T_ '*' WHERE ID_CARTAO = @ID_CARTAO;";

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

        public static Card SearchCardBy(string NomeTitular, string NomeCartao, string Numero)
        {
            try
            {
                string query = $@"SELECT
	                                ID_CARTAO,ID_CLIENTE,ID_BANDEIRA,NOME_CARTAO,
	                                NOME_TITULAR,PRINCIPAL,CPF_TITULAR,NUMERO,
	                                DATA_VALIDADE,CODIGO_SEGURANCA,CRIACAO
                                FROM ECM_CARTOES
                                WHERE D_E_L_E_T_ <> '*' AND
	                                (NOME_TITULAR = @NOME_TITULAR OR NOME_CARTAO = @NOME_CARTAO OR NUMERO = @NUMERO);";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@NUMERO", Numero),
                    new SqlParameter("@NOME_TITULAR", NomeTitular),
                    new SqlParameter("@NOME_CARTAO", NomeCartao),
                };

                return DatabaseProgramas().Choose<Card>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Card SearchClientCardBy(long IdCliente, string NomeTitular, string NomeCartao, string Numero)
        {
            try
            {
                string query = $@"SELECT
	                                ID_CARTAO,ID_CLIENTE,ID_BANDEIRA,NOME_CARTAO,
	                                NOME_TITULAR,PRINCIPAL,CPF_TITULAR,NUMERO,
	                                DATA_VALIDADE,CODIGO_SEGURANCA,CRIACAO
                                FROM ECM_CARTOES
                                WHERE D_E_L_E_T_ <> '*' AND ID_CLIENTE = @ID_CLIENTE AND
	                                (NOME_TITULAR = @NOME_TITULAR
	                                OR NUMERO = @NUMERO);";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                    new SqlParameter("@NUMERO", Numero),
                    new SqlParameter("@NOME_TITULAR", NomeTitular),
                    new SqlParameter("@NOME_CARTAO", NomeCartao),
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
                string query = $@"SELECT
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

        public static List<Card> SelectAllCard()
        {
            try
            {
                string query = $@"SELECT
	                                ID_CARTAO,ID_CLIENTE,ID_BANDEIRA,NOME_CARTAO,
	                                NOME_TITULAR,PRINCIPAL,CPF_TITULAR,NUMERO,
	                                DATA_VALIDADE,CODIGO_SEGURANCA,CRIACAO
                                FROM ECM_CARTOES
                                WHERE D_E_L_E_T_ <> '*';";

                return DatabaseProgramas().Select<Card>(query);
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
                string query = $@"SELECT ID_BANDEIRA, NOME FROM ECM_BANDEIRAS WHERE D_E_L_E_T_ <> '*' ORDER BY NOME ASC;";

                return DatabaseProgramas().Select<Card>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
