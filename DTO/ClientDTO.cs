using ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DTO
{
    public class ClientDTO
    {
        public Client client {get; set;}
        public List<Address> address {get; set;}
        public List<Card> card {get; set;}
    }
}
