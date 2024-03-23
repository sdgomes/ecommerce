using Microsoft.AspNetCore.Mvc;

namespace ecommerce.Views.Shared.Components.Navigation
{
    public class NavigationViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}