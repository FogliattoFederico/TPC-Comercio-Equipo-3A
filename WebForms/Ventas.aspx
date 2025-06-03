<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedores.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="WebForms.Ventas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 class="text-center m-5">Ventas</h1>
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button Text="Agregar Cliente" runat="server" id="btnAgregarCliente" OnClick="btnAgregarCliente_Click" CssClass="btn btn-primary"/>
</asp:Content>
