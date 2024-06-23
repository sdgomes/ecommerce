using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class Discount
    {
        [Column("ID_DESCONTO")]
        public long IdDesconto { get; set; }

        [Column("ID_SOLICITACAO")]
        public long IdSolicitacao { get; set; }

        [Column("ID_CLIENTE")]
        public long IdCliente { get; set; }

        [Column("CODIGO")]
        public string Codigo { get; set; }

        [Column("DESCONTO")]
        public double Desconto { get; set; }

        [Column("RESGATADO")]
        public bool Resgatado { get; set; }

        [Column("TIPO")]
        public string Tipo { get; set; }

        [Column("ATIVO")]
        public bool Ativo { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }
    }
}
