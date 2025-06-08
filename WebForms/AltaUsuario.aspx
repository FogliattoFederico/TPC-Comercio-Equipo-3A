<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedores.Master" AutoEventWireup="true" CodeBehind="AltaUsuario.aspx.cs" Inherits="WebForms.AltaVendedor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlUsuario" runat="server" DefaultButton="btnGuardar">
        <div style="max-width: 500px; margin: 40px auto; margin-bottom: 60px; padding: 30px; background-color: #ffffff; border-radius: 10px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); font-family: 'Segoe UI', Arial, sans-serif;">
            <h2 style="text-align: center; margin-bottom: 25px; color: #2c3e50; font-weight: 600; border-bottom: 2px solid #f1f1f1; padding-bottom: 10px;">
                <i class="fas fa-user-cog" style="margin-right: 10px;"></i>Gestión de Usuario
            </h2>

            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" Style="display: block; margin-bottom: 20px; text-align: center; padding: 10px; background-color: #ffeeee; border-radius: 5px;"></asp:Label>


            <div style="display: grid; grid-template-columns: 80px 1fr; gap: 15px; margin-bottom: 15px;">
                <div>
                    <asp:Label ID="lblIdUsuario" runat="server" Text="ID:" Style="display: block; margin-bottom: 5px; font-weight: 500; color: #5d6d7e; font-size: 14px;"></asp:Label>
                    <asp:TextBox ID="txtIdUsuario" runat="server" ReadOnly="true" Style="width: 100%; padding: 8px 10px; border: 1px solid #e0e0e0; border-radius: 5px; background-color: #f9f9f9;"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lblNombreUsuario" runat="server" Text="Nombre Usuario:" Style="display: block; margin-bottom: 5px; font-weight: 500; color: #5d6d7e; font-size: 14px;"></asp:Label>
                    <asp:TextBox ID="txtNombreUsuario" runat="server" Style="width: 100%; padding: 8px 10px; border: 1px solid #e0e0e0; border-radius: 5px;"></asp:TextBox>
                </div>
            </div>


            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-bottom: 15px;">
                <div>
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:" Style="display: block; margin-bottom: 5px; font-weight: 500; color: #5d6d7e; font-size: 14px;"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" Style="width: 100%; padding: 8px 10px; border: 1px solid #e0e0e0; border-radius: 5px;"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lblApellido" runat="server" Text="Apellido:" Style="display: block; margin-bottom: 5px; font-weight: 500; color: #5d6d7e; font-size: 14px;"></asp:Label>
                    <asp:TextBox ID="txtApellido" runat="server" Style="width: 100%; padding: 8px 10px; border: 1px solid #e0e0e0; border-radius: 5px;"></asp:TextBox>
                </div>
            </div>


            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblEmail" runat="server" Text="Email:" Style="display: block; margin-bottom: 5px; font-weight: 500; color: #5d6d7e; font-size: 14px;"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" Style="width: 100%; padding: 8px 10px; border: 1px solid #e0e0e0; border-radius: 5px;"></asp:TextBox>
            </div>

            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblContrasena" runat="server" Text="Contraseña:" Style="display: block; margin-bottom: 5px; font-weight: 500; color: #5d6d7e; font-size: 14px;"></asp:Label>
                <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" Style="width: 100%; padding: 8px 10px; border: 1px solid #e0e0e0; border-radius: 5px;"></asp:TextBox>
            </div>


            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-bottom: 20px;">
                <div class="form-group">
                    <asp:Label ID="lblFechaAlta" runat="server"
                        Text="Fecha Alta:"
                        CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtFechaAlta" runat="server"
                        TextMode="Date"
                        CssClass="form-control mt-1"
                        Enabled="false"
                        ReadOnly="true"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lblRol" runat="server" Text="Rol:" Style="display: block; margin-bottom: 5px; font-weight: 500; color: #5d6d7e; font-size: 14px;"></asp:Label>
                    <asp:DropDownList ID="ddlRol" runat="server" Style="width: 100%; padding: 8px 10px; border: 1px solid #e0e0e0; border-radius: 5px; background-color: white;">
                        <asp:ListItem Text="Seleccione Rol" Value="" />
                        <asp:ListItem Text="Admin" Value="Admin" />
                        <asp:ListItem Text="Vendedor" Value="Vendedor" />
                    </asp:DropDownList>
                </div>
            </div>


            <div style="display: flex; justify-content: flex-end; gap: 10px; margin-top: 20px;">
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"
                    Style="padding: 8px 20px; background-color: #f5f5f5; color: #555; border: 1px solid #ddd; border-radius: 5px; cursor: pointer; transition: all 0.3s;"
                    onmouseover="this.style.backgroundColor='#e9e9e9'" onmouseout="this.style.backgroundColor='#f5f5f5'" />

                <asp:Button ID="btnGuardar" runat="server" Text="Guardar"
                    Style="padding: 8px 25px; background-color: #3498db; color: white; border: none; border-radius: 5px; cursor: pointer; transition: all 0.3s;"
                    onmouseover="this.style.backgroundColor='#2980b9'" onmouseout="this.style.backgroundColor='#3498db'" />
            </div>
        </div>
    </asp:Panel>
</asp:Content>
