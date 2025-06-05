<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListaUsuarios.aspx.cs" Inherits="WebForms.ListaUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center m-5">Listado de Usuarios</h1>
    <asp:GridView ID="GVUsuarios" runat="server" AutoGenerateColumns="False"
        CssClass="table table-striped table-bordered table-hover text-center gridview"
        HeaderStyle-CssClass="thead-dark">
        <Columns>
            <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="FechaAlta" HeaderText="Fecha Alta" />
            <asp:TemplateField HeaderText="Rol">
                <ItemTemplate>
                    <%# Eval("Rol").ToString() == "1" ? "Administrador" : "Vendedor" %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button Text="Agregar Usuario" runat="server" ID="btnAgregarUsuario" OnClick="btnAgregarUsuario_Click" CssClass="btn btn-primary" />
</asp:Content>
