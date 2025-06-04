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
        public List<Proveedor> ListarProveedores()
        {
            List<Proveedor> listaProveedores = new List<Proveedor>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = "select RazonSocial, CUIT, Direccion, Telefono, Email from Proveedores";

                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Proveedor Prov = new Proveedor();

                    Prov.RazonSocial = datos.Lector["RazonSocial"].ToString();
                    Prov.CUIT = datos.Lector["CUIT"].ToString();
                    Prov.Direccion = datos.Lector["Direccion"].ToString();
                    Prov.Telefono = datos.Lector["Telefono"].ToString();
                    Prov.Email = datos.Lector["Email"].ToString();
                    

                    listaProveedores.Add(Prov);
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
