using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Cart.Components.ProdutosCart
{
    public class ProdutosCartViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            string json = File.ReadAllText(@"C:\ecommerce\data\carrinho.json");
            var Model = JsonConvert.DeserializeObject<List<ViewProdutosCart>>(json);
            return View(Model);
        }
    }

    public class ViewProdutosCart
    {
        public string Imagem { get; set; }
        public string Cor { get; set; }
        public string DescricaoProduto { get; set; }
        public int Quantidade { get; set; }
        public object PrecoDesconto { get; set; }
        public string PrecoOriginal { get; set; }
        public string Id { get; set; }
        public int CupomDesconto { get; set; }
    }
}