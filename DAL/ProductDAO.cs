using ecommerce.DTO;
using ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DAL
{
    public class ProductDAO : BaseDAO
    {
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
    }
}
