using Ecommerce.DAL;
using Ecommerce.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.BLL
{
    public class RelatorioBLL
    {
        public static dynamic Geral()
        {
            List<RelatorioDTO> Geral = RelatorioDAO.Geral();
            List<RelatorioDTO> Caregorias = RelatorioDAO.VendaPorProdutos();

            return new { Geral, Caregorias };
        }

        public static dynamic GeralRange(DateTime Inicio, DateTime Fim)
        {
            List<RelatorioDTO> Geral = RelatorioDAO.GeralComPeriodo(Inicio, Fim);
            List<RelatorioDTO> Caregorias = RelatorioDAO.VendaPorProdutosPeriodo(Inicio, Fim);

            return new { Geral, Caregorias };
        }
    }
}
