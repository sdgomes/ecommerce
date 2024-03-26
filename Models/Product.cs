using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Product
    {
    [Column("ID_PRODUTO")]
    public long IdProduto {get; set;}

    [Column("ID_PRECIFICACAO")]
    public long IdPrecificacao {get; set;}

    [Column("CODIGO")]
    public string Codigo {get; set;}

    [Column("NOME")]
    public string Nome {get; set;}

    [Column("PRECO")]
    public float Preco {get; set;}

    [Column("TIPO")]
    public string Tipo {get; set;}

    [Column("DESCRICAO")]
    public string Descricao {get; set;}

    [Column("DESCONTO")]
    public bool Desconto {get; set;}

    [Column("NOVO")]
    public bool Novo {get; set;}

    [Column("PRE_VENDA")]
    public bool PreVenda {get; set;}

    [Column("ANO")]
    public string Ano {get; set;}

    [Column("ARTISTA")]
    public string Artista {get; set;}

    [Column("QNT_DESCONTO")]
    public int QntDesconto {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}