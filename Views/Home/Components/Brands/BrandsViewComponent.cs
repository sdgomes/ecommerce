using Microsoft.AspNetCore.Mvc;

namespace Ecommerce.Views.Home.Components.Brands
{
    public class BrandsViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}