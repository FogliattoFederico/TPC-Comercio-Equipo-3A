<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListaUsuarios.aspx.cs" Inherits="WebForms.ListaUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center m-4">Usuarios</h1>
    <asp:GridView ID="GVUsuarios" runat="server" AutoGenerateColumns="False"
        CssClass="table table-striped table-bordered table-hover table-responsive rounded-3 overflow-hidden shadow-sm mt-5"
        HeaderStyle-CssClass="bg-primary text-white"
        RowStyle-CssClass="align-middle"
        AlternatingRowStyle-CssClass="align-middle"
        GridLines="None">
        <Columns>
            <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="FechaAlta" HeaderText="Fecha Alta" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
            <asp:TemplateField HeaderText="Rol">
                <ItemTemplate>
                    <span class='badge <%# Eval("Rol").ToString() == "1" ? "bg-danger" : "bg-success" %> rounded-pill'>
                        <%# Eval("Rol").ToString() == "1" ? "Administrador" : "Vendedor" %>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Button Text="Agregar Usuario" runat="server" ID="btnAgregarUsuario"
        OnClick="btnAgregarUsuario_Click" CssClass="btn btn-primary mt-3 px-4 py-2 rounded-pill fw-bold" />
</asp:Content>
