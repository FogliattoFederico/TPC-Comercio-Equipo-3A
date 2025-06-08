using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace WebForms
{
    public partial class AltaProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Proveedor nuevo = new Proveedor();
            ProveedorNegocio negocio = new ProveedorNegocio();

            try
            {
                nuevo.Direccion = txtDireccion.Text;
                nuevo.RazonSocial = txtRazonSocial.Text;
                nuevo.Email = txtEmail.Text;
                nuevo.Telefono = txtTelefono.Text;
                nuevo.CUIT = txtCuit.Text;

                negocio.AltaPorveedor(nuevo);
                Response.Redirect("ListaProveedores.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
            }
        }
    }
}