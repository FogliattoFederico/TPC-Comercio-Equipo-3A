using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace WebForms
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDropdowns();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (ValidarCampos())
            {
                Producto producto = new Producto();

                producto.CodigoArticulo = txtCodProducto.Text;
                producto.Nombre = txtNombre.Text;
                producto.Descripcion = txtDescripcion.Text;
                producto.PrecioCompra = Convert.ToDecimal(TxtPrecio.Text);
                producto.PorcentajeGanancia = Convert.ToDecimal(txtPorcentaje.Text);
                producto.StockActual = Convert.ToInt32(txtStockActual.Text);
                producto.StockMinimo = Convert.ToInt32(txtStockMinimo.Text);
                producto.ImagenUrl = txtImagenUrl.Text;
                producto.Marca = new Marca();
                producto.Marca.IdMarca = ddlMarca.SelectedIndex;

                producto.TipoProducto = new TipoProducto();
                producto.TipoProducto.IdTipoProducto = ddlTipoProducto.SelectedIndex;

                ProductoNegocio negocio = new ProductoNegocio();
                negocio.AgregarProducto(producto);

                lblMensaje.ForeColor = System.Drawing.Color.Green;
                lblMensaje.Text = "Producto agregado exitosamente.";

                /* BOTONES */
                // Deshabilitarlos
                btnAgregar.Enabled = false;
                btnCancelar.Enabled = false;

                // O Sacarlos de la vista
                //btnAgregar.Visible = false;
                //btnCancelar.Visible = false;


                /* DELAY POST AGREGAR PRODUCTO Y POSTERIOR REDIRECCIONAMIENTO */
                string script = "<script>setTimeout(function() { window.location.href = 'ListaProductos.aspx'; }, 3000);</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script);

            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListaProductos.aspx", false);
        }

        private void cargarDropdowns()
        {

            MarcaNegocio marcaNegocio = new MarcaNegocio();
            ddlMarca.DataSource = marcaNegocio.listarMarcas();
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "IdMarca";
            ddlMarca.DataBind();

            TipoProductoNegocio tipoNegocio = new TipoProductoNegocio();
            ddlTipoProducto.DataSource = tipoNegocio.ListarTipoProductos();
            ddlTipoProducto.DataTextField = "Nombre";
            ddlTipoProducto.DataValueField = "IdTipoProducto";
            ddlTipoProducto.DataBind();

            // OPCIONES POR DEFECTO
            ddlMarca.Items.Insert(0, new ListItem("-- Seleccionar Marca --", "0"));
            ddlTipoProducto.Items.Insert(0, new ListItem("-- Seleccionar Tipo --", "0"));
        }

        private bool ValidarCampos()
        {
            lblMensaje.ForeColor = System.Drawing.Color.Red;

            string codigo = txtCodProducto.Text.Trim();
            string nombre = txtNombre.Text.Trim();
            string precio = TxtPrecio.Text.Trim();
            string ganancia = txtPorcentaje.Text.Trim();
            string urlImagen = txtImagenUrl.Text.Trim();
            string descripcion = txtDescripcion.Text.Trim();
            string stockActual = txtStockActual.Text.Trim();
            string stockMinimo = txtStockMinimo.Text.Trim();
            string marca = ddlMarca.SelectedItem?.ToString();
            string tipoProducto = ddlTipoProducto.SelectedItem?.ToString();

            // Validando vacios
            if (string.IsNullOrWhiteSpace(codigo) ||
                string.IsNullOrWhiteSpace(nombre) ||
                string.IsNullOrWhiteSpace(descripcion) ||
                string.IsNullOrWhiteSpace(precio) ||
                string.IsNullOrWhiteSpace(stockActual) ||
                string.IsNullOrWhiteSpace(stockMinimo) ||
                string.IsNullOrWhiteSpace(marca) ||
                string.IsNullOrWhiteSpace(tipoProducto))
            {
                lblMensaje.Text = "Todos los campos deben estar completos.";
                return false;
            }

            /* Valida Codigo */
            if (string.IsNullOrWhiteSpace(codigo))
            {
                lblMensaje.Text = "El código de producto no puede estar vacío.";
                return false;
            }
            if (!Regex.IsMatch(codigo, @"^[a-zA-Z0-9\-]+$"))
            {
                lblMensaje.Text = "El código de producto solo puede contener letras, números y guiones.";
                return false;
            }

            /* Valida Url Imagen */
            if (string.IsNullOrEmpty(urlImagen))
            {
                lblMensaje.Text = "Debe ingresar una URL de imagen.";
                return false;
            }
            if (!(urlImagen.StartsWith("http://") || urlImagen.StartsWith("https://")))
            {
                lblMensaje.Text = "La URL debe comenzar con http:// o https://";
                return false;
            }

            /* Valida Precio */
            if (!decimal.TryParse(precio, out decimal precioValor) || precioValor <= 0)
            {
                lblMensaje.Text = "El precio debe ser un número positivo.";
                return false;
            }

            /* Valida Ganancia */
            if (!decimal.TryParse(ganancia, out decimal gananciavalor) || gananciavalor <= 0)
            {
                lblMensaje.Text = "la ganancia % debe ser un número positivo.";
                return false;
            }

            /* Valida Stocks */
            // Stock minimo
            if (!int.TryParse(stockMinimo, out int stockMin) || stockMin < 0)
            {
                lblMensaje.Text = "El stock mínimo debe ser un número entero positivo.";
                return false;
            }
            // Stock actual
            if (!int.TryParse(stockActual, out int stockValor) || stockValor < stockMin)
            {
                lblMensaje.Text = "El stock actual debe ser un número mayor o igual que el stock mínimo.";
                return false;
            }

            /* Valida Marca */
            if (ddlMarca.SelectedIndex == 0)
            {
                lblMensaje.Text = "Debe seleccionar una Marca.";
                return false;
            }

            /* Valida TipoProducto */
            if (ddlTipoProducto.SelectedIndex == 0)
            {
                lblMensaje.Text = "Debe seleccionar un Tipo de Producto.";
                return false;
            }

            return true; // SE VALIDO TODO
        }


    }
}