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

        public static dynamic BuscarDesconto(string Codigo)
        {
            try
            {
                Discount Desconto = ProductDAO.SearchDiscountByCodigo(Codigo);

                return new { success = true, message = $@"Seu desconto é de {Desconto.Desconto}%", desconto = Desconto.Desconto };
            }
            catch (Exception)
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

        public static long RegistraTransacao(TransactionDTO Transaction)
        {
            Random random = new Random();
            string[] pagamentos = { "APROVADO", "RECUSADO" };
            int sorte = random.Next(0, pagamentos.Length);
            string pagamento = pagamentos[sorte];

            Transaction.Pagamento = pagamento;

            long IdTransaction = TransactionDAO.Create(Transaction);

            if (IdTransaction != 0)
            {
                TransactionDAO.RegistraAtividade(IdTransaction, "Um novo pedido foi feito, e está aguardando validação de pagamento.", "COMPRA");

                foreach (var Item in Transaction.Produtos)
                {
                    TransactionDAO.AssociateProducts(IdTransaction, Item);
                }

                foreach (var Item in Transaction.Cartoes)
                {
                    Item.Pagamento = pagamento;
                    TransactionDAO.AssociateCards(IdTransaction, Item);
                }
            }

            return IdTransaction;
        }
    }
}
