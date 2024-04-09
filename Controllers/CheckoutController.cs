using ecommerce.BLL;
using ecommerce.DTO;
using ecommerce.Extesions;
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
    public class CheckoutController : Controller
    {
        [HttpGet("/finalizar")]
        public IActionResult Index(string Codigo)
        {
            if (Codigo == null)
                return RedirectToAction("Cadastro", "Client");

            if (ClientBLL.IsClientByCodigo(Codigo))
                return View(ClientBLL.SelectClientByCodigo(Codigo));

            return RedirectToAction("Cadastro", "Client", new { error = "Cliente não encontrado. Faça seu registro!".ToBase64Encode() });
        }

        [HttpPost("/registra/transacao")]
        public IActionResult RegistraTransacao(TransactionDTO Transaction, string Codigo)
        {
            try
            {
                ProductBLL.RegistraTransacao(Transaction);
                return Json(new { Url = Url.Action("Pedido", "Client", new { Codigo, Pedido = 152 }) });
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpGet("/buscar/desconto/{Codigo}")]
        public IActionResult BuscarDesconto(string Codigo)
        {
            try
            {
                return Json(new { response = ProductBLL.BuscarDesconto(Codigo) });
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
