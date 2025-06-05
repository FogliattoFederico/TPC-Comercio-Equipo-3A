<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedores.Master" AutoEventWireup="true" CodeBehind="ListaClientes.aspx.cs" Inherits="WebForms.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center m-5">Clientes</h1>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <!--Aca van los clientes-->
            <asp:GridView ID="dgvClientes" runat="server" AutoGenerateColumns="False"
                CssClass="table table-striped table-bordered table-hover text-center gridview">
                <Columns>
                
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Dni" HeaderText="DNI" />
                    <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />

                </Columns>
                
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button Text="Agregar Cliente" runat="server" ID="btnAgregarCliente" OnClick="btnAgregarCliente_Click" CssClass="btn btn-primary" />
</asp:Content>
