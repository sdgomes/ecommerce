using Microsoft.AspNetCore.Mvc;

namespace crm.Views.Home.Components.ShippingInfo
{
    public class ShippingInfoViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}