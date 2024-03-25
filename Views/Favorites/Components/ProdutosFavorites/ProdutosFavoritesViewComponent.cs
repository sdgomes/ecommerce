using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Favorites.Components.ProdutosFavorites
{
    public class ProdutosFavoritesViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Mock\\favoritos.json");
            string json = File.ReadAllText(path);

            var Model = JsonConvert.DeserializeObject<List<ViewProdutosFavorites>>(json);
            return View(Model);
        }
    }

    public class ViewProdutosFavorites
    {
        public string Imagem { get; set; }
        public string Cor { get; set; }
        public string DescricaoProduto { get; set; }
        public string PrecoOriginal { get; set; }
        public string Id { get; set; }
    }
}