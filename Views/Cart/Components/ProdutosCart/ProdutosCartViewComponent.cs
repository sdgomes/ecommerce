using crm.DAL;
using crm.DTO;
using crm.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace crm.Views.Cart.Components.ProdutosCart
{
    [ViewComponent(Name = "ProdutosCart")]
    public class ProdutosCartViewComponent : ViewComponent
    {
        public IViewComponentResult Invoke(List<Product> Produtos)
        {
            try
            {
                var IdsProdutos = String.Join(", ", Produtos.Select(x => x.IdProduto.ToString()).ToArray());

                ViewProdutosCart Model = new();
                if (IdsProdutos != "")
                {
                    Model.Produtos = ProductDAO.SelectProductsByInId(IdsProdutos);
                    foreach (var Item in Model.Produtos)
                    {
                        Product Produto = Produtos.Where(x => x.IdProduto == Item.IdProduto).FirstOrDefault();
                        Item.QntCompra = Produto.QntCompra;
                    }
                }

                return View(Model);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }

    public class ViewProdutosCart
    {
        public List<ProductDTO> Produtos { get; set; }


        public double Subtotal()
        {
            if (Produtos == null)
                return 0;

            return Produtos.Sum(x => x.QntCompra * x.Preco);
        }

        public double Descontos()
        {
            if (Produtos == null)
                return 0;

            return Produtos.Where(x => x.Desconto).Sum(x => x.QntCompra * x.CalculoDesconto);
        }

        public double Total()
        {
            return Subtotal() - Descontos();
        }
    }
}