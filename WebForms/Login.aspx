<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebForms.Login" %>
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
	
</asp:Content>
