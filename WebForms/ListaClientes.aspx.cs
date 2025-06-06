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
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClienteNegocio negocio = new ClienteNegocio();
            List<Cliente> lista = negocio.ListarConSp();

            dgvClientes.DataSource = lista;
            dgvClientes.DataBind();
        }

        

        protected void btnAgregarCliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaCliente.aspx", false);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            /*Logica para redirigir al panel que corresponda egun su perfil*/
            Response.Redirect("Default.aspx", false);
        }
    }
}