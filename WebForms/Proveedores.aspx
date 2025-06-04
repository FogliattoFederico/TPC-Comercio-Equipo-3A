<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="WebForms.Proveedores" %>

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
    <h1 class="text-center m-5">Listado de Proveedores</h1>
    <asp:GridView ID="GVProveedores" runat="server" AutoGenerateColumns="False"
        CssClass="table table-striped table-bordered table-hover text-center gridview"
        HeaderStyle-CssClass="thead-dark">
        <Columns>
            <asp:BoundField DataField="RazonSocial" HeaderText="Proveedor" />
            <asp:BoundField DataField="CUIT" HeaderText="CUIT" />
            <asp:BoundField DataField="Direccion" HeaderText="Direccion" />
            <asp:BoundField DataField="Telefono" HeaderText="Telefono" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
        </Columns>
    </asp:GridView>
    <asp:Button runat="server" Text="Agregar Proveedor" ID="btnAgregar" OnClick="btnAgregar_Click" CssClass="btn btn-primary" />
</asp:Content>
