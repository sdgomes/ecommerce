using ecommerce.DAL;
using ecommerce.Extesions;
using ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;

namespace ecommerce.Controllers.Attributes
{
    public class ClienteExisteAttribute : ActionFilterAttribute
    {
        public ClienteExisteAttribute() { }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            try
            {
                string Codigo = "";
                foreach (var parameter in context.ActionArguments)
                {
                    if (parameter.Key == "Codigo")
                        Codigo = parameter.Value.ToString();
                }

                Client cliente = ClientDAO.SearchForClientByCodigo(Codigo);

                if (cliente == null)
                {
                    var controller = (Controller)context.Controller;
                    context.Result = controller.RedirectToAction("Cadastro", "Client", new { error = "Atenção! Cliente não encontrado.".ToBase64Encode() });
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}