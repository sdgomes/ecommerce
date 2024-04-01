using ecommerce.DAL;
using ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.BLL
{
    public class AdminBLL
    {
        public static void SituacaoCliente(string Situacao, string Codigo)
        {
            if (Situacao == "inativar" || Situacao == "ativar")
                ClientDAO.UpdateClientSituacao(Codigo, (Situacao == "inativar" ? false : true));
        }

        public static List<Client> SelectAllClients()
        {
            return ClientDAO.SelectAllClients();
        }
    }
}
