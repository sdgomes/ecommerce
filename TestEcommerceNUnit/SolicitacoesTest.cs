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
    class SolicitacoesTest : SeleniumActions
    {
        private IWebDriver driver;

        [SetUp]
        public void Setup()
        {
            driver = new ChromeDriver();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);
            driver.Manage().Window.Maximize();

            wait = new WebDriverWait(driver, TimeSpan.FromSeconds(15));
        }

        [Test]
        public void SolicitarTrocaRecusada()
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

            Click("/html/body/main/div[2]/div/div[1]/div/div[1]/a");
            Click("//span[contains(text(), 'ENTREGUE')]");
            Click("//*[@id='solicitar-troca']");

            Click("//*[@id=\"from-solicitacao\"]/div[1]/table/tbody/tr[1]/td[1]/div/label");

            Input("//*[@id=\"from-solicitacao\"]/div[2]/label/textarea", "Solictando troca de teste, recusa");
            Click("/html/body/div/div/div[6]/button[3]");

            var texto = Element("/html/body/main/div[2]/div[1]/div/p").Text;
            var solicitacao = String.Join("", System.Text.RegularExpressions.Regex.Split(texto, @"[^\d]"));

            AcessaAreaFuncionario(driver);

            /*Acessa tela de solicitações*/
            Click("/html/body/main/div[2]/div/div/div/div[2]/a");
            Click($"//h2[contains(text(), 'Nº da Solicitação #{solicitacao}')]");


            Click("/html/body/main/div[2]/div[1]/form/div/table/tbody/tr/td[8]/div[1]/button");
            Click("/html/body/div/div/div[6]/button[3]");
            System.Threading.Thread.Sleep(1000);

            Input("//*[@id=\"from-solicitacao\"]/div/label/textarea", "Solicitação de troca de teste, recusada.");
            Click("/html/body/div/div/div[6]/button[3]");

            System.Threading.Thread.Sleep(7000);

            Assert.Pass();
        }

        [Test]
        public void SolicitarTroca()
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

            Click("/html/body/main/div[2]/div/div[1]/div/div[1]/a");
            Click("//span[contains(text(), 'ENTREGUE')]");
            Click("//*[@id='solicitar-troca']");

            Click("//*[@id=\"from-solicitacao\"]/div[1]/table/tbody/tr[1]/td[1]/div/label");

            Input("//*[@id=\"from-solicitacao\"]/div[2]/label/textarea", "Solictando troca de teste, aprovação");
            Click("/html/body/div/div/div[6]/button[3]");

            var texto = Element("/html/body/main/div[2]/div[1]/div/p").Text;
            var solicitacao = String.Join("", System.Text.RegularExpressions.Regex.Split(texto, @"[^\d]"));

            AcessaAreaFuncionario(driver);

            /*Acessa tela de solicitações*/
            Click("/html/body/main/div[2]/div/div/div/div[2]/a");
            Click($"//h2[contains(text(), 'Nº da Solicitação #{solicitacao}')]");


            Click("/html/body/main/div[2]/div[1]/form/div/table/tbody/tr/td[8]/div[2]/button");
            Click("/html/body/div/div/div[6]/button[3]");
            System.Threading.Thread.Sleep(1000);

            Click("//*[@id=\"sair\"]");

            LoginCliente(cliente);
            Click("/html/body/main/div[2]/div/div[1]/div/div[3]/a");
            Click($"//h2[contains(text(), 'Nº da Solicitação #{solicitacao}')]");

            Click($"/html/body/main/div[2]/div[1]/form/div/table/tbody/tr[1]/td[8]/div[2]/button");
            Click("/html/body/div/div/div[6]/button[3]");
            System.Threading.Thread.Sleep(1000);

            AcessaAreaFuncionario(driver);

            /*Acessa tela de solicitações*/
            Click("/html/body/main/div[2]/div/div/div/div[2]/a");
            Click($"//h2[contains(text(), 'Nº da Solicitação #{solicitacao}')]");

            for (var x = 0; x < 2; x++)
            {
                Click($"/html/body/main/div[2]/div[1]/form/div/table/tbody/tr[1]/td[8]/div/button");
                Click("/html/body/div/div/div[6]/button[3]");
                System.Threading.Thread.Sleep(1000);
            }

            Click("//*[@id=\"sair\"]");

            LoginCliente(cliente);
            Click("/html/body/main/div[2]/div/div[1]/div/div[5]/a");

            System.Threading.Thread.Sleep(7000);

            Assert.Pass();
        }

        [Test]
        public void SolicitarDevolucaoRecusada()
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

            Click("/html/body/main/div[2]/div/div[1]/div/div[1]/a");
            Click("//span[contains(text(), 'ENTREGUE')]");
            Click("//*[@id='solicitar-devolucao']");

            Click("//*[@id=\"from-solicitacao\"]/div[1]/table/tbody/tr[2]/td[1]/div/label");

            Input("//*[@id=\"from-solicitacao\"]/div[2]/label/textarea", "Solictando devolução de teste, aprovação");
            Click("/html/body/div/div/div[6]/button[3]");

            var texto = Element("/html/body/main/div[2]/div[1]/div/p").Text;
            var solicitacao = String.Join("", System.Text.RegularExpressions.Regex.Split(texto, @"[^\d]"));

            AcessaAreaFuncionario(driver);

            /*Acessa tela de solicitações*/
            Click("/html/body/main/div[2]/div/div/div/div[3]/a");
            Click($"//h2[contains(text(), 'Nº da Solicitação #{solicitacao}')]");


            Click("/html/body/main/div[2]/div[1]/form/div/table/tbody/tr/td[8]/div[1]/button");
            Click("/html/body/div/div/div[6]/button[3]");
            System.Threading.Thread.Sleep(1000);

            Input("//*[@id=\"from-solicitacao\"]/div/label/textarea", "Solicitação de devolução de teste, recusada.");
            Click("/html/body/div/div/div[6]/button[3]");

            System.Threading.Thread.Sleep(7000);

            Assert.Pass();
        }

        [Test]
        public void SolicitarDevolucao()
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

            Click("/html/body/main/div[2]/div/div[1]/div/div[1]/a");
            Click("//span[contains(text(), 'ENTREGUE')]");
            Click("//*[@id='solicitar-devolucao']");

            Click("//*[@id=\"from-solicitacao\"]/div[1]/table/tbody/tr[2]/td[1]/div/label");

            Input("//*[@id=\"from-solicitacao\"]/div[2]/label/textarea", "Solictando devolucao de teste, aprovação");
            Click("/html/body/div/div/div[6]/button[3]");

            var texto = Element("/html/body/main/div[2]/div[1]/div/p").Text;
            var solicitacao = String.Join("", System.Text.RegularExpressions.Regex.Split(texto, @"[^\d]"));

            AcessaAreaFuncionario(driver);

            /*Acessa tela de solicitações*/
            Click("/html/body/main/div[2]/div/div/div/div[3]/a");
            Click($"//h2[contains(text(), 'Nº da Solicitação #{solicitacao}')]");


            Click("/html/body/main/div[2]/div[1]/form/div/table/tbody/tr/td[8]/div[2]/button");
            Click("/html/body/div/div/div[6]/button[3]");
            System.Threading.Thread.Sleep(1000);

            Click("//*[@id=\"sair\"]");

            LoginCliente(cliente);
            Click("/html/body/main/div[2]/div/div[1]/div/div[4]/a");
            Click($"//h2[contains(text(), 'Nº da Solicitação #{solicitacao}')]");

            Click($"/html/body/main/div[2]/div[1]/form/div/table/tbody/tr[1]/td[8]/div[2]/button");
            Click("/html/body/div/div/div[6]/button[3]");
            System.Threading.Thread.Sleep(1000);

            AcessaAreaFuncionario(driver);

            /*Acessa tela de solicitações*/
            Click("/html/body/main/div[2]/div/div/div/div[3]/a");
            Click($"//h2[contains(text(), 'Nº da Solicitação #{solicitacao}')]");

            for (var x = 0; x < 2; x++)
            {
                Click($"/html/body/main/div[2]/div[1]/form/div/table/tbody/tr[1]/td[8]/div/button");
                Click("/html/body/div/div/div[6]/button[3]");
                System.Threading.Thread.Sleep(1000);
            }

            Click("//*[@id=\"sair\"]");

            LoginCliente(cliente);
            Click("/html/body/main/div[2]/div/div[1]/div/div[5]/a");

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
