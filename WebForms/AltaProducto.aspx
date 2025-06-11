<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedores.Master" AutoEventWireup="true" CodeBehind="AltaProducto.aspx.cs" Inherits="WebForms.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlProductos" runat="server" DefaultButton="btnAgregar">
    <div style="max-width: 600px; margin: 40px auto; padding: 30px; background-color: #ffffff; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); font-family: 'Segoe UI', Arial, sans-serif;">
        <h2 style="text-align: center; margin-bottom: 25px; color: #2c3e50; font-weight: 600;">Gestión de Productos</h2>

        <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" style="display: block; margin-bottom: 20px; text-align: center;"></asp:Label>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 20px;">
            <div>
                <asp:Label ID="lblNombre" runat="server" Text="Nombre:" style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; transition: border 0.3s;" />
            </div>
            <div>
                <asp:Label ID="lblCodProducto" runat="server" Text="Codigo Producto:" style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
                <asp:TextBox ID="txtCodProducto" runat="server" CssClass="form-control" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; transition: border 0.3s;" />
            </div>
        </div>

        <div style="margin-bottom: 20px;">
            <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:" style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; transition: border 0.3s;"></asp:TextBox>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 20px; margin-bottom: 20px;">
            <div>
                <asp:Label ID="lblPrecio" runat="server" Text="Precio:" style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
                <asp:TextBox ID="TxtPrecio" runat="server" CssClass="form-control" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; transition: border 0.3s;" />
            </div>
            <div>
                <asp:Label ID="lblPorcentaje" runat="server" Text="% Ganancia:" style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
                <asp:TextBox ID="txtPorcentaje" runat="server" CssClass="form-control" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; transition: border 0.3s;" />
            </div>
            <div>
                <asp:Label ID="lblImagenUrl" runat="server" Text="Imagen URL:" style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
                <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; transition: border 0.3s;" />
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 20px;">
            <div>
                <asp:Label ID="lblStockActual" runat="server" Text="Stock Actual:" style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
                <asp:TextBox ID="txtStockActual" runat="server" CssClass="form-control" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; transition: border 0.3s;" />
            </div>
            <div>
                <asp:Label ID="lblStockMinimo" runat="server" Text="Stock Mínimo:" style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
                <asp:TextBox ID="txtStockMinimo" runat="server" CssClass="form-control" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; transition: border 0.3s;" />
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 25px;">
            <div>
                <asp:Label ID="lblMarca" runat="server" Text="Marca:" style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
                <asp:DropDownList ID="ddlMarca" runat="server" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; background-color: white; transition: border 0.3s;"></asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="lblTipoProducto" runat="server" Text="Tipo Producto:" style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
                <asp:DropDownList ID="ddlTipoProducto" runat="server" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; background-color: white; transition: border 0.3s;"></asp:DropDownList>
            </div>
        </div>

        <div style="display: flex; justify-content: space-between; gap: 15px;">
            <asp:Button ID="btnAgregar" runat="server" Text="Aceptar" OnClick="btnAgregar_Click"
                style="flex: 1; padding: 12px; background-color: #3498db; color: white; border: none; border-radius: 6px; font-weight: 500; cursor: pointer; transition: background-color 0.3s;" 
                onmouseover="this.style.backgroundColor='#2980b9'" onmouseout="this.style.backgroundColor='#3498db'" />
                
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"
                style="flex: 1; padding: 12px; background-color: #e74c3c; color: white; border: none; border-radius: 6px; font-weight: 500; cursor: pointer; transition: background-color 0.3s;" 
                onmouseover="this.style.backgroundColor='#c0392b'" onmouseout="this.style.backgroundColor='#e74c3c'" />
        </div>
    </div>
</asp:Panel>
</asp:Content>
