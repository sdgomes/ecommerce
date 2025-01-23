using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Models
{
    public class Gender
    {
        [Column("ID_GENERO")]
        public long IdGenero { get; set; }

        [Column("NOME")]
        public string Nome { get; set; }

        [Column("CHAVE")]
        public string Chave { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }
    }

    public class TypeOfAddress
    {
        [Column("ID_TIPO_LOGRADOURO")]
        public long IdTipoLogradouro { get; set; }

        [Column("NOME")]
        public string Nome { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }
    }

    public class TypeOfResidence
    {
        [Column("ID_TIPO_RESIDENCIA")]
        public long IdTipoResidencia { get; set; }

        [Column("NOME")]
        public string Nome { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }
    }

    public class State
    {
        [Column("ID_ESTADO")]
        public long IdEstado { get; set; }

        [Column("NOME")]
        public string Nome { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }
    }

    public class AddressDataDTO
    {
        public List<TypeOfAddress> TypesOfAddresses { get; set; }

        public List<TypeOfResidence> TypesOfResidences { get; set; }

        public List<State> States { get; set; }
    }
}