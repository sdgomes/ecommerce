using Ecommerce.DTO;
using Microsoft.AspNetCore.Mvc;
using Ecommerce.Models;
using Ecommerce.BLL;

namespace Ecommerce.Views.Client.Components.ProdutoSolicitacao
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