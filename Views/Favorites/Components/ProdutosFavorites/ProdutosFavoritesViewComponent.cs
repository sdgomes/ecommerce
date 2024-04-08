using ecommerce.DAL;
using ecommerce.DTO;
using ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace ecommerce.Views.Favorites.Components.ProdutosFavorites
{
    [ViewComponent(Name = "ProdutosFavorites")]
    public class ProdutosFavoritesViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(List<Product> Produtos)
        {
            var IdsProdutos = String.Join(", ", Produtos.Select(x => x.IdProduto.ToString()).ToArray());

            ViewProdutosFavorites Model = new();
            if (IdsProdutos != "")
                Model.Products = ProductDAO.SelectProductsByInId(IdsProdutos);

            return View(Model);
        }
    }

    public class ViewProdutosFavorites
    {
        public List<ProductDTO> Products { get; set; }
    }
}