<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Confirmacion.aspx.cs" Inherits="WebForms.Confirmacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/StyleError.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
     <div class="error-container text-center">
     
     <div class="error-icon">
         <i class="bi bi-exclamation-triangle-fill"></i>
     </div>

     
     <h3 class="mb-3">En breve recibiras un email con la informacion solicitada</h3>

    
     <asp:Label ID="lblMensaje" runat="server" CssClass="fs-5 text-muted mb-4 d-block" Text=""></asp:Label>

     
     <a href="Default.aspx" class="btn-home">
         <i class="bi bi-house-door me-2"></i>Volver al inicio
     </a>
 </div>
        
</asp:Content>
