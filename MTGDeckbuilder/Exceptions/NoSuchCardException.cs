using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTGDeckbuilder.Exceptions
{
    public class NoSuchCardException : Exception
    {
        public NoSuchCardException(string message)
        : base(message)
        {

        }
    }
}
