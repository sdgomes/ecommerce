using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class User
    {
        [Column("ID_USUARIO")]
        public long IdUsuario { get; set; }

        [Column("EMAIL")]
        public string Email { get; set; }

        [Column("SENHA")]
        public string Senha { get; set; }

        [Column("TIPO")]
        public string Tipo { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }
    }
}