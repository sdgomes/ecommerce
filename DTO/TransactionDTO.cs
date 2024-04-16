using ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DTO
{
    public class TransactionDTO : Transaction
    {
        public List<ProductDTO> Produtos { get; set; }

        public List<Card> Cartoes { get; set; }
    }
}
