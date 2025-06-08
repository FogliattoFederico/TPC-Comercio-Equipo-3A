<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.Master" AutoEventWireup="true" CodeBehind="ListaProveedores.aspx.cs" Inherits="WebForms.Proveedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Css/StyleListProveedores.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mb-4">
        <div class="col-12">
            <h1 class="display-4 text-center mb-4">Listado de Productos</h1>
            <div class="d-flex justify-content-between mb-3">
                <!--<asp:Button runat="server" Text="Regresar" ID="btnVolver" OnClick="btnVolver_Click"
                    CssClass="btn btn-outline-secondary btn-lg shadow-sm" />-->
                <a href="PanelAdmin.aspx" class="back"><img class="imgback" src="/Icon/FlechaI.png"></a>
                <asp:Button runat="server" Text="Agregar Proveedor" ID="btnAgregarProveedor" OnClick="btnAgregarProveedor_Click"
                    CssClass="btn btn-primary btn-lg shadow-sm" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="table-responsive shadow-sm rounded">
                <asp:GridView ID="GVProveedores" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-striped table-bordered table-hover text-center gridview"
                    HeaderStyle-CssClass="thead-dark bg-primary text-white"
                    RowStyle-CssClass="align-middle"
                    AlternatingRowStyle-CssClass="table-light"
                    GridLines="None"
                    AllowPaging="true" PageSize="10"
                    OnPageIndexChanging="GVProveedores_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="RazonSocial" HeaderText="Proveedor"
                            HeaderStyle-CssClass="py-3" />
                        <asp:BoundField DataField="CUIT" HeaderText="CUIT"
                            HeaderStyle-CssClass="py-3" />
                        <asp:BoundField DataField="Direccion" HeaderText="Dirección"
                            HeaderStyle-CssClass="py-3" />
                        <asp:BoundField DataField="Telefono" HeaderText="Teléfono"
                            HeaderStyle-CssClass="py-3" />
                        <asp:BoundField DataField="Email" HeaderText="Correo Electrónico"
                            HeaderStyle-CssClass="py-3" />
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="alert alert-info text-center py-4">
                            No hay proveedores registrados.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
