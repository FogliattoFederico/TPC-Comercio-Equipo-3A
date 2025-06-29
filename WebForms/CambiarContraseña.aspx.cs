﻿using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebForms
{
    public partial class CambiarContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sesionActiva((Usuario)Session["Usuario"]))
            {
                Session.Add("Error", "Debes estar logueado");
                Response.Redirect("Error.aspx", false);
                return;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaVenta.aspx", false);
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                if (ValidarCampos())
                {

                    lblMensaje.Text = string.Empty;

                    if (!validaContraseña(txtPassNueva.Text))
                    {
                        lblMensaje.Text = "Formato incorrecto";
                        return;
                    }
                    string contraseñaActual = txtPassActual.Text.Trim();
                    string contraseñaNueva = txtPassNueva.Text.Trim();
                    string contraseñaNueva2 = txtPassNueva2.Text.Trim();


                    if (contraseñaNueva != contraseñaNueva2)
                    {
                        lblMensaje.Text = "Las contraseñas nuevas no coinciden";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                        return;
                    }


                    if (contraseñaActual == contraseñaNueva)
                    {
                        lblMensaje.Text = "La nueva contraseña debe ser diferente a la actual";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                        return;
                    }

                    UsuarioNegocio negocio = new UsuarioNegocio();

                    Usuario usuario = negocio.Listar()
                        .FirstOrDefault(u => u.Contrasena.Equals(txtPassActual.Text.Trim(), StringComparison.OrdinalIgnoreCase));

                    if (usuario == null)
                    {
                        lblMensaje.Text = "La contraseña actual es incorrecta";
                        return;
                    }

                    usuario.Contrasena = txtPassNueva.Text;

                    negocio.ModificarUsuario(usuario);

                    Session.Remove("Usuario");
                    Response.Redirect("Default.aspx", false);

                }

            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
            }

        }

        private bool ValidarCampos()
        {
            lblMensaje.ForeColor = System.Drawing.Color.Red;

            string contraseñaActual = txtPassActual.Text.Trim();
            string contraseñaNueva = txtPassNueva.Text.Trim();
            string contraseñaNueva2 = txtPassNueva2.Text.Trim();

            if (string.IsNullOrWhiteSpace(contraseñaActual) || string.IsNullOrWhiteSpace(contraseñaNueva) || string.IsNullOrWhiteSpace(contraseñaNueva2))
            {
                lblMensaje.Text = "Todos los campos deben estar completos.";
                return false;
            }

            return true;
        }

        private bool validaContraseña(string contraseña)
        {
            // Expresión regular mejorada que requiere:
            // - Al menos una minúscula
            // - Al menos una mayúscula
            // - Al menos un número
            // - Al menos un carácter especial
            // - Mínimo 8 caracteres
            string patron = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$";

            // Verificar que la contraseña no sea nula o vacía
            if (string.IsNullOrWhiteSpace(contraseña))
            {
                return false;
            }

            // Validar contra el patrón
            return Regex.IsMatch(contraseña, patron);
        }
    }
}