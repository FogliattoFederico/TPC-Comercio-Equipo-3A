<%@ Page Title="" Language="C#" MasterPageFile="~/Venta.Master" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="WebForms.Factura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .invoice-box {
            max-width: 900px;
            margin: auto;
            padding: 40px;
            border: 1px solid #dee2e6;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            font-size: 16px;
            background: #fff;
            font-family: 'Segoe UI', sans-serif;
            color: #333;
        }

            .invoice-box h2, .invoice-box h4 {
                margin-bottom: 10px;
            }

            .invoice-box table {
                width: 100%;
                border-collapse: collapse;
            }

                .invoice-box table td {
                    padding: 8px;
                    vertical-align: top;
                }

                .invoice-box table tr.heading td {
                    background: #007bff;
                    color: white;
                    font-weight: bold;
                    text-align: center;
                }

                .invoice-box table tr.item td {
                    border-bottom: 1px solid #ddd;
                }

            .invoice-box .total {
                font-size: 1.3rem;
                font-weight: bold;
                text-align: right;
                margin-top: 15px;
                border-top: 2px solid #007bff;
                padding-top: 10px;
            }

            .invoice-box .footer {
                margin-top: 50px;
                text-align: center;
                font-size: 0.9rem;
                color: #666;
            }

        .firma-linea {
            margin-top: 60px;
            border-top: 1px solid #333;
            width: 200px;
            text-align: center;
            margin-left: auto;
        }

        .logo-img {
            float: left;
            width: 29px;
            height: auto;
            margin-right: 10px;
        }
    </style>

    <div class="invoice-box">
        <div class="row mb-4 align-items-center">
            <div class="col-md-6">
                <img src="./image/LogoSinMarca.png" class="logo-img" />
                <h4 class="mt-1">Tecno Hogar S.A.</h4>
                <p class="mb-0">
                    CUIT: 30-12345678-9<br />
                    Av. Siempre Viva 123, CABA<br />
                    Tel: (011) 4567-8900<br />
                    Email: contacto@tecnohogar.com.ar
                </p>
            </div>

            <div class="col-md-6 text-end">
                <h2 class="mb-1">FACTURA B</h2>
                <p class="mb-0">
                    Nº:
                    <asp:Label ID="lblNumeroFactura" runat="server" /><br />
                    Fecha:
                    <asp:Label ID="lblFecha" runat="server" /><br />
                    Usuario:
                    <asp:Label ID="lblUsuario" runat="server" />
                </p>
            </div>
        </div>

        <hr />

        <h5 class="mb-2">Datos del Cliente</h5>
        <p>
            Nombre:
            <asp:Label ID="lblClienteNombre" runat="server" /><br />
            Dirección:
            <asp:Label ID="lblClienteDireccion" runat="server" /><br />
            DNI:
            <asp:Label ID="lblClienteDNI" runat="server" />
        </p>

        <asp:Repeater ID="rptDetalles" runat="server">
            <HeaderTemplate>
                <table class="table table-bordered">
                    <thead>
                        <tr class="heading">
                            <td>Producto</td>
                            <td>Cantidad</td>
                            <td>Precio Unitario</td>
                            <td>Subtotal</td>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="item">
                    <td><%# Eval("Producto.Nombre") %></td>
                    <td><%# Eval("Cantidad") %></td>
                    <td><%# String.Format("${0:N0}", Eval("PrecioVenta")) %></td>
                    <td><%# String.Format("${0:N0}", Eval("Subtotal")) %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
        </table>
            </FooterTemplate>
        </asp:Repeater>


        <div class="total">
            Total:
            <asp:Label ID="lblTotal" runat="server" />
        </div>

        <p class="mt-4"><strong>Método de pago:</strong> Tarjeta de Crédito (Visa 1 pago)</p>
        <p><strong>Observaciones:</strong> Garantía oficial de fábrica en todos los productos. Entrega en 48 hs.</p>

        <div class="firma-linea mt-5">Firma Cliente</div>

<%--        <div class="footer">
            Gracias por su compra. Visite <strong>www.tecnohogar.com.ar</strong> para más ofertas.
        </div>--%>
    </div>

</asp:Content>
