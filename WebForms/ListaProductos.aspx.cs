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
    public partial class ListaProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductos();
            }
        }

        private void CargarProductos()
        {
            ProductoNegocio negocio = new ProductoNegocio();
            bool mostrarEliminados = CheckEliminados.Checked;

            try
            {
                List<Producto> lista = mostrarEliminados ?
                negocio.ListarEliminados() :
                negocio.Listar();
                Session["listaProducto"] = lista;
                GVProductos.DataSource = lista;
                GVProductos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }

        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaProducto.aspx", false);
        }

        protected void GVProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVProductos.PageIndex = e.NewPageIndex;
            GVProductos.DataBind();
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaProducto.aspx", false);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("PanelAdmin.aspx", false);
        }

        protected void GVProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = GVProductos.SelectedValue.ToString();
            Response.Redirect("AltaProducto.aspx?Id=" + id);
        }

        protected void GVProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            e.Cancel = true;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();

            List<Producto> lista = negocio.Listar();
            string filtro = txtBuscarCuit.Text.Trim().ToLower();

            List<Producto> listaFiltrada = lista.Where(c =>
                c.Nombre.Trim().ToLower().Contains(filtro) ||
                c.Descripcion.Trim().ToLower().Contains(filtro)
            ).ToList();

            GVProductos.DataSource = listaFiltrada;
            GVProductos.DataBind();
        }

        protected void CheckEliminados_CheckedChanged(object sender, EventArgs e)
        {
            CargarProductos();
        }

        protected void GVProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int idProducto = Convert.ToInt32(e.CommandArgument);

            ProductoNegocio negocio = new ProductoNegocio();

            if (e.CommandName == "Delete")
            {
                negocio.EliminarProductoLogico(idProducto);
            }
            else if (e.CommandName == "Reactivar")
            {
                negocio.ReactivarProducto(idProducto);
            }

            CargarProductos();
        }
    }
}