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
    <asp:Panel ID="pnlLogin" runat="server" DefaultButton="btnLogin">
        <div style="max-width: 400px; margin: 60px auto; padding: 30px; background-color: #f9f9f9; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
            <h2 style="text-align: center; margin-bottom: 20px;">Iniciar Sesión</h2>

            <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>

            <div style="margin-bottom: 15px;">
                <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label><br />
                <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" Width="100%" />
            </div>

            <div style="margin-bottom: 20px;">
                <asp:Label ID="lblContrasena" runat="server" Text="Contraseña:"></asp:Label><br />
                <asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" CssClass="form-control" Width="100%" />
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Ingresar" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" Width="100%" />
        </div>
    </asp:Panel>
</asp:Content>
