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
    public class ShopSingleController : Controller
    {
        public IActionResult Index(string Id)
        {
            var Model = Produto.RetornaProduto(Id);
            return View(Model);
        }
    }
}
