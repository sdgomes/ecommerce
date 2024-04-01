using ecommerce.DAL;
using Microsoft.AspNetCore.Mvc;
using ecommerce.Models;
using ClassClient = ecommerce.Models.Client;
using System.Collections.Generic;

namespace ecommerce.Views.Client.Components.AlteraCliente
{
    [ViewComponent(Name = "AlteraCliente")]
    public class AlteraClienteViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(long IdCliente)
        {
            ViewAlteraCliente model = new(IdCliente);
            return View(model);
        }
    }

    public class ViewAlteraCliente
    {
        public ClassClient Client { get; set; }

        public List<Gender> Genres { get; set; }

        public ViewAlteraCliente() { }

        public ViewAlteraCliente(long IdCliente)
        {
            Client = ClientDAO.SearchForClientById(IdCliente);
            Genres = UserDAO.SelectAllGenres();
        }
    }
}