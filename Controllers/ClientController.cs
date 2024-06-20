using crm.BLL;
using crm.Controllers.Attributes;
using crm.DTO;
using crm.Models;
using crm.Models.ModelView;
using crm.Views.Client.Components.AlteraSenha;
using crm.Views.Client.Components.Cartao;
using crm.Views.Client.Components.Endereco;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Controllers
{
    public class ClientController : Controller
    {
        #region Views
        [HttpGet("/cadastro/cliente")]
        public IActionResult Cadastro()
        {
            if (Request.Cookies["codigo"] != null)
            {
                return RedirectToAction("Perfil", new { Codigo = Request.Cookies["codigo"] });
            }

            return View();
        }

        [ClienteExiste]
        [ClienteLogado]
        [HttpGet("/cliente/perfil/{Codigo}")]
        public IActionResult Perfil(string Codigo)
        {
            Client client = new();
            client.Codigo = Codigo;

            return View(client);
        }

        [ClienteExiste]
        [ClienteLogado]
        [HttpGet("/cliente/perfil/{Codigo}/dados/cadastrais")]
        public IActionResult Cliente(string Codigo)
        {
            ClientDTO Model = ClientBLL.SelectClientByCodigo(Codigo);
            return View(Model);
        }

        [ClienteExiste]
        [ClienteLogado]
        [HttpGet("/cliente/perfil/{Codigo}/trocas")]
        public IActionResult Trocas(string Codigo)
        {
            TrocasView Model = ClientBLL.GetSolicitacoes(Codigo, "TROCA");
            return View(Model);
        }

        [ClienteExiste]
        [ClienteLogado]
        [HttpGet("/cliente/perfil/{Codigo}/trocas/{GrupoCodigo}")]
        public IActionResult TrocasItens(string Codigo, int GrupoCodigo)
        {
            TrocasItensView Model = ClientBLL.GetSolicitacoesByGrupoCodigo(Codigo, GrupoCodigo, "TROCA");
            return View(Model);
        }

        [ClienteExiste]
        [ClienteLogado]
        [HttpGet("/cliente/perfil/{Codigo}/pedidos")]
        public IActionResult Pedidos(string Codigo)
        {
            PedidosView Model = TransactionBLL.Pedidos(Codigo);
            return View(Model);
        }

        [ClienteExiste]
        [ClienteLogado]
        [HttpGet("/cliente/perfil/{Codigo}/pedidos/{Pedido}")]
        public IActionResult Pedido(string Codigo, long Pedido)
        {
            try
            {
                TransactionDTO Model = ProductBLL.Transacao(Pedido);

                if (Model.Etapa == "CANCELADO")
                    return RedirectToAction("Pedidos", new { Codigo });

                return View(Model);
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }
        #endregion

        #region Actions
        [HttpPost("/criar/nova/mensagem")]
        public IActionResult NovaMensagem(Notification notificacao)
        {
            try
            {
                return Json(new { data = ClientBLL.NovaMensagem(notificacao) });
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/criar/nova/solicitacao")]
        public IActionResult CriarSolictacao(List<Solicitation> Solicitacao)
        {
            try
            {
                return Json(new { data = ClientBLL.CriarSolictacao(Solicitacao) });
            }
            catch (Exception)
            {
                throw;
            }
        }

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

        [HttpPost("/buscar/cliente/{Codigo}")]
        public IActionResult BuscarCliente(string Codigo)
        {
            try
            {
                return Json(new { Codigo, IsCliente = ClientBLL.IsClientByCodigo(Codigo) });
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

                HttpContext.Response.Cookies.Append("codigo", codigoCliente, new Microsoft.AspNetCore.Http.CookieOptions { IsEssential = true });

                if (newClient.Retorno)
                    return RedirectToAction("Index", "Checkout");

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

        [HttpPost("/componente/client/cartoes")]
        public IActionResult Cartoes(long IdCliente)
        {
            try
            {
                return ViewComponent("Cartoes", new { IdCliente });
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/componente/client/pagar/novamente")]
        public IActionResult PagarNovamente(long IdCliente, long IdTransacao)
        {
            try
            {
                return ViewComponent("PagarNovamente", new { IdCliente, IdTransacao });
            }
            catch (Exception)
            {
                throw;
            }
        }

        [HttpPost("/componente/client/solicitar")]
        public IActionResult PagarNovamente(long IdTransacao)
        {
            try
            {
                return ViewComponent("ProdutoSolicitacao", new { IdTransacao });
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion
    }
}
