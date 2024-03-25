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
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Mock\\destaque.json");
            string json = File.ReadAllText(path);

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