using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Status
    {
    [Column("ID_STATUS")]
    public long IdStatus {get; set;}

    [Column("ID_PRODUTO")]
    public long IdProduto {get; set;}

    [Column("ID_FUNCIONARIO")]
    public long IdFuncionario {get; set;}

    [Column("ATIVO")]
    public bool Ativo {get; set;}

    [Column("OBSERVACAO")]
    public string Observacao {get; set;}

    [Column("DATA_VALIDADE")]
    public DateTime DataValidade  {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}