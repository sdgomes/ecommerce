using Ecommerce.DAL;
using Ecommerce.DTO;
using Ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace Ecommerce.Views.ShopSingle.Components.KeepShopping
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