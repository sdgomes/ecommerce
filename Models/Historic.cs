using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class Historic
    {
    [Column("ID_HISTORICO")]
    public long IdHistorico {get; set;}

    [Column("ID_TRANSACAO")]
    public long IdTransacao {get; set;}

    [Column("MENSAGEM")]
    public string Mensagem {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}