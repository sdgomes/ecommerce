using crm.DAL;
using crm.DTO;
using crm.Models;
using crm.Models.ModelView;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace crm.BLL
{
    public class TransactionBLL
    {
        public static PedidosView Pedidos(string Codigo)
        {
            PedidosView Model = new();
            Model.Cliente = ClientDAO.SearchForClientByCodigo(Codigo);
            Model.Transactions = TransactionDAO.SelectByClient(Model.Cliente.IdCliente);

            return Model;
        }
    }
}
