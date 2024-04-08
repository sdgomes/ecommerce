using ecommerce.DAL;
using ecommerce.DTO;
using ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.ShopSingle.Components.KeepShopping
{
    public class KeepShoppingViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            ViewKeepShopping Model = new();
            Model.Products = ProductDAO.SelectAllTrendingProducts();

            return View(Model);
        }
    }

    public class ViewKeepShopping
    {
        public List<ProductDTO> Products { get; set; }
    }
}