using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class Delivery
    {
        [Column("ID_ENTREGA")]
        public long IdEntrega { get; set; }

        [Column("ID_TRANSACAO")]
        public long IdTransacao { get; set; }

        [Column("ID_ENDERECO")]
        public long IdEndereco { get; set; }

        [Column("ENTREGUE")]
        public bool Entregue { get; set; }

        [Column("RECEPTIOR")]
        public string Receptior { get; set; }

        [Column("OBSERVACAO")]
        public string Observacao { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }

    }
}