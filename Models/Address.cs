using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Models
{
    public class Address
    {
        [Column("ID_ENDERECO")]
        public long IdEndereco { get; set; }

        [Column("ID_CLIENTE")]
        public long IdCliente { get; set; }

        [Column("CEP")]
        public string CEP { get; set; }

        [Column("TIPO_LOGRADOURO")]
        public string TipoLogradouro { get; set; }

        [Column("TIPO_ENDERECO")]
        public string TipoEndereco { get; set; }

        [Column("TIPO_RESIDENCIA")]
        public string TipoResidencia { get; set; }

        [Column("LOGRADOURO")]
        public string Logradouro { get; set; }

        [Column("BAIRRO")]
        public string Bairro { get; set; }

        [Column("CIDADE")]
        public string Cidade { get; set; }

        [Column("ESTADO")]
        public string Estado { get; set; }

        [Column("NOME_ENDERECO")]
        public string NomeEndereco { get; set; }

        [Column("FRASE")]
        public string Frase { get; set; }

        [Column("PRINCIPAL")]
        public bool Principal { get; set; }

        [Column("COBRANCA")]
        public bool Cobranca { get; set; }

        [Column("COMPLEMENTO")]
        public string Complemento { get; set; }

        [Column("NUMERO")]
        public string Numero { get; set; }

        [Column("PAIS")]
        public string Pais { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }

    }
}