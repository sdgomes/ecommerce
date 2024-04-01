using ecommerce.BLL;
using ecommerce.Controllers.Attributes;
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
        [FuncionarioExiste]
        [HttpGet("/admin/perfil/{Codigo}")]
        public IActionResult Index(string Codigo)
        {
            Employee employee = new();
            employee.Codigo = Codigo;

            return View(employee);
        }

        [FuncionarioExiste]
        [HttpGet("/admin/perfil/{Codigo}/registro/clientes")]
        public IActionResult RegistroCliente(string Codigo)
        {
            List<Client> Client = AdminBLL.SelectAllClients();
            return View(Client);
        }
        #endregion

        #region Actions
        [HttpGet("/admin/perfil/{Situacao}/{Codigo}/cliente")]
        public IActionResult CadastrarCliente(string Situacao, string Codigo)
        {
            try
            {
                AdminBLL.SituacaoCliente(Situacao, Codigo);
                return Redirect(Request.Headers["Referer"].ToString());
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

    }
}
