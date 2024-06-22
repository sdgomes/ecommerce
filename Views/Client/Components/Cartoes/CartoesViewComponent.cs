using crm.DAL;
using crm.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Views.Client.Components.Cartoes
{

    [ViewComponent(Name = "Cartoes")]
    public class CartoesViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(long IdCliente)
        {
            ViewCartoes Model = new();
            Model.Cartoes = CardDAO.SelectClientCard(IdCliente);
            return View("~/Views/Client/Components/Cartoes/Default.cshtml", Model);
        }
    }

    public class ViewCartoes
    {
        public List<Card> Cartoes { get; set; }

        public string ImageSource(byte[] Imagem)
        {

            try
            {
                return "data:image/webp;base64," + Convert.ToBase64String(Imagem);
            }
            catch (Exception)
            {
                return "data:image/webp;base64,";
            }
        }
    }
}
