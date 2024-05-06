using Microsoft.AspNetCore.Mvc;

namespace crm.Views.Shared.Components.Navigation
{
    public class NavigationViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}