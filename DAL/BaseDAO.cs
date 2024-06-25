using Ecommerce.Connection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.DAL
{
    public class BaseDAO : Connections
    {
        protected static Operations DatabaseProgramas()
        {
            return Programas();
        }


        protected static dynamic I(dynamic Item)
        {
            if (Item == null)
                return DBNull.Value;

            return Item;
        }
    }
}
