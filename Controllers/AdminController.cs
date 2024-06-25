using Ecommerce.BLL;
using Ecommerce.Controllers.Attributes;
using Ecommerce.DTO;
using Ecommerce.Models;
using Ecommerce.Models.ModelView;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Controllers
{
    public class AdminController : Controller
    {
        #region Views

        [FuncionarioLogado]
        [FuncionarioExiste]
        [HttpGet("/admin/perfil/{Codigo}")]
        public IActionResult Index(string Codigo)
        {
            AdminDTO Model = AdminBLL.Perfil(Codigo);
            return View(Model);
        }

        [FuncionarioLogado]
        [FuncionarioExiste]
        [HttpGet("/admin/perfil/{Codigo}/relatorio")]
        public IActionResult RelatorioVendas(string Codigo)
        {
            return View();
        }

        [FuncionarioLogado]
        [FuncionarioExiste]
        [HttpGet("/admin/perfil/{Codigo}/pedidos")]
        public IActionResult Pedidos(string Codigo)
        {
            List<PedidoDTO> Model = AdminBLL.ExibiPedidosParaGestao();
            return View(Model);
        }

        [FuncionarioLogado]
        [FuncionarioExiste]
        [HttpGet("/admin/perfil/{Codigo}/{Tipo}")]
        public IActionResult Solicitacoes(string Codigo, string Tipo)
        {
            SolicitacoesView Model = AdminBLL.GetSolicitacoes(Codigo, Tipo == "trocas" ? "TROCA" : "DEVOLUÇÃO");
            return View((Tipo == "trocas" ? "Trocas" : "Devolucoes"), Model);
        }

        [FuncionarioLogado]
        [FuncionarioExiste]
        [HttpGet("/admin/perfil/{Codigo}/{Tipo}/{GrupoCodigo}")]
        public IActionResult SolicitacoesItens(string Codigo, string Tipo, int GrupoCodigo)
        {
            SolicitacoesItensView Model = AdminBLL.GetSolicitacoesByGrupoCodigo(Codigo, GrupoCodigo, Tipo == "trocas" ? "TROCA" : "DEVOLUÇÃO");
            return View((Tipo == "trocas" ? "TrocasItens" : "DevolucoesItens"), Model);
        }

        [FuncionarioLogado]
        [FuncionarioExiste]
        [HttpGet("/admin/perfil/{Codigo}/registro/clientes")]
        public IActionResult RegistroCliente(string Codigo)
        {
            List<Client> Client = AdminBLL.SelectAllClients();
            return View(Client);
        }
        #endregion

        #region Actions

        [HttpGet("/admin/perfil/cliente/resetar/{Codigo}")]
        public IActionResult ResetarSenha(string Codigo)
        {
            try
            {
                AdminBLL.ResetarSenhaCliente(Codigo);
                return Redirect(Request.Headers["Referer"].ToString());
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpGet("/admin/perfil/{Situacao}/{Codigo}/cliente")]
        public IActionResult SatatusCliente(string Situacao, string Codigo)
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

        [HttpPost("/buscar/funcionario/{Codigo}")]
        public IActionResult BuscarFuncionario(string Codigo)
        {
            try
            {
                return Json(new { Codigo, IsFuncionario = AdminBLL.IsFuncionarioByCodigo(Codigo) });
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

    }
}
