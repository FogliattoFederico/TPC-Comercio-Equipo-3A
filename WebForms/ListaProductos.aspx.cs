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
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> lista = negocio.ListarConSp();

            GVProductos.DataSource = lista;
            GVProductos.DataBind();
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

        protected void btnagregaroProducto_Click(object sender, EventArgs e)
        {

        }
    }
}