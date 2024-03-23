using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models.ModelView
{
    public class ProdutoView
    {
        public List<string> Imagens { get; set; }
        public string PreInfo { get; set; }
        public string NomeProduto { get; set; }
        public string Descricao { get; set; }
        public string PrecoDesconto { get; set; }
        public string PrecoOriginal { get; set; }
        public string Id { get; set; }
        public int Quantidade { get; set; }
    }
}
