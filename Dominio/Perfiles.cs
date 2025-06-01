using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Dominio
{
    public class Perfiles
    {
        public int IdPerFil {  get; set; }
        public string Perfil { get; set; }

        public override string ToString()
        {
            return Perfil;
        }
    }

    
}
