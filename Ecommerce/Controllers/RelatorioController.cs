using Ecommerce.BLL;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Controllers
{
    public class RelatorioController : Controller
    {
        [HttpPost("/relatorio/geral")]
        public IActionResult Geral()
        {
            try
            {
                return Json(new { Data = RelatorioBLL.Geral() });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }

        [HttpPost("/relatorio/geral/range")]
        public IActionResult GeralRange(DateTime Inicio, DateTime Fim)
        {
            try
            {
                return Json(new { Data = RelatorioBLL.GeralRange(Inicio, Fim) });
            }
            catch (Exception ex)
            {
                return StatusCode(400, new { Message = ex.Message });
            }
        }
    }
}
