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
    public partial class Factura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Venta ventaActual = null;
                VentaNegocio negocio = new VentaNegocio();

                // 1. Buscar por QueryString
                if (int.TryParse(Request.QueryString["ID"], out int idVenta))
                {
                    // Simular carga desde BD (ajustá a tu lógica real)
                    ventaActual = negocio.BuscarVenta(idVenta); // método que devuelve una Venta por ID
                }
                else
                {
                    // 2. Intentar obtener venta en curso desde sesión
                    ventaActual = Session["VentaEnCurso"] as Venta;
                }

                if (ventaActual != null)
                {
                    // Encabezado
                    lblNumeroFactura.Text = ventaActual.IdVenta.ToString("D8"); // Ej: 00000012
                    //lblFecha.Text = ventaActual.Fecha?.ToString("dd/MM/yyyy") ?? DateTime.Now.ToString("dd/MM/yyyy");
                    lblFecha.Text = ventaActual.Fecha?.ToString("dd/MM/yyyy");
                    lblUsuario.Text = ventaActual.Usuario.NombreUsuario + " " + ventaActual.Usuario.Apellido;

                    // Cliente
                    lblClienteNombre.Text = ventaActual.Cliente.Nombre + " " + ventaActual.Cliente.Apellido;
                    lblClienteDireccion.Text = ventaActual.Cliente.Direccion;
                    lblClienteDNI.Text = ventaActual.Cliente?.Dni ?? "-";

                    //// Detalles
                    var lista = new List<object>();

                    foreach (var detalle in ventaActual.Detalles)
                    {
                        lista.Add(new
                        {
                            Producto = detalle.Producto,
                            Cantidad = detalle.Cantidad,
                            PrecioVenta = detalle.PrecioVenta,
                            Subtotal = detalle.Cantidad * detalle.PrecioVenta
                        });
                    }
                    rptDetalles.DataSource = lista;
                    rptDetalles.DataBind();

                    // Total
                    lblTotal.Text = $"${ventaActual.Total:N0}";
                }
                else
                {
                    Response.Redirect("ListaVentas.aspx");
                }
            }
        }

    }
}