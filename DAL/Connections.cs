using ecommerce.Helpers;
using ecommerce.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.DAL
{
    public class Connections : IDatabaseProgramas
    {
        protected static Operations Programas()
        {
            return new Operations(Enums.ConnectionStringNames.PROGRAMAS);
        }

        Operations IDatabaseProgramas.Programas()
        {
            return Programas();
        }
    }
}
