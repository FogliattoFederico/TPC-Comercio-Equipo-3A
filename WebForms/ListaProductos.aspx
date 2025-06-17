<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.Master" AutoEventWireup="true" CodeBehind="ListaProductos.aspx.cs" Inherits="WebForms.ListaProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Css/StyleListProductos.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-4">

        <div class="row mb-4">
            <div class="col-12">
                <h1 class="display-4 text-center mt-5 mb-4">Listado de Productos</h1>
                <div class="d-flex justify-content-between mb-3">

                    <a href="Default.aspx" class="back">
                        <img class="imgback" src="/Icon/FlechaI.png"></a>
                    <asp:Button runat="server" Text="Agregar Producto" ID="btnagregarProducto" OnClick="btnagregarProducto_Click"
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
                        OnRowCommand="GVProductos_RowCommand"
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
                            <asp:TemplateField HeaderText="Acciones" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <div class="text-center">
                                        <asp:LinkButton ID="btnModificar" runat="server"
                                            CommandName="Modificar"
                                            CommandArgument='<%# Eval("IdProducto") %>'
                                            CssClass="btn btn-primary shadow-sm"
                                            Style="width: 100px;"
                                            Text="Modificar">
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="btnEliminar" runat="server"
                                            CommandName="Eliminar"
                                            CommandArgument='<%# Eval("IdProducto") %>'
                                            CssClass="btn btn-danger btn-sm shadow-sm"
                                            Style="width: 100px;"
                                            OnClientClick="return confirm('¿Estás seguro de que querés eliminar este producto?');"
                                            Text="Eliminar">
                                        </asp:LinkButton>
                                    </div>
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
