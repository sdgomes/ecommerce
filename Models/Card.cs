using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
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

        [Column("NOME_CARTAO")]
        public string NomeCartao { get; set; }
        
        [Column("PRINCIPAL")]
        public bool Principal { get; set; }

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

        [Column("TOTAL")]
        public double Total { get; set; }

        [Column("PAGAMENTO")]
        public string Pagamento { get; set; }
        
        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }

    }
}