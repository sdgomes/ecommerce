using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using crm.Models;
using crm.DAL;

namespace crm.Views.Client.Components.Cartao
{
    [ViewComponent(Name = "Cartao")]
    public class CartaoViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(ViewCartao Model)
        {
            Model.Cards = CardDAO.SelectAllCardBrands();
            return View(Model);
        }
    }

    public class ViewCartao
    {
        public int Index { get; set; }
        public List<Card> Cards { get; set; }

        public ViewCartao() { }
        public ViewCartao(int _Index)
        {
            Index = _Index;
        }
    }
}