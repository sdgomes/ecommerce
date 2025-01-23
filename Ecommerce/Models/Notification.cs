using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Models
{
    public class Notification
    {
        [Column("ID_NOTIFICACAO")]
        public long IdNotificacao {get; set;}

        [Column("GRUPO_CODIGO")]
        public int GrupoCodigo { get; set; }
        
        [Column("ID_CLIENTE")]
        public long IdCliente { get; set; }

        [Column("ID_FUNCIONARIO")]
        public long IdFuncionario { get; set; }

        [Column("NOME_COMPLETO")]
        public string NomeCompleto { get; set; }

        [Column("TITULO")]
        public string Titulo {get; set;}

        [Column("MENSAGEM")]
        public string Mensagem {get; set;}

        [Column("ENVIADO")]
        public string Enviado {get; set;}

        [Column("VISUALIZADO")]
        public bool Visualizado {get; set;}

        [Column("CRIACAO")]
        public DateTime Criacao  {get; set;}

    }
}