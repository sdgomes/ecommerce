using ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DTO
{
    public class ImageDTO : Image
    {
        public string ImageSource
        {
            get
            {
                return "data:image/webp;base64," + Convert.ToBase64String(Imagem);
            }
        }
    }
}
