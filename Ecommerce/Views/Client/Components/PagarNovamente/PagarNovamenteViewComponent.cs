using Ecommerce.DAL;
using Ecommerce.DTO;
using Ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Views.Client.Components.PagarNovamente
{

    [ViewComponent(Name = "PagarNovamente")]
    public class PagarNovamenteViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(long IdCliente, long IdTransacao)
        {
            ViewPagarNovamente Model = new(IdCliente, IdTransacao);
            Model.Transacao = TransactionDAO.SearchById(IdTransacao);

            return View("~/Views/Client/Components/PagarNovamente/Default.cshtml", Model);
        }
    }

    public class ViewPagarNovamente
    {
        public TransactionDTO Transacao { get; set; }

        public long IdCliente { get; set; }

        public long IdTransacao { get; set; }

        public ViewPagarNovamente() { }

        public ViewPagarNovamente(long idCliente, long idTransacao)
        {
            IdCliente = idCliente;
            IdTransacao = idTransacao;
        }
    }
}
