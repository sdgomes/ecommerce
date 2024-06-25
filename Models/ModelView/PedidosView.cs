using Ecommerce.DAL;
using Ecommerce.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Models.ModelView
{
    public class PedidosView
    {
        public Client Cliente { get; set; }

        public List<TransactionDTO> TransacoesDatas { get; set; }

        public List<TransactionDTO> GetPedidos(DateTime Data, long IdCliente)
        {
            return TransactionDAO.SelectByCodigoData(Data, IdCliente);
        }

        public List<ProductDTO> GetProdutos(long IdTransacao)
        {
            return ProductDAO.ImagensCapaPedido(IdTransacao);
        }
    }
}
