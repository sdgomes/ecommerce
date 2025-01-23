using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Views.Client.Components.AlteraSenha
{
    [ViewComponent(Name = "AlteraSenha")]
    public class AlteraSenhaViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(ViewAlteraSenha Model)
        {
            return View(Model);
        }
    }

    public class ViewAlteraSenha
    {
        public long IdUsuario { get; set; }

        public ViewAlteraSenha() { }
        public ViewAlteraSenha(long _IdUsuario) { IdUsuario = _IdUsuario; }
    }
}
