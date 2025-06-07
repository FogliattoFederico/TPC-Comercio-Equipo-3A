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
    public partial class AltaCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {


                    if (Request.QueryString["id"] != null)
                    {
                        ClienteNegocio negocio = new ClienteNegocio();
                        List<Cliente> lista = new List<Cliente>();

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
                cliente.Email = txtEmail.Text;
                cliente.Apellido = txtApellido.Text;
                cliente.Telefono = txtTelefono.Text;

                if (Request.QueryString["id"] != null)
                {

                    cliente.IdCliente = int.Parse(Request.QueryString["id"]);
                    negocio.ModificarCliente(cliente);
                }
                else
                {
                    negocio.AgregarCliente(cliente);

                }

                Response.Redirect("ListaClientes.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("error", ex);
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }
    }
}