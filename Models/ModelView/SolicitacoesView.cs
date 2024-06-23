using crm.DAL;
using crm.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models.ModelView
{
    public class SolicitacoesView
    {
        public string Codigo { get; set; }

        public List<Solicitation> Solicitacoes { get; set; }

        public List<ProductDTO> GetProdutos(string GrupoCodigo)
        {
            return ProductDAO.ImagensCapaSolicitacao(GrupoCodigo);
        }
    }
}
