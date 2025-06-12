using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ComprasNegocio
    {
        public List<Compra> Listar()
        {
            List<Compra> listaCompras = new List<Compra>();
            CompraDetalleNegocio negocio = new CompraDetalleNegocio();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"SELECT 
                                    C.IdCompra,
                                    C.Fecha,
                                    C.IdProveedor,
                                    P.RazonSocial,
                                    P.CUIT,
                                    P.Direccion,
                                    P.Telefono,
                                    P.Email,
                                    SUM(CD.Cantidad * CD.PrecioUnit) AS Total
                                    FROM Compras C
                                    INNER JOIN CompraDetalle CD ON C.IdCompra = CD.IdCompra
                                    INNER JOIN Proveedores P ON C.IdProveedor = P.IdProveedor
                                    GROUP BY 
                                        C.IdCompra, C.Fecha, C.IdProveedor, 
                                        P.RazonSocial, P.CUIT, P.Direccion, P.Telefono, P.Email
                                    ORDER BY C.IdCompra;";

                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Compra compra = new Compra();

                    compra.IdCompra = (int)datos.Lector["IdCompra"];
                    compra.Fecha = (DateTime)datos.Lector["Fecha"];
                    compra.Proveedor = new Proveedor();
                    compra.Proveedor.IdProveedor = (int)datos.Lector["IdProveedor"];
                    compra.Proveedor.RazonSocial = datos.Lector["RazonSocial"].ToString();
                    compra.Proveedor.CUIT = datos.Lector["CUIT"].ToString();
                    compra.Proveedor.Direccion = datos.Lector["Direccion"].ToString();
                    compra.Proveedor.Telefono = datos.Lector["Telefono"].ToString();
                    compra.Proveedor.Email = datos.Lector["Email"].ToString();
                    compra.Total = (decimal)datos.Lector["Total"];
                    compra.Detalles = new List<CompraDetalle>();
                    compra.Detalles = negocio.ObtenerDetallesPorCompra(compra.IdCompra);

                    listaCompras.Add(compra);
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

            return listaCompras;
        }

        public List<CompraHistorial> HistorialPreciosPorProducto(int idProducto)
        {
            AccesoDatos datos = new AccesoDatos();
            List<CompraHistorial> lista = new List<CompraHistorial>();

            try
            {
                datos.setearProcedimiento("SP_HistorialPreciosProducto");
                datos.setearParametro("@IdProducto", idProducto);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    CompraHistorial ch = new CompraHistorial();
                    ch.RazonSocial = datos.Lector["RazonSocial"].ToString();
                    ch.FechaCompra = Convert.ToDateTime(datos.Lector["FechaCompra"]);
                    ch.PrecioUnitario = Convert.ToDecimal(datos.Lector["PrecioUnitario"]);
                    lista.Add(ch);
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
