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
    public class FavoritesController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        #region Components
        [HttpPost("/componente/favorites")]
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
