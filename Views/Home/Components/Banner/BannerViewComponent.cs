using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Home.Components.Banner
{
    public class BannerViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            string json = File.ReadAllText(@"C:\ecommerce\data\middlebanner.json");
            var Model = JsonConvert.DeserializeObject<List<ViewBanner>>(json);

            return View(Model);
        }
    }

    public class ViewBanner
    {
        public string Id { get; set; }
        public string NomeProduto { get; set; }
        public string Texto { get; set; }
        public string Imagem { get; set; }
    }

}