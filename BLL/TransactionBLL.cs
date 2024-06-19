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

        public static void Etapa(long IdTransacao, string Etapa)
        {
            TransactionDAO.AlteraEtapaPedido(IdTransacao, Etapa);

            switch (Etapa)
            {
                case "A CAMINHO":
                    TransactionDAO.RegistraAtividade(IdTransacao, "O pedido foi marcado como enviado! Ação feita por um funcionário.", "ENVIADO");
                    break;

                case "CANCELADO":
                    TransactionDAO.RegistraAtividade(IdTransacao, "O pedido foi cancelado.", "CANCELADO");
                    break;

                case "EM PREPARAÇÃO":
                    TransactionDAO.RegistraAtividade(IdTransacao, "O pedido foi colocado em preparação! Ação feita por um funcionário.", "PREPARACAO");
                    break;

                case "ENTREGUE":
                    TransactionDAO.RegistraAtividade(IdTransacao, "O pedido foi entregue pelos correios.", "ENTREGUE");
                    break;

                case "COMPRA APROVADA":
                    TransactionDAO.RegistraAtividade(IdTransacao, "A venda foi aprovada! Ação feita por um funcionário.", "APROVADO ");
                    break;

                case "COMPRA RECUSADA":
                    TransactionDAO.RegistraAtividade(IdTransacao, "A venda foi reprovada! Ação feita por um funcionário.", "RECUSADO");
                    break;
            }
        }
    }
}
