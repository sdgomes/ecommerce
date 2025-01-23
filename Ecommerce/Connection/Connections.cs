using Ecommerce.Helpers;
using Ecommerce.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ecommerce.Connection
{
    public class Connections : IDatabaseProgramas
    {
        protected static Operations Programas()
        {
#if DEBUG_WORK
            return new Operations(Enums.ConnectionStringNames.PROGRAMAS_WORK);
#else
            return new Operations(Enums.ConnectionStringNames.PROGRAMAS);
#endif
        }

        Operations IDatabaseProgramas.Programas()
        {
            return Programas();
        }
    }
}
