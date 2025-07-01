<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CambiarContraseña.aspx.cs" Inherits="WebForms.CambiarContraseña" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!-- <asp:Panel ID="pnlCambioContraseña" runat="server" DefaultButton="btnAceptar">
        <div style="height: auto; max-width: 500px; margin: 0 auto; margin-bottom: 60px; margin-top: 60px; padding: 40px; background: linear-gradient(145deg, #ffffff, #f5f7fa); border-radius: 12px; box-shadow: 0 8px 20px rgba(0,0,0,0.08); font-family: 'Segoe UI', Arial, sans-serif;">
            <h2 style="text-align: center; margin-bottom: 25px; color: #2c3e50; font-weight: 600; font-size: 28px;">Cambio de contraseña</h2>

            <asp:Label ID="lblMensaje" runat="server" ForeColor="#e74c3c" Style="display: block; margin-bottom: 20px; text-align: center;"></asp:Label>

            <div style="display: flex; flex-direction: column ; gap: 20px; margin-bottom: 20px;">
                <div>
                    <asp:Label ID="PassActual" runat="server" Text="Contraseña Actual" Style="display: block; margin-bottom: 5px; color: #7f8c8d; font-size: 14px; font-weight: 500;"></asp:Label>
                    <asp:TextBox ID="txtPassActual" runat="server" TextMode="Password" CssClass="form-control" Width="100%"
                        Style="padding: 10px; border: 1px solid #ddd; border-radius: 6px; color: #95a5a6;" />
                    
                </div>
                <div>
                    <asp:Label ID="lblPassNueva" runat="server" Text="Contraseña Nueva" Style="display: block; margin-bottom: 5px; color: #7f8c8d; font-size: 14px; font-weight: 500;"></asp:Label>
                    <asp:TextBox ID="txtPassNueva"  runat="server" TextMode="Password" placeHolder="Una letra mayuscula, un numero y un caracter" CssClass="form-control" Width="100%"
                        Style="padding: 10px; border: 1px solid #ddd; border-radius: 6px; transition: border 0.3s;" />
                    
                </div>
                <div>
                    <asp:Label ID="lblPassNueva2" runat="server" Text="Reingrese Contraseña Nueva" Style="display: block; margin-bottom: 5px; color: #7f8c8d; font-size: 14px; font-weight: 500;"></asp:Label>
                    <asp:TextBox ID="txtPassNueva2"  runat="server" placeHolder="Una letra mayuscula, un numero y un caracter" TextMode="Password" CssClass="form-control" Width="100%"
                        Style="padding: 10px; border: 1px solid #ddd; border-radius: 6px; transition: border 0.3s;" />
                    
                </div>
            </div>

            <div style="text-align: center; margin-top: 20px;">
                <asp:Button ID="btnAceptar" runat="server" Text="Cambiar Contraseña" CssClass="btn btn-primary"
                    Style="padding: 10px 25px; background-color: #3498db; border: none; border-radius: 6px; color: white; cursor: pointer; font-weight: 500; transition: background-color 0.3s;"
                    OnClick="btnAceptar_Click" ValidationGroup="CambioPass" />
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary"
                    Style="padding: 10px 25px; margin-left: 10px; background-color: #95a5a6; border: none; border-radius: 6px; color: white; cursor: pointer; font-weight: 500; transition: background-color 0.3s;"
                    OnClick="btnCancelar_Click" CausesValidation="false" />
            </div>
        </div>
    </asp:Panel>-->
</asp:Content>






