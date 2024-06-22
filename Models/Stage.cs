using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class Stage : Address
    {
        [Column("ID_ETAPA")]
        public long IdEtapa { get; set; }

        [Column("ETAPA")]
        public string Etapa { get; set; }

        [Column("COR")]
        public string Cor { get; set; }

    }
}