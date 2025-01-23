using Ecommerce.DAL;
using Ecommerce.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Models.ModelView
{
    public class SolicitacoesItensView
    {
        public int Codigo { get; set; }

        public Client Cliente { get; set; }

        public Employee Funcionario { get; set; }

        public List<Notification> Mensagens { get; set; }

        public List<SolicitationDTO> Solicitacoes { get; set; }
    }
}
