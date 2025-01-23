using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using System;
using TestEcommerceNUnit.Models;
using SeleniumExtras.WaitHelpers;

namespace TestEcommerceNUnit
{
    public class ClienteTest : SeleniumActions
    {
        private IWebDriver driver;

        public ClienteTest() { }

        public ClienteTest(IWebDriver _driver)
        {
            driver = _driver;
        }

        [SetUp]
        public void Setup()
        {
            driver = new ChromeDriver();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(20);
            driver.Manage().Window.Maximize();

            wait = new WebDriverWait(driver, TimeSpan.FromSeconds(20));
        }

        [Test]
        public void Cadastro()
        {
            try
            {
                driver.Navigate().GoToUrl("http://localhost/cadastro/cliente");
                System.Threading.Thread.Sleep(1000);

                var cliente = new Client
                {
                    Email = "sabrina.alessandra@gmail.com.br",
                    Senha = "2hAxOT85kf.",
                    Nome = "Sabrina",
                    Sobrenome = "Alessandra",
                    CPF = "874.973.127-07",
                    RG = "22.799.219-2",
                    Telefone = "(22) 3720-7677",
                    Celular = "(22) 98229-4728",
                    DataNascimento = new DateTime(1994, 06, 17),
                    Genero = "Feminino"
                };

                PreencheDadosPessoais(cliente);

                var endereco = new Address
                {
                    CEP = "78745-550",
                    TipoLogradouro = "Rua",
                    TipoResidencia = "Casa",
                    Numero = "234",
                    NomeEndereco = "Minha Casa"
                };

                PreencheEndereco(endereco, "endereco-prinicpal");

                var cartao = new Card
                {
                    NomeBandeira = "Mastercard",
                    NomeTitular = cliente.Nome + " " + cliente.Sobrenome,
                    NomeCartao = "NuCard",
                    CPFTitular = cliente.CPF,
                    Numero = "5424 0385 5545 9947",
                    DataValidade = "02/2025",
                    CodigoSeguranca = "746"
                };

                CartaoCredito(cartao);

                endereco = new Address
                {
                    CEP = "60055-100",
                    TipoLogradouro = "Rua",
                    TipoResidencia = "Apartamento",
                    Numero = "S/N",
                    NomeEndereco = "Casa da tia"
                };

                PreencheEndereco(endereco, "endereco-cobranca");

                Input("[data-test-target='infomacoes-acesso'] input[name$='email']", cliente.Email, "CSS");
                Input("[data-test-target='infomacoes-acesso'] input[name$='senha']", cliente.Senha, "CSS");
                Input("[data-test-target='infomacoes-acesso'] input[name$='confirmaSenha']", cliente.Senha, "CSS");

                Click("#submit", "CSS");

                System.Threading.Thread.Sleep(7000);

                Assert.Pass();
            }
            catch (AssertionException ex)
            {
                Console.WriteLine($"Erro de asserção: {ex.Message}");
                throw;
            }
        }

        [Test]
        public void Buscar()
        {
            try
            {
                driver.Navigate().GoToUrl("http://localhost");
                System.Threading.Thread.Sleep(1000);

                var cliente = new Client
                {
                    Email = "candace.pinheiro@google.com",
                    Senha = "Padrao.1235"
                };

                LoginCliente(cliente);

                System.Threading.Thread.Sleep(7000);

                Assert.Pass();
            }
            catch (AssertionException ex)
            {
                Console.WriteLine($"Erro de asserção: {ex.Message}");
                throw;
            }
        }

        [Test]
        public void Editar()
        {
            driver.Navigate().GoToUrl("http://localhost");

            var cliente = new Client
            {
                Email = "sabrina.alessandra@gmail.com.br",
                Senha = "2hAxOT85kf."
            };

            LoginCliente(cliente);

            Click("/html/body/main/div[2]/div/div[1]/div/div[2]/a");
            Click("/html/body/main/div[2]/div[2]/div[1]/div[2]/div/button");

            cliente = new Client
            {
                Nome = "Geraldo",
                Sobrenome = "Vitor Jesus",
                CPF = "332.318.701-60",
                RG = "47.672.922-1",
                Telefone = "(65) 3832-7624",
                Celular = "(65) 98321-5187",
                DataNascimento = new DateTime(1990, 03, 18),
                Genero = "Masculino"
            };

            Input("#form-altera-cliente input[name$='nome']", cliente.Nome, "CSS");
            Input("#form-altera-cliente input[name$='sobrenome']", cliente.Sobrenome, "CSS");
            Input("#form-altera-cliente input[name$='cpf']", cliente.CPF, "CSS");
            Input("#form-altera-cliente input[name$='celular']", cliente.Celular, "CSS");
            Input("#form-altera-cliente input[name$='telefone']", cliente.Telefone, "CSS");
            Input("#form-altera-cliente input[name$='rg']", cliente.RG, "CSS");
            Input("#form-altera-cliente input[name$='dataNascimento']", cliente.DataNascimento.ToString("d"), "CSS");

            Select("#form-altera-cliente select[name$='genero']", cliente.Genero, "CSS");

            Click("/html/body/div/div/div[6]/button[3]");

            System.Threading.Thread.Sleep(7000);

            Assert.Pass();
        }

        [Test]
        public void Apagar()
        {
            driver.Navigate().GoToUrl("http://localhost");

            var cliente = new Client
            {
                Email = "sabrina.alessandra@gmail.com.br",
                Senha = "2hAxOT85kf."
            };

            LoginCliente(cliente);

            Click("#excluir-conta", "CSS");
            Click("/html/body/div/div/div[6]/button[3]");

            System.Threading.Thread.Sleep(7000);

            Assert.Pass();
        }

        [TearDown]
        public void TearDown()
        {
            driver?.Quit();
        }
    }
}
