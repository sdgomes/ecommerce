using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Freight
    {
    [Column("ID_FRETE")]
    public long IdFrete {get; set;}

    [Column("ESTADO")]
    public string Estado {get; set;}

    [Column("PRECO")]
    public float Preco {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}