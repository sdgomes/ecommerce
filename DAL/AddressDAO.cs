using crm.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace crm.DAL
{
    public class AddressDAO : BaseDAO
    {
        public static Freight SearchFreightByUF(string Estado) {
            try
            {
                string query = @$"SELECT * FROM ECM_FRETES WHERE D_E_L_E_T_ <> '*' AND ESTADO = @ESTADO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ESTADO", Estado)
                };

                return DatabaseProgramas().Choose<Freight>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static long CreateAddress(long IdCliente, Address address)
        {
            try
            {
                string query = @$"BEGIN
	                                IF NOT EXISTS (SELECT ID_ENDERECO FROM ECM_ENDERECOS WHERE ID_CLIENTE = @ID_CLIENTE AND CEP = @CEP AND LOGRADOURO = @LOGRADOURO AND NUMERO = @NUMERO) 
	                                BEGIN
		                                INSERT INTO ECM_ENDERECOS (ID_CLIENTE, CEP, TIPO_LOGRADOURO, TIPO_ENDERECO, TIPO_RESIDENCIA,
		                                LOGRADOURO, BAIRRO, CIDADE, ESTADO, NOME_ENDERECO, FRASE, PRINCIPAL, COBRANCA, COMPLEMENTO,
		                                NUMERO, PAIS)
		                                OUTPUT Inserted.ID_ENDERECO
		                                VALUES (@ID_CLIENTE, @CEP, UPPER(@TIPO_LOGRADOURO), UPPER(@TIPO_ENDERECO), UPPER(@TIPO_RESIDENCIA),
		                                UPPER(@LOGRADOURO), UPPER(@BAIRRO), UPPER(@CIDADE), UPPER(@ESTADO), UPPER(@NOME_ENDERECO), UPPER(@FRASE), @PRINCIPAL, @COBRANCA, UPPER(@COMPLEMENTO),
		                                UPPER(@NUMERO), UPPER(@PAIS))
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
                string query = @$"UPDATE ECM_ENDERECOS SET CEP = @CEP, TIPO_LOGRADOURO = UPPER(@TIPO_LOGRADOURO), TIPO_RESIDENCIA = UPPER(@TIPO_RESIDENCIA),
                LOGRADOURO = UPPER(@LOGRADOURO), BAIRRO = UPPER(@BAIRRO), CIDADE = UPPER(@CIDADE), ESTADO = UPPER(@ESTADO), NOME_ENDERECO = UPPER(@NOME_ENDERECO),
                FRASE = UPPER(@FRASE), PRINCIPAL = @PRINCIPAL, COBRANCA = @COBRANCA, COMPLEMENTO = UPPER(@COMPLEMENTO), NUMERO = UPPER(@NUMERO), PAIS = UPPER(@PAIS)
                WHERE ID_ENDERECO = @ID_ENDERECO;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_ENDERECO", IdEndereco),
                    new SqlParameter("@CEP", I(address.CEP)),
                    new SqlParameter("@TIPO_LOGRADOURO", I(address.TipoLogradouro)),
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

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void LimpaPrincipal(long IdCiente)
        {
            try
            {
                string query = @$"UPDATE ECM_ENDERECOS SET PRINCIPAL = 0 WHERE ID_CLIENTE = @ID_CLIENTE;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CLIENTE", IdCiente)
                };

                DatabaseProgramas().Execute(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void LimpaCobranca(long IdCiente)
        {
            try
            {
                string query = @$"UPDATE ECM_ENDERECOS SET COBRANCA = 0 WHERE ID_CLIENTE = @ID_CLIENTE;";

                SqlParameter[] parameters = new SqlParameter[] {
                    new SqlParameter("@ID_CLIENTE", IdCiente)
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

        public static Address SearchAddressByIdEndereco(long IdEndereco)
        {
            try
            {
                string query = $@"SELECT ID_CLIENTE, ID_ENDERECO, CEP, TIPO_LOGRADOURO, TIPO_ENDERECO, 
                                TIPO_RESIDENCIA, LOGRADOURO, BAIRRO, CIDADE, ESTADO,
                                NOME_ENDERECO, FRASE, PRINCIPAL, COBRANCA, 
                                COMPLEMENTO, NUMERO, PAIS, CRIACAO FROM ECM_ENDERECOS
                                WHERE ID_ENDERECO = @ID_ENDERECO AND D_E_L_E_T_ <> '*';";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ID_ENDERECO", IdEndereco),
                };

                return DatabaseProgramas().Choose<Address>(query, parameters);
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
                string query = $@"SELECT ID_CLIENTE, ID_ENDERECO, CEP, TIPO_LOGRADOURO, TIPO_ENDERECO, 
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

        public static List<TypeOfAddress> SelectAllTypeOfAddress()
        {
            try
            {
                string query = $@"SELECT ID_TIPO_LOGRADOURO, NOME FROM ECM_TIPOS_LOGRADOURO
                                WHERE D_E_L_E_T_ <> '*';";

                return DatabaseProgramas().Select<TypeOfAddress>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<TypeOfResidence> SelectAllTypeOfResidence()
        {
            try
            {
                string query = $@"SELECT ID_TIPO_RESIDENCIA, NOME FROM ECM_TIPOS_RESIDENCIA
                                WHERE D_E_L_E_T_ <> '*';";

                return DatabaseProgramas().Select<TypeOfResidence>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static List<State> SelectAllState()
        {
            try
            {
                string query = $@"SELECT ID_ESTADO, NOME FROM ECM_ESTADOS
                                WHERE D_E_L_E_T_ <> '*';";

                return DatabaseProgramas().Select<State>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
