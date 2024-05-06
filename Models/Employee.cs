using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class Employee : User
    {
        [Column("ID_FUNCIONARIO")]
        public long IdFuncionario { get; set; }

        [Column("NOME_COMPLETO")]
        public string NomeCompleto { get; set; }

        [Column("CODIGO")]
        public string Codigo { get; set; }

        [Column("CARGO")]
        public string Cargo { get; set; }
    }
}