<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.Master" AutoEventWireup="true" CodeBehind="AltaMarca.aspx.cs" Inherits="WebForms.AltaMarca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlProductos" runat="server" DefaultButton="btnAceptar">
        <div style="max-width: 600px; margin: 40px auto; padding: 30px; background-color: #ffffff; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); font-family: 'Segoe UI', Arial, sans-serif;">
            <h2 style="text-align: center; margin-bottom: 25px; color: #2c3e50; font-weight: 600;">Alta de marcas</h2>

            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red" Style="display: block; margin-bottom: 20px; text-align: center;"></asp:Label>

            <div style="display: grid; grid-template-columns: 1fr 3fr; gap: 20px; margin-bottom: 20px;">
                <div>
                    <asp:Label ID="lblID" runat="server" Text="ID:" Style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
                    <asp:TextBox ID="txtID" runat="server" Enabled="false" CssClass="form-control" Style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px;" />
                </div>
                <div>
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:" Style="display: block; margin-bottom: 5px; font-weight: 500; color: #34495e;"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" AutoPostBack="true" OnTextChanged="txtNombre_TextChanged" CssClass="form-control" Style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; transition: border 0.3s;" />
                </div>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar"
                    CssClass="btn btn-outline-secondary me-md-2" OnClick="btnCancelar_Click" />
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar"
                    CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
            </div>

            <%--  <div style="display: flex; justify-content: space-between; gap: 15px;">
        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click"
            style="flex: 1; padding: 12px; background-color: #3498db; color: white; border: none; border-radius: 6px; font-weight: 500; cursor: pointer; transition: background-color 0.3s;" 
            onmouseover="this.style.backgroundColor='#2980b9'" onmouseout="this.style.backgroundColor='#3498db'" />
            
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" OnClick="btnCancelar_Click"
            style="flex: 1; padding: 12px; background-color: #e74c3c; color: white; border: none; border-radius: 6px; font-weight: 500; cursor: pointer; transition: background-color 0.3s;" 
            onmouseover="this.style.backgroundColor='#c0392b'" onmouseout="this.style.backgroundColor='#e74c3c'" />
    </div>--%>
        </div>
    </asp:Panel>
</asp:Content>
