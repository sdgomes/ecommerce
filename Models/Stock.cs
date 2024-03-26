using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Stock
    {
    [Column("ID_ESTOQUE")]
    public long IdEstoque {get; set;}

    [Column("ID_PRODUTO")]
    public long IdProduto {get; set;}

    [Column("CODIGO")]
    public string Codigo {get; set;}

    [Column("SALDO")]
    public int Saldo {get; set;}

    [Column("ULTIMA_MOVIMENTACAO")]
    public DateTime UltimaMovimentacao  {get; set;}

    [Column("NOTA_FISCAL")]
    public byte[] NotaFiscal {get; set;}

    [Column("COR")]
    public string Cor {get; set;}

    [Column("PRECO_UNITARIO")]
    public float PrecoUnitario {get; set;}

    [Column("TIPO")]
    public string Tipo {get; set;}

    [Column("TAMANHO")]
    public string Tamanho {get; set;}

    [Column("MARCA")]
    public string Marca {get; set;}

    [Column("GRAVADORA")]
    public string Gravadora {get; set;}

    [Column("PESO")]
    public float Peso {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}