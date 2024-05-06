using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class Cart
    {
        [Column("ID_CARRINHO")]
        public long IdCarrinho { get; set; }

        [Column("ID_CLIENTE")]
        public long IdCliente { get; set; }

        [Column("ID_PRODUTO")]
        public long IdProduto { get; set; }

        [Column("EXPIRA")]
        public bool Expira { get; set; }

        [Column("REMOVIDO")]
        public bool Removido { get; set; }

        [Column("DATA_EXPIRACAO")]
        public DateTime DataExpiracao { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }

    }
}