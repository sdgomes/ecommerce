using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestEcommerceNUnit.Models;

namespace TestEcommerceNUnit
{
    class CompraTest : SeleniumActions
    {
        private IWebDriver driver;

        [SetUp]
        public void Setup()
        {
            driver = new ChromeDriver();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(15);
            driver.Manage().Window.Maximize();

            wait = new WebDriverWait(driver, TimeSpan.FromSeconds(15));
        }

        protected void SelecionaProdutos()
        {
            /** Adiciona 3 Itens ao Carrihno**/
            Random num = new Random();
            for (var i = 0; i < 3; i++)
            {
                Click($"//*[@id='shop-content']/div/div/div[{num.Next(1, 10)}]/div/div[2]/h4/a");
                Click("/html/body/main/div[2]/div[2]/form/button[2]");

                if (i < 2)
                    Click("/html/body/main/div[1]/div/div/div[2]/ul/li[2]/a");
            }
        }

        protected void FinalizaCompra()
        {
            /* Calculo de frete */
            Click("//*[@id='container-enderecos']/div[1]/label");

            var texto = Element("//*[@id=\"container-enderecos\"]/div[1]/label/div/div/div[1]").Text;

            Input("/html/body/main/section/div[2]/div/div[2]/div/div[3]/form/div/div[1]/input", texto);
            Click("/html/body/main/section/div[2]/div/div[2]/div/div[3]/form/div/div[2]/button");

            System.Threading.Thread.Sleep(3000);

            /* Cartão de credito*/
            Click("//*[@id='container-cartoes']/label[1]");

            /* Comprar*/
            Click("/html/body/main/section/div[2]/div/div[2]/div/div[4]/div[3]/button");
        }

        public void NovoEndereco()
        {
            string CEP = "08559-300";
            Click("//*[@id=\"novo-endereco\"]");

            Input("//*[@id=\"form-adiciona-endereco\"]/div[2]/div[1]/div/div/div/div/input", CEP);
            Click("//*[@id=\"form-adiciona-endereco\"]/div[2]/div[1]/div/div/div/div/button");

            Select("//*[@id=\"form-adiciona-endereco\"]/div[2]/div[2]/div[1]/div/div/div/select", "Avenida");
            Select("//*[@id=\"form-adiciona-endereco\"]/div[2]/div[2]/div[2]/div/div/div/select", "Empresa");

            Input("//*[@id=\"form-adiciona-endereco\"]/div[2]/div[2]/div[4]/div/div/div/input", "300");
            Input("//*[@id=\"form-adiciona-endereco\"]/div[2]/div[2]/div[10]/div/div/div/input", "Trabalho");

            Click("/html/body/div/div/div[6]/button[3]");

            /* Calculo de frete */
            Input("/html/body/main/section/div[2]/div/div[2]/div/div[3]/form/div/div[1]/input", CEP);
            Click("/html/body/main/section/div[2]/div/div[2]/div/div[3]/form/div/div[2]/button");
        }

        protected void FinalizaCompraComplexa()
        {
            NovoEndereco();
            System.Threading.Thread.Sleep(3000);

            /* Cartão de credito*/
            for (var i = 0; i < 3; i++)
            {
                Click($"//*[@id='container-cartoes']/label[{i + 1}]");
            }

            Input("/html/body/main/section/div[2]/div/div[2]/div/div[1]/form/div/div[1]/input", "82CCF7CD");
            Click("/html/body/main/section/div[2]/div/div[2]/div/div[1]/form/div/div[2]/button");

            Input("/html/body/main/section/div[2]/div/div[2]/div/div[2]/form/div/div[1]/input", "80347");
            Click("/html/body/main/section/div[2]/div/div[2]/div/div[2]/form/div/div[2]/button");


            /* Comprar*/
            Click("/html/body/main/section/div[2]/div/div[2]/div/div[4]/div[3]/button");

            var elemnto = Element("//*[@id=\"total-pagar-cartao\"]/span");
            var numero = elemnto.Text.Replace("R$", "").Trim();
            double preco = (Double.Parse(numero) / 3);

            for (var i = 0; i < 3; i++)
            {
                Input($"//*[@id=\"swal2-html-container\"]/div/form/div[{i + 1}]/div/label/input", preco.ToString("F"));
            }

            elemnto = Element("//*[@id=\"total-pagar-cartao\"]/span");
            numero = elemnto.Text.Replace("R$", "").Trim();
            Input("//*[@id=\"swal2-html-container\"]/div/form/div[3]/div/label/input", (preco + Double.Parse(numero)).ToString("F"));


            Click("/html/body/div/div/div[6]/button[3]");
        }

        [Test]
        public void CompraSemLogin()
        {
            var cliente = new Client
            {
                Email = "tiago_assuncao@kascher.com.br",
                Senha = "m2xNzOQPfn.",
                Nome = "Tiago",
                Sobrenome = "Assunção",
                CPF = "441.739.269-28",
                RG = "22.085.455-5",
                Telefone = "(41) 3638-4325",
                Celular = "(41) 98672-8392",
                DataNascimento = new DateTime(2002, 01, 24),
                Genero = "Masculino"
            };

            var endereco = new Address
            {
                CEP = "78745-550",
                TipoLogradouro = "Rua",
                TipoResidencia = "Casa",
                Numero = "234",
                NomeEndereco = "Minha Casa"
            };

            var cartao = new Card
            {
                NomeBandeira = "Visa",
                NomeTitular = cliente.Nome + " " + cliente.Sobrenome,
                NomeCartao = "Mey Card",
                CPFTitular = cliente.CPF,
                Numero = "4485 0429 4065 4583",
                DataValidade = "12/2024",
                CodigoSeguranca = "202",
            };

            driver.Navigate().GoToUrl("http://localhost/produtos");
            System.Threading.Thread.Sleep(3000);

            SelecionaProdutos();

            /*Vai para o carrinho*/
            Click("/html/body/header/div[2]/div/div/div[3]/div/div/div[2]/a");

            /*Calcula frete */
            Input("//*[@id='lista-produtos']/div[2]/div/div[1]/div/div/div[1]/input", endereco.CEP);
            Click("//*[@id='lista-produtos']/div[2]/div/div[1]/div/div/div[2]/button");

            /*Sai do carrinho e vai para cadastro de cliente*/
            Click("//*[@id='lista-produtos']/div[2]/div/div[2]/div/div[3]/button");
            System.Threading.Thread.Sleep(3000);

            PreencheDadosPessoais(cliente);

            PreencheEndereco(endereco, "endereco-prinicpal", true);

            CartaoCredito(cartao);

            Input("[data-test-target='infomacoes-acesso'] input[name$='email']", cliente.Email, "CSS");
            Input("[data-test-target='infomacoes-acesso'] input[name$='senha']", cliente.Senha, "CSS");
            Input("[data-test-target='infomacoes-acesso'] input[name$='confirmaSenha']", cliente.Senha, "CSS");

            Click("#submit", "CSS");

            System.Threading.Thread.Sleep(3000);

            FinalizaCompra();

            System.Threading.Thread.Sleep(7000);

            Assert.Pass();
        }

        [Test]
        public void CompraComLogin()
        {
            driver.Navigate().GoToUrl("http://localhost");
            System.Threading.Thread.Sleep(3000);

            var cliente = new Client
            {
                Email = "coby.souza@icloud.com",
                Senha = "Padrao.1235"
            };

            LoginCliente(cliente);
            System.Threading.Thread.Sleep(1000);
            driver.Navigate().GoToUrl("http://localhost/produtos");

            SelecionaProdutos();

            /*Vai para o carrinho*/
            Click("/html/body/header/div[2]/div/div/div[3]/div/div/div[2]/a");

            /*Altera itens */
            for (var i = 0; i < 3; i++)
            {
                for (var x = 0; x < i; x++)
                {
                    Click($"//*[@id=\"lista-produtos\"]/div[1]/table/tbody/tr[{i + 1}]/td[3]/div/button[2]");
                }
            }

            /*Sai do carrinho e vai para compra*/
            Click("//*[@id='lista-produtos']/div[2]/div/div[2]/div/div[3]/button");
            System.Threading.Thread.Sleep(3000);

            FinalizaCompra();

            System.Threading.Thread.Sleep(7000);

            Assert.Pass();
        }

        [Test]
        public void CaminhoFeliz()
        {
            driver.Navigate().GoToUrl("http://localhost");
            System.Threading.Thread.Sleep(3000);

            var cliente = new Client
            {
                Email = "candace.pinheiro@google.com",
                Senha = "Padrao.1235"
            };

            LoginCliente(cliente);
            System.Threading.Thread.Sleep(1000);
            driver.Navigate().GoToUrl("http://localhost/produtos");

            SelecionaProdutos();

            /*Vai para o carrinho*/
            Click("/html/body/header/div[2]/div/div/div[3]/div/div/div[2]/a");

            /*Altera itens */
            for (var i = 0; i < 3; i++)
            {
                for (var x = 0; x < i; x++)
                {
                    Click($"//*[@id=\"lista-produtos\"]/div[1]/table/tbody/tr[{i + 1}]/td[3]/div/button[2]");
                }
            }

            /*Sai do carrinho e vai para compra*/
            Click("//*[@id='lista-produtos']/div[2]/div/div[2]/div/div[3]/button");
            System.Threading.Thread.Sleep(3000);

            FinalizaCompra();

            /*Caso pagamento seja recusado */
            try
            {
                var elemento = Element("//span[contains(text(), 'Pagamento Recusado')]");

                Click("//*[@id=\"refazer-pagamento\"]");
                Click("//*[@id=\"swal2-html-container\"]/div/div[1]/div/div/label[1]");
                Click("/html/body/div/div/div[6]/button[3]");
            }
            catch (Exception) { }

            var pedido = Element("/html/body/main/div[2]/div[3]/div[1]/div[1]/h2");
            var numero = String.Join("", System.Text.RegularExpressions.Regex.Split(pedido.Text, @"[^\d]"));

            AcessaAreaFuncionario(driver);

            /*Acessa tela de pedidos*/
            Click("/html/body/main/div[2]/div/div/div/div[8]/a");

            /*Aprova venda*/
            string[] etapas = { "COMPRA APROVADA", "EM PREPARAÇÃO", "A CAMINHO",
            "ENTREGUE"};

            foreach (var i in etapas)
            {
                System.Threading.Thread.Sleep(3000);
                Input(".dt-input.input", numero, "CSS");

                Click($"//*[@id='registros']/tbody/tr[1]/td[9]/div[1]/button[@data-etapa='{i}']");
                Click("/html/body/div/div/div[6]/button[3]");
            }

            System.Threading.Thread.Sleep(3000);
            Input("//*[@id='dt-search-0']", numero);

            System.Threading.Thread.Sleep(7000);

            Assert.Pass();
        }

        [Test]
        public void FluxoCompleto()
        {
            driver.Navigate().GoToUrl("http://localhost");
            System.Threading.Thread.Sleep(3000);

            var cliente = new Client
            {
                Email = "chelsea.medeiros@google.com.br",
                Senha = "Padrao.1235"
            };

            LoginCliente(cliente);
            System.Threading.Thread.Sleep(1000);
            driver.Navigate().GoToUrl("http://localhost/produtos");

            SelecionaProdutos();

            /*Vai para o carrinho*/
            Click("/html/body/header/div[2]/div/div/div[3]/div/div/div[2]/a");

            /*Altera itens */
            for (var i = 0; i < 3; i++)
            {
                var cliques = (i == 0 ? 2 : i == 1 ? 1 : 4);

                for (var x = 0; x < cliques; x++)
                {
                    Click($"//*[@id=\"lista-produtos\"]/div[1]/table/tbody/tr[{i + 1}]/td[3]/div/button[2]");
                }
            }

            /*Sai do carrinho e vai para compra*/
            Click("//*[@id='lista-produtos']/div[2]/div/div[2]/div/div[3]/button");
            System.Threading.Thread.Sleep(3000);

            FinalizaCompraComplexa();

            /*Caso pagamento seja recusado */
            try
            {
                var elemento = Element("//span[contains(text(), 'Pagamento Recusado')]");

                Click("//*[@id=\"refazer-pagamento\"]");
                Click("//*[@id=\"swal2-html-container\"]/div/div[1]/div/div/label[1]");
                Click("/html/body/div/div/div[6]/button[3]");
            }
            catch (Exception) { }

            var pedido = Element("/html/body/main/div[2]/div[3]/div[1]/div[1]/h2");
            var numero = String.Join("", System.Text.RegularExpressions.Regex.Split(pedido.Text, @"[^\d]"));

            AcessaAreaFuncionario(driver);

            /*Acessa tela de pedidos*/
            Click("/html/body/main/div[2]/div/div/div/div[8]/a");

            /*Aprova venda*/
            string[] etapas = { "COMPRA APROVADA", "EM PREPARAÇÃO", "A CAMINHO",
            "ENTREGUE"};

            foreach (var i in etapas)
            {
                System.Threading.Thread.Sleep(3000);
                Input(".dt-input.input", numero, "CSS");

                Click($"//*[@id='registros']/tbody/tr[1]/td[9]/div[1]/button[@data-etapa='{i}']");
                Click("/html/body/div/div/div[6]/button[3]");
            }

            System.Threading.Thread.Sleep(3000);
            Click("//*[@id=\"sair\"]");

            LoginCliente(cliente);

            /*Solicita troca*/
            Click("/html/body/main/div[2]/div/div[1]/div/div[1]/a");
            Click($"//span[contains(text(), '#{numero}')]");
            Click("//*[@id='solicitar-troca']");

            for (var i = 0; i < 3; i++)
            {
                Click($"//*[@id=\"from-solicitacao\"]/div[1]/table/tbody/tr[{i + 2}]/td[1]/div/label/input");
            }

            Input("//*[@id=\"from-solicitacao\"]/div[2]/label/textarea", "Solictando troca de teste");
            Click("/html/body/div/div/div[6]/button[3]");

            var texto = Element("/html/body/main/div[2]/div[1]/div/p").Text;
            var solicitacao = String.Join("", System.Text.RegularExpressions.Regex.Split(texto, @"[^\d]"));

            AcessaAreaFuncionario(driver);

            /*Acessa tela de solicitações*/
            Click("/html/body/main/div[2]/div/div/div/div[2]/a");
            Click($"//h2[contains(text(), 'Nº da Solicitação #{solicitacao}')]");

            for (var i = 0; i < 3; i++)
            {
                Click($"/html/body/main/div[2]/div[1]/form/div/table/tbody/tr[{i + 1}]/td[8]/div[2]/button");
                Click("/html/body/div/div/div[6]/button[3]");
                System.Threading.Thread.Sleep(1000);
            }

            System.Threading.Thread.Sleep(3000);
            Click("//*[@id=\"sair\"]");

            LoginCliente(cliente);
            Click("/html/body/main/div[2]/div/div[1]/div/div[3]/a");
            Click($"//h2[contains(text(), 'Nº da Solicitação #{solicitacao}')]");

            for (var i = 0; i < 3; i++)
            {
                Click($"/html/body/main/div[2]/div[1]/form/div/table/tbody/tr[{i + 1}]/td[8]/div[2]/button");
                Click("/html/body/div/div/div[6]/button[3]");
                System.Threading.Thread.Sleep(1000);
            }

            AcessaAreaFuncionario(driver);

            /*Acessa tela de solicitações*/
            Click("/html/body/main/div[2]/div/div/div/div[2]/a");
            Click($"//h2[contains(text(), 'Nº da Solicitação #{solicitacao}')]");

            for (var x = 0; x < 2; x++)
                for (var i = 0; i < 3; i++)
                {
                    Click($"/html/body/main/div[2]/div[1]/form/div/table/tbody/tr[{i + 1}]/td[8]/div/button");
                    Click("/html/body/div/div/div[6]/button[3]");
                    System.Threading.Thread.Sleep(1000);
                }

            System.Threading.Thread.Sleep(3000);
            Click("//*[@id=\"sair\"]");

            LoginCliente(cliente);
            Click("/html/body/main/div[2]/div/div[1]/div/div[5]/a");

            texto = Element("/html/body/main/div[2]/div/form/div/table/tbody/tr[3]/td[1]").Text;
            System.Threading.Thread.Sleep(1000);
            driver.Navigate().GoToUrl("http://localhost/produtos");

            Random num = new Random();
            Click($"//*[@id='shop-content']/div/div/div[{num.Next(1, 10)}]/div/div[2]/h4/a");
            Click("/html/body/main/div[2]/div[2]/form/button[1]");

            Click("//*[@id=\"container-enderecos\"]/div[1]/label");
            var CEP = Element("//*[@id=\"container-enderecos\"]/div[1]/label/div/div/div[1]").Text;
            Input("/html/body/main/section/div[2]/div/div[2]/div/div[3]/form/div/div[1]/input", CEP);
            Click("/html/body/main/section/div[2]/div/div[2]/div/div[3]/form/div/div[2]/button");

            Click("//*[@id='container-cartoes']/label[1]");

            Input("/html/body/main/section/div[2]/div/div[2]/div/div[2]/form/div/div[1]/input", texto);
            Click("/html/body/main/section/div[2]/div/div[2]/div/div[2]/form/div/div[2]/button");

            System.Threading.Thread.Sleep(3000);
            Click("/html/body/main/section/div[2]/div/div[2]/div/div[4]/div[3]/button");

            System.Threading.Thread.Sleep(7000);

            Assert.Pass();
        }

        [TearDown]
        public void TearDown()
        {
            // Encerrar o WebDriver
            if (driver != null)
            {
                driver.Quit();
            }
        }
    }
}
