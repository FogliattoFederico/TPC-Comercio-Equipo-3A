<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.Master" AutoEventWireup="true" CodeBehind="ListaUsuarios.aspx.cs" Inherits="WebForms.ListaUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Css/StyleListUsuarios.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row mb-4">
        <div class="col-12">
            <h1 class="display-4 text-center mt-4 mb-4">Listado de Usuarios</h1>
            <div class="d-flex justify-content-between mb-3">
                <!--<asp:Button runat="server" Text="Regresar" ID="btnVolver" OnClick="btnVolver_Click"
                    CssClass="btn btn-outline-secondary btn-lg shadow-sm" />-->
                <a href="PanelAdmin.aspx" class="back">
                    <img class="imgback" src="/Icon/FlechaI.png"></a>

                <asp:Button runat="server" Text="Agregar Usuario" ID="btnAgregarUsuario" OnClick="btnAgregarUsuario_Click"
                    CssClass="btn btn-primary btn-lg shadow-sm" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="table-responsive shadow-sm rounded">
                <asp:GridView ID="GVUsuarios" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-striped table-bordered table-hover text-center gridview"
                    HeaderStyle-CssClass="bg-primary text-white"
                    RowStyle-CssClass="align-middle"
                    AlternatingRowStyle-CssClass="align-middle"
                    GridLines="None"
                    EmptyDataText="No se encontraron usuarios"
                    DataKeyNames="IdUsuario"
                    OnSelectedIndexChanged="GVUsuarios_SelectedIndexChanged"
                    OnRowDeleting="GVUsuarios_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" HeaderStyle-CssClass="py-3" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" HeaderStyle-CssClass="py-3"/>
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" HeaderStyle-CssClass="py-3" />
                        <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-CssClass="py-3" />
                        <asp:BoundField DataField="FechaAlta" HeaderText="Fecha Alta" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" HeaderStyle-CssClass="py-3" />
                        <asp:TemplateField HeaderText="Rol" HeaderStyle-CssClass="py-3">
                            <ItemTemplate>
                                <span class='badge <%# Eval("Admin") != null && (bool)Eval("Admin") ? "bg-danger" : "bg-success" %> rounded-pill '>
                                    <%# Eval("Admin") != null && (bool)Eval("Admin") ? "Administrador" : "Vendedor" %>
                                </span H>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField HeaderText="Acciones"
                            HeaderStyle-CssClass="py-3"
                            ShowSelectButton="true"
                            SelectText="<i class='fas fa-edit'></i> Modificar"
                            ShowDeleteButton="true"
                            DeleteText="<i class='fas fa-trash-alt'></i> Eliminar"
                            ButtonType="Link"
                            ControlStyle-CssClass="btn btn-sm" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
