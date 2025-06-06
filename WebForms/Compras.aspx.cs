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
    public partial class Compras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ComprasNegocio negocio = new ComprasNegocio();
            List<Proveedor> lista = negocio.ListarProveedores();

            ProductoNegocio negocioProd = new ProductoNegocio();
            List<Producto> listaProd = negocioProd.ListarConSp();

            GridProveedores.DataSource = lista;
            GridProveedores.DataBind();

            GridProductos.DataSource = listaProd;
            GridProductos.DataBind();
        }

        protected void GridProveedores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridProveedores.PageIndex = e.NewPageIndex;
            GridProveedores.DataBind();
        }

        protected void GridProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridProductos.PageIndex= e.NewPageIndex;
            GridProductos.DataBind();
        }
    }
}