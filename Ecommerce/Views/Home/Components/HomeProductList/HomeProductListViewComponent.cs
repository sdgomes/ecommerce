using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace Ecommerce.Views.Home.Components.HomeProductList
{
    public class HomeProductListViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Mock\\homeproductlist.json");
            string json = File.ReadAllText(path);

            var Model = JsonConvert.DeserializeObject<List<ViewHomeProductList>>(json);
            return View(Model);
        }
    }

    public class ViewHomeProductList
    {
        public string Titulo { get; set; }
        public List<ProdutoDTO> Produtos { get; set; }
    }

    public class ProdutoDTO
    {
        public string Imagem { get; set; }
        public string NomeProduto { get; set; }
        public string PrecoOriginal { get; set; }
        public int IdProduto { get; set; }
        public string Subcategoria { get; set; }
        public string TipoProduto { get; set; }
        public string Tipo { get; set; }
    }

}