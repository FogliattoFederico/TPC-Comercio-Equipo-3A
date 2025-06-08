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
    <div class="card mb-4 shadow-0 border-0">
        <div class="card-body">
            <div class="row align-items-center justify-content-center">
                <div class="col-md-6 mb-3 mb-md-0">
                    <div class="input-group">
                        <asp:TextBox ID="txtBuscarDni" runat="server"
                            CssClass="form-control form-control-lg me-3"
                            placeholder="Ingrese DNI del cliente"
                            MaxLength="8"></asp:TextBox>
                        <div class="input-group-append">
                            <asp:Button ID="btnBuscar" runat="server" Text="Buscar"
                                CssClass="btn btn-primary btn-lg" />
                        </div>
                    </div>
                </div>
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
                            AllowPaging="True" PageSize="5"
                            PagerStyle-CssClass="pagination"
                            PagerSettings-Mode="NumericFirstLast"
                            GridLines="None"
                            CellPadding="4"
                            DataKeyNames="IdCliente"
                            OnSelectedIndexChanged="dgvClientes_SelectedIndexChanged"
                            OnPageIndexChanging="dgvClientes_PageIndexChanging"
                            OnRowDeleting="dgvClientes_RowDeleting">

                            <Columns>
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" ItemStyle-Width="15%" />
                                <asp:BoundField DataField="Apellido" HeaderText="Apellido" ItemStyle-Width="15%" />
                                <asp:BoundField DataField="Dni" HeaderText="DNI" ItemStyle-Width="12%" />
                                <asp:BoundField DataField="Telefono" HeaderText="Teléfono" ItemStyle-Width="12%" />
                                <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="18%" />
                                <asp:BoundField DataField="Direccion" HeaderText="Dirección" ItemStyle-Width="28%" />

                                <asp:CommandField HeaderText="Acciones"
                                    ShowSelectButton="true"
                                    SelectText="<i class='fas fa-edit'></i> Modificar"
                                    ShowDeleteButton="true"
                                    DeleteText="<i class='fas fa-trash-alt'></i> Eliminar"
                                    ButtonType="Link"
                                    ControlStyle-CssClass="btn btn-sm" />
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
