using crm.DAL;
using crm.DTO;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace crm.Views.Shop.Components.Grid
{
    [ViewComponent(Name = "Grid")]
    public class GridViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            ViewGrid Model = new();
            Model.Products = ProductDAO.SelectAllProducts();

            return View(Model);
        }
    }

    public class ViewGrid
    {
        public List<ProductDTO> Products { get; set; }
    }
}