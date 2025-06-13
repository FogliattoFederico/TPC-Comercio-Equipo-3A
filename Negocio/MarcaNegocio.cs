using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class MarcaNegocio
    {
        public List<Marca> listarMarcas()
        {
            List<Marca> lista = new List<Marca>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"SELECT IdMarca, Nombre
                                    FROM Marcas";
                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Marca marca = new Marca();
                    marca.IdMarca = (int)datos.Lector["IdMarca"];
                    marca.Nombre = datos.Lector["Nombre"].ToString();
                    lista.Add(marca);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public List<Marca> ListarMarcaConSp()
        {
            List<Marca> listaMarcas = new List<Marca>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_ListarMarca");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Marca MRK= new Marca();
                    MRK.IdMarca = (int)datos.Lector["IdMarca"];
                    MRK.Nombre = datos.Lector["Nombre"].ToString();
                    
                    listaMarcas.Add(MRK);
                }
                return listaMarcas;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void AgregarMarca(Marca nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_AgregarMarca");
                datos.setearParametro("@Nombre", nuevo.Nombre);
                
                /*datos.setearParametro("@Activo", 1)*/;
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void ModificarMarca(Marca mrk)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_ModificarMarca");
                datos.setearParametro("@IdMarca", mrk.IdMarca);
                datos.setearParametro("@Nombre", mrk.Nombre);
               
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void EliminarMarca(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_EliminarMarca");
                datos.setearParametro("IdMarca", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }


        }
    }
}
