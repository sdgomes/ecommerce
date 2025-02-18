﻿using Ecommerce.BLL;
using Ecommerce.Controllers.Attributes;
using Ecommerce.DTO;
using Ecommerce.Models;
using Ecommerce.Models.ModelView;
using Ecommerce.Views.Client.Components.AlteraSenha;
using Ecommerce.Views.Client.Components.Cartao;
using Ecommerce.Views.Client.Components.Endereco;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Controllers
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
            Client client = ClientBLL.SelectPerfilByCodigo(Codigo);
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
        [HttpGet("/cliente/perfil/{Codigo}/cupons")]
        public IActionResult Cupons(string Codigo)
        {
            List<Discount> Model = ClientBLL.BuscaDescontos(Codigo);
            return View(Model);
        }

        [ClienteExiste]
        [ClienteLogado]
        [HttpGet("/cliente/perfil/{Codigo}/{Tipo}")]
        public IActionResult Solicitacoes(string Codigo, string Tipo)
        {
            SolicitacoesView Model = ClientBLL.GetSolicitacoes(Codigo, Tipo == "trocas" ? "TROCA" : "DEVOLUÇÃO");
            return View((Tipo == "trocas" ? "Trocas" : "Devolucoes"), Model);
        }

        [ClienteExiste]
        [ClienteLogado]
        [HttpGet("/cliente/perfil/{Codigo}/{Tipo}/{GrupoCodigo}")]
        public IActionResult SolicitacoesItens(string Codigo, string Tipo, int GrupoCodigo)
        {
            SolicitacoesItensView Model = ClientBLL.GetSolicitacoesByGrupoCodigo(Codigo, GrupoCodigo, Tipo == "trocas" ? "TROCA" : "DEVOLUÇÃO");
            return View((Tipo == "trocas" ? "TrocasItens" : "DevolucoesItens"), Model);
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

        [HttpGet("/inativar/minha/conta/{Codigo}")]
        public IActionResult InativarConta(string Codigo)
        {
            try
            {
                ClientBLL.InativarConta(Codigo);
                return Json(new { success = true });
            }
            catch (Exception ex)
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
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpPost("/buscar/cliente")]
        public IActionResult BuscarCliente(string Email, string Password)
        {
            try
            {
                return Json(new { data = ClientBLL.IsClientByLogin(Email, Password) });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }

        [HttpPost("/cadastrar/cliente")]
        public IActionResult CadastrarCliente(ClientDTO newClient)
        {
            try
            {
                string codigoCliente = ClientBLL.CreateClient(newClient);
                var QueryString = HttpContext.Request.QueryString;

                if (codigoCliente == "")
                {
                    return RedirectToAction("Cadastro", new { message = "Cliente já cadastrado no sistema!", Produtos = QueryString });
                }

                HttpContext.Response.Cookies.Append("codigo", codigoCliente, new Microsoft.AspNetCore.Http.CookieOptions { IsEssential = true });

                if (newClient.Retorno)
                {
                    var Url = $"/finalizar/compra/carrinho{QueryString}";
                    return Redirect(Url);
                }

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
                return Json(new { confirm = true, cartao = ClientBLL.CreateNewCard(card) });
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
                return Json(new { confirm = true, address = ClientBLL.CreateNewAddress(address) });
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

        [HttpPost("/componente/client/lista/endereco")]
        public IActionResult ListaEnderecos(List<Address> Enderecos)
        {
            try
            {
                return ViewComponent("EnderecoCompra", Enderecos);
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
