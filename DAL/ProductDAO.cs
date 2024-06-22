using crm.DTO;
using crm.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace crm.DAL
{
    public class ProductDAO : BaseDAO
    {
        public static List<ProductDTO> ImagensCapaPedido(long IdTransacao)
        {
            try
            {
                string query = @$"SELECT TOP 4
	                                EI.IMAGEM
                                FROM ECM_IMAGENS EI
                                INNER JOIN ECM_PRO_TRA EPT ON EPT.ID_PRODUTO = EI.ID_PRODUTO
	                                AND EPT.ID_TRANSACAO = @ID_TRANSACAO
                                WHERE EI.NOME = 'COVER';";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", IdTransacao)
                };

                return DatabaseProgramas().Select<ProductDTO>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void RegistraResgateDesconto(string Codigo)
        {
            try
            {
                string query = @$"UPDATE ECM_DESCONTOS SET RESGATADO = 1 WHERE CODIGO = @CODIGO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CODIGO", Codigo)
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static double ResgataCodigo(string Codigo)
        {
            try
            {
                string query = @$"SELECT 
	                                ES.PRECO
                                FROM ECM_DESCONTOS EC
	                                INNER JOIN ECM_SOLICITACOES ES ON ES.ID_DESCONTO = EC.ID_DESCONTO
                                WHERE 
	                                EC.CODIGO = @CODIGO AND 
	                                EC.RESGATADO = 0 AND 
	                                EC.D_E_L_E_T_ <> '*';";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CODIGO", Codigo)
                };

                return DatabaseProgramas().ChoosePrimitiveType<double>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static int SearchDiscountByCodigo(string Codigo)
        {
            try
            {
                string query = @$"SELECT DESCONTO FROM ECM_DESCONTOS WHERE TIPO = 'CUPONS' AND CODIGO = @CODIGO AND RESGATADO = 0 AND ATIVO = 1 AND D_E_L_E_T_ <> '*';";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@CODIGO", Codigo)
                };

                return DatabaseProgramas().ChoosePrimitiveType<int>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<ImageDTO> SelectImagesFromProduct(long IdProduto)
        {
            try
            {
                string query = $@"SELECT NOME AS NOME_IMAGEM, IMAGEM FROM ECM_IMAGENS WHERE ID_PRODUTO = @ID_PRODUTO AND D_E_L_E_T_ <> '*';";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_PRODUTO", IdProduto)
                };

                return DatabaseProgramas().Select<ImageDTO>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<ProductDTO> SelectProductsByInId(string IdsProdutos)
        {
            try
            {
                string query = $@"SELECT
									(SELECT AVG(NOTA) FROM ECM_AVALIACOES AVA WHERE AVA.ID_PRODUTO = PRO.ID_PRODUTO) AS NOTA,
									(SELECT COUNT(1) FROM ECM_AVALIACOES AVA WHERE AVA.ID_PRODUTO = PRO.ID_PRODUTO) AS QNT_AVALIACOES,
									(SELECT		
										IMA.IMAGEM FROM ECM_IMAGENS IMA 
										WHERE IMA.ID_PRODUTO = PRO.ID_PRODUTO
										AND IMA.NOME = 'COVER') AS IMAGEM,
									PRO.ID_PRODUTO, PRO.CODIGO, PRO.NOME, PRO.PRECO,
									PRO.TIPO, PRO.DESCRICAO, PRO.DESCONTO, PRO.NOVO,
									PRO.PRE_VENDA, PRO.ANO, PRO.ARTISTA, PRO.QNT_DESCONTO,
									EST.SALDO, EST.COR, EST.TAMANHO, 
									EST.MARCA, EST.GRAVADORA, EST.PESO,
									PRE.TIPO AS TIPO_PRODUTO, SUBCATEGORIA
								FROM ECM_PRODUTOS PRO
									INNER JOIN ECM_STATUS STA ON STA.ID_PRODUTO = PRO.ID_PRODUTO
										AND GETDATE() <= STA.DATA_VALIDADE
										AND STA.ATIVO = 1
										AND STA.D_E_L_E_T_ <> '*'
									INNER JOIN ECM_PRECIFICACOES PRE ON PRE.ID_PRECIFICACAO = PRO.ID_PRECIFICACAO
										AND PRE.D_E_L_E_T_ <> '*'
									INNER JOIN ECM_ESTOQUES EST ON EST.ID_PRODUTO = PRO.ID_PRODUTO
										AND EST.SALDO > 0
										AND EST.D_E_L_E_T_ <> '*'
								WHERE PRO.D_E_L_E_T_ <> '*' AND PRO.ID_PRODUTO IN ({IdsProdutos})";

                return DatabaseProgramas().Select<ProductDTO>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static ProductDTO SearchProductById(long IdProduto)
        {
            try
            {
                string query = $@"SELECT
									(SELECT AVG(NOTA) FROM ECM_AVALIACOES AVA WHERE AVA.ID_PRODUTO = PRO.ID_PRODUTO) AS NOTA,
									(SELECT COUNT(1) FROM ECM_AVALIACOES AVA WHERE AVA.ID_PRODUTO = PRO.ID_PRODUTO) AS QNT_AVALIACOES,								
									PRO.ID_PRODUTO, PRO.CODIGO, PRO.NOME, PRO.PRECO,
									PRO.TIPO, PRO.DESCRICAO, PRO.DESCONTO, PRO.NOVO,
									PRO.PRE_VENDA, PRO.ANO, PRO.ARTISTA, PRO.QNT_DESCONTO,
									EST.SALDO, EST.COR, EST.TAMANHO, 
									EST.MARCA, EST.GRAVADORA, EST.PESO,
									PRE.TIPO AS TIPO_PRODUTO, SUBCATEGORIA
								FROM ECM_PRODUTOS PRO
									INNER JOIN ECM_STATUS STA ON STA.ID_PRODUTO = PRO.ID_PRODUTO
										AND GETDATE() <= STA.DATA_VALIDADE
										AND STA.ATIVO = 1
										AND STA.D_E_L_E_T_ <> '*'
									INNER JOIN ECM_PRECIFICACOES PRE ON PRE.ID_PRECIFICACAO = PRO.ID_PRECIFICACAO
										AND PRE.D_E_L_E_T_ <> '*'
									INNER JOIN ECM_ESTOQUES EST ON EST.ID_PRODUTO = PRO.ID_PRODUTO
										AND EST.SALDO > 0
										AND EST.D_E_L_E_T_ <> '*'
								WHERE PRO.D_E_L_E_T_ <> '*' AND PRO.ID_PRODUTO = @ID_PRODUTO";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_PRODUTO", IdProduto)
                };

                return DatabaseProgramas().Choose<ProductDTO>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<ProductDTO> SelectAllProductsTransactionsSolicitacao(long IdTransacao)
        {
            try
            {
                string query = $@"SELECT * FROM
                                (      
                                    SELECT 
									EPT.QUANTIDADE AS QNT_COMPRA,
									EPT.ID_PRODUTO_TRANSACAO,
									EP.CODIGO,
									EP.NOME,
									EP.PRECO,
									EI.IMAGEM,
									EP.QNT_DESCONTO,
                                    EP.ID_PRODUTO,
									EP.DESCONTO
								FROM ECM_PRO_TRA EPT
									INNER JOIN ECM_PRODUTOS EP ON EP.ID_PRODUTO = EPT.ID_PRODUTO
									INNER JOIN ECM_IMAGENS EI ON EI.ID_PRODUTO = EPT.ID_PRODUTO
										AND EI.NOME = 'COVER'
								WHERE
									ID_TRANSACAO = @ID_TRANSACAO
                            ) TAB
                            CROSS APPLY dbo.RepetirRegistros(TAB.QNT_COMPRA)";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", IdTransacao)
                };

                return DatabaseProgramas().Select<ProductDTO>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<ProductDTO> SelectAllProductsTransactions(long IdTransacao)
        {
            try
            {
                string query = $@"SELECT 
									EPT.QUANTIDADE AS QNT_COMPRA,
									EPT.ID_PRODUTO_TRANSACAO,
									EP.CODIGO,
									EP.NOME,
									EP.PRECO,
									EI.IMAGEM,
									EP.QNT_DESCONTO,
									EP.DESCONTO
								FROM ECM_PRO_TRA EPT
									INNER JOIN ECM_PRODUTOS EP ON EP.ID_PRODUTO = EPT.ID_PRODUTO
									INNER JOIN ECM_IMAGENS EI ON EI.ID_PRODUTO = EPT.ID_PRODUTO
										AND EI.NOME = 'COVER'
								WHERE
									ID_TRANSACAO = @ID_TRANSACAO";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_TRANSACAO", IdTransacao)
                };

                return DatabaseProgramas().Select<ProductDTO>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<ProductDTO> SelectAllProducts()
        {
            try
            {
                string query = $@"SELECT
									(SELECT AVG(NOTA) FROM ECM_AVALIACOES AVA WHERE AVA.ID_PRODUTO = PRO.ID_PRODUTO) AS NOTA,
									(SELECT COUNT(1) FROM ECM_AVALIACOES AVA WHERE AVA.ID_PRODUTO = PRO.ID_PRODUTO) AS QNT_AVALIACOES,
									(SELECT		
										IMA.IMAGEM FROM ECM_IMAGENS IMA 
										WHERE IMA.ID_PRODUTO = PRO.ID_PRODUTO
										AND IMA.NOME = 'COVER') AS IMAGEM,
									PRO.ID_PRODUTO, PRO.CODIGO, PRO.NOME, PRO.PRECO,
									PRO.TIPO, PRO.DESCRICAO, PRO.DESCONTO, PRO.NOVO,
									PRO.PRE_VENDA, PRO.ANO, PRO.ARTISTA, PRO.QNT_DESCONTO,
									EST.SALDO, EST.COR, EST.TAMANHO, 
									EST.MARCA, EST.GRAVADORA, EST.PESO,
									PRE.TIPO AS TIPO_PRODUTO, SUBCATEGORIA
								FROM ECM_PRODUTOS PRO
									INNER JOIN ECM_STATUS STA ON STA.ID_PRODUTO = PRO.ID_PRODUTO
										AND GETDATE() <= STA.DATA_VALIDADE
										AND STA.ATIVO = 1
										AND STA.D_E_L_E_T_ <> '*'
									INNER JOIN ECM_PRECIFICACOES PRE ON PRE.ID_PRECIFICACAO = PRO.ID_PRECIFICACAO
										AND PRE.D_E_L_E_T_ <> '*'
									INNER JOIN ECM_ESTOQUES EST ON EST.ID_PRODUTO = PRO.ID_PRODUTO
										AND EST.SALDO > 0
										AND EST.D_E_L_E_T_ <> '*'
								WHERE PRO.D_E_L_E_T_ <> '*'
								ORDER BY NEWID();";

                return DatabaseProgramas().Select<ProductDTO>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<ProductDTO> SelectAllTrendingProducts()
        {
            try
            {
                string query = $@"SELECT TOP 8
									(SELECT AVG(NOTA) FROM ECM_AVALIACOES AVA WHERE AVA.ID_PRODUTO = PRO.ID_PRODUTO) AS NOTA,
									(SELECT COUNT(1) FROM ECM_AVALIACOES AVA WHERE AVA.ID_PRODUTO = PRO.ID_PRODUTO) AS QNT_AVALIACOES,
									(SELECT		
										IMA.IMAGEM FROM ECM_IMAGENS IMA 
										WHERE IMA.ID_PRODUTO = PRO.ID_PRODUTO
										AND IMA.NOME = 'COVER') AS IMAGEM,
									PRO.ID_PRODUTO, PRO.CODIGO, PRO.NOME, PRO.PRECO,
									PRO.TIPO, PRO.DESCRICAO, PRO.DESCONTO, PRO.NOVO,
									PRO.PRE_VENDA, PRO.ANO, PRO.ARTISTA, PRO.QNT_DESCONTO,
									EST.SALDO, EST.COR, EST.TAMANHO, 
									EST.MARCA, EST.GRAVADORA, EST.PESO,
									PRE.TIPO AS TIPO_PRODUTO, SUBCATEGORIA
								FROM ECM_PRODUTOS PRO
									INNER JOIN ECM_STATUS STA ON STA.ID_PRODUTO = PRO.ID_PRODUTO
										AND GETDATE() <= STA.DATA_VALIDADE
										AND STA.ATIVO = 1
										AND STA.D_E_L_E_T_ <> '*'
									INNER JOIN ECM_PRECIFICACOES PRE ON PRE.ID_PRECIFICACAO = PRO.ID_PRECIFICACAO
										AND PRE.D_E_L_E_T_ <> '*'
									INNER JOIN ECM_ESTOQUES EST ON EST.ID_PRODUTO = PRO.ID_PRODUTO
										AND EST.SALDO > 0
										AND EST.D_E_L_E_T_ <> '*'
								WHERE PRO.D_E_L_E_T_ <> '*'
								ORDER BY NEWID();";

                return DatabaseProgramas().Select<ProductDTO>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static int QuantidadeProcessandoPagamento()
        {
            try
            {
                string query = $@"SELECT 
									COUNT(1) AS QUANTIDADE
								FROM
									ECM_TRANSACOES 
								WHERE ID_ETAPA = 
									(SELECT ID_ETAPA FROM 
										ECM_ETAPAS WHERE ETAPA = 'PROCESSANDO PAGAMENTO')
									AND D_E_L_E_T_ <> '*'";

                return DatabaseProgramas().ChoosePrimitiveType<int>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
