using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForms
{
    public partial class vendedores : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lkbCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("Usuario");
            Response.Redirect("Default.aspx", false);
        }

        protected void lnkVenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("PanelVendedores.aspx", false);
        }

        protected void lnkProductos_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaProductos.aspx", false);
        }

        protected void lnkClientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaClientes.aspx", false);
        }

        protected void lnkNuevoCliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaCliente.aspx", false);
        }

        protected void lnkFacturas_Click(object sender, EventArgs e)
        {

        }
    }
}