using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Models
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

        [Column("CODIGO")]
        public int Codigo { get; set; }

        [Column("FRETE")]
        public double Frete { get; set; }

        [Column("DESCONTOS")]
        public double Descontos { get; set; }

        [Column("REEMBOLSO")]
        public bool Reembolso { get; set; }

        [Column("TROCA")]
        public bool Troca { get; set; }

        [Column("DEVOLUCAO")]
        public bool Devolucao { get; set; }

        [Column("TOTAL")]
        public double Total { get; set; }

        [Column("IMAGEM")]
        public byte[] Imagem { get; set; }

        [Column("NOME_IMAGEM")]
        public string NomeImagem { get; set; }

        [Column("DATA_COMPRA")]
        public DateTime DataCompra { get; set; }

        [Column("ULTIMA_ALTERACAO")]
        public DateTime UltimaAlteracao { get; set; }

        [Column("ENTREGA")]
        public DateTime? Entrega { get; set; }

        [Column("QNT_CARTOES")]
        public int QntCartoes { get; set; }
    }
}