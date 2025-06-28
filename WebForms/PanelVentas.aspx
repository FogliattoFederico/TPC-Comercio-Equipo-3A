<%@ Page Title="" Language="C#" MasterPageFile="~/Venta.Master" AutoEventWireup="true" CodeBehind="PanelVentas.aspx.cs" Inherits="WebForms.Vendedores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Css/StylePanelVentas.css">
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

    <h3 class="titulo">Venta</h3>
    <div class="venta">
        <div class="row info-venta">
            <div class="col">
                <label>Fecha</label>
                <span>15/10/2025</span>
            </div>
            <div class="col text-end">
                <label>Número de factura</label>
                <span>0000001</span>
            </div>
        </div>

        <div class="mb-4">
            <label class="form-label">Vendedor</label>
            <div class="row">
                <div class="col">
                    <input type="text" class="form-control" placeholder="Nombre">
                </div>
                <div class="col">
                    <input type="text" class="form-control" placeholder="Apellido">
                </div>
            </div>
        </div>
        <hr class="separador">
        <div class="row">
            <div class="col-4 seccionDC">
                <h6 class="subtit">Datos del cliente</h6>
                <div class="row mb-2 align-items-end">
                    <div class="col">
                        <label>DNI</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="col text-end">
                        <!--<button class="btn btn-primary">Buscar</button>-->
                        <asp:ImageButton ID="btnimg" CssClass="btnimg_lup" ImageUrl="~/Icon/Lupa.png" runat="server" />
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col">
                        <label>Nombre</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="col">
                        <label>Apellido</label>
                        <input type="text" class="form-control">
                    </div>
                </div>
                <div class="row mb-2">
                    <div class="col">
                        <label>Teléfono</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="col">
                        <label>Mail</label>
                        <input type="text" class="form-control">
                    </div>
                </div>
                <div>
                    <label>Dirección</label>
                    <input type="text" class="form-control">
                </div>
            </div>

            <div class="col-8">
                <h6 class="subtit">Detalle de venta</h6>
                <div class="row mb-3">
                    <div class="col">
                        <label>Producto</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="col">
                        <label>Cantidad</label>
                        <input type="number" class="form-control">
                    </div>
                    <div class="col-auto d-flex align-items-end">
                        <!--<button class="btn btn-success">Agregar</button>-->
                        <asp:ImageButton ID="BtnPlus" CssClass="btnimgPlus" ImageUrl="./Icon/plus3.png" runat="server" />
                    </div>
                </div>

                <table class="table table-striped table-bordered table-hover">
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
                </table>

                <div class="text-end mt-2">
                    <label class="fw-bold">Total:</label>
                    <span>$1.000.000</span>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-6 seccionDC">
                <h6 class="subtit">Factura</h6>
                <div class="d-flex flex-wrap gap-1">
                    <!--<button class="btn btn-secondary">Ver</button>-->
                    <asp:LinkButton ID="lkbVer" runat="server" CssClass="btn-factura">
<img src="/Icon/Ver.png" style="width: 20px; height: 20px;" />
Ver factura
                    </asp:LinkButton>
                    <!--<button class="btn btn-secondary">Imprimir</button>-->
                    <asp:LinkButton ID="lkbImprimir" runat="server" CssClass="btn-factura">
<img src="/Icon/Imprimir.png" style="width: 20px; height: 20px;" />
Imprimir factura
                    </asp:LinkButton>
                    <!--<button class="btn btn-secondary">Enviar mail</button>-->
                    <asp:LinkButton ID="lkbEnviar" runat="server" CssClass="btn-factura">
<img src="/Icon/Correo.png" style="width: 20px; height: 20px;" />
Enviar factura
                    </asp:LinkButton>
                </div>
            </div>
            <div class="col-6 text-center">
                <button class="btnfacturar">Facturar</button>
            </div>
        </div>
    </div>


</asp:Content>
