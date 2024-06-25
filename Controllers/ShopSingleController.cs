using Ecommerce.BLL;
using Ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Controllers
{
    public class ShopSingleController : Controller
    {
        [HttpGet("produtos/{Categoria}/{Subcategoria}/detalhes/{IdProduto}")]
        public IActionResult Index(long IdProduto)
        {
            var Model = ProductBLL.RetornaProduto(IdProduto);
            return View(Model);
        }
    }
}
