using ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DAL
{
    public class AddressDAO : BaseDAO
    {
        public static long CreateAddress(long IdCliente, Address address)
        {
            try
            {
                string query = @$"BEGIN
	                                IF NOT EXISTS (SELECT ID_ENDERECO FROM ECM_ENDERECOS WHERE CEP = @CEP OR (LOGRADOURO = @LOGRADOURO AND NUMERO = @NUMERO)) 
	                                BEGIN
		                                INSERT INTO ECM_ENDERECOS (ID_CLIENTE, CEP, TIPO_LOGRADOURO, TIPO_ENDERECO, TIPO_RESIDENCIA,
		                                LOGRADOURO, BAIRRO, CIDADE, ESTADO, NOME_ENDERECO, FRASE, PRINCIPAL, COBRANCA, COMPLEMENTO,
		                                NUMERO, PAIS)
		                                OUTPUT Inserted.ID_ENDERECO
		                                VALUES (@ID_CLIENTE, @CEP, @TIPO_LOGRADOURO, @TIPO_ENDERECO, @TIPO_RESIDENCIA,
		                                @LOGRADOURO, @BAIRRO, @CIDADE, @ESTADO, @NOME_ENDERECO, @FRASE, @PRINCIPAL, @COBRANCA, @COMPLEMENTO,
		                                @NUMERO, @PAIS)
	                                END
                                END;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                    new SqlParameter("@CEP", I(address.CEP)),
                    new SqlParameter("@TIPO_LOGRADOURO", I(address.TipoLogradouro)),
                    new SqlParameter("@TIPO_ENDERECO", I(address.TipoEndereco)),
                    new SqlParameter("@TIPO_RESIDENCIA ", I(address.TipoResidencia)),
                    new SqlParameter("@LOGRADOURO", I(address.Logradouro)),
                    new SqlParameter("@BAIRRO", I(address.Bairro)),
                    new SqlParameter("@CIDADE", I(address.Cidade)),
                    new SqlParameter("@ESTADO", I(address.Estado)),
                    new SqlParameter("@NOME_ENDERECO", I(address.NomeEndereco)),
                    new SqlParameter("@FRASE", I(address.Frase)),
                    new SqlParameter("@PRINCIPAL", I(address.Principal)),
                    new SqlParameter("@COBRANCA", I(address.Cobranca)),
                    new SqlParameter("@COMPLEMENTO ", I(address.Complemento)),
                    new SqlParameter("@NUMERO", I(address.Numero)),
                    new SqlParameter("@PAIS", I(address.Pais)),
                };

                return DatabaseProgramas().ChoosePrimitiveType<long>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void UpdateAddress(long IdEndereco, Address address)
        {
            try
            {
                string query = @$"UPDATE ECM_ENDERECOS SET CEP = @CEP, TIPO_LOGRADOURO = @TIPO_LOGRADOURO, TIPO_ENDERECO = @TIPO_ENDERECO, TIPO_RESIDENCIA = @TIPO_RESIDENCIA,
                LOGRADOURO = @LOGRADOURO, BAIRRO = @BAIRRO, CIDADE = @CIDADE, ESTADO = @ESTADO, NOME_ENDERECO = @NOME_ENDERECO,
                FRASE = @FRASE, PRINCIPAL = @PRINCIPAL, COBRANCA = @COBRANCA, COMPLEMENTO = @COMPLEMENTO, NUMERO = @NUMERO, PAIS = @PAIS
                WHERE ID_ENDERECO = @ID_ENDERECO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_ENDERECO", IdEndereco),
                    new SqlParameter("@CEP", address.CEP),
                    new SqlParameter("@TIPO_LOGRADOURO", address.TipoLogradouro),
                    new SqlParameter("@TIPO_ENDERECO", address.TipoEndereco),
                    new SqlParameter("@TIPO_RESIDENCIA ", address.TipoResidencia),
                    new SqlParameter("@LOGRADOURO", address.Logradouro),
                    new SqlParameter("@BAIRRO", address.Bairro),
                    new SqlParameter("@CIDADE", address.Cidade),
                    new SqlParameter("@ESTADO", address.Estado),
                    new SqlParameter("@NOME_ENDERECO", address.NomeEndereco),
                    new SqlParameter("@FRASE", address.Frase),
                    new SqlParameter("@PRINCIPAL", address.Principal),
                    new SqlParameter("@COBRANCA", address.Cobranca),
                    new SqlParameter("@COMPLEMENTO ", address.Complemento),
                    new SqlParameter("@NUMERO", address.Numero),
                    new SqlParameter("@PAIS", address.Pais),
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void DeleteAddress(long IdEndereco)
        {
            try
            {
                string query = @$"UPDATE ECM_ENDERECOS SET D_E_L_E_T_ = '*' WHERE ID_ENDERECO = @ID_ENDERECO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_ENDERECO", IdEndereco)
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void RemoveAddress(long IdEndereco)
        {
            try
            {
                string query = @$"DELETE FROM ECM_ENDERECOS WHERE ID_ENDERECO = @ID_ENDERECO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_ENDERECO", IdEndereco)
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Address SearchAddressByEndereco(string Endereco)
        {
            try
            {
                string query = $@"SELECT ID_ENDERECO, CEP, TIPO_LOGRADOURO, TIPO_ENDERECO, 
                                TIPO_RESIDENCIA, LOGRADOURO, BAIRRO, CIDADE, ESTADO,
                                NOME_ENDERECO, FRASE, PRINCIPAL, COBRANCA, 
                                COMPLEMENTO, NUMERO, PAIS, CRIACAO FROM ECM_ENDERECOS
                                WHERE CONCAT(LOGRADOURO, ', ', NUMERO, ' - ', BAIRRO, ', ', CIDADE, ' - ', ESTADO, ', ', PAIS) 
                                LIKE CONCAT('%', @ENDERECO, '%') AND D_E_L_E_T_ <> '*';";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ENDERECO", Endereco),
                };

                return DatabaseProgramas().Choose<Address>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static Address SearchClientAddressByEndereco(long IdCliente, string Endereco)
        {
            try
            {
                string query = $@"SELECT ID_ENDERECO, CEP, TIPO_LOGRADOURO, TIPO_ENDERECO, 
                                TIPO_RESIDENCIA, LOGRADOURO, BAIRRO, CIDADE, ESTADO,
                                NOME_ENDERECO, FRASE, PRINCIPAL, COBRANCA, 
                                COMPLEMENTO, NUMERO, PAIS, CRIACAO FROM ECM_ENDERECOS
                                WHERE CONCAT(LOGRADOURO, ', ', NUMERO, ' - ', BAIRRO, ', ', CIDADE, ' - ', ESTADO, ', ', PAIS) 
                                LIKE CONCAT('%', @ENDERECO, '%') AND ID_CLIENTE = @ID_CLIENTE AND D_E_L_E_T_ <> '*';";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                    new SqlParameter("@ENDERECO", Endereco),
                };

                return DatabaseProgramas().Choose<Address>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Address> SelectAddressByEndereco(string Endereco)
        {
            try
            {
                string query = $@"SELECT ID_ENDERECO, CEP, TIPO_LOGRADOURO, TIPO_ENDERECO, 
                                TIPO_RESIDENCIA, LOGRADOURO, BAIRRO, CIDADE, ESTADO,
                                NOME_ENDERECO, FRASE, PRINCIPAL, COBRANCA, 
                                COMPLEMENTO, NUMERO, PAIS, CRIACAO FROM ECM_ENDERECOS
                                WHERE CONCAT(LOGRADOURO, ', ', NUMERO, ' - ', BAIRRO, ', ', CIDADE, ' - ', ESTADO, ', ', PAIS) 
                                LIKE CONCAT('%', @ENDERECO, '%') AND D_E_L_E_T_ <> '*';";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ENDERECO", Endereco),
                };

                return DatabaseProgramas().Select<Address>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Address> SelectClientAddressByEndereco(long IdCliente, string Endereco)
        {
            try
            {
                string query = $@"SELECT ID_ENDERECO, CEP, TIPO_LOGRADOURO, TIPO_ENDERECO, 
                                TIPO_RESIDENCIA, LOGRADOURO, BAIRRO, CIDADE, ESTADO,
                                NOME_ENDERECO, FRASE, PRINCIPAL, COBRANCA, 
                                COMPLEMENTO, NUMERO, PAIS, CRIACAO FROM ECM_ENDERECOS
                                WHERE CONCAT(LOGRADOURO, ', ', NUMERO, ' - ', BAIRRO, ', ', CIDADE, ' - ', ESTADO, ', ', PAIS) 
                                LIKE CONCAT('%', @ENDERECO, '%') AND ID_CLIENTE = @ID_CLIENTE AND D_E_L_E_T_ <> '*';";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                    new SqlParameter("@ENDERECO", Endereco),
                };

                return DatabaseProgramas().Select<Address>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Address> SelectAllAddress()
        {
            try
            {
                string query = $@"SELECT ID_ENDERECO, CEP, TIPO_LOGRADOURO, TIPO_ENDERECO, 
                                TIPO_RESIDENCIA, LOGRADOURO, BAIRRO, CIDADE, ESTADO,
                                NOME_ENDERECO, FRASE, PRINCIPAL, COBRANCA, 
                                COMPLEMENTO, NUMERO, PAIS, CRIACAO FROM ECM_ENDERECOS
                                WHERE AND D_E_L_E_T_ <> '*';";

                return DatabaseProgramas().Select<Address>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<Address> SelectAllAddressByClient(long IdCliente)
        {
            try
            {
                string query = $@"SELECT ID_ENDERECO, CEP, TIPO_LOGRADOURO, TIPO_ENDERECO, 
                                TIPO_RESIDENCIA, LOGRADOURO, BAIRRO, CIDADE, ESTADO,
                                NOME_ENDERECO, FRASE, PRINCIPAL, COBRANCA, 
                                COMPLEMENTO, NUMERO, PAIS, CRIACAO FROM ECM_ENDERECOS
                                WHERE ID_CLIENTE = @ID_CLIENTE AND D_E_L_E_T_ <> '*';";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ID_CLIENTE", IdCliente),
                };

                return DatabaseProgramas().Select<Address>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
