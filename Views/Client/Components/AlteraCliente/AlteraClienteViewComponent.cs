using crm.DAL;
using Microsoft.AspNetCore.Mvc;
using crm.Models;
using ClassClient = crm.Models.Client;
using System.Collections.Generic;

namespace crm.Views.Client.Components.AlteraCliente
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