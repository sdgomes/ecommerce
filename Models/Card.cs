using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Card
    {
        [Column("ID_CARTAO")]
        public long IdCartao { get; set; }

        [Column("ID_CLIENTE")]
        public long IdCliente { get; set; }

        [Column("ID_BANDEIRA")]
        public long IdBandeira { get; set; }

        [Column("NOME_TITULAR")]
        public string NomeTitular { get; set; }

        [Column("TIPO")]
        public string Tipo { get; set; }

        [Column("CPF_TITULAR")]
        public string CPFTitular { get; set; }

        [Column("NUMERO")]
        public string Numero { get; set; }

        [Column("DATA_VALIDADE")]
        public string DataValidade { get; set; }

        [Column("CODIGO_SEGURANCA")]
        public string CodigoSeguranca { get; set; }

        [Column("NOME")]
        public string NomeBandeira { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }

    }
}