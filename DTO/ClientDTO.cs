using ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DTO
{
    public class ClientDTO
    {
        public int MainCard { get; set; }
        public Client Client {get; set;}
        public List<Address> Adresses { get; set;}
        public List<Card> Cards { get; set;}
    }
}
