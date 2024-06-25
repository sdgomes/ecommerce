using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.DTO
{
    public class RelatorioDTO
    {
        [Column("ID_PRODUTO")]
        public long IdProduto { get; set; }

        [Column("NOME")]
        public string Nome { get; set; }

        [Column("QUANTIDADE")]
        public int Quantidade { get; set; }

        [Column("DATA_VENDA")]
        public string DataVenda { get; set; }

        public List<RelatorioDTO> Data { get; set; }
    }
}
