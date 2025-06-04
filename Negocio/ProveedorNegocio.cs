using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ProveedorNegocio
    {
        public List<Proveedor> Listar()
        {
            List<Proveedor> listaProveedores = new List<Proveedor>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"SELECT *
                                    FROM Proveedores
                                    ORDER BY RazonSocial;";

                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Proveedor proveedor = new Proveedor();

                    proveedor.IdProveedor = (int)datos.Lector["IdProveedor"];
                    proveedor.RazonSocial = datos.Lector["RazonSocial"].ToString();
                    proveedor.CUIT = datos.Lector["CUIT"].ToString();
                    proveedor.Direccion = datos.Lector["Direccion"].ToString();
                    proveedor.Telefono = datos.Lector["Telefono"].ToString();
                    proveedor.Email = datos.Lector["Email"].ToString();

                    listaProveedores.Add(proveedor);
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

            return listaProveedores;
        }
    }
}
