using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class Ranking
    {
    [Column("ID_RANKING")]
    public long IdRanking {get; set;}

    [Column("ID_CLIENTE")]
    public long IdCliente {get; set;}

    [Column("QNT_COMPRAS")]
    public int QntCompras {get; set;}

    [Column("NOTA")]
    public int Nota {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}