<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedores.Master" AutoEventWireup="true" CodeBehind="PanelVendedores.aspx.cs" Inherits="WebForms.Vendedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center align-items-center" style="height: 700px;">
        <div style="max-width: 800px; margin: 60px auto; padding: 30px; background-color: #f9f9f9; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
            <h2 class="text-center mt-4">Panel de Vendedores</h2>

            <div class="container mt-5">
                <div class="row row-cols-1 row-cols-md-3 g-4  justify-content-center">
                    <div class="col text-center" style="width:200px">
                        <asp:Button ID="btnProductos" runat="server" Text="📦 Productos" CssClass="btn btn-primary btn-lg w-100 px-1" PostBackUrl="~/ListaProductos.aspx" />
                    </div>

                    <div class="col text-center">
                        <asp:Button ID="btnClientes" runat="server" Text="🧍 Clientes" CssClass="btn btn-primary btn-lg w-100" PostBackUrl="~/ListaClientes.aspx" />
                    </div>

                    <div class="col text-center">
                        <asp:Button ID="btnVentas" runat="server" Text="🧾 Ventas" CssClass="btn btn-primary btn-lg w-100" PostBackUrl="~/ListaVentas.aspx" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
