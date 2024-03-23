using Microsoft.AspNetCore.Mvc;

namespace ecommerce.Views.Home.Components.Brands
{
    public class BrandsViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}