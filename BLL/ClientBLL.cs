using Ecommerce.DAL;
using Ecommerce.DTO;
using Ecommerce.Models;
using Ecommerce.Models.ModelView;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Crypt = BCrypt.Net.BCrypt;

namespace Ecommerce.BLL
{
    public class ClientBLL
    {
        public static string Imagem(long IdProduto)
        {
            try
            {
                Product Produto = ProductDAO.RetornaImagem(IdProduto);
                return "data:image/webp;base64," + Convert.ToBase64String(Produto.Imagem);
            }
            catch (Exception)
            {
                return "data:image/webp;base64,";
            }
        }

        public static FavoritesView RetornaFavoritos(string codigo)
        {
            FavoritesView Model = new();
            if (codigo == null)
                Model.Produtos = new();
            else
                Model.Produtos = ClientDAO.SelectFavoritosByClient(codigo);

            return Model;
        }

        public static int AdicionaFavoritoItem(long IdProduto, string Codigo)
        {
            return ClientDAO.FavoritosAdicionaItem(Codigo, IdProduto);
        }

        public static int AdicionaQuantidadeItem(long IdProduto, string Codigo, int Quantidade)
        {
            return ClientDAO.CarrinhoAdicionaItem(Codigo, IdProduto, Quantidade);
        }

        public static void AlteraQuantidadeItem(long IdProduto, string Codigo, int Quantidade)
        {
            ClientDAO.CarrinhoAlteraQuantidade(Codigo, IdProduto, Quantidade);
        }

        public static int RemoveItemFavoritos(long IdProduto, string Codigo)
        {
            return ClientDAO.FavoritoDeletaItem(Codigo, IdProduto);
        }

        public static int RemoveItemCarrinho(long IdProduto, string Codigo)
        {
            return ClientDAO.CarrinhoDeletaItem(Codigo, IdProduto);
        }

        public static CartView RetornaCarrinho(string codigo)
        {
            CartView Model = new();
            if (codigo == null)
                Model.Produtos = new();
            else
                Model.Produtos = ClientDAO.SelectCarrinhoByClient(codigo);

            return Model;
        }

        public static long NovaMensagem(Notification notification)
        {
            return NotificationDAO.CreateChat(notification);
        }

        public static SolicitacoesItensView GetSolicitacoesByGrupoCodigo(string Codigo, int GrupoCodigo, string Tipo)
        {
            SolicitacoesItensView Model = new();
            Model.Codigo = GrupoCodigo;
            Model.Cliente = ClientDAO.SearchForClientByCodigo(Codigo);
            Model.Solicitacoes = TransactionDAO.SelectAllSolicitacaoByGrupoCodigo(GrupoCodigo, Tipo);
            Model.Mensagens = NotificationDAO.SelectAllChatByGrupoCodigo(GrupoCodigo);

            return Model;
        }

        public static SolicitacoesView GetSolicitacoes(string Codigo, string Tipo)
        {
            SolicitacoesView Model = new();
            Model.Codigo = Codigo;
            Model.Solicitacoes = TransactionDAO.SelectGrupoSolicitacoes(Codigo, Tipo);
            return Model;
        }

        public static dynamic CriarSolictacao(List<Solicitation> solicitacoes)
        {
            bool sucesso = true;
            string message = "Todas as solicitações foram feitas, por favor aguarde andamento da loja.";

            Random randNum = new Random();
            string GrupoCodigo = randNum.Next(10000, 99999).ToString();

            foreach (var solicitacao in solicitacoes)
            {
                solicitacao.GrupoCodigo = GrupoCodigo;
                var IdSolicitacao = ClientDAO.CreateSolicitacao(solicitacao);

                if (IdSolicitacao == 0)
                {
                    sucesso = false;
                    message = "Atenção! Uma de suas solicitações não foi registrada, por favor entre em contato com o suporte da loja.";
                }
            }
            return new { sucesso, message };
        }

        public static void RemoveEndereco(long IdEndereco)
        {
            AddressDAO.RemoveAddress(IdEndereco);
        }

        public static void RemoveCartao(long IdCartao)
        {
            CardDAO.RemoveCard(IdCartao);
        }

        public static void ExcluiConta(string Codigo)
        {
            ClientDAO.DeleteClientByCodigo(Codigo);
        }

        public static void InativarConta(string Codigo)
        {
            ClientDAO.UpdateClientSituacao(Codigo, false);
        }

        public static void AlteraDadosCliente(Client client)
        {
            ClientDAO.UpdateClient(client.IdCliente, client);
        }

        public static void AlteraEnderecoCliente(Address address)
        {
            if (address.Principal)
                AddressDAO.LimpaPrincipal(address.IdCliente);

            if (address.Cobranca)
                AddressDAO.LimpaCobranca(address.IdCliente);

            AddressDAO.UpdateAddress(address.IdEndereco, address);
        }

        public static void AlteraSenhaCliente(User user, string senha)
        {
            UserDAO.UpdateUserPassword(user.IdUsuario, senha);
        }

        public static bool ConsultaSenhaCliente(User user)
        {
            User clientUser = UserDAO.SearchForUserById(user.IdUsuario);
            return Crypt.Verify(user.Senha, clientUser.Senha);
        }

        public static List<Discount> BuscaDescontos(string Codigo)
        {
            return ClientDAO.SelectDiscountByClient(Codigo);
        }

        public static ClientDTO SelectClientByCodigo(string Codigo)
        {
            ClientDTO Model = new();

            Model.Client = ClientDAO.SearchForClientByCodigo(Codigo);
            Model.Adresses = AddressDAO.SelectAllAddressByClient(Model.Client.IdCliente);
            Model.Cards = CardDAO.SelectClientCard(Model.Client.IdCliente);
            return Model;
        }

        public static CheckoutView ClientCheckoutByCodigo(string Codigo, List<Product> Produtos, string Carrinho)
        {
            CheckoutView Model = new();

            Model.Carrinho = Carrinho != null;

            var IdsProdutos = String.Join(", ", Produtos.Select(x => x.IdProduto.ToString()).ToArray());
            if (IdsProdutos != "")
            {
                Model.Produtos = ProductDAO.SelectProductsByInId(IdsProdutos);
                foreach (var Item in Model.Produtos)
                {
                    Product Produto = Produtos.Where(x => x.IdProduto == Item.IdProduto).FirstOrDefault();
                    Item.QntCompra = Produto.QntCompra;
                }
            }

            Model.Cliente = ClientDAO.SearchForClientByCodigo(Codigo);
            Model.Enderecos = AddressDAO.SelectAllAddressByClient(Model.Cliente.IdCliente);

            return Model;
        }

        public static dynamic IsClientByLogin(string Email, string Password)
        {
            Client cliente = ClientDAO.SearchClientByLoginSenha(Email);

            if (cliente == null)
            {
                throw new ArgumentException("Email ou senha incorretos, tente novamente!");
            }

            if (!Crypt.Verify(Password, cliente.Senha))
            {
                throw new ArgumentException("Email ou senha incorretos, tente novamente!");
            }

            return new { codigo = cliente.Codigo };
        }

        public static Client SelectClientById(long IdCliente)
        {
            return ClientDAO.SearchForClientById(IdCliente);
        }

        public static Client SelectPerfilByCodigo(string Codigo)
        {
            return ClientDAO.SearchForClientByCodigo(Codigo);
        }

        public static string CreateClient(ClientDTO newClient)
        {
            try
            {
                long idCliente = ClientDAO.CreateClient(newClient.Client);

                if (idCliente == 0)
                    return "";

                Client client = SelectClientById(idCliente);

                foreach (var address in newClient.Adresses)
                {
                    AddressDAO.CreateAddress(idCliente, address);
                }

                foreach (var (card, index) in newClient.Cards.Select((card, index) => (card, index)))
                {
                    if (index == newClient.MainCard)
                        card.Principal = true;

                    CardDAO.CreateCard(idCliente, card);
                }

                return client.Codigo;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Card CreateNewCard(Card card)
        {
            long IdCartao = CardDAO.CreateCard(card.IdCliente, card);
            return CardDAO.SearchCardById(IdCartao);
        }

        public static Address CreateNewAddress(Address address)
        {
            if (address.Principal)
                AddressDAO.LimpaPrincipal(address.IdCliente);

            if (address.Cobranca)
                AddressDAO.LimpaCobranca(address.IdCliente);

            long IdEndereco = AddressDAO.CreateAddress(address.IdCliente, address);
            return AddressDAO.SearchAddressByIdEndereco(IdEndereco);
        }
    }
}
