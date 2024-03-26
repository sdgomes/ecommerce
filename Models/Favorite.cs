using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Models
{
    public class Favorite
    {
    [Column("ID_FAVORITO")]
    public long IdFavorito {get; set;}

    [Column("ID_CLIENTE")]
    public long IdCliente {get; set;}

    [Column("ID_PRODUTO")]
    public long IdProduto {get; set;}

    [Column("REMOVIDO")]
    public bool Removido {get; set;}

    [Column("CRIACAO")]
    public DateTime Criacao  {get; set;}

    }
}