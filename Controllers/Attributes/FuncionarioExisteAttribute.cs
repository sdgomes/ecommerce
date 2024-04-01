using ecommerce.DAL;
using ecommerce.Extesions;
using ecommerce.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Controllers.Attributes
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

                Employee cliente = EmployeeDAO.SearchForEmployeeByCodigo(Codigo);

                if (cliente == null)
                {
                    var controller = (Controller)context.Controller;
                    context.Result = controller.RedirectToAction("Index", "Home", new { error = "Atenção! Funcionário não encontrado.".ToBase64Encode() });
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
