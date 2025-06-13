﻿using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebForms.Utils;

namespace WebForms
{
    public partial class AltaCliente : System.Web.UI.Page
    {
        private List<Cliente> lista = new List<Cliente>();
        private TextBox[] CajasDeTexto = new TextBox[6];

        protected void Page_Load(object sender, EventArgs e)
        {

            lblAviso.Text = "";
            try
            {
                CajasDeTexto[0] = txtApellido;
                CajasDeTexto[1] = txtDireccion;
                CajasDeTexto[2] = txtDni;
                CajasDeTexto[3] = txtEmail;
                CajasDeTexto[4] = txtDni;
                CajasDeTexto[5] = txtNombre;

                if (!IsPostBack)
                {

                    if (Request.QueryString["id"] != null)
                    {
                        ClienteNegocio negocio = new ClienteNegocio();
                        lista = negocio.ListarConSp();
                        int id = int.Parse((Request.QueryString["id"]));

                        Cliente seleccionado = lista.Find(x => x.IdCliente == id);

                        txtApellido.Text = seleccionado.Apellido;
                        txtDireccion.Text = seleccionado.Direccion;
                        txtNombre.Text = seleccionado.Nombre;
                        txtDni.Text = seleccionado.Dni;
                        txtEmail.Text = seleccionado.Email;
                        txtTelefono.Text = seleccionado.Telefono;
                        txtId.Text = seleccionado.IdCliente.ToString();


                    }

                }

                btnAceptar.Enabled = false;
                ValidacionCampo.TodosCamposCompletos(CajasDeTexto);
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Cliente cliente = new Cliente();
            ClienteNegocio negocio = new ClienteNegocio();

            try
            {

                cliente.Dni = txtDni.Text;
                cliente.Direccion = txtDireccion.Text;
                cliente.Nombre = txtNombre.Text;
                if (ValidacionCampo.ValidarCorreo(txtEmail.Text))
                {
                    cliente.Email = txtEmail.Text;

                }
                else
                {
                    lblAviso.Text = "El correo es invalido";
                    return;
                }
                cliente.Apellido = txtApellido.Text;
                cliente.Telefono = txtTelefono.Text;

                if (Request.QueryString["id"] != null)
                {

                    cliente.IdCliente = int.Parse(Request.QueryString["id"]);
                    negocio.ModificarCliente(cliente);
                    Response.Redirect("ListaClientes.aspx", false);
                }
                else
                {
                    lista = negocio.ListarConSp();
                    bool encontrado = lista.Any(x => x.Dni == cliente.Dni);

                    if (!encontrado)
                    {
                        negocio.AgregarCliente(cliente);
                        Response.Redirect("ListaClientes.aspx", false);

                    }
                    else
                    {
                        lblAviso.Text = "El cliente ya se encuentra registrado";
                        lblAviso.Visible = true;
                        return;
                    }


                }

            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaClientes.aspx", false);
        }

        protected void txtId_TextChanged(object sender, EventArgs e)
        {
            ValidacionCampo.ControlAceptar(btnAceptar, CajasDeTexto);
        }

        protected void txtDni_TextChanged(object sender, EventArgs e)
        {
            ValidacionCampo.ControlAceptar(btnAceptar, CajasDeTexto);

        }

        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {
            ValidacionCampo.ControlAceptar(btnAceptar, CajasDeTexto);

        }

        protected void txtApellido_TextChanged(object sender, EventArgs e)
        {
            ValidacionCampo.ControlAceptar(btnAceptar, CajasDeTexto);

        }

        protected void txtDireccion_TextChanged(object sender, EventArgs e)
        {
            ValidacionCampo.ControlAceptar(btnAceptar, CajasDeTexto);

        }

        protected void txtTelefono_TextChanged(object sender, EventArgs e)
        {
            ValidacionCampo.ControlAceptar(btnAceptar, CajasDeTexto);

        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            ValidacionCampo.ControlAceptar(btnAceptar, CajasDeTexto);

        }


        
    }
}