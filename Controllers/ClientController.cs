using ecommerce.BLL;
using ecommerce.DTO;
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

        [HttpGet("/cliente/cadastrado/{Codigo}")]
        public IActionResult Cliente(string Codigo)
        {
            ClientDTO Model = ClientBLL.SelectClientByCodigo(Codigo);
            return View(Model);
        }

        [HttpPost("/cadastrar/usuario")]
        public IActionResult Cadastrar(ClientDTO newClient)
        {
            try
            {
                string codigoCliente = ClientBLL.CreateClient(newClient);
                return RedirectToAction("Cliente", new { Codigo = codigoCliente });
            }
            catch (Exception)
            {
                throw;
                //return RedirectToAction("Cadastro");
            }

        }
    }
}
