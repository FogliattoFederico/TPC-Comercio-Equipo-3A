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
    public partial class Compras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarProductosHistorial();
            if (!IsPostBack)
            {
                hfSeccionActiva.Value = "OCPendientes";
                cargarDropdowns();
                ActualizarNotificacionStock();
            }

            MostrarSeccionActiva();
        }

        protected void MostrarSeccion(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            hfSeccionActiva.Value = btn.CommandArgument;

            MostrarSeccionActiva();
        }

        private void MostrarSeccionActiva()
        {
            OCPendientes.Style["display"] = "none";
            NuevaOC.Style["display"] = "none";
            HistorialPrecios.Style["display"] = "none";
            Productos.Style["display"] = "none";
            Proveedores.Style["display"] = "none";
            StockCritico.Style["display"] = "none";

            switch (hfSeccionActiva.Value)
            {
                case "OCPendientes":
                    OCPendientes.Style["display"] = "block";
                    if (!IsPostBack) CargarOC();
                    break;
                case "NuevaOC":
                    NuevaOC.Style["display"] = "block";
                    break;
                case "HistorialPrecios":
                    HistorialPrecios.Style["display"] = "block";
                    break;
                case "Productos":
                    Productos.Style["display"] = "block";
                    CargarProductos();
                    break;
                case "Proveedores":
                    Proveedores.Style["display"] = "block";
                    CargarProveedores();
                    break;
                case "StockCritico":
                    StockCritico.Style["display"] = "block";
                    CargarProductosCriticos(); 
                    break;
            }

            upSecciones.Update();
        }

        /****NuevaOC****/

        private void cargarDropdowns()
        {
            ProveedorNegocio PNegocio = new ProveedorNegocio();
            DDLProveedor.DataSource = PNegocio.Listar();
            DDLProveedor.DataTextField = "RazonSocial";
            DDLProveedor.DataValueField = "IdProveedor";
            DDLProveedor.DataBind();

            DDLProveedor.Items.Insert(0, new ListItem("- Seleccionar proveedor -", "0"));

            ProductoNegocio Negocio = new ProductoNegocio();
            DDLProducto.DataSource = Negocio.ListarConSp();
            
            DDLProducto.DataTextField = "Nombre";
            //DDLProducto.DataValueField = "IdProducto";
            DDLProducto.DataValueField = "PrecioCompra";
            DDLProducto.DataBind();

            DDLProducto.Items.Insert(0, new ListItem("- Seleccionar producto -", "0"));
        }

        protected void DDLProducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DDLProducto.SelectedIndex == 0)
            {
                TxtBPrecio.Text = "$";
            }
            else
            {
                string precioSeleccionado = DDLProducto.SelectedValue;

                if (decimal.TryParse(precioSeleccionado, out decimal precio))
                {
                    TxtBPrecio.Text = precio.ToString("C"); 
                }
                else
                {
                    TxtBPrecio.Text = "$";
                }
            }

        }
        
        [Serializable]
        public class DetalleOC
        {
            public int IdProducto { get; set; }
            public string Nombre { get; set; }
            public int Cantidad { get; set; }
            public decimal PrecioUnitario { get; set; }
            public decimal Subtotal { get { return Cantidad * PrecioUnitario; } }
        }
        
        private List<DetalleOC> DetallesOC
        {
            get
            {
                if (ViewState["DetallesOC"] == null)
                    ViewState["DetallesOC"] = new List<DetalleOC>();
                return (List<DetalleOC>)ViewState["DetallesOC"];
            }
            set
            {
                ViewState["DetallesOC"] = value;
            }
        }
        
        protected void BtnPlus_Click(object sender, ImageClickEventArgs e)
        {
            int idProducto;

            if (DDLProducto.SelectedValue == "0" || string.IsNullOrEmpty(DDLProducto.SelectedValue)||
                DDLProveedor.SelectedValue == "0" || string.IsNullOrEmpty(DDLProveedor.SelectedValue)||
                int.TryParse(DDLProducto.SelectedValue, out idProducto))
            {
                lblAlerta2.Text = "Debe ingresar al menos un producto y un proveedor";
                PanelAleta.Visible = true;
                return;
            }
            else 
            {
                ProductoNegocio negocioProd = new ProductoNegocio();
                var producto = negocioProd.ListarConSp()
                                         .FirstOrDefault(p => p.IdProducto == idProducto);

                if (producto == null)
                {
                    lblAlerta2.Text = "El producto no existe en la base de datos.";
                    PanelAleta.Visible = true;
                    return;
                }
                /*
                // Evitar duplicados: si ya existe este producto en el detalle, mostrar alerta
                if (DetallesOC.Any(d => d.IdProducto == idProducto))
                {
                    lblAlerta2.Text = "El producto ya fue agregado al detalle. Para cambiar la cantidad, modifique la fila existente.";
                    PanelAleta.Visible = true;
                    return;
                }
                */
                // Crear y agregar el nuevo detalle
                DetalleOC nuevo = new DetalleOC
                {
                    IdProducto = producto.IdProducto,
                    Nombre = producto.Nombre,
                    Cantidad = 1,
                    PrecioUnitario = producto.PrecioCompra
                };
                DetallesOC.Add(nuevo);

                // Refrescar la grilla y totales
                ActualizarGridDetalle();
                ActualizarTotal();

                // Resetear controles de entrada
                DDLProducto.SelectedIndex = 0;
                TxtBPrecio.Text = "$";
                PanelAleta.Visible = false;

            }

            

        }

        private void ActualizarGridDetalle()
        {
            gvDetalleOC.DataSource = DetallesOC;
            gvDetalleOC.DataBind();
        }

        private void ActualizarTotal()
        {
            decimal total = DetallesOC.Sum(d => d.Subtotal);
            lblTotal.Text = total.ToString("C");
        }

        protected void gvDetalleOC_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                DetallesOC.RemoveAt(index);
                ActualizarGridDetalle();
                ActualizarTotal();
            }
        }
        
        /*******Productos*******/
        private void CargarProductos()
        {
            ProductoNegocio negocioProd = new ProductoNegocio();
            GridProductos.DataSource = negocioProd.ListarConSp();
            GridProductos.DataBind();
        }

        protected void GridProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridProductos.PageIndex = e.NewPageIndex;
            CargarProductos();
        }

        /*******Proveedores*******/
        private void CargarProveedores()
        {
            ProveedorNegocio negocioProv = new ProveedorNegocio();
            GridProveedores.DataSource = negocioProv.Listar();
            GridProveedores.DataBind();
        }

        protected void GridProveedores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridProveedores.PageIndex = e.NewPageIndex;
            CargarProveedores();
        }

        /******OC Pendientes**********/

        private void CargarOC()
        {
            ComprasNegocio negocio = new ComprasNegocio();
            List<Compra> lista = negocio.Listar();

            rptCompras.DataSource = lista;
            rptCompras.DataBind();
        }

        protected void btnDetalle_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            string idCompra = btn.CommandArgument;
            Response.Redirect("CompraDetalles.aspx?ID=" + idCompra);
        }

        /********Historial de previos*******/

        private void CargarProductosHistorial()
        {
            if (Session["ProductosHistorial"] == null)
            {
                ProductoNegocio negocioProd = new ProductoNegocio();
                var listaProductos = negocioProd.ListarConSp();
                Session["ProductosHistorial"] = listaProductos;
            }

            string selectedValue = DDLHistPrecios.SelectedValue;

            DDLHistPrecios.DataSource = Session["ProductosHistorial"];
            DDLHistPrecios.DataTextField = "Nombre";
            DDLHistPrecios.DataValueField = "IdProducto";
            DDLHistPrecios.DataBind();

            DDLHistPrecios.Items.Insert(0, new ListItem("- Seleccione producto -", "0"));

            if (!string.IsNullOrEmpty(selectedValue) && DDLHistPrecios.Items.FindByValue(selectedValue) != null)
            {
                DDLHistPrecios.SelectedValue = selectedValue;
            }
        }

        protected void btnimg_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                pnlAlerta.Visible = false;
                pnlHistorial.Visible = false;
                rptHistorial.DataSource = null;
                rptHistorial.DataBind();
                /*
                if (DDLHistPrecios.SelectedIndex <= 0)
                {
                    lblAlerta.Text = "Por favor, seleccione un producto para ver el historial de precios.";
                    pnlAlerta.Visible = true;
                   
                }*/

                int idProducto = Convert.ToInt32(DDLHistPrecios.SelectedValue);

                ComprasNegocio negocio = new ComprasNegocio();
                var historial = negocio.HistorialPreciosPorProducto(idProducto);

                if (historial != null)
                {
                    LblItem.Text = DDLHistPrecios.SelectedItem.Text;
                    pnlAlerta.Visible = false;
                    pnlHistorial.Visible = true;
                    rptHistorial.DataSource = historial;
                    rptHistorial.DataBind();
                }
                else if(DDLHistPrecios.SelectedIndex <= 0)
                {
                    lblAlerta.Text = "Por favor, seleccione un producto para ver el historial de precios.";
                    pnlAlerta.Visible = true;
                    pnlHistorial.Visible = false;
                }
                else
                {
                    lblAlerta.Text = "No se encontró historial de precios para el producto seleccionado.";
                    pnlAlerta.Visible = true;
                    pnlHistorial.Visible = false;
                }
            }
            catch (Exception ex)
            {
                lblAlerta.Text = "Ocurrió un error al obtener el historial de precios: " + ex.Message;
                pnlAlerta.Visible = true;
            }
            finally
            {
                upSecciones.Update();
            }
        }

        /********Stock crítico*********/

        private void ActualizarNotificacionStock()
        {
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> productosCriticos = negocio.ListarStockCritico();

            int cantidad = productosCriticos.Count;
            LblNotif.Text = cantidad.ToString();
            LblNotif.Visible = cantidad > 0;
            pnlNotificacion.Visible = cantidad > 0;
        }

        private void CargarProductosCriticos()
        {
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> productosCriticos = negocio.ListarStockCritico();
            int cantidad = productosCriticos.Count;
            pnlNotificacion.Visible = cantidad > 0;

            if (cantidad > 0)
            {
                GVStockCritico.DataSource = productosCriticos;
                GVStockCritico.DataBind();
                GVStockCritico.Visible = true;
                pnlSinStockCritico.Visible = false;
            }
            else
            {
                GVStockCritico.Visible = false;
                pnlSinStockCritico.Visible = true;
            }
        }
        protected void GVStockCritico_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridProductos.PageIndex = e.NewPageIndex;
            CargarProductosCriticos();
        }

        protected void lnkNotificaciones_Click(object sender, EventArgs e)
        {
            hfSeccionActiva.Value = "StockCritico";
            MostrarSeccionActiva();
        }

       
    }
}









