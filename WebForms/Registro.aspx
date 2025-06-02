<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="WebForms.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlRegistrar" runat="server" DefaultButton="btnRegistrar">
        <div style="max-width: 400px; margin: 60px auto; padding: 30px; background-color: #f9f9f9; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
            <h2 style="text-align: center; margin-bottom: 20px;">Registrarse</h2>

            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>

            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label><br />
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblContrasena" runat="server" Text="Contraseña:"></asp:Label><br />
                <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label><br />
                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblApellido" runat="server" Text="Apellido:"></asp:Label><br />
                <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" Width="100%" />
            </div>
            <div style="margin-bottom: 20px;">
                <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label><br />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Width="100%" />
            </div>



            <asp:Button ID="btnRegistrar" runat="server" Text="Registrar" OnClick="btnRegistrar_Click" CssClass="btn btn-primary btn-block" Width="100%" />
        </div>
    </asp:Panel>
</asp:Content>
