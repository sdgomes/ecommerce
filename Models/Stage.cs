using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Stage
    {
    [Column("ID_ETAPA")]
    public long IdEtapa {get; set;}

    [Column("ETAPA")]
    public string Etapa {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}