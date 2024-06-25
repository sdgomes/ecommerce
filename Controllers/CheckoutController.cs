using Ecommerce.BLL;
using Ecommerce.Controllers.Attributes;
using Ecommerce.DTO;
using Ecommerce.Extesions;
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
    public class CheckoutController : Controller
    {
        [ValidaCompra]
        [HttpGet("/finalizar/compra/{Carrinho?}")]
        public IActionResult Index(List<Product> Produtos, string Carrinho)
        {
            var codigo = Request.Cookies["codigo"];
            return View(ClientBLL.ClientCheckoutByCodigo(codigo, Produtos, Carrinho));
        }

        [HttpPost("/registra/transacao")]
        public async Task<IActionResult> RegistraTransacao(TransactionDTO Transaction)
        {
            try
            {
                var Codigo = Request.Cookies["codigo"];

                long IdTransacao = await ProductBLL.RegistraTransacao(Transaction, Codigo);
                return Json(new { Transacoes = Transaction, Url = Url.Action("Pedido", "Client", new { Codigo, Pedido = IdTransacao }) });
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/registra/novo/pagamento/transacao")]
        public IActionResult RegistraNovoPagamento(TransactionDTO Transaction)
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

        [HttpGet("/buscar/desconto/{Codigo}/{Tipo}")]
        public IActionResult BuscarDesconto(string Codigo, string Tipo)
        {
            try
            {
                return Json(new { data = ProductBLL.BuscarDesconto(Codigo, Tipo) });
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}