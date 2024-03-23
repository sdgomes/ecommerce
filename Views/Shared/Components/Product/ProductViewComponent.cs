using Microsoft.AspNetCore.Mvc;

namespace ecommerce.Views.Shared.Components.Product
{
    public class ProductViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}