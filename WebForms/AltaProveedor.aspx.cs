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
            if (Request.QueryString["Id"] != null)
            {
                ProveedorNegocio negocio = new ProveedorNegocio();
                List<Proveedor> lista = negocio.Listar();
                if (!IsPostBack)
                {
                    int id = int.Parse(Request.QueryString["Id"]);
                    Proveedor seleccionado = lista.Find(x => x.IdProveedor == id);

                    txtCuit.Text = seleccionado.CUIT;
                    txtDireccion.Text = seleccionado.Direccion;
                    txtEmail.Text = seleccionado.Email;
                    txtId.Text = seleccionado.IdProveedor.ToString();
                    txtRazonSocial.Text = seleccionado.RazonSocial;
                    txtTelefono.Text = seleccionado.Telefono;

                }



            }
        }



        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaProveedores.aspx", false);
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

                if (Request.QueryString["Id"] != null)
                {
                    nuevo.IdProveedor = int.Parse(Request.QueryString["id"]);
                    negocio.ModificarProveedor(nuevo);
                    Response.Redirect("ListaProveedores.aspx", false);
                }
                else
                {
                    negocio.AltaPorveedor(nuevo);
                    Response.Redirect("ListaProveedores.aspx", false);

                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
            }
        }
    }
}