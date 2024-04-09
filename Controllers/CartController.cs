using ecommerce.BLL;
using ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Controllers
{
    public class CartController : Controller
    {
        public IActionResult Index()
        {
            return View();
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
            catch (Exception)
            {
                throw;
            }
        }
        #endregion
    }
}
