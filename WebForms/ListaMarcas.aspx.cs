using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForms
{
    public partial class ListaMarcas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMarcas();
            }
        }

        private void CargarMarcas()
        {
            MarcaNegocio negocio = new MarcaNegocio();
            bool mostrarEliminados = CheckEliminados.Checked;

            List<Marca> lista = mostrarEliminados ?
                negocio.ListarMarcaEliminadas():
                negocio.ListarMarcaConSp();
            try
            {
                Session["listaMarca"] = lista;
                GVMarcas.DataSource = lista;
                GVMarcas.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }
            
        }

        protected void btnAgregarMarca_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaMarca.aspx", false);
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Marca> lista = (List<Marca>)Session["listaMarca"];
            List<Marca> filtrada = lista.Where(M => M.Nombre.Trim().ToLower().Contains(txtBuscarMarca.Text.Trim().ToLower())).ToList();

            GVMarcas.DataSource = filtrada;
            GVMarcas.DataBind();
        }

        protected void GVMarcas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVMarcas.PageIndex = e.NewPageIndex;
            CargarMarcas();
        }

        protected void GVMarcas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = GVMarcas.SelectedDataKey.Value.ToString();
            Response.Redirect("AltaMarca.aspx?id=" + id);
        }

        protected void CheckEliminados_CheckedChanged(object sender, EventArgs e)
        {
            CargarMarcas();
        }

        protected void GVMarcas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = GVMarcas.Rows[rowIndex];
            int idMarca = Convert.ToInt32(GVMarcas.DataKeys[row.RowIndex].Values["IdMarca"]);

            MarcaNegocio negocio = new MarcaNegocio();

            if (e.CommandName == "Delete")
            {
                negocio.EliminarMarca(idMarca);
            }
            else if (e.CommandName == "Reactivar")
            {
                negocio.ReactivarMarca(idMarca);
            }

            CargarMarcas();
        }

        protected void GVMarcas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            e.Cancel = true;
        }
    }
}