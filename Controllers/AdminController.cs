using crm.BLL;
using crm.Controllers.Attributes;
using crm.DTO;
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
    public class AdminController : Controller
    {
        #region Views
        [FuncionarioExiste]
        [HttpGet("/admin/perfil/{Codigo}")]
        public IActionResult Index(string Codigo)
        {
            AdminDTO Model = AdminBLL.Perfil(Codigo);
            return View(Model);
        }

        [FuncionarioExiste]
        [HttpGet("/admin/perfil/{Codigo}/pedidos")]
        public IActionResult Pedidos(string Codigo)
        {
            List<PedidoDTO> Model = AdminBLL.ExibiPedidosParaGestao();
            return View(Model);
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
