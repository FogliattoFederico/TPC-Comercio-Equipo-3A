<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="WebForms.Ventas1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center m-5">Ventas</h1>
    <asp:GridView ID="GVVentas" runat="server" AutoGenerateColumns="False"
        CssClass="table table-striped table-bordered table-hover text-center gridview"
        HeaderStyle-CssClass="thead-dark">
        <Columns>
            <asp:BoundField DataField="IdVenta" HeaderText="IdVenta" />
            <asp:BoundField DataField="Fecha" HeaderText="Fecha" />
            <asp:BoundField DataField="Cliente.Nombre" HeaderText="Cliente" />
            <asp:BoundField DataField="Cliente.Apellido" HeaderText="Apellido" />
            <asp:BoundField DataField="Total" HeaderText="Monto" DataFormatString="{0:C}" HtmlEncode="false" />
            <asp:TemplateField HeaderText="Detalles">
                <ItemTemplate>
                    <asp:Button ID="btnDetalles" runat="server" Text="Ver Detalles" CssClass="btn btn-primary" PostBackUrl='<%# "VentaDetalles.aspx?ID=" + Eval("IdVenta") %>' />
                    <a href='<%# "VentaDetalles.aspx?ID=" + Eval("IdVenta") %>' class="icono" title="Ver Detalles">
                        <i class="fa-solid fa-search" style="color: dimgrey; margin: 10px"></i>
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button Text="Agregar Venta" runat="server" id="btnAgregarVenta" OnClick="btnAgregarVenta_Click" CssClass="btn btn-primary"/>
</asp:Content>
