using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DTO
{
    public class CreateClientDTO
    {
        [Column("ID_USUARIO")]
        public long IdUsuario { get; set; }

        [Column("EMAIL")]
        public string Email { get; set; }

        [Column("SENHA")]
        public string Senha { get; set; }

        [Column("TIPO")]
        public string Tipo { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }
        public string confirmaSenha { get; set; }

        [Column("ID_CLIENTE")]
        public long IdCliente { get; set; }

        [Column("CODIGO")]
        public string Codigo { get; set; }

        [Column("NOME")]
        public string Nome { get; set; }

        [Column("SOBRENOME")]
        public string Sobrenome { get; set; }

        [Column("CPF")]
        public string CPF { get; set; }

        [Column("DATA_NASCIMENTO")]
        public DateTime DataNascimento { get; set; }

        [Column("RG")]
        public string RG { get; set; }

        [Column("TELEFONE")]
        public string Telefone { get; set; }

        [Column("CELULAR")]
        public string Celular { get; set; }

        [Column("SITUACAO")]
        public bool Situacao { get; set; }

        [Column("GENERO")]
        public string Genero { get; set; }
        [Column("ID_CARTAO")]
        public long IdCartao { get; set; }

        [Column("ID_CLIENTE")]
        public long IdCliente { get; set; }

        [Column("ID_BANDEIRA")]
        public long IdBandeira { get; set; }

        [Column("NOME_TITULAR")]
        public string NomeTitular { get; set; }

        [Column("TIPO")]
        public string Tipo { get; set; }

        [Column("CPF_TITULAR")]
        public string CPFTitular { get; set; }

        [Column("NUMERO")]
        public string Numero { get; set; }

        [Column("DATA_VALIDADE")]
        public string DataValidade { get; set; }

        [Column("CODIGO_SEGURANCA")]
        public string CodigoSeguranca { get; set; }

        [Column("NOME")]
        public string NomeBandeira { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }
        [Column("ID_ENDERECO")]
        public long IdEndereco { get; set; }

        [Column("ID_CLIENTE")]
        public long IdCliente { get; set; }

        [Column("CEP")]
        public string CEP { get; set; }

        [Column("TIPO_LOGRADOURO")]
        public string TipoLogradouro { get; set; }

        [Column("TIPO_ENDERECO")]
        public string TipoEndereco { get; set; }

        [Column("TIPO_RESIDENCIA")]
        public string TipoResidencia { get; set; }

        [Column("LOGRADOURO")]
        public string Logradouro { get; set; }

        [Column("BAIRRO")]
        public string Bairro { get; set; }

        [Column("CIDADE")]
        public string Cidade { get; set; }

        [Column("ESTADO")]
        public string Estado { get; set; }

        [Column("NOME_ENDERECO")]
        public string NomeEndereco { get; set; }

        [Column("FRASE")]
        public string Frase { get; set; }

        [Column("PRINCIPAL")]
        public bool Principal { get; set; }

        [Column("COBRANCA")]
        public bool Cobranca { get; set; }

        [Column("COMPLEMENTO")]
        public string Complemento { get; set; }

        [Column("NUMERO")]
        public string Numero { get; set; }

        [Column("PAIS")]
        public string Pais { get; set; }

        [Column("CRIACAO")]
        public DateTime Criacao { get; set; }

    }
}
