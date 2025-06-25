using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForms
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensaje.Text = "";
        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidarCampos())
                {
                    UsuarioNegocio negocio = new UsuarioNegocio();
                    EmailService email = new EmailService();

                    List<Usuario> lista = negocio.Listar();

                    Usuario encontrado = lista.FirstOrDefault(x => x.Email == txtEmail.Text);

                    if (encontrado == null)
                    {
                        lblMensaje.Text = "Email no encontrado";
                        return;
                    }

                    lblMensaje.Text = "";

                    string asunto = "Recuperar datos de tu cuenta";
                    string cuerpo = "Usuario : " + encontrado.NombreUsuario + " Contraesña : " + encontrado.Contrasena;

                    email.ArmarCorreo(txtEmail.Text, asunto, cuerpo);
                    email.enviarEmail();

                    Response.Redirect("Confirmacion.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error.aspx", ex.ToString());
            }
            
        }

        private bool ValidarCampos()
        {
            lblMensaje.ForeColor = System.Drawing.Color.Red;

            
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrWhiteSpace(email))
            {
                lblMensaje.Text = "Todos los campos deben estar completos.";
                return false;
            }

            return true;
        }
    }
}