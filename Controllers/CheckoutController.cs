using crm.BLL;
using crm.Controllers.Attributes;
using crm.DTO;
using crm.Extesions;
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
    public class CheckoutController : Controller
    {
        [ValidaCompra]
        [HttpGet("/finalizar/compra")]
        public IActionResult Index(List<Product> Produtos)
        {
            var codigo = Request.Cookies["codigo"];
            return View(ClientBLL.ClientCheckoutByCodigo(codigo, Produtos));
        }

        [HttpPost("/registra/transacao")]
        public IActionResult RegistraTransacao(TransactionDTO Transaction, string Codigo)
        {
            try
            {
                long IdTransacao = ProductBLL.RegistraTransacao(Transaction);
                return Json(new { Transacoes = Transaction, Url = Url.Action("Pedido", "Client", new { Codigo, Pedido = IdTransacao }) });
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/registra/novo/pagamento/transacao")]
        public IActionResult RegistraTransacao(TransactionDTO Transaction)
        {
            try
            {
                ProductBLL.NovoPagamento(Transaction);
                return Json(new { success = true });
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