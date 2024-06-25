using Ecommerce.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Models.ModelView
{
    public class CheckoutView
    {
        public bool Carrinho { get; set; }
        
        public List<ProductDTO> Produtos { get; set; }

        public Client Cliente { get; set; }

        public List<Address> Enderecos { get; set; }

        public double Subtotal()
        {
            return Produtos.Sum(x => x.QntCompra * x.Preco);
        }

        public double Descontos()
        {
            return Produtos.Where(x => x.Desconto).Sum(x => ((x.QntCompra * x.Preco) - (x.QntCompra * x.CalculoDesconto)));
        }

        public double Total()
        {
            return Subtotal() - Descontos();
        }
    }
}
