using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Models
{
    public class Image
    {
        [Column("ID_IMAGEM")]
        public long IdImagem { get; set; }

        [Column("IMAGEM")]
        public byte[] Imagem { get; set; }

        [Column("NOME_IMAGEM")]
        public string NomeImagem { get; set; }
    }
}