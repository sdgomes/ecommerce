using crm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.DTO
{
    public class ClientDTO
    {
        public bool Retorno { get; set; }

        public int MainCard { get; set; }

        public List<ProductDTO> Products { get; set; }

        public Client Client { get; set; }

        public List<Address> Adresses { get; set; }

        public List<Card> Cards { get; set; }
    }
}
