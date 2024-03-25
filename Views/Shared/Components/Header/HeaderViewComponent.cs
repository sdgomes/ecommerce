using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Shared.Components.Header
{
    public class HeaderViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            string path = Path.Combine(Directory.GetCurrentDirectory(), "Mock\\categorias.json");
            string json = File.ReadAllText(path);

            var Model = JsonConvert.DeserializeObject<ViewHeader>(json);
            return View(Model);
        }
    }
    public class ViewHeader
    {
        public List<CategoriaDTO> Categorias { get; set; }
        public int Favoritos { get; set; }
        public List<CarrinhoDTO> Carrinho { get; set; }
    }
    public class CarrinhoDTO
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

    public class CategoriaDTO
    {
        public string Categoria { get; set; }
        public List<string> SubCategoria { get; set; }
    }
}