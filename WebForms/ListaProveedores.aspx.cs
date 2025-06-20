﻿using System;
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
            
            if (!IsPostBack)
            {
                CargarProveedor();
            }
        }

        private void CargarProveedor()
        {
            ProveedorNegocio negocio = new ProveedorNegocio();
            bool mostrarEliminados = CheckEliminados.Checked;

            try
            {
                List<Proveedor> lista = mostrarEliminados ?
                negocio.ListarEliminados() :
                negocio.Listar();
                Session["listaProveedor"] = lista;
                GVProveedores.DataSource = lista;
                GVProveedores.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }

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
            //string id = GVProveedores.SelectedDataKey.Value.ToString();
            string id = GVProveedores.SelectedValue.ToString();
            Response.Redirect("AltaProveedor.aspx?Id=" + id);
        }

        protected void GVProveedores_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            e.Cancel = true;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ProveedorNegocio negocio = new ProveedorNegocio();

            List<Proveedor> lista = (List<Proveedor>)Session["listaProveedor"] ;
            List<Proveedor> listaFiltrada = lista.Where(c => c.CUIT.Trim().Contains(txtBuscarCuit.Text.Trim()) || c.RazonSocial.Trim().ToLower().Contains(txtBuscarCuit.Text.Trim().ToLower())).ToList();

            GVProveedores.DataSource = listaFiltrada;
            GVProveedores.DataBind();
        }

        protected void CheckEliminados_CheckedChanged(object sender, EventArgs e)
        {
            CargarProveedor();
        }

        protected void GVProveedores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //int rowIndex = Convert.ToInt32(e.CommandArgument);
            //GridViewRow row = GVProveedores.Rows[rowIndex];
            //int idProveedor = Convert.ToInt32(GVProveedores.DataKeys[row.RowIndex].Values["IdProveedor"]);
            int idProveedor = Convert.ToInt32(e.CommandArgument);

            ProveedorNegocio negocio = new ProveedorNegocio();

            if (e.CommandName == "Delete")
            {
                negocio.EliminarProveedor(idProveedor);
            }
            else if (e.CommandName == "Reactivar")
            {
                negocio.ReactivarProveedor(idProveedor);
            }

            CargarProveedor();
        }
    }
}