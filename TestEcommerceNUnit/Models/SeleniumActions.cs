using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using SeleniumExtras.WaitHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestEcommerceNUnit.Models
{
    public class SeleniumActions
    {
        protected WebDriverWait wait;

        protected void Input(string caminho, string texto, string buscar = "")
        {
            By buscador = By.XPath(caminho);

            switch (buscar)
            {
                case "CSS":
                    buscador = By.CssSelector(caminho);
                    break;
            }

            var input = wait.Until(ExpectedConditions.ElementIsVisible(buscador));
            input.Clear();
            input.SendKeys(texto);
            System.Threading.Thread.Sleep(1000);
        }

        protected void Select(string caminho, string texto, string buscar = "")
        {
            By buscador = By.XPath(caminho);

            switch (buscar)
            {
                case "CSS":
                    buscador = By.CssSelector(caminho);
                    break;
            }

            var selectElement = new SelectElement(wait.Until(ExpectedConditions.ElementIsVisible(buscador)));
            selectElement.SelectByText(texto);
            System.Threading.Thread.Sleep(1000);
        }

        protected void Click(string caminho, string buscar = "")
        {
            By buscador = By.XPath(caminho);

            switch (buscar)
            {
                case "CSS":
                    buscador = By.CssSelector(caminho);
                    break;
            }

            wait.Until(ExpectedConditions.ElementToBeClickable(buscador)).Click();
            System.Threading.Thread.Sleep(1000);
        }

        protected IWebElement Element(string caminho, string buscar = "")
        {
            By buscador = By.XPath(caminho);

            switch (buscar)
            {
                case "CSS":
                    buscador = By.CssSelector(caminho);
                    break;
            }

            var element = wait.Until(ExpectedConditions.ElementIsVisible(buscador));
            return element;
        }

        public void PreencheDadosPessoais(Client cliente)
        {
            Input("[data-test-target='dados-cadastrais'] input[name$='.nome']", cliente.Nome, "CSS");
            Input("[data-test-target='dados-cadastrais'] input[name$='.sobrenome']", cliente.Sobrenome, "CSS");
            Input("[data-test-target='dados-cadastrais'] input[name$='cpf']", cliente.CPF, "CSS");
            Input("[data-test-target='dados-cadastrais'] input[name$='celular']", cliente.Celular, "CSS");
            Input("[data-test-target='dados-cadastrais'] input[name$='telefone']", cliente.Telefone, "CSS");
            Input("[data-test-target='dados-cadastrais'] input[name$='rg']", cliente.RG, "CSS");
            Input("[data-test-target='dados-cadastrais'] input[name$='dataNascimento']", cliente.DataNascimento.ToString("d"), "CSS");

            Select("[data-test-target='dados-cadastrais'] select[name$='genero']", cliente.Genero, "CSS");

            Click("[data-test-target='dados-cadastrais'] [data-action='next']", "CSS");
        }

        public void PreencheEndereco(Address endereco, string tipo, bool pulaCobranca = false)
        {
            Input($"[data-test-target='{tipo}'] input[name$='cep']", endereco.CEP, "CSS");
            Click($"[data-test-target='{tipo}'] .viacep", "CSS");

            Select($"[data-test-target='{tipo}'] select[name$='tipoLogradouro']", endereco.TipoLogradouro, "CSS");
            Select($"[data-test-target='{tipo}'] select[name$='tipoResidencia']", endereco.TipoResidencia, "CSS");

            Input($"[data-test-target='{tipo}'] input[name$='numero']", endereco.Numero, "CSS");
            Input($"[data-test-target='{tipo}'] input[name$='nomeEndereco']", endereco.NomeEndereco, "CSS");

            if (pulaCobranca)
                Click("/html/body/main/div[2]/form/div[2]/div[2]/div[1]/div[2]/div/label");

            Click($"[data-test-target='{tipo}'] [data-action='next']", "CSS");
        }

        public void CartaoCredito(Card cartao)
        {
            Select("[data-test-target='informacoes-pagamento'] select[name$='idBandeira']", cartao.NomeBandeira, "CSS");
            Input("[data-test-target='informacoes-pagamento'] input[name$='nomeTitular']", cartao.NomeTitular, "CSS");
            Input("[data-test-target='informacoes-pagamento'] input[name$='nomeCartao']", cartao.NomeCartao, "CSS");
            Input("[data-test-target='informacoes-pagamento'] input[name$='CPFTitular']", cartao.CPFTitular, "CSS");
            Input("[data-test-target='informacoes-pagamento'] input[name$='numero']", cartao.Numero, "CSS");
            Input("[data-test-target='informacoes-pagamento'] input[name$='mes']", cartao.DataValidade.Split("/")[0], "CSS");
            Input("[data-test-target='informacoes-pagamento'] input[name$='ano']", cartao.DataValidade.Split("/")[1], "CSS");
            Input("[data-test-target='informacoes-pagamento'] input[name$='codigoSeguranca']", cartao.CodigoSeguranca, "CSS");

            Click("[data-test-target='informacoes-pagamento'] [data-action='next']", "CSS");
        }

        public void LoginCliente(Client cliente)
        {
            Click("#entrar", "CSS");

            Input("//*[@id='login-cliente']/label[1]/label/input", cliente.Email);
            Input("//*[@id='login-cliente']/label[2]/label/input", cliente.Senha);

            Click("/html/body/div/div/div[6]/button[1]");
        }


        public void AcessaAreaFuncionario(IWebDriver driver)
        {
            IJavaScriptExecutor js = (IJavaScriptExecutor)driver;
            js.ExecuteScript("window.scrollTo(0, document.body.scrollHeight);");
            System.Threading.Thread.Sleep(1000);

            Click("//*[@id='acesso']");

            Input("//*[@id='form-acesso']/div/input", "FUV05HRO6BN");
            Click("//*[@id='acessar']");
        }

    }
}
