USE Comercio_DB;
GO

/*PRODUCTOS*/

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


/*VENTAS*/

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
	    U.Admin,	
        COUNT(VD.IdVentaDetalle) AS CantidadProductos
    FROM Ventas V
    INNER JOIN Clientes C ON C.IdCliente = V.IdCliente
    INNER JOIN Usuario U ON V.IdUsuario = U.IdUsuario
    INNER JOIN VentaDetalle VD ON V.IdVenta = VD.IdVenta
    GROUP BY 
        V.IdVenta, V.Fecha,
	    C.IdCliente, C.Nombre, C.Apellido, C.Dni, C.Telefono, C.Email, C.Direccion,
        U.IdUsuario, U.Nombre, U.Apellido, U.Email, U.FechaAlta, U.Admin
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

/*CLIENTES*/

CREATE  PROCEDURE SP_ListarClientes
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
    WHERE Activo = 1
	order by Apellido, nombre Asc
END;
GO

CREATE OR ALTER PROCEDURE SP_AgregarCliente
    @Nombre varchar(100),
    @Apellido varchar(100),
    @Dni varchar(10),
    @Telefono varchar(20),
    @Email varchar(100),
    @Direccion varchar(150),
    @Activo bit = 1 
AS
BEGIN
    INSERT INTO Clientes (Nombre, Apellido, Dni, Telefono, Email, Direccion, Activo)
    VALUES (@Nombre, @Apellido, @Dni, @Telefono, @Email, @Direccion, @Activo);
END

go

create or alter procedure SP_ModificarCliente
@Nombre varchar(100),
@Apellido varchar(100),
@Dni varchar(10),
@Telefono varchar(150),
@Email varchar(100),
@Direccion varchar(150),
@IdCliente int
as
BEGIN
update clientes 
	set Nombre = @Nombre, 
	Apellido = @Apellido, 
	Direccion =@Direccion, 
	Email = @Email, 
	Dni = @Dni, 
	Telefono = @Telefono 
where IdCliente = @IdCliente
END

go

/*PROVEEDORES*/
create or Alter procedure SP_listarProveedores
as
Begin
select IdProveedor, RazonSocial, CUIT, Direccion,Telefono, Email, Activo from Proveedores where activo = 1 order by RazonSocial asc
end

go

create or alter procedure SP_AgregarProveedor
@RazonSocial varchar(150),
@Cuit varchar(20),
@Direccion varchar(50),
@Telefono varchar(20),
@Email varchar(100),
@Activo bit = 1
as
begin
insert into Proveedores (RazonSocial, CUIT, Direccion, Telefono, Email, Activo) values (@RazonSocial, @Cuit, @Direccion, @Telefono, @Email, 1)
end

go

create or alter procedure SP_ModificarProveedor
@RazonSocial varchar(150),
@Cuit varchar(20),
@Direccion varchar(50),
@Telefono varchar(20),
@Email varchar(100),
@IdProveedor int
as
begin
update Proveedores set RazonSocial = @RazonSocial, CUIT = @Cuit, Direccion = @Direccion, Telefono = @Telefono, Email = @Email where IdProveedor = @IdProveedor
end

go

create procedure SP_EliminarProveedor
@IdProveedor int
as
begin
update Proveedores set Activo = 0 where IdProveedor = @IdProveedor
end



