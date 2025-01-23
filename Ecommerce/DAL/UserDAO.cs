using Ecommerce.Models;
using Ecommerce.Utility;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Crypt = BCrypt.Net.BCrypt;

namespace Ecommerce.DAL
{
    public class UserDAO : BaseDAO
    {
        public static List<Gender> SelectAllGenres()
        {
            try
            {
                string query = $@"SELECT ID_GENERO, NOME, CHAVE FROM ECM_GENEROS
                                WHERE D_E_L_E_T_ <> '*';";

                return DatabaseProgramas().Select<Gender>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static User SearchForUserById(long IdUsuario)
        {
            try
            {
                string query = $@"SELECT
	                                EMAIL, SENHA, ID_USUARIO, TIPO
                                FROM ECM_USUARIOS
                                WHERE D_E_L_E_T_ <> '*' AND ID_USUARIO = @ID_USUARIO;";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ID_USUARIO", IdUsuario),
                };

                return DatabaseProgramas().Choose<User>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void UpdateUserPassword(long IdUsuario, string Senha)
        {
            try
            {
                string query = $@"UPDATE ECM_USUARIOS SET SENHA = @SENHA WHERE ID_USUARIO = @ID_USUARIO;";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@ID_USUARIO", IdUsuario),
                    new SqlParameter("@SENHA", Crypt.HashPassword(Senha)),
                };

                DatabaseProgramas().Choose<User>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
