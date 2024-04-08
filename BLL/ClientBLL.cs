using ecommerce.DAL;
using ecommerce.DTO;
using ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Crypt = BCrypt.Net.BCrypt;

namespace ecommerce.BLL
{
    public class ClientBLL
    {
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

        public static ClientDTO SelectClientByCodigo(string Codigo)
        {
            ClientDTO Model = new();
            Model.Client = ClientDAO.SearchForClientByCodigo(Codigo);
            Model.Adresses = AddressDAO.SelectAllAddressByClient(Model.Client.IdCliente);
            Model.Cards = CardDAO.SelectClientCard(Model.Client.IdCliente);
            return Model;
        }

        public static Client SelectClientById(long IdCliente)
        {
            return ClientDAO.SearchForClientById(IdCliente);
        }

        public static string CreateClient(ClientDTO newClient)
        {
            long idCliente = ClientDAO.CreateClient(newClient.Client);
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

        public static void CreateNewCard(Card card)
        {
            CardDAO.CreateCard(card.IdCliente, card);
        }

        public static void CreateNewAddress(Address address)
        {
            if (address.Principal)
                AddressDAO.LimpaPrincipal(address.IdCliente);

            if (address.Cobranca)
                AddressDAO.LimpaCobranca(address.IdCliente);

            AddressDAO.CreateAddress(address.IdCliente, address);
        }
    }
}
