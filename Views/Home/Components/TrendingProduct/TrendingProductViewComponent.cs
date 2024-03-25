using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Home.Components.TrendingProduct
{
    public class TrendingProductViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Mock\\emalta.json");
            string json = File.ReadAllText(path);

            var Model = JsonConvert.DeserializeObject<List<ViewTrendingProduct>>(json);
            return View(Model);
        }
    }

    public class ViewTrendingProduct
    {
        public string Imagem { get; set; }
        public string PreInfo { get; set; }
        public string NomeProduto { get; set; }
        public int Nota { get; set; }
        public string PrecoOriginal { get; set; }
        public string PrecoDesconto { get; set; }
        public string Id { get; set; }
        public int Desconto { get; set; }
        public string Tipo { get; set; }
    }
}