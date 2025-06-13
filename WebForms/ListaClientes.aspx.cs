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

            try
            {
                Session.Add("listaClientes", negocio.ListarConSp());

                dgvClientes.DataSource = lista;
                dgvClientes.DataBind();

            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
            }

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

        protected void dgvClientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvClientes.SelectedDataKey.Value.ToString();
            Response.Redirect("AltaCliente.aspx?id=" + id);
        }

        protected void dgvClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvClientes.PageIndex = e.NewPageIndex;
            dgvClientes.DataBind();
        }

        protected void dgvClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int idCliente = Convert.ToInt32(dgvClientes.DataKeys[e.RowIndex].Value);

                ClienteNegocio negocio = new ClienteNegocio();
                negocio.EliminarCliente(idCliente);

                dgvClientes.DataSource = negocio.ListarConSp();
                dgvClientes.DataBind();

            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Cliente> lista = (List<Cliente>)Session["listaClientes"];
            List<Cliente> filtrada = lista.Where(c => c.Dni.Trim().Contains(txtBuscarDni.Text.Trim())).ToList();

            dgvClientes.DataSource = filtrada;
            dgvClientes.DataBind();
        }
    }
}