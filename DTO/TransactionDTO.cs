using crm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.DTO
{
    public class TransactionDTO : Transaction
    {
        public Client Cliente { get; set; }

        public List<ProductDTO> Produtos { get; set; }

        public List<Card> Cartoes { get; set; }

        public string CodCupons { get; set; }

        public string CodDesconto { get; set; }

        public bool LimpaCarrinho { get; set; }
    }
}
