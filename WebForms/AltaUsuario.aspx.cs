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
            try
            {
                if (!IsPostBack)
                {
                    txtFechaAlta.Text = DateTime.Now.ToString("yyyy-MM-dd");

                    if (Request.QueryString["Id"] != null)
                    {
                        Usuario usuario = new Usuario();
                        UsuarioNegocio negocio = new UsuarioNegocio();

                        List<Usuario> lista = negocio.Listar();

                        usuario = lista.Find(x => x.IdUsuario == int.Parse((Request.QueryString["Id"])));

                        txtIdUsuario.Text = usuario.IdUsuario.ToString();
                        txtApellido.Text = usuario.Apellido;
                        txtNombre.Text = usuario.Nombre;
                        txtNombreUsuario.Text = usuario.NombreUsuario;
                        txtEmail.Text = usuario.Email;
                        txtContrasena.Text = usuario.Contrasena;
                        txtFechaAlta.Text = usuario.FechaAlta.ToString();
                        ddlRol.SelectedValue = usuario.Admin.ToString();


                    }
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error" , ex.ToString());
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

                if (Request.QueryString["Id"] != null)
                {
                    nuevo.IdUsuario = int.Parse(Request.QueryString["Id"]);
                    negocio.ModificarUsuario(nuevo);

                }
                else
                {
                    negocio.AgregarUsuario(nuevo);

                }

                Response.Redirect("ListaUsuarios.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
            }
            

        }
    }
}