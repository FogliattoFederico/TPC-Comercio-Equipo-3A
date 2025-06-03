USE Comercio_DB
Go
CREATE PROCEDURE SP_ListarProductos
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
	ORDER BY C.Nombre ASC, P.Nombre ASC;
END;
