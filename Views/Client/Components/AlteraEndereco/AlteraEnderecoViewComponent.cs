using ecommerce.DAL;
using ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Client.Components.AlteraEndereco
{
    [ViewComponent(Name = "AlteraEndereco")]
    public class AlteraEnderecoViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(long IdEndereco)
        {
            ViewAlteraEndereco model = new(IdEndereco);
            return View(model);
        }
    }

    public class ViewAlteraEndereco
    {
        public AddressDataDTO AddressData { get; set; }

        public Address Address { get; set; }

        public ViewAlteraEndereco() { }

        public ViewAlteraEndereco(long IdEndereco)
        {
            Address = AddressDAO.SearchAddressByIdEndereco(IdEndereco);

            AddressData = new AddressDataDTO();
            AddressData.TypesOfAddresses = AddressDAO.SelectAllTypeOfAddress();
            AddressData.TypesOfResidences = AddressDAO.SelectAllTypeOfResidence();
            AddressData.States = AddressDAO.SelectAllState();
        }
    }
}