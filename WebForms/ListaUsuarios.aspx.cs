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
    public partial class ListaUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioNegocio negocio = new UsuarioNegocio();
            List<Usuario> lista = negocio.Listar();

            GVUsuarios.DataSource = lista;
            GVUsuarios.DataBind();
        }

        protected void btnAgregarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaUsuario.aspx", false);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("PanelAdmin.aspx", false);
        }

        protected void GVUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = GVUsuarios.SelectedDataKey.Value.ToString();
            Response.Redirect("AltaUsuario.aspx?Id=" + id);
        }

        protected void GVUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(GVUsuarios.DataKeys[e.RowIndex].Value);
                UsuarioNegocio negocio = new UsuarioNegocio();

                negocio.EliminarUsuario(id);
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
            }
            
            
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio negocio = new UsuarioNegocio();

                List<Usuario> lista = negocio.Listar();
                List<Usuario> filtrada = lista.Where(c => c.NombreUsuario.ToLower().Contains(txtBuscarUsuario.Text.ToLower()) || c.Apellido.ToLower().Contains(txtBuscarUsuario.Text.ToLower()) || c.Nombre.ToLower().Contains(txtBuscarUsuario.Text.ToLower())).ToList();
                GVUsuarios.DataSource = filtrada ;
                GVUsuarios.DataBind();
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
            }
        }

        protected void GVUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVUsuarios.PageIndex = e.NewPageIndex;
            GVUsuarios.DataBind();
        }
    }
}