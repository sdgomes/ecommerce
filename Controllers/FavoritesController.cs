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
    public class FavoritesController : Controller
    {
        [HttpGet("/favoritos")]
        public IActionResult Index()
        {
            var codigo = Request.Cookies["codigo"];
            FavoritesView Model = ClientBLL.RetornaFavoritos(codigo);
            return View(Model);
        }

        [HttpPost("/favoritos/adiciona/item")]
        public IActionResult AdicionaFavoritoItem(long IdProduto, string Codigo)
        {
            try
            {
                return Json(new { Quantidade = ClientBLL.AdicionaFavoritoItem(IdProduto, Codigo) });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }

    [HttpPost("/favoritos/retorna/imagem")]
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


        [HttpPost("/favoritos/remove/item")]
        public IActionResult RemoveItem(long IdProduto, string Codigo)
        {
            try
            {
                return Json(new { Quantidade = ClientBLL.RemoveItemFavoritos(IdProduto, Codigo) });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }

        #region Components

        [HttpPost("/componente/favoritos")]
        public IActionResult Favoritos(List<Product> Produtos)
        {
            try
            {
                return ViewComponent("ProdutosFavorites", new { Produtos });
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion
    }
}
