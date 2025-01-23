using Ecommerce.DAL;
using Ecommerce.Extesions;
using Ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;

namespace Ecommerce.Controllers.Attributes
{
    public class FuncionarioLogadoAttribute : ActionFilterAttribute
    {
        public FuncionarioLogadoAttribute() { }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            try
            {
                if (context.HttpContext.Request.Cookies["codigo"] == null)
                {
                    var controller = (Controller)context.Controller;
                    context.Result = controller.RedirectToAction("Index", "Home", new { error = "Faça login para acessar seu perfil".ToBase64Encode() });
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}