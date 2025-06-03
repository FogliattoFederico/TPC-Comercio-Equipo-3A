<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="WebForms.Proveedores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Proveedores</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <!--Aqui se mostraran los distintos proveedores y cada uno tengra un boton de accion para modificar y para
                realizar una compra-->
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button runat="server" Text="Agregar Proveedor" id="btnAgregar" OnClick="btnAgregar_Click" CssClass="btn btn-primary"    />
</asp:Content>
