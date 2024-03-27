using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Client.Components.Cartao
{
    public class CartaoViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(ViewCartao Model)
        {
            return View(Model);
        }
    }

    public class ViewCartao
    {
        public int Index { get; set; }

        public ViewCartao() { }
        public ViewCartao(int _Index)
        {
            Index = _Index;
        }
    }
}