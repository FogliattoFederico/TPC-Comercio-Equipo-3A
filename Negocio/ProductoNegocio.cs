using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ProductoNegocio
    {
        public List<Producto> Listar()
        {
            List<Producto> listaProductos = new List<Producto>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"SELECT 
                                    P.CodigoArticulo, 
                                    P.Nombre, 
                                    P.Descripcion, 
                                    P.PrecioCompra, 
                                    CAST(P.PrecioCompra * (P.PorcentajeGanancia / 100 + 1) AS DECIMAL(10,2)) AS PrecioVenta,
                                    P.PorcentajeGanancia, 
                                    P.StockActual, 
                                    P.StockMinimo, 
                                    P.ImagenUrl, 
	                                P.IdMarca,
                                    M.Nombre AS Marca, 
	                                TP.IdTipoProducto,
	                                TP.Nombre AS NombreTP,
	                                C.IdCategoria,
                                    C.Nombre AS Categoria
                                    FROM Productos P
                                    INNER JOIN Marcas M ON P.IdMarca = M.IdMarca
                                    INNER JOIN TiposProducto TP ON P.IdTipoProducto = TP.IdTipoProducto
                                    INNER JOIN Categorias C ON TP.IdCategoria = C.IdCategoria;";

                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Producto producto = new Producto();

                    producto.CodigoArticulo = datos.Lector["CodigoArticulo"].ToString();
                    producto.Nombre = datos.Lector["Nombre"].ToString();
                    producto.Descripcion = datos.Lector["Descripcion"].ToString();
                    producto.PrecioCompra = (decimal)datos.Lector["PrecioCompra"];
                    producto.PorcentajeGanancia = (decimal)datos.Lector["PorcentajeGanancia"];
                    producto.StockActual = (int)datos.Lector["StockActual"];
                    producto.StockMinimo = (int)datos.Lector["StockMinimo"];
                    producto.ImagenUrl = datos.Lector["ImagenUrl"].ToString();
                    producto.Marca = new Marca();
                    producto.Marca.IdMarca = (int)datos.Lector["IdMarca"];
                    producto.Marca.Nombre = datos.Lector["Marca"].ToString();

                    producto.TipoProducto = new TipoProducto();
                    producto.TipoProducto.IdTipoProducto = (int)datos.Lector["IdTipoProducto"];
                    producto.TipoProducto.Nombre = datos.Lector["NombreTP"].ToString();
                    producto.TipoProducto.categoria = new Categoria();
                    producto.TipoProducto.categoria.IdCategoria = (int)datos.Lector["IdCategoria"];
                    producto.TipoProducto.categoria.Nombre = datos.Lector["Categoria"].ToString();

                    listaProductos.Add(producto);
                }


            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return listaProductos;
        }
    }
}
