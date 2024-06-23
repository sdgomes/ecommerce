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
    public class CartController : Controller
    {
        [HttpGet("/carrinho")]
        public IActionResult Index()
        {
            return View(Produtos);
        }

        #region Actions

        [HttpGet("/calcular/frete/{CEP}")]
        public async Task<IActionResult> CalcularFrete(string CEP)
        {
            try
            {
                return Json(new { response = await ProductBLL.CalcularFrete(CEP) });
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        #region Components

        [HttpPost("/componente/carrinho")]
        public IActionResult Carrinho(List<Product> Produtos)
        {
            try
            {
                return ViewComponent("ProdutosCart", new { Produtos });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }
     
        #endregion
    }
}
