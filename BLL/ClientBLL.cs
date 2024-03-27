using ecommerce.DAL;
using ecommerce.DTO;
using ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.BLL
{
    public class ClientBLL
    {
        public static ClientDTO SelectClientByCodigo(string Codigo)
        {
            ClientDTO Model = new();
            Model.client = ClientDAO.SearchForClientByCodigo(Codigo);
            Model.address = AddressDAO.SelectAllAddressByClient(Model.client.IdCliente);
            Model.card = CardDAO.SelectClientCard(Model.client.IdCliente);
            return Model;
        }
        public static Client SelectClientById(long IdCliente)
        {
            return ClientDAO.SearchForClientById(IdCliente);
        }

        public static string CreateClient(ClientDTO newClient)
        {
            long idCliente = ClientDAO.CreateClient(newClient.client);
            Client client = SelectClientById(idCliente);

            foreach (var address in newClient.address)
            {
                AddressDAO.CreateAddress(idCliente, address);
            }

            foreach (var card in newClient.card)
            {
                CardDAO.CreateCard(idCliente, card);
            }

            return client.Codigo;
        }
    }
}
