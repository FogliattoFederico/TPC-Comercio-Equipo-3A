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
    }
}
