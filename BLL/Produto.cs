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
        public static ProdutoView RetornaProduto(string Id)
        {
            string json = File.ReadAllText(@"C:\ecommerce\data\produtoindividual.json");
            List<ProdutoView> Produtos = JsonConvert.DeserializeObject<List<ProdutoView>>(json);

            return Produtos.Where((Item) => Item.Id == Id).FirstOrDefault();
        }
    }
}
