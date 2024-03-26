using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Images
    {
    [Column("ID_IMAGEM")]
    public long IdImagem {get; set;}

    [Column("ID_PRODUTO")]
    public long IdProduto {get; set;}

    [Column("IMAGEM")]
    public byte[] Imagem {get; set;}

    [Column("NOME")]
    public string Nome {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}