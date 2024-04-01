using ecommerce.DAL;
using ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;

namespace ecommerce.Views.Client.Components.Endereco
{
    [ViewComponent(Name = "Endereco")]
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

        public AddressDataDTO AddressData { get; set; }

        public ViewEndereco() { }

        public ViewEndereco(int _Index)
        {
            Index = _Index;

            AddressData = new AddressDataDTO();
            AddressData.TypesOfAddresses = AddressDAO.SelectAllTypeOfAddress();
            AddressData.TypesOfResidences = AddressDAO.SelectAllTypeOfResidence();
            AddressData.States = AddressDAO.SelectAllState();
        }
    }
}