using crm.DAL;
using crm.DTO;
using crm.Models;
using crm.Models.ModelView;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace crm.BLL
{
    public class TransactionBLL
    {
        public static PedidosView Pedidos(string Codigo)
        {
            PedidosView Model = new();
            Model.Cliente = ClientDAO.SearchForClientByCodigo(Codigo);
            Model.TransacoesDatas = TransactionDAO.SelectByClient(Model.Cliente.IdCliente);

            return Model;
        }

        public static void AlteraSolicitacao(long IdSolicitacao, string Etapa, string Motivo, string Tipo)
        {
            switch (Etapa)
            {
                case "CANCELADO":
                case "ENVIADO PARA TROCA":
                case "ENVIADO PARA DEVOLUÇÃO":
                    TransactionDAO.AlteraEtapaSolicitacao(IdSolicitacao, Etapa, Motivo);
                    break;

                case "APROVAR SOLICITACAO DE TROCA":
                case "APROVAR SOLICITACAO DE DEVOLUÇÃO":
                    TransactionDAO.AprovaSolicitacao(IdSolicitacao);
                    break;

                case "APROVAR TROCA":
                case "APROVAR DEVOLUÇÃO":
                    TransactionDAO.AprovaEntrega(IdSolicitacao);
                    break;

                case "ENTREGUE":
                    long IdDesconto = TransactionDAO.GeraDesconto(IdSolicitacao, Tipo);
                    TransactionDAO.SolicitacaoEntregue(IdSolicitacao, IdDesconto);
                    break;
            }
        }

        public static void Reembolso(long IdTransacao)
        {
            TransactionDTO transaction = TransactionDAO.SearchById(IdTransacao);
            string Motivo = "Pedido cancelado ou venda não aprovada, foi feito reembolso.";
            string Tipo = "REEMBOLSO";

            Solicitation solicitacao = new();
            solicitacao.GrupoCodigo = transaction.Codigo.ToString();
            solicitacao.Codigo = transaction.Codigo.ToString();
            solicitacao.IdTransacao = IdTransacao;
            solicitacao.Tipo = Tipo;
            solicitacao.Preco = transaction.Total;
            solicitacao.MotivoSolicitacao = Motivo;

            var IdSolicitacao = ClientDAO.CreateSolicitacao(solicitacao);

            long IdDesconto = TransactionDAO.GeraDesconto(IdSolicitacao, Tipo);
            TransactionDAO.SolicitacaoReembolso(IdSolicitacao, IdDesconto);

            TransactionDAO.AlteraPedidoReembolso(IdTransacao);
            TransactionDAO.RegistraAtividade(IdTransacao, Motivo, Tipo);
        }

        public static void Etapa(long IdTransacao, string Etapa)
        {
            if (Etapa == "REEMBOLSAR")
            {
                Reembolso(IdTransacao);
            }
            else
            {
                TransactionDAO.AlteraEtapaPedido(IdTransacao, Etapa);

                switch (Etapa)
                {
                    case "A CAMINHO":
                        TransactionDAO.RegistraAtividade(IdTransacao, "O pedido foi marcado como enviado! Ação feita por um funcionário.", "ENVIADO");
                        break;

                    case "CANCELADO":
                        TransactionDAO.RegistraAtividade(IdTransacao, "O pedido foi cancelado.", "CANCELADO");
                        break;

                    case "EM PREPARAÇÃO":
                        TransactionDAO.RegistraAtividade(IdTransacao, "O pedido foi colocado em preparação! Ação feita por um funcionário.", "PREPARACAO");
                        break;

                    case "ENTREGUE":
                        TransactionDAO.RegistraAtividade(IdTransacao, "O pedido foi entregue pelos correios.", "ENTREGUE");
                        break;

                    case "COMPRA APROVADA":
                        TransactionDAO.RegistraAtividade(IdTransacao, "A venda foi aprovada! Ação feita por um funcionário.", "APROVADO ");
                        break;

                    case "COMPRA RECUSADA":
                        TransactionDAO.RegistraAtividade(IdTransacao, "A venda foi reprovada! Ação feita por um funcionário.", "RECUSADO");
                        break;
                }
            }
        }
    }
}
