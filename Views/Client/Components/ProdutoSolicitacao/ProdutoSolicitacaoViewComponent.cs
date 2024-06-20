using crm.DTO;
using Microsoft.AspNetCore.Mvc;
using crm.Models;
using crm.BLL;

namespace crm.Views.Client.Components.ProdutoSolicitacao
{
    [ViewComponent(Name = "ProdutoSolicitacao")]
    public class ProdutoSolicitacaoViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(long IdTransacao)
        {
            ViewProdutoSolicitacao Model = new();
            Model.Transacao = ProductBLL.TransacaoParaSolicitacao(IdTransacao);

            return View(Model);
        }
    }

    public class ViewProdutoSolicitacao
    {
        public TransactionDTO Transacao { get; set; }
    }
}