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
                string query = @$"SELECT 
                                	*,
	                                (SELECT COUNT(1) FROM ECM_TRA_CAR TC WHERE TC.ID_TRANSACAO = TR.ID_TRANSACAO) AS QNT_CARTOES,
	                                TR.CRIACAO AS DATA_COMPRA
                                FROM ECM_TRANSACOES TR
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

        public static List<TransactionDTO> SelectByIdTransaction(long IdTransacao, string Etapa, string Tipo, string Cor)
        {
            try
            {
                string query = @$"SELECT 
                                    @COR AS COR,
	                                EPT.QUANTIDADE,
	                                EPT.ID_PRODUTO,
	                                PR.NOME,
	                                PR.DESCRICAO,
	                                EPT.ID_TRANSACAO, 
	                                @ETAPA AS ETAPA, 
	                                @TIPO AS TIPO,
                                    (SELECT IMAGEM FROM ECM_IMAGENS IMA WHERE IMA.NOME = 'COVER' AND IMA.ID_PRODUTO = PR.ID_PRODUTO) AS IMAGEM
                                FROM ECM_PRO_TRA EPT
	                                INNER JOIN ECM_PRODUTOS PR ON PR.ID_PRODUTO = EPT.ID_PRODUTO
                                WHERE EPT.ID_TRANSACAO = @ID_TRANSACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", IdTransacao),
                    new SqlParameter("@ETAPA", I(Etapa)),
                    new SqlParameter("@TIPO", I(Tipo)),
                    new SqlParameter("@COR", I(Cor)),
                };

                return DatabaseProgramas().Select<TransactionDTO>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<TransactionDTO> SelectByCodigoData(DateTime Data, long IdCliente)
        {
            try
            {
                string query = @$"SELECT
	                                ET.ETAPA, 
	                                ET.COR, 
	                                TR.TIPO,
	                                TR.CODIGO,
                                    TR.PAGAMENTO,
                                    TR.TOTAL, 
                                    TR.FRETE, 
                                    TR.DESCONTOS,
                                    (SELECT COUNT(1) FROM ECM_PRO_TRA EPT WHERE EPT.ID_TRANSACAO = TR.ID_TRANSACAO) AS QUANTIDADE,
	                                TR.ID_TRANSACAO
                                FROM ECM_TRANSACOES TR
	                                INNER JOIN ECM_ETAPAS ET ON ET.ID_ETAPA = TR.ID_ETAPA
                                WHERE TR.ID_CLIENTE = @ID_CLIENTE AND 
                                CONVERT(CHAR(10), TR.CRIACAO, 126) = CONVERT(CHAR(10), @CRIACAO, 126)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CRIACAO", I(Data)),
                    new SqlParameter("@ID_CLIENTE", I(IdCliente)),
                };

                return DatabaseProgramas().Select<TransactionDTO>(query, parameters);
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
                string query = @$" INSERT INTO ECM_TRANSACOES (ID_CLIENTE, ID_ENDERECO, ID_ETAPA, TIPO, SUBTOTAL, FRETE, DESCONTOS, TOTAL, PAGAMENTO)
		                                OUTPUT Inserted.ID_TRANSACAO
		                                VALUES (@ID_CLIENTE, @ID_ENDERECO, (SELECT ID_ETAPA FROM ECM_ETAPAS WHERE ETAPA = 'PROCESSANDO PAGAMENTO'),'COMPRA', @SUBTOTAL, @FRETE, @DESCONTOS, @TOTAL, @PAGAMENTO)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CLIENTE", I(transaction.IdCliente)),
                    new SqlParameter("@ID_ENDERECO", I(transaction.IdEndereco)),
                    new SqlParameter("@SUBTOTAL", I(transaction.Subtotal)),
                    new SqlParameter("@FRETE", I(transaction.Frete)),
                    new SqlParameter("@DESCONTOS", I(transaction.Pagamento == "RECUSADO" ? 0 : transaction.Descontos )),
                    new SqlParameter("@PAGAMENTO", transaction.Pagamento),
                    new SqlParameter("@TOTAL", I(transaction.Total)),
                };

                return DatabaseProgramas().ChoosePrimitiveType<long>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AssociateCards(long IdTransacao, Card Cartao)
        {
            try
            {
                string query = @$" INSERT INTO ECM_TRA_CAR (ID_TRANSACAO, ID_CARTAO, TOTAL, PAGAMENTO)
		                                VALUES (@ID_TRANSACAO, @ID_CARTAO, @TOTAL, @PAGAMENTO)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", I(IdTransacao)),
                    new SqlParameter("@ID_CARTAO", I(Cartao.IdCartao)),
                    new SqlParameter("@TOTAL", I(Cartao.Total)),
                    new SqlParameter("@PAGAMENTO", I(Cartao.Pagamento)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AssociateProducts(long IdTransacao, Product Produto)
        {
            try
            {
                string query = @$"INSERT INTO ECM_PRO_TRA (ID_TRANSACAO, ID_PRODUTO, QUANTIDADE)
		                                VALUES (@ID_TRANSACAO, @ID_PRODUTO, @QUANTIDADE)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", I(IdTransacao)),
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

        public static long GeraDesconto(long IdSolicitacao, string tipo)
        {
            try
            {
                string query = @$"INSERT INTO ECM_DESCONTOS (ID_CLIENTE, CODIGO, TIPO, DESCONTO)
                OUTPUT Inserted.ID_DESCONTO
                VALUES ((SELECT ID_CLIENTE FROM ECM_SOLICITACOES ES
                INNER JOIN ECM_TRANSACOES ET ON ET.ID_TRANSACAO = ES.ID_TRANSACAO
                WHERE ES.ID_SOLICITACAO = @ID_SOLICITACAO), (SELECT (ABS(CHECKSUM(NEWID())) % 99999) + 10000), @TIPO, 0)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@TIPO", I(tipo)),
                    new SqlParameter("@ID_SOLICITACAO", I(IdSolicitacao)),
                };

                return DatabaseProgramas().ChoosePrimitiveType<long>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void SolicitacaoReembolso(long IdSolicitacao, long IdDesconto)
        {
            try
            {
                string query = @$"UPDATE ECM_SOLICITACOES SET ID_ETAPA = (SELECT ID_ETAPA FROM ECM_ETAPAS WHERE ETAPA = 'REEMBOLSO'),
                ID_DESCONTO = @ID_DESCONTO
                WHERE ID_SOLICITACAO = @ID_SOLICITACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_DESCONTO", I(IdDesconto)),
                    new SqlParameter("@ID_SOLICITACAO", I(IdSolicitacao)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void SolicitacaoEntregue(long IdSolicitacao, long IdDesconto)
        {
            try
            {
                string query = @$"UPDATE ECM_SOLICITACOES SET ID_ETAPA = (SELECT ID_ETAPA FROM ECM_ETAPAS WHERE ETAPA = 'ENTREGUE'),
                DATA_RECEBIMENTO = GETDATE(), ID_DESCONTO = @ID_DESCONTO
                WHERE ID_SOLICITACAO = @ID_SOLICITACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_DESCONTO", I(IdDesconto)),
                    new SqlParameter("@ID_SOLICITACAO", I(IdSolicitacao)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AprovaEntrega(long IdSolicitacao)
        {
            try
            {
                string query = @$"UPDATE ECM_SOLICITACOES SET APROCACAO_2 = 1
                WHERE ID_SOLICITACAO = @ID_SOLICITACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_SOLICITACAO", I(IdSolicitacao)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AprovaSolicitacao(long IdSolicitacao)
        {
            try
            {
                string query = @$"UPDATE ECM_SOLICITACOES SET APROCACAO_1 = 1
                WHERE ID_SOLICITACAO = @ID_SOLICITACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_SOLICITACAO", I(IdSolicitacao)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AlteraEtapaSolicitacao(long IdSolicitacao, string Etapa, string Motivo)
        {
            try
            {
                string query = @$"UPDATE ECM_SOLICITACOES SET ID_ETAPA = (SELECT ID_ETAPA FROM ECM_ETAPAS WHERE ETAPA = @ETAPA),
                DATA_RECUSA = CASE WHEN @ETAPA = 'CANCELADO' THEN GETDATE() END, 
                MOTIVO_RECUSA = CASE WHEN @ETAPA = 'CANCELADO' THEN @MOTIVO_RECUSA END,
                DATA_ENVIO = CASE WHEN @ETAPA = 'ENVIADO PARA TROCA' THEN GETDATE() END
                WHERE ID_SOLICITACAO = @ID_SOLICITACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@MOTIVO_RECUSA", I(Motivo)),
                    new SqlParameter("@ETAPA", I(Etapa)),
                    new SqlParameter("@ID_SOLICITACAO", I(IdSolicitacao)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AlteraPedidoReembolso(long IdTransacao)
        {
            try
            {
                string query = @$"UPDATE ECM_TRANSACOES SET REEMBOLSO = 1, ULTIMA_ALTERACAO = GETDATE()
                WHERE ID_TRANSACAO = @ID_TRANSACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", I(IdTransacao)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AlteraPedidoTroca(long IdTransacao)
        {
            try
            {
                string query = @$"UPDATE ECM_TRANSACOES SET TROCA = 1, ULTIMA_ALTERACAO = GETDATE()
                WHERE ID_TRANSACAO = @ID_TRANSACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", I(IdTransacao)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AlteraPedidoDevolucao(long IdTransacao)
        {
            try
            {
                string query = @$"UPDATE ECM_TRANSACOES SET DEVOLUCAO = 1, ULTIMA_ALTERACAO = GETDATE()
                WHERE ID_TRANSACAO = @ID_TRANSACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", I(IdTransacao)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AlteraEtapaPedido(long IdTransacao, string Etapa)
        {
            try
            {
                string query = @$"UPDATE ECM_TRANSACOES SET ID_ETAPA = (SELECT ID_ETAPA FROM ECM_ETAPAS WHERE ETAPA = @ETAPA),
                ENTREGA = CASE WHEN @ETAPA = 'ENTREGUE' THEN GETDATE() ELSE NULL END, ULTIMA_ALTERACAO = GETDATE()
                WHERE ID_TRANSACAO = @ID_TRANSACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ETAPA", I(Etapa)),
                    new SqlParameter("@ID_TRANSACAO", I(IdTransacao)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void AlteraPagamento(TransactionDTO transaction)
        {
            try
            {
                string query = @$"UPDATE ECM_TRANSACOES SET ID_ETAPA = (SELECT ID_ETAPA FROM ECM_ETAPAS WHERE ETAPA = 'PROCESSANDO PAGAMENTO'),
                ULTIMA_ALTERACAO = GETDATE(), PAGAMENTO = @PAGAMENTO, DESCONTOS = @DESCONTOS, TOTAL = @TOTAL
                WHERE ID_TRANSACAO = @ID_TRANSACAO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@DESCONTOS", I(transaction.Descontos)),
                    new SqlParameter("@PAGAMENTO", transaction.Pagamento),
                    new SqlParameter("@TOTAL", I(transaction.Total)),
                    new SqlParameter("@ID_TRANSACAO", I(transaction.IdTransacao)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void RegistraAtividade(long IdTransacao, string Descricao, string Acao)
        {
            try
            {
                string query = @$"INSERT INTO ECM_HISTORICO_TRANSACOES (ID_TRANSACAO, DESCRICAO, ACAO)
                VALUES (@ID_TRANSACAO, @DESCRICAO, @ACAO)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", I(IdTransacao)),
                    new SqlParameter("@DESCRICAO", I(Descricao)),
                    new SqlParameter("@ACAO", I(Acao)),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<PedidoDTO> SelectAllPedidos()
        {
            try
            {
                string query = @$"SELECT 
	                                ET.ID_TRANSACAO,
	                                (SELECT SUM(QUANTIDADE) FROM ECM_PRO_TRA WHERE ID_TRANSACAO = ET.ID_TRANSACAO) AS QUANTIDADE,
	                                ET.TOTAL,
	                                CONCAT(EC.NOME, ' ', EC.SOBRENOME) AS NOME,
	                                CONCAT(EN.LOGRADOURO, ', ', EN.NUMERO, ' - ', EN.BAIRRO, ', ', EN.CIDADE, ' - ', EN.ESTADO) AS NOME_ENDERECO,
	                                ETP.ETAPA,
	                                ETP.COR,
	                                ET.PAGAMENTO,
	                                ET.CODIGO,
	                                ET.CRIACAO,
                                    ET.REEMBOLSO,
                                    ET.TROCA,
                                    ET.DEVOLUCAO
                                FROM ECM_TRANSACOES ET
	                                INNER JOIN ECM_CLIENTES EC ON EC.ID_CLIENTE = ET.ID_CLIENTE
		                                AND EC.D_E_L_E_T_ <> '*'
	                                INNER JOIN ECM_ETAPAS ETP ON ETP.ID_ETAPA = ET.ID_ETAPA
		                                AND ETP.D_E_L_E_T_ <> '*'
	                                INNER JOIN ECM_ENDERECOS EN ON EN.ID_ENDERECO = ET.ID_ENDERECO
		                                AND EN.D_E_L_E_T_ <> '*'
                                WHERE ET.ID_ETAPA NOT IN (
	                                SELECT ID_ETAPA FROM ECM_ETAPAS 
	                                WHERE ETAPA IN ('TROCA SOLICITADA', 'DEVOLUÇÃO SOLICITADA','ENVIADO PARA TROCA', 'ENVIADO PARA DEVOLUÇÃO')
                                )";

                return DatabaseProgramas().Select<PedidoDTO>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<SolicitationDTO> SelectAllSolicitacaoByGrupoCodigo(int GrupoCodigo, string Tipo)
        {
            try
            {
                string query = @$"SELECT 
	                                * ,
                                (SELECT IMAGEM FROM ECM_IMAGENS EI WHERE EI.NOME = 'COVER' AND EI.ID_PRODUTO = ES.ID_PRODUTO) AS IMAGEM
                                FROM ECM_SOLICITACOES ES
	                                INNER JOIN ECM_ETAPAS EE ON EE.ID_ETAPA = ES.ID_ETAPA
	                                INNER JOIN ECM_PRODUTOS EP ON EP.ID_PRODUTO = ES.ID_PRODUTO
                                WHERE ES.GRUPO_CODIGO = @GRUPO_CODIGO
                                AND ES.TIPO = @TIPO";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@GRUPO_CODIGO", I(GrupoCodigo)),
                    new SqlParameter("@TIPO", I(Tipo)),
                };

                return DatabaseProgramas().Select<SolicitationDTO>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Solicitation> SelectGrupoSolicitacoes(string Codigo, string Tipo)
        {
            try
            {
                string query = @$"SELECT
	                                ES.GRUPO_CODIGO, ES.ID_TRANSACAO,
	                                ET.CODIGO AS CODIGO_TRANSACAO,
	                                DATEADD(dd, 0, DATEDIFF(dd, 0, ET.CRIACAO)) AS CRIACAO,
	                                ES.MOTIVO_SOLICITACAO,
	                                DATEADD(dd, 0, DATEDIFF(dd, 0, ES.DATA_SOLICITACAO)) AS DATA_SOLICITACAO
                                FROM ECM_SOLICITACOES ES
	                                INNER JOIN ECM_TRANSACOES ET ON ET.ID_TRANSACAO = ES.ID_TRANSACAO
		                                AND ET.ID_CLIENTE = (SELECT ID_CLIENTE FROM ECM_CLIENTES WHERE CODIGO = @CODIGO)
                                WHERE
	                                ES.TIPO = @TIPO
                                GROUP BY ES.GRUPO_CODIGO,
	                                ET.CODIGO, ES.ID_TRANSACAO, 
									DATEADD(dd, 0, DATEDIFF(dd, 0, ET.CRIACAO)),
	                                ES.MOTIVO_SOLICITACAO,
	                                DATEADD(dd, 0, DATEDIFF(dd, 0, ES.DATA_SOLICITACAO))
                                ORDER BY ES.GRUPO_CODIGO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CODIGO", I(Codigo)),
                    new SqlParameter("@TIPO", I(Tipo)),
                };

                return DatabaseProgramas().Select<Solicitation>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
