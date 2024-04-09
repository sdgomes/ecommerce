﻿using ecommerce.DAL;
using ecommerce.Models;
using ecommerce.Models.ModelView;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace ecommerce.BLL
{
    public class ProductBLL
    {
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
    }
}
