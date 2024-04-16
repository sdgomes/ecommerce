using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Transaction
    {
    [Column("ID_TRANSACAO")]
    public long IdTransacao {get; set;}

    [Column("ID_CLIENTE")]
    public long IdCliente {get; set;}

    [Column("ID_ENDERECO")]
    public long IdEndereco {get; set;}

    [Column("ID_ETAPA")]
    public long IdEtapa {get; set;}

    [Column("TIPO")]
    public string Tipo {get; set;}

    [Column("PAGAMENTO")]
    public string Pagamento {get; set;}

    [Column("SUBTOTAL")]
    public double Subtotal {get; set;}

    [Column("FRETE")]
    public double Frete {get; set;}

    [Column("DESCONTOS")]
    public double Descontos {get; set;}

    [Column("TOTAL")]
    public double Total {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}