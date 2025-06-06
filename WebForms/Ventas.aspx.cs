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
    public partial class Ventas1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VentaNegocio negocio = new VentaNegocio();
            List<Venta> lista = negocio.Listar();

            GVVentas.DataSource = lista;
            GVVentas.DataBind();
        }

        protected void btnAgregarVenta_Click(object sender, EventArgs e)
        {

        }
    }
}