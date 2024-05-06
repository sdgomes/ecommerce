using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace crm.Views.Home.Components.SpecialOffer
{
    public class SpecialOfferViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Mock\\ofertaespecial.json");
            string json = File.ReadAllText(path);

            var Model = JsonConvert.DeserializeObject<ViewSpecialOffer>(json);
            return View(Model);
        }
    }

    public class ViewSpecialOffer
    {
        public List<ProdutoDTO> Produtos { get; set; }
        public BannerDTO Banner { get; set; }
        public OfertaPrincipalDTO OfertaPrincipal { get; set; }
    }

    public class BannerDTO
    {
        public string Imagem { get; set; } 
        public string Titulo { get; set; }
        public string Texto { get; set; }
        public string PrecoOriginal { get; set; }
        public string Id { get; set; }
    }

    public class OfertaPrincipalDTO
    {
        public string Imagem { get; set; }
        public string Texto { get; set; }
        public string NomeProduto { get; set; }
        public int Nota { get; set; }
        public int Dias { get; set; }
        public string PrecoDesconto { get; set; }
        public string PrecoOriginal { get; set; }
        public string Id { get; set; }
        public int Desconto { get; set; }
        public string Tipo { get; set; }
    }

    public class ProdutoDTO
    {
        public string Imagem { get; set; }
        public string PreInfo { get; set; }
        public string NomeProduto { get; set; }
        public int Nota { get; set; }
        public string PrecoDesconto { get; set; }
        public string PrecoOriginal { get; set; }
        public string Id { get; set; }
        public int Desconto { get; set; }
        public string Tipo { get; set; }
    }




}