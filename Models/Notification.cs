using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Notification
    {
    [Column("ID_NOTIFICACAO")]
    public long IdNotificacao {get; set;}

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