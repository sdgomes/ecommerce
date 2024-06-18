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
