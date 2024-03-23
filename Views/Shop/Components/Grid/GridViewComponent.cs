using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Home.Components.Grid
{
    [ViewComponent(Name = "Grid")]
    public class GridViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            string json = File.ReadAllText(@"C:\ecommerce\data\produtos.json");
            var Model = JsonConvert.DeserializeObject<List<ViewGrid>>(json);
            return View(Model);
        }
    }

    public class ViewGrid
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