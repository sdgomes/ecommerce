using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestEcommerceNUnit.Models
{
    public class Card
    {
        public long IdCartao { get; set; }

        public long IdCliente { get; set; }

        public long IdBandeira { get; set; }

        public string NomeTitular { get; set; }

        public string Cor { get; set; }

        public byte[] Imagem { get; set; }

        public string NomeCartao { get; set; }

        public bool Principal { get; set; }

        public string CPFTitular { get; set; }

        public string Numero { get; set; }

        public string DataValidade { get; set; }

        public string CodigoSeguranca { get; set; }

        public string NomeBandeira { get; set; }

        public double Total { get; set; }

        public string Pagamento { get; set; }

        public DateTime Criacao { get; set; }

    }
}
