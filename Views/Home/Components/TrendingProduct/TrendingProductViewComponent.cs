using ecommerce.DAL;
using ecommerce.DTO;
using ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Home.Components.TrendingProduct
{
    public class TrendingProductViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            ViewTrendingProduct Model = new();
            Model.Products = ProductDAO.SelectAllTrendingProducts();

            return View(Model);
        }
    }

    public class ViewTrendingProduct
    {
        public List<ProductDTO> Products { get; set; }
    }
}