using ecommerce.BLL;
using ecommerce.Models;
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

        [HttpGet("/cadastro/usuario")]
        public IActionResult Cadastro()
        {
            return View();
        }

        [HttpPost("/cadastrar/usuario")]
        public IActionResult Cadastrar(Client client)
        {
            var t = client;
            return RedirectToAction("Cadastro");
        }
    }
}
