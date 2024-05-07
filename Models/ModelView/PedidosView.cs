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

        public List<TransactionDTO> GetProdutos(DateTime Data, long IdCliente)
        {
            List<TransactionDTO> Items = new();
            List<TransactionDTO> transactions = TransactionDAO.SelectByCodigoData(Data, IdCliente);

            foreach (var i in transactions)
            {
                List<TransactionDTO> transacoes = TransactionDAO.SelectByIdTransaction(i.IdTransacao, i.Etapa, i.Tipo);
                foreach (var x in transacoes)
                {
                    Items.Add(x);
                }
            }

            return Items;
        }
    }
}
