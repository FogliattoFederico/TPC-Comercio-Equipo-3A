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
                            <button>
                                <svg fill="none" viewBox="0 0 24 24" height="14" width="14"
                                    xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linejoin="round" stroke-linecap="round" stroke-width="2.5"
                                        stroke="#47484b" d="M20 12L4 12"></path>
                                </svg>
                            </button>
                            <label>0</label>
                            <button>
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
		<div id="HistorialPrecios" style="display: none;">
			<h1 class="titulo">Historial de precios</h1>
            <div class="busqueda">
                <label>Producto</label>
                <input type="text">
                <button class="btnimg"><img src="./Icon/Lupa.png"></button>
            </div>
		</div>
		
        
        <div id="Productos" style="display: none;">
			<h1 class="titulo">Productos</h1>
			<div class="tblProd">
				<div class="table-responsive shadow-sm rounded">
					<asp:GridView ID="GridProductos" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="10"
						CssClass="table table-striped table-bordered table-hover text-center gridview"
						HeaderStyle-CssClass="thead-dark"
						RowStyle-CssClass="align-middle"
						AlternatingRowStyle-CssClass="align-middle"
						GridLines="None" OnPageIndexChanging="GridProductos_PageIndexChanging"
						PagerStyle-CssClass="pagination pagination-sm justify-content-center"
						PageIndex="0">
						<Columns>
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
		<div id="Proveedores" style="display: none;">
			<h1 class="titulo">Proveedores</h1>
			<div class="tblProd">
            <div class="table-responsive shadow-sm rounded">
            <asp:GridView ID="GridProveedores" runat="server" AutoGenerateColumns="False" AllowPaging="true" 
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

	


</asp:Content>
