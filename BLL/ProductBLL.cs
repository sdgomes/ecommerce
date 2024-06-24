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
    public class ProductBLL
    {
        public static TransactionDTO TransacaoParaSolicitacao(long IdTransacao)
        {
            TransactionDTO transacao = TransactionDAO.SearchById(IdTransacao);
            if (transacao == null)
                throw new ArgumentException("Pedido não encontrado, entre em contato com o suporte.");

            transacao.Produtos = ProductDAO.SelectAllProductsTransactionsSolicitacao(transacao.IdTransacao);

            return transacao;
        }

        public static TransactionDTO Transacao(long IdTransacao)
        {
            TransactionDTO transacao = TransactionDAO.SearchById(IdTransacao);
            if (transacao == null)
                throw new ArgumentException("Pedido não encontrado, entre em contato com o suporte.");

            transacao.Cliente = ClientDAO.SearchForClientById(transacao.IdCliente);
            transacao.Produtos = ProductDAO.SelectAllProductsTransactions(transacao.IdTransacao);
            transacao.Cartoes = CardDAO.SelectAllCardSTransactions(transacao.IdTransacao);

            return transacao;
        }

        public static ProdutoView RetornaProduto(long IdProduto)
        {
            ProdutoView Model = new();
            Model.Produto = ProductDAO.SearchProductById(IdProduto);
            Model.Imagens = ProductDAO.SelectImagesFromProduct(IdProduto);

            return Model;
        }

        public static async Task<dynamic> CalcularFrete(string CEP)
        {
            HttpClient client = new HttpClient();
            HttpResponseMessage response = await client.GetAsync($@"https://viacep.com.br/ws/{CEP}/json/");

            if (response.IsSuccessStatusCode)
            {
                var stringResponse = await response.Content.ReadAsStringAsync();

                try
                {
                    ViaCEP Endereco = JsonConvert.DeserializeObject<ViaCEP>(stringResponse);

                    if (Endereco.Erro)
                        return new { success = false, message = "O CEP informado é inválido, por favor tente novamente!" };

                    Freight ValorFrete = AddressDAO.SearchFreightByUF(Endereco.UF);

                    return new { success = true, message = $@"O valor do seu frete é de {ValorFrete.Preco.ToString("C")}", preco = ValorFrete.Preco, frete = ValorFrete.Preco.ToString("C") };
                }
                catch (Exception)
                {
                    return new { success = false, message = "O CEP informado é inválido, por favor tente novamente!" };
                }
            }
            else
            {
                return new { success = false, message = "O CEP informado é inválido, por favor tente novamente!" };
            }
        }

        public static dynamic BuscarDesconto(string Codigo, string Tipo)
        {
            try
            {
                double desconto;
                if (Tipo == "DESCONTO")
                {
                    desconto = ProductDAO.ResgataCodigo(Codigo);
                    if (desconto == 0)
                        return new { success = false, message = "O código informado é inválido, por favor tente novamente!" };
                    else
                        return new { success = true, message = $@"Seu desconto resgatado é de {desconto.ToString("C")}", desconto };
                }

                if (Tipo == "CUPONS")
                {
                    desconto = ProductDAO.SearchDiscountByCodigo(Codigo);
                    if (desconto == 0)
                        return new { success = false, message = "O código informado é inválido, por favor tente novamente!" };
                    else
                        return new { success = true, message = $@"Seu desconto é de {desconto}%", desconto };
                }

                return new { success = false, message = "O código informado é inválido, ou o tipo não aceito, por favor tente novamente!" };
            }
            catch (Exception ex)
            {
                return new { success = false, message = "O código informado é inválido, por favor tente novamente!" };
            }
        }

        public static void NovoPagamento(TransactionDTO Transaction)
        {
            string pagamento = "APROVADO";
            Transaction.Pagamento = pagamento;

            TransactionDAO.AlteraPagamento(Transaction);

            foreach (var Item in Transaction.Cartoes)
            {
                Item.Pagamento = pagamento;
                TransactionDAO.AssociateCards(Transaction.IdTransacao, Item);
            }

        }

        public static TransactionDTO ValidaCupons(TransactionDTO transaction)
        {
            if (transaction.CodCupons != null)
            {
                var cupom = ProductDAO.SearchDiscountByCodigo(transaction.CodCupons);

                if (cupom > 0)
                {
                    var cuponsExtra = (transaction.Total / 100) * cupom;
                    transaction.Total -= cuponsExtra;

                    ProductDAO.RegistraResgateDesconto(transaction.CodCupons);
                }
            }

            return transaction;
        }

        public static TransactionDTO ValidaDesconto(TransactionDTO transaction)
        {
            transaction.Descontos = transaction.Produtos.Where(x => x.Desconto).Sum(x => ((x.QntCompra * x.Preco) - (x.QntCompra * x.CalculoDesconto)));

            if (transaction.CodDesconto != null)
            {
                var descontoMais = ProductDAO.ResgataCodigo(transaction.CodDesconto);
                transaction.Descontos += descontoMais;

                if (descontoMais > 0)
                {
                    ProductDAO.RegistraResgateDesconto(transaction.CodDesconto);
                }
            }

            return transaction;
        }

        public static TransactionDTO ValidaPagamrnto(TransactionDTO transaction)
        {
            Random random = new Random();
            string[] pagamentos = { "APROVADO", "APROVADO", "APROVADO", "APROVADO", "RECUSADO" };
            int sorte = random.Next(0, pagamentos.Length);
            string pagamento = pagamentos[sorte];

            if (transaction.Total <= 0)
            {
                transaction.Pagamento = "APROVADO";
                transaction.Total = 0;
            }
            else
            {
                transaction.Pagamento = pagamento;
            }

            return transaction;
        }

        public static async Task<long> RegistraTransacao(TransactionDTO transaction, string Codigo)
        {
            if (transaction.LimpaCarrinho)
            {
                ClientDAO.LimpaCarrinho(Codigo);
            }

            dynamic via = await CalcularFrete(transaction.CEP);
            transaction.Frete = via.preco;

            transaction = ValidaDesconto(transaction);

            transaction.Subtotal = transaction.Produtos.Sum(x => x.QntCompra * x.Preco);

            transaction.Total = (transaction.Subtotal + transaction.Frete) - transaction.Descontos;

            transaction = ValidaCupons(transaction);

            transaction = ValidaPagamrnto(transaction);

            long IdTransaction = TransactionDAO.Create(transaction);

            if (IdTransaction != 0)
            {
                TransactionDAO.RegistraAtividade(IdTransaction, "Um novo pedido foi feito, e está aguardando validação de pagamento.", "COMPRA");

                foreach (var Item in transaction.Produtos)
                {
                    TransactionDAO.AssociateProducts(IdTransaction, Item);
                }

                foreach (var Item in transaction.Cartoes)
                {
                    Item.Pagamento = transaction.Pagamento;
                    if (transaction.Total == 0)
                        Item.Total = 0;

                    TransactionDAO.AssociateCards(IdTransaction, Item);
                }
            }

            return IdTransaction;
        }
    }
}
