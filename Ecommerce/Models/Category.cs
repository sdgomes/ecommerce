using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Models
{
    public class Category
    {
        [Column("ID_CATEGORIA")]
        public long IdCategoria { get; set; }

        [Column("ID_CATEGORIA_PAI")]
        public long IdCategoriaPai { get; set; }

        [Column("SUBCATEGORIA")]
        public bool Subcategoria { get; set; }

        [Column("NOME")]
        public string Nome { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }

    }
}