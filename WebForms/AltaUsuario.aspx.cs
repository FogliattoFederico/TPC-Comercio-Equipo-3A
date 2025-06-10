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
    public partial class AltaVendedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtFechaAlta.Text = DateTime.Now.ToString("yyyy-MM-dd");
                
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaUsuarios.aspx", false);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Usuario nuevo = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                nuevo.Apellido = txtApellido.Text;
                nuevo.NombreUsuario = txtNombreUsuario.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Email = txtEmail.Text;
                nuevo.Contrasena = txtContrasena.Text;
                nuevo.FechaAlta = DateTime.Parse(txtFechaAlta.Text);
                nuevo.Admin = Convert.ToBoolean(ddlRol.SelectedValue);

                negocio.AgregarUsuario(nuevo);
                Response.Redirect("ListaUsuarios.aspsx", false);
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
            }
            

        }
    }
}