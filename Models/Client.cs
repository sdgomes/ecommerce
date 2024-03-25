using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Client
    {
        [Column("ID_CLIENTE")]
        public long IdCliente { get; set; }

        [Column("NOME")]
        public string Nome { get; set; }

        [Column("SOBRENOME")]
        public string Sobrenome { get; set; }

        [Column("CPF")]
        public string CPF { get; set; }

        [Column("DATA_NASCIMENTO")]
        public DateTime DataNascimento { get; set; }

        [Column("EMAIL")]
        public string Email { get; set; }

        [Column("RG")]
        public string RG { get; set; }

        [Column("SITUACAO")]
        public bool Situacao { get; set; }

        [Column("GENERO")]
        public string Genero { get; set; }

        [Column("DATA_CRIACAO")]
        public DateTime DataCriacao { get; set; }

        [Column("DATA_EDICAO")]
        public DateTime? DataEdicao { get; set; }
    }
}