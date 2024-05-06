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
    public class ShopController : Controller
    {
        [HttpGet("produtos/{Categoria?}/{Subcategoria?}")]
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Route("Retorna/Produtos/{Tipo}")]
        public IActionResult TipoProdutos(string Tipo)
        {
            try
            {
                return ViewComponent(Tipo);
            }
            catch (Exception ex)
            {
                return Json(new { Response = "", Message = ex.Message });
            }
        }
    }
}
