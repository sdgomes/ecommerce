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

        [HttpPost]
        [Route("altera/etapa/pedido")]
        public IActionResult EtapaPedido(long IdTransacao, string Etapa)
        {
            try
            {
                TransactionBLL.Etapa(IdTransacao, Etapa);
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }

        [HttpPost]
        [Route("altera/etapa/solicitacao")]
        public IActionResult EtapaSolicitacao(long IdSolicitacao, string Etapa, string Motivo, string Tipo)
        {
            try
            {
                TransactionBLL.AlteraSolicitacao(IdSolicitacao, Etapa, Motivo, Tipo);
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }
    }
}
