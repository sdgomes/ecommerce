using Microsoft.AspNetCore.Mvc;

namespace Ecommerce.Views.Home.Components.BlogSection
{
    public class BlogSectionViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}