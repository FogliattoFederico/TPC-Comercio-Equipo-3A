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

        protected void GVProveedores_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = GVProveedores.SelectedDataKey.Value.ToString();
            Response.Redirect("AltaProveedor.aspx?Id=" + id);
        }

        protected void GVProveedores_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ProveedorNegocio negocio = new ProveedorNegocio();

            try
            {
                int id = Convert.ToInt32(GVProveedores.DataKeys[e.RowIndex].Value);
                negocio.EliminarProveedor(id);
                
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ProveedorNegocio negocio = new ProveedorNegocio();

            List<Proveedor> lista = negocio.Listar();
            List<Proveedor> listaFiltrada = lista.Where(c => c.CUIT.Trim().Contains(txtBuscarCuit.Text.Trim()) || c.RazonSocial.Trim().ToLower().Contains(txtBuscarCuit.Text.Trim().ToLower())).ToList();

            GVProveedores.DataSource = listaFiltrada;
            GVProveedores.DataBind();
        }
    }
}