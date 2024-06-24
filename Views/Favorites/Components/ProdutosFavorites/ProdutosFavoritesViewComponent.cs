using crm.DAL;
using crm.DTO;
using crm.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace crm.Views.Favorites.Components.ProdutosFavorites
{
    [ViewComponent(Name = "ProdutosFavorites")]
    public class ProdutosFavoritesViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(List<Product> Produtos)
        {
            try
            {
                var IdsProdutos = String.Join(", ", Produtos.Select(x => x.IdProduto.ToString()).ToArray());

                ViewProdutosFavorites Model = new();
                if (IdsProdutos != "")
                    Model.Produtos = ProductDAO.SelectProductsByInId(IdsProdutos);

                return View(Model);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }

    public class ViewProdutosFavorites
    {
        public List<ProductDTO> Produtos { get; set; }
    }
}