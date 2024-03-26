using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Pricing
    {    
    [Column("ID_PRECIFICACAO")]
    public long IdPrecificacao {get; set;}

    [Column("TIPO")]
    public string Tipo {get; set;}

    [Column("SUBCATEGORIA")]
    public string Subcategoria {get; set;}

    [Column("PRECO_MINIMO")]
    public float PrecoMinimo {get; set;}

    [Column("PRECO_MAXIMO")]
    public float PrecoMaximo {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}


    }
}