using Microsoft.AspNetCore.Mvc;

namespace crm.Views.Shared.Components.Product
{
    public class ProductViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}