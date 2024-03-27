using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Client.Components.Endereco
{
    public class EnderecoViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(ViewEndereco Model)
        {
            return View(Model);
        }
    }

    public class ViewEndereco
    {
        public int Index { get; set; }

        public ViewEndereco() { }
        public ViewEndereco(int _Index)
        {
            Index = _Index;
        }
    }
}