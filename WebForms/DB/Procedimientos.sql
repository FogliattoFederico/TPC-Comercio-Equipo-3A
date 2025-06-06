USE Comercio_DB;
GO

CREATE OR ALTER PROCEDURE SP_ListarProductos
AS
BEGIN
    SELECT 
        P.CodigoArticulo, 
        P.Nombre, 
        P.Descripcion, 
        P.PrecioCompra, 
        CAST(P.PrecioCompra * (P.PorcentajeGanancia / 100 + 1) AS DECIMAL(10,2)) AS PrecioVenta,
        P.PorcentajeGanancia, 
        P.StockActual, 
        P.StockMinimo, 
        P.ImagenUrl, 
        P.IdMarca,
        M.Nombre AS Marca, 
        TP.IdTipoProducto,
        TP.Nombre AS NombreTP,
        C.IdCategoria,
        C.Nombre AS Categoria
    FROM Productos P
    INNER JOIN Marcas M ON P.IdMarca = M.IdMarca
    INNER JOIN TiposProducto TP ON P.IdTipoProducto = TP.IdTipoProducto
    INNER JOIN Categorias C ON TP.IdCategoria = C.IdCategoria
    --WHERE P.Activo = 1
    ORDER BY C.Nombre ASC, P.Nombre ASC;
END;
GO

CREATE OR ALTER PROCEDURE SP_ListarClientes
AS
BEGIN
    SELECT 
        IdCliente, 
        Nombre, 
        Apellido, 
        Dni, 
        Telefono, 
        Email, 
        Direccion
    FROM Clientes
    --WHERE Activo = 1;
END;
GO

CREATE OR ALTER PROCEDURE SP_ListarVentas
AS
BEGIN
    SELECT 
        V.IdVenta, 
        V.Fecha,
	    SUM(VD.Cantidad * VD.PrecioUnit) AS Total,
        C.IdCliente,
        C.Nombre,
        C.Apellido,
        C.Dni,
        C.Telefono,
        C.Email,
        C.Direccion,
        U.IdUsuario,
        U.Nombre AS NombreUsuario,
	    U.Apellido AS ApellidoUsuario,
	    U.Email AS EmailUsuario,
	    U.FechaAlta,
	    U.Rol,	
        COUNT(VD.IdVentaDetalle) AS CantidadProductos
    FROM Ventas V
    INNER JOIN Clientes C ON C.IdCliente = V.IdCliente
    INNER JOIN Usuario U ON V.IdUsuario = U.IdUsuario
    INNER JOIN VentaDetalle VD ON V.IdVenta = VD.IdVenta
    GROUP BY 
        V.IdVenta, V.Fecha,
	    C.IdCliente, C.Nombre, C.Apellido, C.Dni, C.Telefono, C.Email, C.Direccion,
        U.IdUsuario, U.Nombre, U.Apellido, U.Email, U.FechaAlta, U.Rol
    --WHERE Activo = 1;
END;
GO

CREATE OR ALTER PROCEDURE SP_ListarDetalleVenta
    @idVenta INT
AS
BEGIN
    SELECT 
        VD.IdVentaDetalle,
        VD.IdVenta,
        VD.Cantidad,
        VD.PrecioUnit,
        VD.IdProducto,
        P.CodigoArticulo,
        P.Nombre AS NombreProducto,
        P.Descripcion, 
        P.PrecioCompra,
        P.PorcentajeGanancia, 
        P.StockActual, 
        P.StockMinimo, 
        P.ImagenUrl, 
        P.IdMarca,
        M.Nombre AS Marca, 
        TP.IdTipoProducto,
        TP.Nombre AS NombreTP,
        C.IdCategoria,
        C.Nombre AS Categoria
    FROM VentaDetalle VD
    INNER JOIN Productos P ON VD.IdProducto = P.IdProducto
    INNER JOIN Marcas M ON P.IdMarca = M.IdMarca
    INNER JOIN TiposProducto TP ON P.IdTipoProducto = TP.IdTipoProducto
    INNER JOIN Categorias C ON TP.IdCategoria = C.IdCategoria
    WHERE VD.IdVenta = @idVenta;
END;
GO