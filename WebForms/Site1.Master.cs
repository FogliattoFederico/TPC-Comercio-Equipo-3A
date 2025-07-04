﻿using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Globalization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForms
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!MostrarModalLogin && IsPostBack)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "mostrarLogin", "mostrarLogin();", true);
            }
            


        }
        
        
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidarCampos())
                {

                    UsuarioNegocio negocio = new UsuarioNegocio();
                    Usuario usuario = new Usuario();

                    usuario.NombreUsuario = txtUsuario.Text;

                    usuario.Contrasena = txtContrasena.Text;

                    bool encontrado = negocio.Loguear(usuario);

                    if (!encontrado)
                    {
                       
                        lblMensaje.Text = "Usuario y/o contraseña incorrectos";
                        ScriptManager.RegisterStartupScript(this, GetType(), "mostrarLogin", "mostrarLogin();", true);
                        return;
                    }

                    Session.Add("Usuario", usuario);

                    if (usuario.Admin == true)
                    {
                        MostrarModalLogin = false;
                        Response.Redirect("PanelAdmin.aspx", false);
                    }
                    else
                    {
                        MostrarModalLogin = false;
                        Response.Redirect("AltaVenta.aspx", false);

                    }
                }
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx", false);

            }

        }

        private bool ValidarCampos()
        {
            lblMensaje.ForeColor = System.Drawing.Color.Red;

            string usuario = txtUsuario.Text.Trim();
            string contrasenia = txtContrasena.Text.Trim();

            if (string.IsNullOrWhiteSpace(usuario) ||
                string.IsNullOrWhiteSpace(contrasenia)
                )
            {
                lblMensaje.Text = "Todos los campos deben estar completos.";
                return false;
            }

            return true;
        }

        protected void btnCerrarSesion_Click1(object sender, ImageClickEventArgs e)
        {
            Session.Remove("Usuario");
            Response.Redirect("Default.aspx", false);
        }

        public bool MostrarModalLogin
        {
            get
            {
                return ViewState["MostrarModalLogin"] != null && (bool)ViewState["MostrarModalLogin"];
            }
            set
            {
                ViewState["MostrarModalLogin"] = value;
            }
        }

    }
}