using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models
{
    public class Solicitation : Product
    {
        [Column("ID_SOLICITACAO")]
        public long IdSolicitacao { get; set; }

        [Column("GRUPO_CODIGO")]
        public string GrupoCodigo { get; set; }

        [Column("CODIGO_TRANSACAO")]
        public int CodigoTransacao { get; set; }

        [Column("ID_TRANSACAO")]
        public long IdTransacao { get; set; }
        
        [Column("ID_DESCONTO")]
        public long IdDesconto { get; set; }

        [Column("ID_ETAPA")]
        public long IdEtapa { get; set; }

        [Column("ETAPA")]
        public string Etapa { get; set; }

        [Column("APROCACAO_1")]
        public bool Aprovacao1 { get; set; }

        [Column("APROCACAO_2")]
        public bool Aprovacao2 { get; set; }

        [Column("MOTIVO_SOLICITACAO")]
        public string MotivoSolicitacao { get; set; }

        [Column("MOTIVO_RECUSA")]
        public string MotivoRecusa { get; set; }

        [Column("DATA_SOLICITACAO")]
        public DateTime DataSolicitacao { get; set; }

        [Column("DATA_APROVACAO")]
        public DateTime DataAprovacao { get; set; }

        [Column("DATA_RECUSA")]
        public DateTime DataRecusa { get; set; }

        [Column("DATA_ENVIO")]
        public DateTime DataEnvio { get; set; }

        [Column("DATA_RECEBIMENTO")]
        public DateTime DataRecebimento { get; set; }
    }
}