using Microsoft.AspNetCore.Mvc;

namespace ecommerce.Views.Home.Components.ShippingInfo
{
    public class ShippingInfoViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}