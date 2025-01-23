using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using Ecommerce.Models;
using Ecommerce.DAL;
using System;

namespace Ecommerce.Views.Client.Components.Cartao
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