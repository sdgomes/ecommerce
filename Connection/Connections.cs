using crm.Helpers;
using crm.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace crm.Connection
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
