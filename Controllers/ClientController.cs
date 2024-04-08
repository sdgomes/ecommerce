using ecommerce.BLL;
using ecommerce.Controllers.Attributes;
using ecommerce.DTO;
using ecommerce.Models;
using ecommerce.Views.Client.Components.AlteraSenha;
using ecommerce.Views.Client.Components.Cartao;
using ecommerce.Views.Client.Components.Endereco;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Controllers
{
    public class ClientController : Controller
    {
        #region Views
        [HttpGet("/cadastro/cliente")]
        public IActionResult Cadastro()
        {
            return View();
        }

        [ClienteExiste]
        [HttpGet("/cliente/perfil/{Codigo}")]
        public IActionResult Perfil(string Codigo)
        {
            Client client = new();
            client.Codigo = Codigo;

            return View(client);
        }

        [ClienteExiste]
        [HttpGet("/cliente/perfil/{Codigo}/dados/cadastrais")]
        public IActionResult Cliente(string Codigo)
        {
            ClientDTO Model = ClientBLL.SelectClientByCodigo(Codigo);
            return View(Model);
        }
        #endregion

        #region Actions
        [HttpGet("/excluir/minha/conta/{Codigo}")]
        public IActionResult ExcluirConta(string Codigo)
        {
            try
            {
                ClientBLL.ExcluiConta(Codigo);
                return Redirect(Request.Headers["Referer"].ToString());
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/cadastrar/cliente")]
        public IActionResult CadastrarCliente(ClientDTO newClient)
        {
            try
            {
                string codigoCliente = ClientBLL.CreateClient(newClient);
                return RedirectToAction("Cliente", new { Codigo = codigoCliente });
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/cadastrar/novo/cartao")]
        public IActionResult CadastrarNovoCartao(Card card)
        {
            try
            {
                ClientBLL.CreateNewCard(card);
                return Json(new { confirm = true });
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/cadastrar/novo/endereco")]
        public IActionResult CadastrarNovoEndereco(Address address)
        {
            try
            {
                ClientBLL.CreateNewAddress(address);
                return Json(new { confirm = true });
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/alterar/senha/cliente")]
        public IActionResult AlterarSenhaCliente(User client, string senha)
        {
            try
            {
                ClientBLL.AlteraSenhaCliente(client, senha);
                return Ok();
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/alterar/endereco/cliente")]
        public IActionResult AlterarEnderecoCliente(Address address)
        {
            try
            {
                ClientBLL.AlteraEnderecoCliente(address);
                return Ok();
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/alterar/dados/cliente")]
        public IActionResult AlterarDadosCliente(Client client)
        {
            try
            {
                ClientBLL.AlteraDadosCliente(client);
                return Ok();
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/remove/cartao")]
        public IActionResult RemoveCartao(long IdCartao)
        {
            try
            {
                ClientBLL.RemoveCartao(IdCartao);
                return Ok();
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/remove/endereco")]
        public IActionResult RemoveEndereco(long IdEndereco)
        {
            try
            {
                ClientBLL.RemoveEndereco(IdEndereco);
                return Ok();
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        #region Queries 
        [HttpPost("/confirma/senha/cliente")]
        public IActionResult ConfirmaSenhaUsuario(User user)
        {
            try
            {
                return Json(new { confirm = ClientBLL.ConsultaSenhaCliente(user) });
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion

        #region Components
        [HttpPost("/componente/client/altera/cliente")]
        public IActionResult AlteraCliente(long IdCliente)
        {
            try
            {
                return ViewComponent("AlteraCliente", new { IdCliente });
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/componente/client/altera/endereco")]
        public IActionResult AlteraEndereco(long IdEndereco)
        {
            try
            {
                return ViewComponent("AlteraEndereco", new { IdEndereco });
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/componente/client/adiciona/endereco")]
        public IActionResult NovoEndereco(int Index)
        {
            try
            {
                return ViewComponent("Endereco", new ViewEndereco(Index));
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/componente/client/adiciona/cartao")]
        public IActionResult NovoCartao(int Index)
        {
            try
            {
                return ViewComponent("Cartao", new ViewCartao(Index));
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/componente/client/alterasenha")]
        public IActionResult AlteraSenha(long IdUsuario)
        {
            try
            {
                return ViewComponent("AlteraSenha", new ViewAlteraSenha(IdUsuario));
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion
    }
}
