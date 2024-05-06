using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace crm.Views.Shared.Components.Breadcrumbs
{
    public class BreadcrumbsViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(ViewBreadcrumbs Model)
        {
            return View(Model);
        }
    }

    public class ViewBreadcrumbs
    {
        public string Title { get; set; }
        public BreadcrumbsDTO[] Breadcrumbs { get; set; }
    }

    public class BreadcrumbsDTO
    {
        public string Link { get; set; }
        public string Name { get; set; }
        public string Icone { get; set; }

        public BreadcrumbsDTO() { }

        public BreadcrumbsDTO(string name, string link = "", string icone = "")
        {
            Name = name;
            Link = link;
            Icone = icone;
        }
    }


}