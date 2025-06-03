<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedores.Master" AutoEventWireup="true" CodeBehind="AltaCliente.aspx.cs" Inherits="WebForms.AltaCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlAltaCliente" runat="server" DefaultButton="btnAceptar">
                <div style="max-width: 400px; margin: 60px auto; padding: 30px; background-color: #f9f9f9; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
                    <h2 style="text-align: center; margin-bottom: 20px;">Cliente</h2>
                    <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>
                    <div style="margin-bottom: 15px;">
                        <asp:Label ID="lblId" runat="server" Text="Id:"></asp:Label><br />
                        <asp:TextBox ID="txtId" runat="server" CssClass="form-control" Width="100%" disabled="true" />
                    </div>
                    <div style="margin-bottom: 15px;">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre:"></asp:Label><br />
                        <asp:TextBox ID="txtRazonSocial" runat="server" CssClass="form-control" Width="100%" />
                    </div>
                    <div style="margin-bottom: 15px;">
                        <asp:Label ID="lblApellido" runat="server" Text="Apellido:"></asp:Label><br />
                        <asp:TextBox ID="txtCuit" runat="server" CssClass="form-control" Width="100%" />
                    </div>
                    <div style="margin-bottom: 15px;">
                        <asp:Label ID="lblDni" runat="server" Text="DNI:"></asp:Label><br />
                        <asp:TextBox ID="txtDni" runat="server" CssClass="form-control" Width="100%" />
                    </div>
                    <div style="margin-bottom: 15px;">
                        <asp:Label ID="lblDireccion" runat="server" Text="Direccion:"></asp:Label><br />
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" Width="100%" />
                    </div>
                    <div style="margin-bottom: 15px;">
                        <asp:Label ID="lblTelefono" runat="server" Text="Teléfono:"></asp:Label><br />
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" Width="100%" />
                    </div>
                    <div style="margin-bottom: 15px;">
                        <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label><br />
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Width="100%" />
                    </div>
                    <div class="d-flex">
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click"
                            CssClass="btn btn-primary flex-grow-1" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar"
                            CssClass="btn btn-danger flex-grow-1 ms-2" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
