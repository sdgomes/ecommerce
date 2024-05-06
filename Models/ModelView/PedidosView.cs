using crm.DAL;
using crm.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models.ModelView
{
    public class PedidosView
    {
        public Client Cliente { get; set; }

        public List<TransactionDTO> Transactions { get; set; }

        public List<Transaction> GetProdutos(DateTime Data, long IdCliente)
        {
            List<Transaction> Items = new();
            List<Transaction> transactions = TransactionDAO.SelectByCodigoData(Data, IdCliente);

            foreach (var i in transactions)
            {
                List<Transaction> transacoes = TransactionDAO.SelectByIdTransaction(i.IdTransacao, i.Etapa, i.Tipo);
                foreach (var x in transacoes)
                {
                    Items.Add(x);
                }
            }

            return Items;
        }
    }
}
