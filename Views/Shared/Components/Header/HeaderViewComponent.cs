using crm.DAL;
using crm.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace crm.Views.Shared.Components.Header
{
    public class HeaderViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            ViewHeader Model = new();

            if (Request.Cookies["codigo"] != null)
            {
                var codigo = Request.Cookies["codigo"];
                Model.Cliente = ClientDAO.SearchForClientByCodigo(codigo);
            }

            return View(Model);
        }
    }

    public class ViewHeader
    {
        public Models.Client Cliente { get; set; }

        public List<CategoriaDTO> Categorias { get; set; }

        public int Favoritos { get; set; }

        public List<CarrinhoDTO> Carrinho { get; set; }

        public ViewHeader()
        {
            List<Category> categories = CategoriaDAO.SelectAllCategories();
            var FatherCategories = categories.Where((category) => category.Subcategoria == false);
            var NodeCategories = categories.Where((category) => category.Subcategoria == true);

            Categorias = new List<CategoriaDTO>();

            foreach (var Item in FatherCategories)
            {
                var SubCategorias = NodeCategories.Where((category) => category.IdCategoriaPai == Item.IdCategoria);

                Categorias.Add(new CategoriaDTO()
                {
                    Categoria = Item,
                    SubCategoria = SubCategorias.ToList()
                });
            }
        }

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
        public Category Categoria { get; set; }

        public List<Category> SubCategoria { get; set; }
    }
}