using crm.BLL;
using crm.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Controllers
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
