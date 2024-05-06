using Microsoft.AspNetCore.Mvc;

namespace crm.Views.Home.Components.Brands
{
    public class BrandsViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}