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
                CssClass="table table-striped table-bordered table-hover text-center gridview"
                HeaderStyle-CssClass="thead-dark"
                RowStyle-CssClass="align-middle"
                EmptyDataText="No se encontraron clientes"
                AllowPaging="True" PageSize="10"
                PagerStyle-CssClass="pagination"
                PagerSettings-Mode="NumericFirstLast"
                GridLines="None"
                CellPadding="4">

                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="15%" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" ItemStyle-Width="15%" />
                    <asp:BoundField DataField="Dni" HeaderText="DNI" ItemStyle-Width="12%" />
                    <asp:BoundField DataField="Telefono" HeaderText="Teléfono" ItemStyle-Width="12%" />
                    <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="18%" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" ItemStyle-Width="28%" />
                </Columns>

                <HeaderStyle CssClass="bg-primary text-white" />
                <AlternatingRowStyle CssClass="bg-light" />
                <PagerStyle HorizontalAlign="Center" CssClass="pagination" />

            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button Text="Agregar Cliente" runat="server" ID="btnAgregarCliente" OnClick="btnAgregarCliente_Click" CssClass="btn btn-primary" />
</asp:Content>
