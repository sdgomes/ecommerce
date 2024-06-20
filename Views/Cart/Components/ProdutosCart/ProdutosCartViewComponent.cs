﻿using crm.DAL;
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
                    Model.Products = ProductDAO.SelectProductsByInId(IdsProdutos);
                    foreach (var Item in Model.Products)
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
        public List<ProductDTO> Products { get; set; }
    }
}