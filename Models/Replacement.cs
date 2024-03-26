using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Replacement
    {
    [Column("ID_TROCA")]
    public long IdTroca {get; set;}

    [Column("ID_CLIENTE")]
    public long IdCliente {get; set;}

    [Column("ID_FUNCIONARIO")]
    public long IdFuncionario {get; set;}

    [Column("ID_DESCONTO")]
    public long IdDesconto {get; set;}

    [Column("DATA_SOLICITACAO")]
    public DateTime DataSolicitacao  {get; set;}

    [Column("DATA_ENVIO")]
    public DateTime DataEnvio  {get; set;}

    [Column("MOTIVO")]
    public string Motivo {get; set;}

    [Column("STATUS")]
    public string Status {get; set;}

    [Column("APROVADO")]
    public bool Aprovado {get; set;}

    [Column("OBSERVACAO")]
    public string Observacao {get; set;}

    [Column("DATA_RECEBIMENTO")]
    public DateTime DataRecebimento  {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}