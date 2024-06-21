using crm.DAL;
using crm.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Models.ModelView
{
    public class TrocasItensView
    {
        public int Codigo { get; set; }

        public Client Cliente { get; set; }

        public Employee Funcionario { get; set; }

        public List<Notification> Mensagens { get; set; }

        public List<SolicitationDTO> Solicitacoes { get; set; }
    }
}
