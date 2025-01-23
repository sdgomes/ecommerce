using Ecommerce.DAL;
using Ecommerce.DTO;
using Ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace Ecommerce.Views.Home.Components.TrendingProduct
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