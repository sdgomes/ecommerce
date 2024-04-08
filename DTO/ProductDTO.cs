using ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DTO
{
    public class ProductDTO : Product
    {
        public double CalculoDesconto
        {
            get
            {
                var ValorDesconto = (Preco / 100) * QntDesconto;
                return Preco - ValorDesconto;
            }
        }

        public string ImageSource
        {
            get
            {
                return "data:image/webp;base64," + Convert.ToBase64String(Imagem);
            }
        }
    }
}
