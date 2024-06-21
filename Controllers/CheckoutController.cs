﻿using crm.BLL;
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
        [HttpGet("/finalizar/{Rota}/{IdProduto?}/{Quantidade?}")]
        public IActionResult Index(string Rota, long IdProduto, int Quantidade)
        {
            var codigo = Request.Cookies["codigo"];
            if (Rota == "produto")
            {
                if (IdProduto == 0)
                    return RedirectToAction("Index", "Shop");

                return View(ClientBLL.SelectClientByCodigo(codigo, IdProduto, Quantidade));
            }

            return View(ClientBLL.SelectClientByCodigo(codigo, IdProduto, Quantidade));
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