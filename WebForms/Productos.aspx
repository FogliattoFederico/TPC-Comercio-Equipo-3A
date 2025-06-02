<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="WebForms.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlProductos" runat="server" DefaultButton="btnAgregar">
        <div style="max-width: 400px; margin: 60px auto; padding: 30px; background-color: #f9f9f9; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
            <h2 style="text-align: center; margin-bottom: 20px;">Producto</h2>

            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>

            <div style="margin-bottom: 15px;">
                <asp:Label ID="Id" runat="server" Text="ID:"></asp:Label><br />
                <asp:TextBox ID="txtId" runat="server" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label><br />
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion:"></asp:Label><br />
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblPrecio" runat="server" Text="Precio:"></asp:Label><br />
                <asp:TextBox ID="TxtPrecio" runat="server" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblPorcentaje" runat="server" Text="Porcentaje Ganancia:"></asp:Label><br />
                <asp:TextBox ID="txtPorcentaje" runat="server" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblStockActual" runat="server" Text="Stock Actual:"></asp:Label><br />
                <asp:TextBox ID="txtStockActual" runat="server" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblStockMinimo" runat="server" Text="Stock Minimo:"></asp:Label><br />
                <asp:TextBox ID="txtStockMinimo" runat="server" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblImagenUrl" runat="server" Text="Imagen Url:"></asp:Label><br />
                <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblMarca" runat="server" Text="Marca:"></asp:Label><br />
                <asp:DropDownList ID="ddlMarca" runat="server"></asp:DropDownList>
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblTipoProducto" runat="server" Text="Tipo Producto:"></asp:Label><br />
                <asp:DropDownList ID="ddlTipoProducto" runat="server"></asp:DropDownList>
            </div>
            <div class="d-flex">
                <asp:Button ID="btnAgregar" runat="server" Text="Aceptar" OnClick="btnAgregar_Click"
                    CssClass="btn btn-primary flex-grow-1" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"
                    CssClass="btn btn-danger flex-grow-1 ms-2" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
