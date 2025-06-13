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
            MarcaNegocio negocio = new MarcaNegocio();
            List<Marca> lista = negocio.ListarMarcaConSp();

            try
            {
                Session.Add("listaMarca", negocio.ListarMarcaConSp());
                GVMarcas.DataSource=lista;
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
            GVMarcas.DataBind();
        }

        protected void GVMarcas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = GVMarcas.SelectedDataKey.Value.ToString();
            Response.Redirect("AltaMarca.aspx?id=" + id);
        }

        protected void GVMarcas_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int idMarca = Convert.ToInt32(GVMarcas.DataKeys[e.RowIndex].Value);

                MarcaNegocio negocio = new MarcaNegocio();
                negocio.EliminarMarca(idMarca);

                GVMarcas.DataSource = negocio.listarMarcas();
                GVMarcas.DataBind();

            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }
        }
    }
}