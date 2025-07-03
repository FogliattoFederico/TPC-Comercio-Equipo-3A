<%@ Page Title="" Language="C#" MasterPageFile="~/Venta.Master" AutoEventWireup="true" CodeBehind="AltaVenta.aspx.cs" Inherits="WebForms.Vendedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Css/StylePanelVentas.css">


    <script type="text/javascript">
        const toastTrigger = document.getElementById('BtnFacturar')
        const toastLiveExample = document.getElementById('liveToast')

        if (toastTrigger) {
            const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
            toastTrigger.addEventListener('click', () => {
                toastBootstrap.show()
            })
        }
	 </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- <div class="d-flex justify-content-center align-items-center" style="height: 700px;">
        <div style="max-width: 800px; margin: 60px auto; padding: 30px; background-color: #f9f9f9; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
            <h2 class="text-center mt-4">Panel de Vendedores</h2>

            <div class="container mt-5">
                <div class="row row-cols-1 row-cols-md-3 g-4  justify-content-center">
                    <div class="col text-center" style="width:200px">
                        <asp:Button ID="btnProductos" runat="server" Text="📦 Productos" CssClass="btn btn-primary btn-lg w-100 px-1" PostBackUrl="~/ListaProductos.aspx" />
                    </div>

                    <div class="col text-center">
                        <asp:Button ID="btnClientes" runat="server" Text="🧍 Clientes" CssClass="btn btn-primary btn-lg w-100" PostBackUrl="~/ListaClientes.aspx" />
                    </div>

                    <div class="col text-center">
                        <asp:Button ID="btnVentas" runat="server" Text="🧾 Ventas" CssClass="btn btn-primary btn-lg w-100" PostBackUrl="~/ListaVentas.aspx" />
                    </div>
                </div>
            </div>
        </div>
    </div>-->

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="venta">
        <div class="row info-venta">
            <div class="col">
                <label>Fecha</label>
                <asp:Label ID="lblFechaVenta" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col">
                <h3 class="titulo">Venta</h3>
            </div>
            <div class="col text-end">
                <label>Número de factura</label>
                <asp:Label ID="lblNumFactura" runat="server" Text=""></asp:Label>
            </div>
        </div>

        <div class="mb-4">
            <label class="form-label">Vendedor</label>
            <div class="row">
                <div class="col">
                    <%--<input type="text" class="form-control" placeholder="Nombre">--%><asp:Label ID="lblNombreUsuario" runat="server" Text=""></asp:Label>
                </div>
                <div class="col">
                    <%--<input type="text" class="form-control" placeholder="Apellido">--%><asp:Label ID="lblApellidoUsuario" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <hr class="separador">
        <div class="row">
            <div class="col-4 seccionDC">
                <h6 class="subtit">Datos del cliente</h6>
                <asp:UpdatePanel ID="UpdatePanelBuscarCliente" runat="server">
                    <ContentTemplate>
                        <div class="row mb-2 align-items-end">
                            <div class="col">
                                <label>DNI</label>
                                <asp:TextBox ID="txtDNICliente" runat="server" class="form-control" placeholder="Ingrese su DNI"
                                    MaxLength="8"
                                    onkeypress="return event.charCode >= 48 && event.charCode <= 57">
                                </asp:TextBox>
<%--                                <asp:TextBox ID="txtDNICliente" runat="server"
                                    class="form-control"
                                    placeholder="Ingrese su DNI"
                                    MaxLength="8"
                                    onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                                    pattern="\d{8}"
                                    title="Debe ingresar exactamente 8 dígitos">
                                </asp:TextBox>--%>
                            </div>
                            <div class="col text-end">
                                <asp:ImageButton ID="btnimg" CssClass="btnimg_lup"
                                    ImageUrl="~/Icon/Lupa.png"
                                    runat="server"
                                    OnClick="btnimg_Click" />
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col">
                                <label>Nombre</label>
                                <asp:TextBox ID="txtNombreCliente" runat="server"
                                    class="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label>Apellido</label>
                                <asp:TextBox ID="txtApellidoCliente" runat="server"
                                    class="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col">
                                <label>Teléfono</label>
                                <asp:TextBox ID="txtTelefonoCliente" runat="server"
                                    class="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label>Mail</label>
                                <asp:TextBox ID="txtMailCliente" runat="server"
                                    class="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                        <div>
                            <label>Dirección</label>
                            <asp:TextBox ID="txtDireccionCliente" runat="server"
                                class="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>


            <div class="col-8">
                <asp:UpdatePanel ID="UpdatePanelVenta" runat="server">
                    <ContentTemplate>
                        <h6 class="subtit">Detalle de venta</h6>
                        <!-- Fila 1: Marca - Categoría - Tipo de Producto -->
                        <div class="row mb-2">
                            <div class="col">
                                <label>Marca</label>
                                <asp:DropDownList ID="DDLMarcas" runat="server"
                                    OnSelectedIndexChanged="DDLMarcas_SelectedIndexChanged"
                                    AutoPostBack="true"
                                    Style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; background-color: white; transition: border 0.3s;">
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <label>Categoría</label>
                                <asp:DropDownList ID="DDLCategorias" runat="server"
                                    OnSelectedIndexChanged="DDLCategorias_SelectedIndexChanged"
                                    AutoPostBack="true"
                                    Style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; background-color: white; transition: border 0.3s;">
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <label>Tipo de Producto</label>
                                <asp:DropDownList ID="DDLTipoProductos" runat="server"
                                    OnSelectedIndexChanged="DDLTipoProductos_SelectedIndexChanged"
                                    AutoPostBack="true"
                                    Style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; background-color: white; transition: border 0.3s;">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- Fila 2: Producto y Cantidad -->
                        <div class="row mb-3">
                            <div class="col-9">
                                <label>Producto</label>
                                <asp:DropDownList ID="DDLProductos" runat="server" OnSelectedIndexChanged="DDLProductos_SelectedIndexChanged" AutoPostBack="true"
                                    Style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 6px; background-color: white; transition: border 0.3s;">
                                </asp:DropDownList>
                            </div>
                            <div class="col-2">
                                <label>Cantidad</label>
                                <div class="qty" style="width: 100px; display: flex; align-items: center;">
                                    <asp:Button ID="btnMenos" runat="server" Text="-" OnClick="btnMenos_Click" Enabled="false"
                                        Style="width: 30px; height: 30px; font-size: 16px; font-weight: bold; border: none; background-color: transparent; color: #47484b; cursor: pointer; padding: 0;" />


                                    <asp:TextBox ID="txtCantidad" runat="server" Text="0" ReadOnly="true" Enabled="false"
                                        Style="width: 40px; margin: 0 5px; border: none; background-color: transparent; font-weight: bold; font-size: 14px; text-align: center;" />

                                    <asp:Button ID="btnMas" runat="server" Text="+" OnClick="btnMas_Click" Enabled="false"
                                        Style="width: 30px; height: 30px; font-size: 16px; font-weight: bold; border: none; background-color: transparent; color: #47484b; cursor: pointer; padding: 0;" />
                                </div>
                            </div>
                            <div class="col-1" style="display: block; margin-top: 30px; justify-content: center">
                                <asp:ImageButton ID="BtnPlus" CssClass="btnimgPlus" ImageUrl="./Icon/plus3.png" runat="server" OnClick="BtnPlus_Click" />
                            </div>
                        </div>


                        <%--<table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>#</th>
                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Tele</td>
                            <td>3</td>
                            <td>$50,000</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Heladera</td>
                            <td>5</td>
                            <td>$84,000</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Lavarropas</td>
                            <td>2</td>
                            <td>$97,000</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Horno eléctrico</td>
                            <td>5</td>
                            <td>$27,000</td>
                        </tr>
                    </tbody>
                </table>--%>
                        <asp:Panel ID="PanelAleta" runat="server" CssClass="alert alert-warning mt-3" Visible="false">
                            <asp:Label ID="lblAlerta2" runat="server" CssClass="mb-0" Text=""></asp:Label>
                        </asp:Panel>
                        <asp:Panel ID="PanelAlertaOK" runat="server" CssClass="alert alert-success mt-3" Visible="false">
                            <asp:Label ID="LblAlertaOK" runat="server" CssClass="mb-0" Text=""></asp:Label>
                        </asp:Panel>
                        <div class="tbl">
                            <asp:GridView ID="GVVenta" runat="server" AutoGenerateColumns="False"
                                CssClass="table" OnRowCommand="GVVenta_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="Producto.IdProducto" HeaderText="ID" Visible="False" />
                                    <asp:BoundField DataField="Producto.Nombre" HeaderText="Producto" />
                                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                                    <asp:BoundField DataField="PrecioVenta" HeaderText="Precio Unitario" DataFormatString="{0:C}" />
                                    <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C}" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEliminar" runat="server" CssClass="btnEdit_Delete" ImageUrl="./Icon/IconBasuraG.png"
                                                CommandName="Eliminar" CommandArgument='<%# Container.DataItemIndex %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="text-end mt-2">
                            <label class="fw-bold">Total:</label>
                            <asp:Label ID="lblTotal" runat="server" Text="$ 0,00"></asp:Label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-6 seccionDC">
                <h6 class="subtit">Factura</h6>
                <div class="d-flex flex-wrap gap-1">
                    <!--<button class="btn btn-secondary">Ver</button>-->
                    <asp:LinkButton ID="lkbVer" runat="server" CssClass="btn-factura" OnClick="lkbVer_Click">
                    <img src="/Icon/Ver.png" style="width: 20px; height: 20px;" />
                    Ver ultima 
                    </asp:LinkButton>
                    <!--<button class="btn btn-secondary">Imprimir</button>-->
                    <asp:LinkButton ID="lkbImprimir" runat="server" CssClass="btn-factura" OnClick="lkbImprimir_Click">
                    <img src="/Icon/Imprimir.png" style="width: 20px; height: 20px;" />
                    Imprimir ultima 
                    </asp:LinkButton>
                    <!--<button class="btn btn-secondary">Enviar mail</button>-->
                    <asp:LinkButton ID="lkbEnviar" runat="server" CssClass="btn-factura" OnClick="lkbEnviar_Click">
                    <img src="/Icon/Correo.png" style="width: 20px; height: 20px;" />
                    Enviar 
                    </asp:LinkButton>
                </div>
            </div>

            <div class="col-6 text-center">
                <asp:Button ID="btnFacturar" runat="server" class="btnfacturar" Text="Facturar" OnClick="btnFacturar_Click" />
            </div>
        </div>
    </div>






</asp:Content>
