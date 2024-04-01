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
    public class AdminController : Controller
    {
        #region Views
        [HttpGet("/admin/perfil/{Codigo}")]
        public IActionResult Index(string Codigo)
        {
            Employee employee = new();
            employee.Codigo = Codigo;

            return View(employee);
        }

        [HttpGet("/admin/perfil/{Codigo}/registro/clientes")]
        public IActionResult RegistroCliente()
        {
            List<Client> Client = AdminBLL.SelectAllClients();
            return View(Client);
        }

        #endregion
    }
}
