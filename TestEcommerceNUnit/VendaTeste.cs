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
    class VendaTeste : SeleniumActions
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
        public void AprovaVenda()
        {
            driver.Navigate().GoToUrl("http://localhost");
            System.Threading.Thread.Sleep(3000);

            AcessaAreaFuncionario(driver);
            Click("/html/body/main/div[2]/div/div/div/div[8]/a");

            /*Aprova venda*/
            string[] etapas = { "COMPRA APROVADA", "EM PREPARAÇÃO", "A CAMINHO",
            "ENTREGUE"};

            System.Threading.Thread.Sleep(3000);
            Input(".dt-input.input", "Processando Pagamento", "CSS");
            System.Threading.Thread.Sleep(3000);

            var numero = Element("//*[@id=\"registros\"]/tbody/tr[1]/td[1]").Text;

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
