using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Models
{
    public class Pricing : Stock
    {
        [Column("ID_PRECIFICACAO")]
        public long IdPrecificacao { get; set; }

        [Column("TIPO_PRECIFICACAO")]
        public string TipoPrecificacao { get; set; }

        [Column("SUBCATEGORIA")]
        public string Subcategoria { get; set; }

        [Column("PRECO_MINIMO")]
        public double PrecoMinimo { get; set; }

        [Column("PRECO_MAXIMO")]
        public double PrecoMaximo { get; set; }
    }
}