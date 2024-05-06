using Microsoft.AspNetCore.Mvc;

namespace crm.Views.Home.Components.BlogSection
{
    public class BlogSectionViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}