using ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DTO
{
    public class TransactionDTO
    {
        public List<ProductDTO> Produtos { get; set; }

        public List<Card> Cartoes { get; set; }

        public long IdEndereco { get; set; }

        public long IdCliente { get; set; }

        public double Subtotal { get; set; }

        public double Frete { get; set; }

        public double Descontos { get; set; }

        public double Total { get; set; }
    }
}
