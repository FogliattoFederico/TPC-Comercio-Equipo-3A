<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebForms.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link href="css/StyleLogin.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<main>
	<div class="container">
		<div class="form">
		<div class="form_front">
			<div class="form_details">Acceso</div>
			<!--<input type="text" class="input" placeholder="Usuario">-->
			<asp:TextBox ID="TxtUser" type="text" cssclass="input" placeholder="Usuario" runat="server"></asp:TextBox>
			<!--<input type="password" class="input" placeholder="Password">-->
			<asp:TextBox ID="TxtPass" type="password" cssclass="input" placeholder="Password" runat="server"></asp:TextBox>
			<!--<button class="btn">Ingresar</button>-->
			<asp:Button ID="btnLogin" runat="server" CssClass="btn" Style="color:white;font-weight: bold;" OnClick="btnLogin_Click" Text="Ingresar" />

			<span class="switch">¿No recuerdas tu clave? 
            <label for="signup_toggle" class="signup_tog">
				Recuperar
			</label>
			</span>
		</div>
		
	</div>
</div>
</main>	
	
</asp:Content>--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebForms.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnIngresar">
        <div style="max-width: 500px; margin: 40px auto; padding: 40px; background: linear-gradient(145deg, #ffffff, #f5f7fa); border-radius: 12px; box-shadow: 0 8px 20px rgba(0,0,0,0.08); font-family: 'Segoe UI', Arial, sans-serif;">
            <h2 style="text-align: center; margin-bottom: 25px; color: #2c3e50; font-weight: 600; font-size: 28px;">Login</h2>

            <asp:Label ID="lblMensaje" runat="server" ForeColor="#e74c3c" Style="display: block; margin-bottom: 20px; text-align: center;"></asp:Label>

            <div style="display: flex; flex-direction: column; gap: 20px; margin-bottom: 20px;">
                <div>
                    <asp:Label ID="lblUsuario" runat="server" Text="Usuario" Style="display: block; margin-bottom: 5px; color: #7f8c8d; font-size: 16px; font-weight: 500;"></asp:Label>
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" Width="100%"
                        Style="padding: 10px; border: 1px solid #ddd; border-radius: 6px; background-color: #f8f9fa; color: #95a5a6;" />
                </div>

                <div>
                    <asp:Label ID="lblContrasena" runat="server" Text="Contraseña" Style="display: block; margin-bottom: 5px; color: #7f8c8d; font-size: 16px; font-weight: 500;"></asp:Label>
                    <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" Width="100%"
                        Style="padding: 10px; border: 1px solid #ddd; border-radius: 6px; background-color: #f8f9fa; color: #95a5a6;" />
                </div>
            </div>
            <div style="display: flex; gap: 15px; margin-top: 30px;">
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click"
                    Style="flex: 1; padding: 12px; background: linear-gradient(135deg, #3498db, #2980b9); color: white; border: none; border-radius: 6px; font-weight: 600; cursor: pointer; transition: all 0.3s;"
                    onmouseover="this.style.background='linear-gradient(135deg, #2980b9, #3498db)'; this.style.transform='translateY(-1px)';"
                    onmouseout="this.style.background='linear-gradient(135deg, #3498db, #2980b9)'; this.style.transform='translateY(0)';" />
            </div>
            <p class="mt-3" style="color: #7f8c8d; font-size: 16px; font-weight: 500">No tienes una cuenta ?? <a href="registro.aspx">registrate</a></p>
        </div>
    </asp:Panel>
</asp:Content>
