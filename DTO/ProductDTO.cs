﻿using Ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.DTO
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
                try
                {
                    return "data:image/webp;base64," + Convert.ToBase64String(Imagem);
                }
                catch (Exception)
                {
                    return "data:image/webp;base64,";
                }

            }
        }
    }
}
