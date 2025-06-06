using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class VentaNegocio
    {
        public List<Venta> Listar()
        {
            List<Venta> listaVentas = new List<Venta>();
            VentaDetalleNegocio negocio = new VentaDetalleNegocio();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"SELECT 
                                        V.IdVenta, 
                                        V.Fecha,
	                                    SUM(VD.Cantidad * VD.PrecioUnit) AS Total,
                                        C.IdCliente,
                                        C.Nombre,
                                        C.Apellido,
                                        C.Dni,
                                        C.Telefono,
                                        C.Email,
                                        C.Direccion,
                                        U.IdUsuario,
                                        U.Nombre AS NombreUsuario,
	                                    U.Apellido AS ApellidoUsuario,
	                                    U.Email AS EmailUsuario,
	                                    U.FechaAlta,
	                                    U.Rol,	
                                        COUNT(VD.IdVentaDetalle) AS CantidadProductos
                                    FROM Ventas V
                                    INNER JOIN Clientes C ON C.IdCliente = V.IdCliente
                                    INNER JOIN Usuario U ON V.IdUsuario = U.IdUsuario
                                    INNER JOIN VentaDetalle VD ON V.IdVenta = VD.IdVenta
                                    GROUP BY 
                                        V.IdVenta, V.Fecha,
	                                    C.IdCliente, C.Nombre, C.Apellido, C.Dni, C.Telefono, C.Email, C.Direccion,
                                        U.IdUsuario, U.Nombre, U.Apellido, U.Email, U.FechaAlta, U.Rol";

                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Venta venta = new Venta();

                    venta.IdVenta = (int)datos.Lector["IdVenta"];
                    venta.Fecha = (DateTime)datos.Lector["Fecha"];
                    venta.Total = (decimal)datos.Lector["Total"];
                    venta.Cliente = new Cliente();
                    venta.Cliente.IdCliente = (int)datos.Lector["IdCliente"];
                    venta.Cliente.Nombre = datos.Lector["Nombre"].ToString();
                    venta.Cliente.Apellido = datos.Lector["Apellido"].ToString();
                    venta.Cliente.Dni = datos.Lector["DNI"].ToString();
                    venta.Cliente.Telefono = datos.Lector["Telefono"].ToString();
                    venta.Cliente.Email = datos.Lector["Email"].ToString();
                    venta.Cliente.Direccion = datos.Lector["Direccion"].ToString();
                    venta.Usuario = new Usuario();
                    venta.Usuario.IdUsuario = (int)datos.Lector["IdUsuario"];
                    venta.Usuario.NombreUsuario = datos.Lector["NombreUsuario"].ToString();
                    venta.Usuario.Apellido = datos.Lector["ApellidoUsuario"].ToString();
                    venta.Usuario.Email = datos.Lector["EmailUsuario"].ToString();
                    //venta.Usuario.Contrasena = datos.Lector["Contrasena"].ToString();
                    venta.Usuario.FechaAlta = (DateTime)datos.Lector["FechaAlta"];
                    venta.Usuario.Rol = datos.Lector["Rol"].ToString();
                    venta.Detalles = new List<VentaDetalle>();
                    venta.Detalles = negocio.ObtenerDetallesPorVenta(venta.IdVenta);

                    listaVentas.Add(venta);
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

            return listaVentas;
        }
    }
}
