using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class MovementHistory
    {
    [Column("ID_HISTORICO_MOVIMENTACAO")]
    public long IdHistoricoMovimentacao {get; set;}

    [Column("ID_ESTOQUE")]
    public long IdEstoque {get; set;}

    [Column("ID_USUARIO")]
    public long IdUsuario {get; set;}

    [Column("TIPO_MOVIMENTO")]
    public string TipoMovimento {get; set;}

    [Column("QNT_MOVIMENTADA")]
    public int QntMovimentada {get; set;}

    [Column("DESCRICAO")]
    public string Descricao {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}