using crm.DAL;
using crm.Extesions;
using crm.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Controllers.Attributes
{
    public class FuncionarioExisteAttribute : ActionFilterAttribute
    {
        public FuncionarioExisteAttribute() { }

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

                Employee employee = EmployeeDAO.SearchForEmployeeByCodigo(Codigo);

                if (employee == null)
                {
                    var controller = (Controller)context.Controller;

                    Client cliente = ClientDAO.SearchForClientByCodigo(Codigo);
                    if (cliente != null)
                    {
                        context.Result = controller.RedirectToAction("Perfil", "Client", new { Codigo });
                    }
                    else
                    {
                        context.Result = controller.RedirectToAction("Index", "Home", new { error = "Atenção! Funcionário não encontrado.".ToBase64Encode() });
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
