using ecommerce.DAL;
using ecommerce.Models.ModelView;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.BLL
{
    public class Produto
    {
        public static ProdutoView RetornaProduto(long IdProduto)
        {
            ProdutoView Model = new();
            Model.Produto = ProductDAO.SearchProductById(IdProduto);
            Model.Imagens = ProductDAO.SelectImagesFromProduct(IdProduto);

            return Model;
        }
    }
}
