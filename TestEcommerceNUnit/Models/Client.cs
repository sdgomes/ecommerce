using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestEcommerceNUnit.Models
{
    public class Client
    {
        public long IdCliente { get; set; }

        public string Codigo { get; set; }

        public string Nome { get; set; }

        public string Sobrenome { get; set; }

        public string CPF { get; set; }

        public DateTime DataNascimento { get; set; }

        public string RG { get; set; }

        public string Telefone { get; set; }

        public string Celular { get; set; }

        public bool Situacao { get; set; }

        public string Genero { get; set; }

        public long IdUsuario { get; set; }

        public string Email { get; set; }

        public string Senha { get; set; }

        public string Tipo { get; set; }

        public DateTime Criacao { get; set; }
    }
}
