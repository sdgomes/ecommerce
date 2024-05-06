using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class Client : User
    {
        [Column("ID_CLIENTE")]
        public long IdCliente { get; set; }

        [Column("CODIGO")]
        public string Codigo { get; set; }

        [Column("NOME")]
        public string Nome { get; set; }

        [Column("SOBRENOME")]
        public string Sobrenome { get; set; }

        [Column("CPF")]
        public string CPF { get; set; }

        [Column("DATA_NASCIMENTO")]
        public DateTime DataNascimento { get; set; }

        [Column("RG")]
        public string RG { get; set; }

        [Column("TELEFONE")]
        public string Telefone { get; set; }

        [Column("CELULAR")]
        public string Celular { get; set; }

        [Column("SITUACAO")]
        public bool Situacao { get; set; }

        [Column("GENERO")]
        public string Genero { get; set; }
    }

}