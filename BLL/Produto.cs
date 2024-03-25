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
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Mock\\produtoindividual.json");
            string json = File.ReadAllText(path);

            List<ProdutoView> Produtos = JsonConvert.DeserializeObject<List<ProdutoView>>(json);

            return Produtos.Where((Item) => Item.Id == Id).FirstOrDefault();
        }
    }
}
