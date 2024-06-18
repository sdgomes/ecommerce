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

        public static void CancelaPedido(long IdTransacao, string Descricao, string Acao)
        {
            TransactionDAO.CancelaPedio(IdTransacao);
            TransactionDAO.RegistraAtividade(IdTransacao, Descricao, Acao);
        }

        public static void Etapa(long IdTransacao, string Etapa)
        {
            TransactionDAO.AlteraEtapaPedido(IdTransacao, Etapa);

            switch (Etapa)
            {
                case "PAGAMENTO APROVADO":
                    TransactionDAO.RegistraAtividade(IdTransacao, "A venda foi aprovada por um funcionário.", "APROVA VENDA");
                    break;

                case "PAGAMENTO RECUSADO":
                    TransactionDAO.RegistraAtividade(IdTransacao, "A venda foi reprovada por um funcionário.", "APROVA RECUSADA");
                    break;
            }
        }
    }
}
