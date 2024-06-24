using crm.BLL;
using crm.Models;
using crm.Models.ModelView;
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
            var codigo = Request.Cookies["codigo"];

            CartView Model = ClientBLL.RetornaCarrinho(codigo);
            return View(Model);
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
        [HttpPost("/carrinho/retorna/imagem")]
        public IActionResult RetornaImagem(long IdProduto)
        {
            try
            {
                return Json(new { Imagem = ClientBLL.Imagem(IdProduto) });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }

        [HttpPost("/carrinho/adiciona/item")]
        public IActionResult AdicionaQuantidadeItem(long IdProduto, string Codigo, int Quantidade)
        {
            try
            {
                return Json(new { Quantidade = ClientBLL.AdicionaQuantidadeItem(IdProduto, Codigo, Quantidade) });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }

        [HttpPost("/carrinho/altera/quantidade/item")]
        public IActionResult AlteraQuantidadeItem(long IdProduto, string Codigo, int Quantidade)
        {
            try
            {
                ClientBLL.AlteraQuantidadeItem(IdProduto, Codigo, Quantidade);
                return Json(new { seuccess = true });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }

        [HttpPost("/carrinho/remove/item")]
        public IActionResult RemoveItem(long IdProduto, string Codigo)
        {
            try
            {
                return Json(new { Quantidade = ClientBLL.RemoveItemCarrinho(IdProduto, Codigo) });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }
            
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
