using Ecommerce.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.DAL
{
    public class CategoriaDAO : BaseDAO
    {

        public static List<Category> SelectAllCategories()
        {
            try
            {
                string query = $@"SELECT 
	                                ID_CATEGORIA,
	                                ID_CATEGORIA_PAI,
	                                SUBCATEGORIA,
	                                NOME
                                FROM ECM_CATEGORIAS 
                                WHERE D_E_L_E_T_ <> '*';";

                return DatabaseProgramas().Select<Category>(query);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
