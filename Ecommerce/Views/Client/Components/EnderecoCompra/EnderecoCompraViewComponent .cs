using Ecommerce.DAL;
using Ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace Ecommerce.Views.Client.Components.EnderecoCompra
{
    [ViewComponent(Name = "EnderecoCompra")]
    public class EnderecoCompraViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(List<Address> Model)
        {
            return View("~/Views/Client/Components/EnderecoCompra/Default.cshtml", Model);
        }
    }
}