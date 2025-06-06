<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListaUsuarios.aspx.cs" Inherits="WebForms.ListaUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid mt-4">
        <div class="row mb-4">
            <div class="col-12">
                <h1 class="display-4 text-center mb-4">Listado de Usuarios</h1>
                <div class="d-flex justify-content-end ">
                    <asp:Button runat="server" Text="Agregar Usuario" ID="btnAgregarUsuario" OnClick="btnAgregarUsuario_Click"
                        CssClass="btn btn-primary btn-lg shadow-sm" />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="table-responsive shadow-sm rounded">
                <asp:GridView ID="GVUsuarios" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-striped table-bordered table-hover table-responsive rounded-3 overflow-hidden shadow-sm"
                    HeaderStyle-CssClass="bg-primary text-white"
                    RowStyle-CssClass="align-middle"
                    AlternatingRowStyle-CssClass="align-middle"
                    GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="NombreUsuario" HeaderText="Usuario" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="FechaAlta" HeaderText="Fecha Alta" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                        <asp:TemplateField HeaderText="Rol">
                            <ItemTemplate>
                                <span class='badge <%# Eval("Rol").ToString() == "1" ? "bg-danger" : "bg-success" %> rounded-pill'>
                                    <%# Eval("Rol").ToString() == "1" ? "Administrador" : "Vendedor" %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
