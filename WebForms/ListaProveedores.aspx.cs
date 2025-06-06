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
    public partial class Proveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ProveedorNegocio negocio = new ProveedorNegocio();
            List<Proveedor> lista = negocio.Listar();

            GVProveedores.DataSource = lista;
            GVProveedores.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaProveedor.aspx", false);
        }

        protected void GVProveedores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVProveedores.PageIndex = e.NewPageIndex;
            GVProveedores.DataBind();
        }

        protected void btnAgregarProveedor_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaProveedor.aspx", false);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("PanelAdmin.aspx", false);
        }
    }
}