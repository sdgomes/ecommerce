using Ecommerce.DAL;
using Ecommerce.Extesions;
using Ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;

namespace Ecommerce.Controllers.Attributes
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

                    Employee employee = EmployeeDAO.SearchForEmployeeByCodigo(Codigo);
                    if (employee != null)
                    {
                        context.Result = controller.RedirectToAction("Index", "Admin", new { Codigo });
                    }
                    else
                    {
                        context.Result = controller.RedirectToAction("Index", "Home", new { error = "Atenção! Cliente não encontrado.".ToBase64Encode() });
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