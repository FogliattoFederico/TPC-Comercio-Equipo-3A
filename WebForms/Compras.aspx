<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="WebForms.Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Css/StyleCompras.css">
    <script src="<%= ResolveUrl("~/Scripts/Funciones.js") %>"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<ul class="nav flex-column ">
        <li><img src="/Icon/CamionB.png"><span>Ordenes de compra</span>
            <ul>
                <li>
                    <a href="#" onclick="mostrarSeccion('OCPendientes')">OC Pendientes</a>
                </li>
                <li>
                    <a href="#" onclick="mostrarSeccion('NuevaOC')">OC Nueva</a>
                </li>
            </ul>
        </li>
        <li >
            <img src="/Icon/GraficoB.png"><a href="#" onclick="mostrarSeccion('HistorialPrecios')">Historial de precios</a>
        </li>
        <li >
            <img src="/Icon/PortafolioB.png"><a href="#" onclick="mostrarSeccion('Proveedores')">Proveedores</a>
        </li>
        <li >
            <img src="/Icon/TiendaB.png"><a href="#" onclick="mostrarSeccion('Productos')">Productos</a>
        </li>
    </ul>
	<div id="contenedor-secciones">

		<div id="OCPendientes" style="display: none;">
			<h1 class="titulo">Ordenes de compra pendientes</h1>
		</div>
		<div id="NuevaOC" style="display: none;">
			<h1 class="titulo">Ordene de compra</h1>
		</div>
		<div id="HistorialPrecios" style="display: none;">
			<h1 class="titulo">Historial de precios</h1>
		</div>
		<div id="Productos" style="display: none;">
			<h1 class="titulo">Productos</h1>
		</div>
		<div id="Proveedores" style="display: none;">
			<h1 class="titulo">Proveedores</h1>
			<asp:GridView ID="GridProveedores" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="10"
				CssClass="table table-striped table-bordered table-hover text-center gridview"
				HeaderStyle-CssClass="thead-dark"
				GridLines="None" OnPageIndexChanging="GridProveedores_PageIndexChanging">
				<Columns>
					<asp:BoundField DataField="RazonSocial" HeaderText="Razón Social" />
					<asp:BoundField DataField="CUIT" HeaderText="CUIT" />
					<asp:BoundField DataField="Direccion" HeaderText="Dirección" />
					<asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
					<asp:BoundField DataField="Email" HeaderText="E-mail" />
				</Columns>
			</asp:GridView>
		</div>


	</div>




</asp:Content>
