using Microsoft.AspNetCore.Mvc;

namespace ecommerce.Views.Home.Components.BlogSection
{
    public class BlogSectionViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}