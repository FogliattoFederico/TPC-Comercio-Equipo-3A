<%@ Page Title="" Language="C#" MasterPageFile="~/Vendedores.Master" AutoEventWireup="true" CodeBehind="ListaClientes.aspx.cs" Inherits="WebForms.Clientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mb-4">
        <div class="col-12">
            <h1 class="display-4 text-center mb-4">Listado de Clientes</h1>
            <div class="d-flex justify-content-between mb-3">
                <asp:Button runat="server" Text="Regresar" ID="btnVolver" OnClick="btnVolver_Click"
                    CssClass="btn btn-outline-secondary btn-lg shadow-sm" />
                <asp:Button runat="server" Text="Agregar Cliente" ID="btnAgregarCliente" OnClick="btnAgregarCliente_Click"
                    CssClass="btn btn-primary btn-lg shadow-sm" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <div class="table-responsive shadow-sm rounded">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <!--Aca van los clientes-->
                        <asp:GridView ID="dgvClientes" runat="server" AutoGenerateColumns="False"
                            CssClass="table table-striped table-bordered table-hover text-center gridview"
                            HeaderStyle-CssClass="bg-primary text-white text-center"
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
                            <HeaderStyle CssClass="bg-primary text-white text-center" />
                            <AlternatingRowStyle CssClass="bg-light" />
                            <PagerStyle HorizontalAlign="Center" CssClass="pagination" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
