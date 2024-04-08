using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Status : Image
    {
        [Column("ID_STATUS")]
        public long IdStatus { get; set; }

        [Column("ID_FUNCIONARIO")]
        public long IdFuncionario { get; set; }

        [Column("ATIVO")]
        public bool Ativo { get; set; }

        [Column("OBSERVACAO_STATUS")]
        public string ObservacaoStatus { get; set; }

        [Column("DATA_VALIDADE")]
        public DateTime DataValidade { get; set; }
    }
}