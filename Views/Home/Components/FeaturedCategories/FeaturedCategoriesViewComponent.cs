using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Home.Components.FeaturedCategories
{
    public class FeaturedCategoriesViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            string json = File.ReadAllText(@"C:\ecommerce\data\destaque.json");
            var Model = JsonConvert.DeserializeObject<List<ViewFeaturedCategories>>(json);  
            return View(Model);
        }
    }

    public class ViewFeaturedCategories
    {
        public string Categoria { get; set; }
        public string Image { get; set; }
        public List<string> SubCategoria { get; set; }
    }
}