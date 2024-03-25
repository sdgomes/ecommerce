using ecommerce.Helpers;
using ecommerce.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ecommerce.Connection
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

        protected static Operations ProgramasHomologacao()
        {
            return new Operations(Enums.ConnectionStringNames.PROGRAMAS_HOM);
        }

        Operations IDatabaseProgramas.ProgramasHomologacao()
        {
            return ProgramasHomologacao();
        }
    }
}
