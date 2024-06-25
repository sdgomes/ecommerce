using Ecommerce.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Models.ModelView
{
    public class ProdutoView
    {
        public List<ImageDTO> Imagens { get; set; }

        public ProductDTO Produto { get; set; }
    }
}
