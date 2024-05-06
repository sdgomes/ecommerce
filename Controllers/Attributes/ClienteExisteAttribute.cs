using crm.DAL;
using crm.Extesions;
using crm.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;

namespace crm.Controllers.Attributes
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
                    context.Result = controller.RedirectToAction("Cadastro", "Client", new { error = "Aten��o! Cliente n�o encontrado.".ToBase64Encode() });
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}