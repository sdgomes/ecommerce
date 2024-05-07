using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class Transaction : Stage
    {
        [Column("ID_TRANSACAO")]
        public long IdTransacao { get; set; }

        [Column("ID_PRODUTO")]
        public long IdProduto { get; set; }

        [Column("QUANTIDADE")]
        public int Quantidade { get; set; }

        [Column("NOME")]
        public string Nome { get; set; }

        [Column("DESCRICAO")]
        public string Descricao { get; set; }

        [Column("TIPO")]
        public string Tipo { get; set; }

        [Column("PAGAMENTO")]
        public string Pagamento { get; set; }

        [Column("SUBTOTAL")]
        public double Subtotal { get; set; }

        [Column("FRETE")]
        public double Frete { get; set; }

        [Column("DESCONTOS")]
        public double Descontos { get; set; }

        [Column("TOTAL")]
        public double Total { get; set; }

        [Column("IMAGEM")]
        public byte[] Imagem { get; set; }

        [Column("NOME_IMAGEM")]
        public string NomeImagem { get; set; }

    }
}