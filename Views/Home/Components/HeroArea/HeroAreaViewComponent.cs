using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace Ecommerce.Views.Home.Components.HeroArea
{
    public class HeroAreaViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Mock\\herobanner.json");
            string json = File.ReadAllText(path);

            var Model = JsonConvert.DeserializeObject<ViewHeroArea>(json);
            return View(Model);
        }
    }

    public class ViewHeroArea
    {
        public AnuncioDTO Anuncio { get; set; }

        public List<SliderDTO> Slider { get; set; }

        public OfertaDTO Oferta { get; set; }
    }

    public class AnuncioDTO
    {
        public string Titulo { get; set; }

        public string Texto { get; set; }
    }

    public class OfertaDTO
    {
        public string PreTitulo { get; set; }

        public string Titulo { get; set; }

        public string Preco { get; set; }

        public string Imagem { get; set; }
    }

    public class SliderDTO
    {
        public string PreTitulo { get; set; }

        public string Titulo { get; set; }

        public string SubTitulo { get; set; }

        public List<string> InformativoPreco { get; set; }

        public string Imagem { get; set; }

        public int IdProduto { get; set; }

        public string Subcategoria { get; set; }

        public string TipoProduto { get; set; }
    }
}