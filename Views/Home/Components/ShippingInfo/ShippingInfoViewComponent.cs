using Microsoft.AspNetCore.Mvc;

namespace Ecommerce.Views.Home.Components.ShippingInfo
{
    public class ShippingInfoViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}