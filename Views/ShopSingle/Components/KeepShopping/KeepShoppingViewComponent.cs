using crm.DAL;
using crm.DTO;
using crm.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace crm.Views.ShopSingle.Components.KeepShopping
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