<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListaProductos.aspx.cs" Inherits="WebForms.ListaProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-4">

        <div class="row mb-4">
            <div class="col-12">
                <h1 class="display-4 text-center mb-4">Listado de Proveedores</h1>
                <div class="d-flex justify-content-end mb-3">
                    <asp:Button runat="server" Text="Agregar Producto" ID="btnagregaroProducto" OnClick="btnagregaroProducto_Click"
                        CssClass="btn btn-primary btn-lg shadow-sm" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="table-responsive shadow-sm rounded">
                    <asp:GridView ID="GVProductos" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="10"
                        CssClass="table table-striped table-bordered table-hover table-responsive rounded-3 overflow-hidden shadow-sm"
                        HeaderStyle-CssClass="bg-primary text-white text-center"
                        RowStyle-CssClass="align-middle"
                        AlternatingRowStyle-CssClass="align-middle"
                        GridLines="None"
                        OnPageIndexChanging="GVProductos_PageIndexChanging"
                        PagerStyle-CssClass="pagination pagination-sm justify-content-center"
                        PageIndex="0">
                        <Columns>
                            <asp:BoundField DataField="TipoProducto.categoria.Nombre" HeaderText="Categoría" />
                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="CodigoArticulo" HeaderText="Código" />
                            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                            <asp:BoundField DataField="Marca.Nombre" HeaderText="Marca" />
                            <asp:BoundField DataField="PrecioCompra" HeaderText="Precio Compra" DataFormatString="{0:C2}" />
                            <asp:BoundField DataField="PorcentajeGanancia" HeaderText="% Ganancia" DataFormatString="{0}%" />
                            <asp:BoundField DataField="StockActual" HeaderText="Stock" />
                            <asp:BoundField DataField="StockMinimo" HeaderText="Stock Mín" />
                            <asp:TemplateField HeaderText="Imagen">
                                <ItemTemplate>
                                    <asp:Image ID="imgProducto" runat="server"
                                        ImageUrl='<%# Eval("ImagenUrl") %>'
                                        CssClass="img-thumbnail"
                                        Style="max-width: 80px; height: auto;"
                                        onerror="this.src='https://via.placeholder.com/80?text=Sin+Imagen';" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <%--<asp:Button Text="Agregar Producto" runat="server" ID="btnAgregarProducto"
        OnClick="btnAgregarProducto_Click"
        CssClass="btn btn-primary btn-lg shadow-sm" />--%>
    </div>
</asp:Content>
