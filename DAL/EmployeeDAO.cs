using ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DAL
{
    public class EmployeeDAO : BaseDAO
    {
        public static Employee SearchForEmployeeByCodigo(string Codigo)
        {
            try
            {
                string query = $@"SELECT
	                                USU.EMAIL, FUN.CODIGO, USU.ID_USUARIO,
	                                FUN.ID_FUNCIONARIO, FUN.NOME_COMPLETO, FUN.CARGO
                                FROM ECM_FUNCIONARIOS FUN
	                                INNER JOIN ECM_USUARIOS USU ON USU.ID_USUARIO = FUN.ID_USUARIO
		                                AND USU.D_E_L_E_T_ <> '*'
                                WHERE FUN.D_E_L_E_T_ <> '*' AND FUN.CODIGO = @CODIGO;";

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@CODIGO", Codigo),
                };

                return DatabaseProgramas().Choose<Employee>(query, parameters);
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
