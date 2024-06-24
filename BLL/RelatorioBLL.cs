using crm.DAL;
using crm.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.BLL
{
    public class RelatorioBLL
    {
        public static dynamic Geral()
        {
            List<RelatorioDTO> relatorios = RelatorioDAO.VendaPorProdutos();
            foreach (var rel in relatorios)
            {
                rel.Data = RelatorioDAO.VendaPorProdutosId(rel.IdProduto);
            }

            return new { Geral = RelatorioDAO.Geral(), Produto = relatorios };
        }

        public static dynamic GeralRange(DateTime Inicio, DateTime Fim)
        {
            List<RelatorioDTO> relatorios = RelatorioDAO.VendaPorProdutosPeriodo(Inicio, Fim);
            foreach (var rel in relatorios)
            {
                rel.Data = RelatorioDAO.VendaPorProdutosId(rel.IdProduto);
            }

            return new { Geral = RelatorioDAO.GeralComPeriodo(Inicio, Fim), Produto = relatorios };
        }
    }
}
