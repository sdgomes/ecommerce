using crm.DAL;
using crm.DTO;
using crm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.BLL
{
    public class AdminBLL
    {
        public static bool IsFuncionarioByCodigo(string Codigo)
        {
            Employee employee = EmployeeDAO.SearchForEmployeeByCodigo(Codigo);
            return employee == null ? false : true;
        }

        public static void SituacaoCliente(string Situacao, string Codigo)
        {
            if (Situacao == "inativar" || Situacao == "ativar")
                ClientDAO.UpdateClientSituacao(Codigo, (Situacao == "inativar" ? false : true));
        }

        public static List<Client> SelectAllClients()
        {
            return ClientDAO.SelectAllClients();
        }

        public static AdminDTO Perfil(string Codigo)
        {
            AdminDTO Model = new();
            Model.Funcionario.Codigo = Codigo;
            Model.QntProcessandoPagamento = ProductDAO.QuantidadeProcessandoPagamento();

            return Model;
        }

        public static List<PedidoDTO> ExibiPedidosParaGestao()
        {
            return TransactionDAO.SelectAllPedidos();
        }
    }
}
