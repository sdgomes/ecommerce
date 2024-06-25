using Ecommerce.DAL;
using Ecommerce.Extesions;
using Ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;

namespace Ecommerce.Controllers.Attributes
{
    public class ValidaCompraAttribute : ActionFilterAttribute
    {
        public ValidaCompraAttribute() { }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            try
            {
                var codigo = context.HttpContext.Request.Cookies["codigo"];
                if (codigo == null)
                {
                    var controller = (Controller)context.Controller;
                    context.Result = controller.RedirectToAction("Cadastro", "Client", new { finalizar = true });
                }
                else
                {
                    Client cliente = ClientDAO.SearchForClientByCodigo(codigo);

                    if (cliente == null)
                    {
                        var controller = (Controller)context.Controller;
                        context.Result = controller.RedirectToAction("Cadastro", "Client", new { error = "Atenção! Cliente não encontrado.".ToBase64Encode() });
                    }
                }

            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}