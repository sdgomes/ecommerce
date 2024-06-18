using crm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.DTO
{
    public class AdminDTO
    {
        public Employee Funcionario { get; set; }

        public int QntProcessandoPagamento { get; set; }

        public AdminDTO()
        {
            Funcionario = new Employee();
        }

    }
}
