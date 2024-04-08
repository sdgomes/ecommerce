using ecommerce.DAL;
using ecommerce.DTO;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Shop.Components.List
{
    [ViewComponent(Name = "List")]
    public class ListViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            ViewList Model = new();
            Model.Products = ProductDAO.SelectAllProducts();

            return View(Model);
        }
    }

    public class ViewList
    {
        public List<ProductDTO> Products { get; set; }
    }
}