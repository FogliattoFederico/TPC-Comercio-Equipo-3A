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
                CargarGrid();
            }
        }

        private void CargarGrid()
        {
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> lista = negocio.Listar(); // Usar el que muestra sólo los activos
            GVProductos.DataSource = lista;
            GVProductos.DataBind();
        }

        protected void GVProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVProductos.PageIndex = e.NewPageIndex;
            CargarGrid();

        }     

        protected void btnagregarProducto_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaProducto.aspx", false);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            /*Logica para redirigir al panel que corresponda egun su perfil*/
            Response.Redirect("Default.aspx", false);
        }

        protected void GVProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Modificar")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect("AltaProducto.aspx?Id=" + id, false);
            }

            if (e.CommandName == "Eliminar")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                ProductoNegocio negocio = new ProductoNegocio();

                try
                {
                    negocio.EliminarProductoLogico(id);
                    CargarGrid();
                }
                catch (Exception ex)
                {
                    Session["Error"] = ex.ToString();
                }
            }
        }
    }
}