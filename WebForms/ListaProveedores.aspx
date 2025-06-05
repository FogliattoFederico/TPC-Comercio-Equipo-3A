<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListaProveedores.aspx.cs" Inherits="WebForms.Proveedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--    <h1>Proveedores</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <!--Aqui se mostraran los distintos proveedores y cada uno tengra un boton de accion para modificar y para
                realizar una compra-->
        </ContentTemplate>
    </asp:UpdatePanel>--%>
    <div class="container-fluid mt-4">
        <div class="row mb-4">
            <div class="col-12">
                <h1 class="display-4 text-center mb-4">Listado de Proveedores</h1>
                <div class="d-flex justify-content-end mb-3">
                    <asp:Button runat="server" Text="Agregar Proveedor" ID="btnAgregar" OnClick="btnAgregar_Click"
                        CssClass="btn btn-primary btn-lg shadow-sm" />
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <div class="table-responsive shadow-sm rounded">
                    <asp:GridView id="GVProveedores" runat="server" AutoGenerateColumns="False"
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
