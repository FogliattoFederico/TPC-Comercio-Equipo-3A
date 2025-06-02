using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public bool ValidarUsuario(string nombreUsuario, string contrasena)
        {
            AccesoDatos datos = new AccesoDatos();

            datos.setearConsulta(@"SELECT 1 
                                FROM Usuario 
                                WHERE NombreUsuario = @usuario AND Contrasena = @contrasena");
            datos.setearParametro("@usuario", nombreUsuario);
            datos.setearParametro("@contrasena", contrasena);
            datos.ejecutarLectura();

            if (datos.Lector.Read())
                return true;
            return false;

        }
    }
}
