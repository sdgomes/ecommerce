using ecommerce.DAL;
using ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace ecommerce.Views.Home.Components.FeaturedCategories
{
    public class FeaturedCategoriesViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            var Model = new ViewFeaturedCategories();
            return View(Model);
        }
    }

    public class ViewFeaturedCategories
    {
        public List<CategoriaDTO> Categorias { get; set; }

        public ViewFeaturedCategories()
        {
            List<Category> categories = CategoriaDAO.SelectAllCategories();
            var FatherCategories = categories.Where((category) => category.Subcategoria == false);
            var NodeCategories = categories.Where((category) => category.Subcategoria == true);

            List<CategoriaDTO> CategoriasDestaque = new();

            foreach (var Item in FatherCategories)
            {
                var SubCategorias = NodeCategories.Where((category) => category.IdCategoriaPai == Item.IdCategoria);

                CategoriasDestaque.Add(new CategoriaDTO()
                {
                    Categoria = Item,
                    SubCategoria = SubCategorias.ToList()
                });
            }

            Categorias = CategoriasDestaque.Where((category) => category.SubCategoria.Count > 0).ToList();
        }
    }

    public class CategoriaDTO
    {
        public Category Categoria { get; set; }

        public List<Category> SubCategoria { get; set; }
    }
}