using Microsoft.AspNetCore.Mvc;

namespace Ecommerce.Views.Shared.Components.Navigation
{
    public class NavigationViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}