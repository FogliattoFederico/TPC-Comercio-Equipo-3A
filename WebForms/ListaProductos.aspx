<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListaProductos.aspx.cs" Inherits="WebForms.ListaProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center m-5">Listado de Productos</h1>
    <asp:GridView ID="GVProductos" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="8"
        CssClass="table table-striped table-bordered table-hover text-center gridview"
        HeaderStyle-CssClass="thead-dark"
        GridLines="None" OnPageIndexChanging="GVProductos_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="TipoProducto.categoria.Nombre" HeaderText="Categoría" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="CodigoArticulo" HeaderText="Código" />
            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
            <asp:BoundField DataField="Marca.Nombre" HeaderText="Marca" />
            <asp:BoundField DataField="PrecioCompra" HeaderText="Precio de Compra" DataFormatString="{0:C2}" />
            <asp:BoundField DataField="PorcentajeGanancia" HeaderText="% Ganancia" />
            <asp:BoundField DataField="StockActual" HeaderText="Stock" />
            <asp:BoundField DataField="StockMinimo" HeaderText="Stock Mínimo" />
            <%--<asp:BoundField DataField="ImagenUrl" HeaderText="URL Imagen" />--%>
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image ID="imgProducto" runat="server" ImageUrl='<%# Eval("ImagenUrl") %>' CssClass="imagen-producto" />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
</asp:Content>
