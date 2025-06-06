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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*protected void btnLogin_Click(object sender, EventArgs e)
         {
             string user = TxtUser.Text;
             string pass = TxtPass.Text;

             try
             {
                 UsuariosDatos negocio = new UsuariosDatos();
                 Usuarios encontrado = negocio.LoginUsuario(user, pass);

                 if (encontrado != null)
                 {
                     string perfil = encontrado.Perfil.Perfil;

                     if (perfil == "Vendedor")
                         Response.Redirect("Venta.aspx");
                     else if (perfil == "Compras")
                         Response.Redirect("Compras.aspx");
                     else if (perfil == "Administrador")
                         Response.Redirect("Administrador.aspx");
                     else if (perfil == "Expedicion")
                         Response.Redirect("Expedicion.aspx");
                     else if (perfil == "Contabilidad")
                         Response.Redirect("Contabilidad.aspx");
                     else if (perfil == "Sistemas")
                         Response.Redirect("Sistemas.aspx");
                 }
             }
             catch (Exception ex) 
             {
                 throw ex;
             }

         }*/

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            try
            {
                if (negocio.ValidarUsuario(txtUsuario.Text, txtContrasena.Text))
                {
                    usuario.NombreUsuario = txtUsuario.Text;
                    usuario.Contrasena = txtContrasena.Text;

                    Session.Add("Usuario", usuario);
                    Response.Redirect("ListaProductos.aspx", false);
                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("Default.aspx", false);
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {

        }
    }
}