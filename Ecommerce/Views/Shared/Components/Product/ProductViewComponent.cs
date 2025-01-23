using Microsoft.AspNetCore.Mvc;

namespace Ecommerce.Views.Shared.Components.Product
{
    public class ProductViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}