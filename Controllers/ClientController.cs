using ecommerce.BLL;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Controllers
{
    public class ClientController : Controller
    {
        [HttpGet("/usuario/{Document}")]
        public IActionResult Index(string Document)
        {
            return View();
        }
    }
}
