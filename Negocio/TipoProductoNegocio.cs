using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class TipoProductoNegocio
    {
        public List<TipoProducto> ListarTipoProductos()
        {
            List<TipoProducto> lista = new List<TipoProducto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"SELECT TP.IdTipoProducto, TP.Nombre As NombreTipoProducto, TP.IdCategoria, C.Nombre AS NombreCategoria
                                    FROM TiposProducto TP
                                    INNER JOIN Categorias C ON TP.IdCategoria = C.IdCategoria";
                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    TipoProducto tipoProducto = new TipoProducto();
                    tipoProducto.IdTipoProducto = (int)datos.Lector["IdTipoProducto"];
                    tipoProducto.Nombre = datos.Lector["NombreTipoProducto"].ToString();
                    tipoProducto.categoria = new Categoria();
                    tipoProducto.categoria.IdCategoria = (int)datos.Lector["IdCategoria"];
                    tipoProducto.categoria.Nombre = datos.Lector["NombreCategoria"].ToString();
                    lista.Add(tipoProducto);
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

        public List<TipoProducto> ListarPorCategoria(int idCategoria)
        {
            List<TipoProducto> lista = new List<TipoProducto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT IdTipoProducto, Nombre, Activo FROM TiposProducto WHERE IdCategoria = @id");
                datos.setearParametro("@id", idCategoria);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    TipoProducto tp = new TipoProducto
                    {
                        IdTipoProducto = (int)datos.Lector["IdTipoProducto"],
                        Nombre = datos.Lector["Nombre"].ToString(),
                        Activo = (bool)datos.Lector["Activo"]
                    };

                    lista.Add(tp);
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

        public List<TipoProducto> ListarTPConSp()
        {
            List<TipoProducto> listaTP = new List<TipoProducto>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_ListarTiposProducto");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    TipoProducto TP = new TipoProducto();

                    TP.IdTipoProducto = (int)datos.Lector["IdTipoProducto"];
                    TP.Nombre = datos.Lector["Nombre"].ToString();
                    TP.Activo = (bool)datos.Lector["Activo"];
                    TP.categoria = new Categoria();
                    TP.categoria.IdCategoria = (int)datos.Lector["IdCategoria"];//
                    TP.categoria.Nombre = datos.Lector["NombreCategoria"].ToString();
                        
                    

                    listaTP.Add(TP);
                }

                return listaTP;
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

        public void AgregarTP(TipoProducto nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_AgregarTipoProducto");
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@IdCategoria", nuevo.categoria.IdCategoria);

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

        public void ModificarTP(TipoProducto tp)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_ModificarTipoProducto");
                datos.setearParametro("@IdTipoProducto", tp.IdTipoProducto);
                datos.setearParametro("@Nombre", tp.Nombre);
                datos.setearParametro("@IdCategoria", tp.categoria.IdCategoria);

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

        public void EliminarTP(int id)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_EliminarTipoProducto");
                datos.setearParametro("IdTipoProducto", id);
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

        public List<TipoProducto> ListarTPEliminados()
        {
            List<TipoProducto> listaTPe = new List<TipoProducto>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearProcedimiento("SP_ListarTiposProductoEliminados");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    TipoProducto TPe = new TipoProducto();

                    TPe.IdTipoProducto = (int)datos.Lector["IdTipoProducto"];
                    TPe.Nombre = datos.Lector["Nombre"].ToString();
                    TPe.Activo = (bool)datos.Lector["Activo"];
                    TPe.categoria = new Categoria();
                    /*TPe.categoria.IdCategoria = (int)datos.Lector["IdCategoria"];*/
                    TPe.categoria.Nombre = datos.Lector["NombreCategoria"].ToString();

                    listaTPe.Add(TPe);
                }
                return listaTPe;
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

        public void ReactivarTP(int idTP)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("SP_AltaTipoProducto");
                datos.setearParametro("@IdTipoProducto", idTP);
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
