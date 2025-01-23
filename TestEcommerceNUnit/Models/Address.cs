using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestEcommerceNUnit.Models
{
    public class Address
    {
        public long IdEndereco { get; set; }

        public long IdCliente { get; set; }

        public string CEP { get; set; }

        public string TipoLogradouro { get; set; }

        public string TipoEndereco { get; set; }

        public string TipoResidencia { get; set; }

        public string Logradouro { get; set; }

        public string Bairro { get; set; }

        public string Cidade { get; set; }

        public string Estado { get; set; }

        public string NomeEndereco { get; set; }

        public string Frase { get; set; }

        public bool Principal { get; set; }

        public bool Cobranca { get; set; }

        public string Complemento { get; set; }

        public string Numero { get; set; }

        public string Pais { get; set; }

        public DateTime Criacao { get; set; }
    }
}
