﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Administradores.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="WebForms.Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Css/StyleCompras.css">
    <script src="<%= ResolveUrl("~/Scripts/Funciones.js") %>"></script>

   <script type="text/javascript">
	   function mostrarSeccion(id) {
		   var secciones = document.querySelectorAll('#contenedor-secciones > div');
		   secciones.forEach(function (sec) {
			   sec.style.display = 'none';
		   });

		   document.getElementById(id).style.display = 'block';
		   document.getElementById('<%= hfSeccionActiva.ClientID %>').value = id;
       }


	   function actualizarEstadoBotones() {
		   var haySeleccionado = false;
		   var checks = document.querySelectorAll('input[id*="chkSeleccion"]');

		   checks.forEach(function (chk) {
			   if (chk.checked) {
				   haySeleccionado = true;
			   }
		   });

		   document.getElementById("BtnModificar").disabled = !haySeleccionado;
		   document.getElementById("BtnEliminar").disabled = !haySeleccionado;
	   }
	   window.onload = function () {
		   actualizarEstadoBotones();
	   };
	  
	   
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hfSeccionActiva" runat="server" />

    <div class="sidebar">
	<ul class="nav flex-column ">
        <li><div class="icon-wrapper"><img src="/Icon/CamionB.png"></div><span class="btnMenu">Ordenes de compra</span>
            <ul>
                <li>
                    <asp:LinkButton ID="lnkOCPendientes" runat="server" OnClick="MostrarSeccion" CommandArgument="OCPendientes">
                    OC Pendientes
                </asp:LinkButton>
                </li>
                <li>
                   <asp:LinkButton ID="lnkNuevaOC" runat="server" OnClick="MostrarSeccion" CommandArgument="NuevaOC">
                    OC Nueva
                </asp:LinkButton>
                </li>
            </ul>
        </li>
        <li >
            <div class="icon-wrapper"><img src="/Icon/GraficoB.png"></div>
            <asp:LinkButton ID="lnkHistorialPrecios" cssClass="btnMenu" runat="server" OnClick="MostrarSeccion" CommandArgument="HistorialPrecios">
            Historial de precios
        </asp:LinkButton>
        </li>
        <li >
            <div class="icon-wrapper"><img src="/Icon/PortafolioB.png"></div>
            <asp:LinkButton ID="lnkProveedores" cssClass="btnMenu" runat="server" OnClick="MostrarSeccion" CommandArgument="Proveedores">
            Proveedores
        </asp:LinkButton>
        </li>
        <li >
            <div class="icon-wrapper"><img src="/Icon/TiendaB.png"></div>
            <asp:LinkButton ID="lnkProductos" cssClass="btnMenu" runat="server" OnClick="MostrarSeccion" CommandArgument="Productos">
            Productos
        </asp:LinkButton>
        </li>
    </ul>
	</div>
<!--Pantallas-->    
    <asp:UpdatePanel ID="upSecciones" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <div id="contenedor-secciones">
        <!--Pantalla OC pendientes-->    
		<div id="OCPendientes" runat="server">
			<h1 class="titulo">Ordenes de compra realizadas</h1>
                <asp:Repeater ID="rptCompras" runat="server">
    <HeaderTemplate>
        <table class="table tblOC">
            <thead class="tblOCcont">
                <tr>
                    <th>IdCompra</th>
                    <th>Fecha</th>
                    <th>Proveedor</th>
                    <th>Monto</th>
                    <th>Detalles</th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr class="tblOCcont">
            <td><%# Eval("IdCompra") %></td>
            <td><%# Eval("Fecha", "{0:dd/MM/yyyy}") %></td>
            <td><%# Eval("Proveedor.RazonSocial") %></td>
            <td><%# Eval("Total", "{0:C}") %></td>
            <td>
                
                <asp:ImageButton ID="btnDetalle" 
                    OnClick="btnDetalle_Click" 
                    CssClass="lupa" 
                    CommandArgument='<%# Eval("IdCompra") %>'
                    ImageUrl="~/Icon/lupa2.png" runat="server" />
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
            </tbody>
        </table>
    </FooterTemplate>
</asp:Repeater>

		</div>
        <!--Pantalla OC Nueva--> 
		<div id="NuevaOC" runat="server">
			<h1 class="titulo">Orden de compra</h1>
			<div class="NewOC">
                <div class="row">
                    <div class="NOC col">
                        <label>Orden de compra: </label>
                        <label>111111</label>
                    </div>
                    <div class="FOC col">
                        <label>Fecha</label>
                        <input type="date" class="input" style="width: 200px;" placeholder="dd/mm/yyyy">
                    </div>
                </div>
                <div>
                    <label>Proveedor</label>
                    <select class="form-select" style="width: 300px;" aria-label="Default select example">
                        <option selected>-</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
                <div class="row">
                    <div class="col-10">
                        <label>Producto</label>
                        <select class="form-select" style="width: 600px;" aria-label="Default select example">
                            <option selected>-</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                    <div class="col-2">
                        <label>Cantidad</label>
                        <div class="qty" style="width: 100px;">
                            <button type="button">
                                <svg fill="none" viewBox="0 0 24 24" height="14" width="14"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linejoin="round" stroke-linecap="round" stroke-width="2.5"
                                        stroke="#47484b" d="M20 12L4 12"></path>
                                </svg>
                            </button>
                            <label>0</label>
                            <button type="button">
                                <svg fill="none" viewBox="0 0 24 24" height="14" width="14"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linejoin="round" stroke-linecap="round" stroke-width="2.5"
                                        stroke="#47484b" d="M12 4V20M20 12H4"></path>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
                    <div class="row">
                        <div class="col-9">
                            <label>Precio unitario</label>
                            <input type="text" class="input" style="width: 300px;" placeholder="$">
                        </div>
                        <div class="col-3">
                            <button class="btnimg"><img src="./Icon/plus3.png"></button>
                        </div>
                    </div>

                <div class="tbl">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Producto</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Precio</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Tele</td>
                                <td>3</td>
                                <td>$50000</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Heladera</td>
                                <td>5</td>
                                <td>$84000</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Lavarropas</td>
                                <td>2</td>
                                <td>$97000</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>Horno eléctrico</td>
                                <td>5</td>
                                <td>$27000</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div>
                    <label>Total: $</label>
                    <label>1.000.000,00</label>
                </div>
                <button class="btnaceptar">Agregar</button>
            </div>
		</div>
        <!--Pantalla Historial de precios--> 
		<div id="HistorialPrecios" runat="server">
			<h1 class="titulo">Historial de precios</h1>
            
            <div class="container-fluid busqueda">
                <label>Producto</label>
                <asp:DropDownList ID="DDLHistPrecios" CssClass="lbhp" runat="server" EnableViewState="true" ViewStateMode="Enabled"></asp:DropDownList>         
                <asp:ImageButton ID="btnimg" 
                    CssClass="btnimg" 
                    CausesValidation="false" 
                    UseSubmitBehavior="true"
                    OnClick="btnimg_Click" ImageUrl="~/Icon/Lupa.png" runat="server" />
            </div>

            <asp:Panel ID="pnlAlerta" runat="server" CssClass="alert alert-warning mt-3" Visible="false">
    <asp:Label ID="lblAlerta" runat="server" CssClass="mb-0" Text=""></asp:Label>
</asp:Panel>
           

<asp:Panel ID="pnlHistorial" runat="server" Visible="false">
    
    <asp:Label ID="LblItem" runat="server" Text=""></asp:Label>
    <asp:Repeater ID="rptHistorial" runat="server">
        <HeaderTemplate>
            <table class="table">
                <thead>
                    <tr>
                        <th>Razón Social</th>
                        <th>Fecha</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("RazonSocial") %></td>
                <td><%# Eval("FechaCompra", "{0:dd/MM/yyyy}") %></td>
                <td>$<%# Eval("PrecioUnitario", "{0:N2}") %></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
                </tbody>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Panel>
		</div>



		<!--Pantalla Productos--> 
        <div id="Productos" runat="server">
			<h1 class="titulo">Productos</h1>
			
				<div class="tblProd fixed-header-gridview shadow-sm rounded">
					<asp:GridView ID="GridProductos" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="10"
						CssClass="table table-striped table-bordered table-hover text-center gridview"
						HeaderStyle-CssClass="thead-dark"
						RowStyle-CssClass="align-middle"
						AlternatingRowStyle-CssClass="align-middle"
						GridLines="None" OnPageIndexChanging="GridProductos_PageIndexChanging"
						PagerStyle-CssClass="pagination pagination-sm justify-content-center"
						PageIndex="0">
						<Columns>
							<asp:TemplateField HeaderText="✔" ItemStyle-HorizontalAlign="Center">
								<ItemTemplate>
									<asp:CheckBox ID="chkSeleccion" runat="server" onclick="actualizarEstadoBotones()" />
								</ItemTemplate>
								<HeaderStyle Width="30px" />
							</asp:TemplateField>

							<asp:BoundField DataField="TipoProducto.categoria.Nombre" HeaderText="Categoría" />
							<asp:BoundField DataField="Nombre" HeaderText="Nombre" />
							<asp:BoundField DataField="CodigoArticulo" HeaderText="Código" />
							<asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
							<asp:BoundField DataField="Marca.Nombre" HeaderText="Marca" />
							<asp:BoundField DataField="PrecioCompra" HeaderText="Precio Compra" DataFormatString="{0:C2}" />
							<asp:BoundField DataField="PorcentajeGanancia" HeaderText="% Ganancia" DataFormatString="{0}%" />
							<asp:BoundField DataField="StockActual" HeaderText="Stock" />
							<asp:BoundField DataField="StockMinimo" HeaderText="Stock Mín" />
							<asp:TemplateField HeaderText="Imagen">
								<ItemTemplate>
									<asp:Image ID="imgProducto" runat="server"
										ImageUrl='<%# Eval("ImagenUrl") %>'
										CssClass="img-thumbnail"
										Style="max-width: 80px; height: auto;"
										onerror="this.src='https://via.placeholder.com/80?text=Sin+Imagen';" />
								</ItemTemplate>
							</asp:TemplateField>
						</Columns>
					</asp:GridView>
				
                    </div>
            <div class="row" style="margin-left:150px">
	<div class="col">
		<!--<button class="btnABM">Agregar</button>-->
        <asp:Button ID="BtnAgregar" CssClass="btnABM" runat="server" Text="Agregar" />
	</div>
	<div class="col">
		<!--<button class="btnABM">Modificar</button>-->
        <asp:Button ID="BtnModificar" CssClass="btnABM" runat="server" ClientIDMode="Static" Enabled="false" Text="Modificar" />
	</div>
	<div class="col">
		<!--<button class="btnABM">Eliminar</button>-->
        <asp:Button ID="BtnEliminar" CssClass="btnABM" runat="server" ClientIDMode="Static" Enabled="false" Text="Eliminar" />
	</div>
</div>
		</div>
        <!--Pantalla Proveedores--> 
		<div id="Proveedores" runat="server" style="display: none;">
			<h1 class="titulo">Proveedores</h1>
			<div class="tblProd">
            <div class="table-responsive shadow-sm rounded">
            <asp:GridView ID="GridProveedores" runat="server" AutoGenerateColumns="False" AllowPaging="true" 
				CssClass="table table-striped table-bordered table-hover text-center gridview"
				HeaderStyle-CssClass="thead-dark"
				GridLines="None" OnPageIndexChanging="GridProveedores_PageIndexChanging">
				<Columns>
					<asp:TemplateField HeaderText="✔" ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<asp:CheckBox ID="chkSeleccion" runat="server" />
						</ItemTemplate>
						<HeaderStyle Width="30px" />
					</asp:TemplateField>

					<asp:BoundField DataField="RazonSocial" HeaderText="Razón Social" />
					<asp:BoundField DataField="CUIT" HeaderText="CUIT" />
					<asp:BoundField DataField="Direccion" HeaderText="Dirección" />
					<asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
					<asp:BoundField DataField="Email" HeaderText="E-mail" />
				</Columns>
			</asp:GridView>
                </div>
                </div>
			<div class="row" style="margin-left:150px">
				<div class="col">
					<button class="btnABM">Agregar</button>
				</div>
				<div class="col">
					<button class="btnABM">Modificar</button>
				</div>
				<div class="col">
					<button class="btnABM">Eliminar</button>
				</div>
			</div>
		</div>
				
	</div>

	 </ContentTemplate>
</asp:UpdatePanel>


</asp:Content>
