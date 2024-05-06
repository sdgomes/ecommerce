using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class Assessment
    {
        [Column("ID_AVALIACAO")]
        public long IdAvaliacao { get; set; }

        [Column("ID_PRODUTO")]
        public long IdProduto { get; set; }

        [Column("ID_CLIENTE")]
        public long IdCliente { get; set; }

        [Column("NOTA")]
        public int Nota { get; set; }

        [Column("MENSAGEM")]
        public string Mensagem { get; set; }

        [Column("NOME")]
        public string Nome { get; set; }

        [Column("EMAIL")]
        public string Email { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }
    }
}