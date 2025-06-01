using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuariosDatos
    {
        public List<Usuarios> listarUsuarios()
        {
            List<Usuarios> lista = new List<Usuarios>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.Consulta("select U.IdUsuario,U.NombreUsuario, U.Pass, P.Perfil from Usuarios U, Perfiles P where U.IdPerfil=P.IdPerfil");
                datos.EjecutarConsulta();

                while (datos.Reader.Read())
                {
                    Usuarios aux = new Usuarios();

                    aux.IdUsuario = (int)datos.Reader["IdUsuario"];
                    aux.NombreUsuario = (string)datos.Reader["NombreUsuario"];
                    aux.Pass = (string)datos.Reader["Pass"];
                    aux.Perfil = new Perfiles();
                    aux.Perfil.Perfil= (string)datos.Reader["Perfil"];

                    lista.Add(aux);
                }


                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }

        }

        public Usuarios LoginUsuario(string User, string Password)
        {
            Usuarios usuario = null;
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.Consulta("select U.NombreUsuario, U.Pass, U.IdPerfil, P.Perfil from Usuarios U inner join Perfiles P on U.IdPerfil = P.IdPerfil where U.NombreUsuario=@User and U.Pass=@Password");
                datos.SetearParametros("@User", User);
                datos.SetearParametros("@Password", Password);
                datos.EjecutarConsulta();

                if (datos.Reader.Read())
                {
                    usuario = new Usuarios
                    {
                        NombreUsuario = (string)datos.Reader["NombreUsuario"],
                        Pass = (string)datos.Reader["Pass"],
                        Perfil = new Perfiles { IdPerFil = (int)datos.Reader["IdPerfil"], Perfil = (string)datos.Reader["Perfil"] }

                    };
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }

            return usuario;
        }

    }
}
