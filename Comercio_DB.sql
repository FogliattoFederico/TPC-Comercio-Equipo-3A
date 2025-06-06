/*CREATE DATABASE Comercio_DB;
GO*/

USE Comercio_DB;
GO
/*
CREATE TABLE Usuario (
    IdUsuario INT PRIMARY KEY IDENTITY(1,1),
    NombreUsuario VARCHAR(100) NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Contrasena VARCHAR(200) NOT NULL, -- Guardar encriptada
    FechaAlta DATE NOT NULL DEFAULT GETDATE(),
    Rol VARCHAR(50) NOT NULL, -- Ej: 'Vendedor', 'Admin'
	Activo BIT NOT NULL DEFAULT 1 -- Empleado inactivo por cambio de Sector/Planta, despido, etc
);
-- Tabla: Categorias (ELECTRODOMESTICOS-AUDIO-INFORMATICA-GAMING-TELEFONIA)
CREATE TABLE Categorias (
    IdCategoria INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
	Activo BIT NOT NULL DEFAULT 1 -- Categoria inactiva por no contar con productos en esa categoria
);

-- Tabla: Marcas
CREATE TABLE Marcas (
    IdMarca INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
	Activo BIT NOT NULL DEFAULT 1 -- Marca inactiva por no contar con productos de la marca
);

-- Tabla: TiposProducto (MICROONDAS, LAVARROPAS, CONSOLAS, CELULARES, NOTEBOOKS, AURICULARES, TV, PARLANTES)
CREATE TABLE TiposProducto (
    IdTipoProducto INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    IdCategoria INT NOT NULL,
	Activo BIT NOT NULL DEFAULT 1, -- TipoProducto inactivo por no contar con productos de ese tipo
    FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria)
);


-- Tabla: Productos
CREATE TABLE Productos (
    IdProducto INT PRIMARY KEY IDENTITY(1,1),
    CodigoArticulo VARCHAR(50),
    Nombre VARCHAR(100),
    Descripcion VARCHAR(255),
    PrecioCompra DECIMAL(18,2),
    PorcentajeGanancia DECIMAL(5,2),
    StockActual INT,
    StockMinimo INT,
    ImagenUrl VARCHAR(500),
    IdMarca INT NOT NULL,
    IdTipoProducto INT NOT NULL,
	Activo BIT NOT NULL DEFAULT 1, -- Producto inactivo por falta de stock o estar discontinuado
    FOREIGN KEY (IdMarca) REFERENCES Marcas(IdMarca),
    FOREIGN KEY (IdTipoProducto) REFERENCES TiposProducto(IdTipoProducto)
);



-- Tabla: Proveedores
CREATE TABLE Proveedores (
    IdProveedor INT PRIMARY KEY IDENTITY(1,1),
    RazonSocial VARCHAR(150) NOT NULL,
	CUIT VARCHAR(20) NOT NULL,
	Direccion VARCHAR(50),
    Telefono VARCHAR(20),
    Email VARCHAR(100),
	Activo BIT NOT NULL DEFAULT 1 -- Proveedor inactivo que por X motivo se corta la relacion comercial
);

-- Tabla: ProductoProveedor (relación N a N)
CREATE TABLE ProductoProveedor (
    IdProducto INT NOT NULL,
    IdProveedor INT NOT NULL,
    PRIMARY KEY (IdProducto, IdProveedor),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto),
    FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor)
);

-- Tabla: Compras
CREATE TABLE Compras (
    IdCompra INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    IdProveedor INT NOT NULL,
    Total DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor)
);

-- Tabla: CompraDetalle
CREATE TABLE CompraDetalle (
    IdCompraDetalle INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IdCompra INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnit DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (IdCompra) REFERENCES Compras(IdCompra),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);

-- Tabla: Clientes
CREATE TABLE Clientes (
    IdCliente INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
	Apellido VARCHAR(100) NOT NULL,
	Dni VARCHAR(10) NOT NULL,
    Telefono VARCHAR(20),
    Email VARCHAR(100),
    Direccion VARCHAR(150),
	Activo BIT NOT NULL DEFAULT 1 -- Cliente inactivo por X motivo ya no se le vende.
);

-- Tabla: Ventas
CREATE TABLE Ventas (
    IdVenta INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    IdCliente INT NOT NULL,
	IdUsuario INT NOT NULL,
    Total DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente),
	FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

-- Tabla: VentaDetalle
CREATE TABLE VentaDetalle (
    IdVentaDetalle INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    IdVenta INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnit DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);*/
/*
INSERT INTO Categorias (Nombre) VALUES
('Electrodomésticos'),
('Audio'),
('Informática'),
('Gaming'),
('Cocina'),
('Telefonia');

GO
INSERT INTO TiposProducto (Nombre, IdCategoria) VALUES
('Microondas', 1),
('Consolas', 4),
('Celulares', 6),
('Notebooks', 3),
('Parlantes', 2);

GO
INSERT INTO Marcas (Nombre) VALUES
('Samsung'),
('LG'),
('Sony'),
('Philips'),
('Lenovo'),
('HP'),
('Xiaomi'),
('Whirlpool'),
('Electrolux'),
('Asus');

GO
INSERT INTO Usuario (NombreUsuario, Nombre, Apellido, Email, Contrasena, FechaAlta, Rol) VALUES
('Ale', 'Alejandro', 'Olguera', 'ale@gmail.com', 'admin', '2025-05-30', 1),
('Fede', 'Federico', 'Fogliatto', 'fede@gmail.com', 'vendedor', '2025-05-29', 0);

GO
INSERT INTO Productos (CodigoArticulo, Nombre, Descripcion, PrecioCompra, PorcentajeGanancia, StockActual, StockMinimo, ImagenUrl, IdMarca, IdTipoProducto) VALUES
('SAMS-MWO23L', 'Microondas ME731K', 'Capacidad 23L, 800W, 6 niveles de potencia', 95000.00, 35.00, 10, 3, 'https://http2.mlstatic.com/D_NQ_NP_832347-MLA84549796072_052025-O.webp', 1, 1),
('WHIRL-LAV8K', 'Lavarropas WLF800', 'Automático, 8kg, carga frontal, 1200 rpm', 215000.00, 40.00, 7, 2, 'https://http2.mlstatic.com/D_NQ_NP_779808-MLU79129490555_092024-O.webp', 8, 1),
('SONY-PS5STD', 'PlayStation 5 Standard', '825GB SSD, control DualSense, 4K HDR', 550000.00, 25.00, 5, 1, 'https://http2.mlstatic.com/D_878229-MLA82556653763_022025-C.jpg', 3, 2),
('XIA-REDMI12', 'Redmi Note 12', '6.6", 128GB, 4GB RAM, cámara 50MP', 185000.00, 30.00, 15, 5, 'https://http2.mlstatic.com/D_Q_NP_775760-MLU78805224085_082024-O.webp', 7, 3),
('HP-LAP15D', 'Laptop 15-dw3000la', 'Intel i5, 8GB RAM, 512GB SSD, 15.6"', 350000.00, 28.00, 6, 2, 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/8c9f99d6-9214-46b5-935b-37005a6f696b.jpg', 6, 4),
('LG-TV55UQ', 'Smart TV 55UQ7500', '55", 4K UHD, WebOS, HDR10 Pro', 385000.00, 30.00, 8, 3, 'https://www.lg.com/content/dam/channel/wcms/my/images/tvs/55uq7050psa_atsq_eaml_my_c/gallery/DZ-1.jpg', 2, 5),
('LEN-IDEA3', 'Notebook IdeaPad 3', 'Ryzen 5, 8GB, 512GB SSD, FHD', 330000.00, 30.00, 10, 4, 'https://http2.mlstatic.com/D_931147-MLA84766832402_052025-C.jpg', 5, 4),
('PHIL-SPKBT', 'Parlante Bluetooth BT100', '20W, batería 8h, resistente al agua', 42000.00, 35.00, 12, 4, 'https://http2.mlstatic.com/D_941249-MLA50211827182_062022-O.jpg', 4, 5),
('ASUS-ROGALLY', 'ROG Ally Z1 Extreme', 'Consola portátil, Ryzen Z1, 512GB SSD', 680000.00, 20.00, 3, 1, 'https://celularesindustriales.com.ar/wp-content/uploads/ally_ryzen_z101_l.jpg', 10, 2),
('LG-MIC20L', 'Microondas MS2042D', 'Capacidad 20L, 700W, manual', 82000.00, 35.00, 9, 2, 'https://www.lg.com/content/dam/channel/wcms/cl/images/microondas/ms2042d/gallery/MS2042DS%20door%20open.jpg', 2, 1);

GO
INSERT INTO Productos (CodigoArticulo, Nombre, Descripcion, PrecioCompra, PorcentajeGanancia, StockActual, StockMinimo, ImagenUrl, IdMarca, IdTipoProducto) VALUES
('SAMS-GALTAB-A9', 'Tablet Galaxy Tab A9 64GB', 'Pantalla 8.7", Octa-Core, RAM 4GB, Android 13', 115000, 30.00, 8, 3, 'https://http2.mlstatic.com/D_NQ_NP_892038-MLU74328290469_012024-O.webp', 1, 3),
('HP-M24FHD', 'Monitor HP M24f', '23.8", FHD, IPS, HDMI/VGA, sin bordes', 75000, 35.00, 6, 2, 'https://www.hp.com/fr-fr/shop/Html/Merch/Images/c07056663_1750x1285.jpg', 6, 5),
('LG-AAC12W', 'Aire Acondicionado LG Inverter 3000W', 'Frío/Calor, eficiencia A+, split', 345000, 25.00, 4, 1, 'https://www.lg.com/ar/images/aire-acondicionado/us-h126eft0/gallery/large-02.jpg', 2, 1),
('PHIL-PLANCHA4200', 'Plancha a vapor Philips 4200', 'Potencia 2400W, suela cerámica, vapor continuo', 35000, 30.00, 10, 3, 'https://images.fravega.com/f300/7d2f096dbc33f3bdb19b8e9c97a09e85.jpg', 4, 1),
('SONY-WHCH520', 'Auriculares Bluetooth Sony WH-CH520', 'Con micrófono, batería 50h, compatible con asistentes', 52000, 35.00, 15, 4, 'https://mall.icbc.com.ar/33596004-large_default/auriculares-sony-bluetooth-inalambricos-wh-ch-520-negro.jpg', 3, 5),
('XIA-11T-256', 'Smartphone Xiaomi 11T 256GB', '6.67", 8GB RAM, Cámara 108MP, 5G', 285000, 30.00, 7, 2, 'https://www.megatone.net/images/Articulos/zoom2x/209/MKT0867SEN-2.jpg', 7, 3),
('LEN-TAB-M10', 'Tablet Lenovo Tab M10 HD 64GB', '10.1", Android 11, Wi-Fi, cámara 8MP', 89000, 28.00, 9, 3, 'https://p4-ofp.static.pub/fes/cms/2023/02/22/6tq47f1v0lxg2bhvbqefq7wgngope9281905.png', 5, 3),
('ASUS-MON27VG', 'Monitor ASUS TUF 27" 165Hz', 'Resolución FHD, 1ms, HDMI/DP, G-Sync Compatible', 140000, 25.00, 4, 1, 'https://www.asus.com/media/global/products/vu6dtkhyjqxf93km/P_setting_xxx_0_90_end_500.png', 10, 5),
('WHIRL-MICGRILL20L', 'Microondas Whirlpool Grill 20L', '700W + grill, 6 niveles de potencia, blanco', 95000, 30.00, 5, 2, 'https://whirlpoolarg.vtexassets.com/arquivos/ids/165738/frente_cerrado.jpg', 8, 1),
('SAMS-TV32T4300', 'Smart TV Samsung 32” T4300', 'HD, HDR, Tizen OS, HDMI/USB, Wi-Fi', 165000, 32.00, 6, 2, 'https://d2pr1pn9ywx3vo.cloudfront.net/spree/products/20500/large/sam32t4300_primera_con_logo.jpg', 1, 5);

GO
INSERT INTO Proveedores (RazonSocial, CUIT, Direccion, Telefono, Email) VALUES
('Tech Global S.A.', '20-34218594-7', 'Av. Rivadavia 4530', '011-4555-1234', 'contacto@techglobal.com'),
('ElectroHouse', '30-28574910-3', 'Ruta 8 Km 45', '02320-478911', 'ventas@electrohouse.com'),
('Distribuidora Gama', '23-94837210-5', 'Calle Falsa 123', '0341-4234567', 'info@dgama.com'),
('Nova Distribución', '27-10293847-2', 'San Martín 550', '011-4789-3344', 'contacto@nova.com.ar'),
('Supreme Tech', '20-38475629-1', 'Av. Santa Fe 3456', '011-4000-9999', 'ventas@supremetech.com'),
('Industrias Celta', '30-92837465-0', 'Roca 980', '0341-4567890', 'info@celta.com'),
('Grupo Andes', '27-91837462-6', 'Av. Las Heras 3300', '011-4300-5678', 'ventas@grupoandes.com'),
('MegaDigital', '20-93746183-3', 'Boulevard Oroño 147', '0341-4892371', 'info@megadigital.com'),
('NorteSur S.A.', '30-11223344-9', 'Alberdi 2876', '011-4875-1233', 'contacto@nortesur.com'),
('Litoral Distribuciones', '23-81937465-5', 'Av. Pellegrini 1010', '0341-4000123', 'ventas@litoral.com'),
('ElectroDelta', '27-82736455-1', 'Córdoba 789', '0342-4761111', 'info@electrodelta.com'),
('Tecno Mundo', '20-74829475-0', 'Ituzaingó 984', '011-47778987', 'ventas@tecnomundo.com'),
('Distribuidora del Sur', '30-11198273-4', 'Av. Calchaquí 3001', '011-42001233', 'info@surdistribucion.com'),
('FullTech', '27-39284756-9', 'Ruta 3 Km 60', '011-43009876', 'ventas@fulltech.com'),
('Galaxy Proveedores', '23-84736291-2', 'Santa Fe 2340', '0341-4210987', 'galaxy@proveedores.com'),
('Red Zona S.A.', '20-77788899-1', 'Av. Mitre 4450', '011-44004400', 'info@redzona.com'),
('TecnoRed', '30-93847561-7', 'Cuyo 1234', '011-48947812', 'ventas@tecnored.com'),
('ElectroMax', '27-82736519-2', 'Castelli 1500', '0341-4321987', 'ventas@emax.com'),
('Digitronix', '23-29384756-8', 'San Juan 6700', '011-43009000', 'info@digitronix.com'),
('Proveedores Argentinos', '20-99988877-0', 'Av. Corrientes 900', '011-47881234', 'contacto@pa.com.ar');

GO
INSERT INTO Compras (Fecha, IdProveedor, Total) VALUES
('2024-08-14 02:03:01', 1, 1326000.00),
('2024-10-13 14:48:11', 2, 2245000.00),
('2024-09-15 17:45:45', 3, 4153000.00);
--('2024-12-07 11:33:28', 10, 438404.18),
--('2025-01-23 03:25:33', 7, 903514.71),
--('2024-11-09 07:16:24', 9, 1616769.95),
--('2024-08-07 14:34:41', 6, 1673307.59),
--('2024-10-17 18:00:44', 11, 244355.71),
--('2024-06-14 20:37:52', 13, 1022092.87),
--('2024-11-25 10:15:47', 12, 1433852.58),
--('2025-05-12 15:51:50', 20, 994707.84),
--('2024-12-14 04:43:24', 17, 1950941.98),
--('2024-07-01 02:41:36', 15, 1417598.52),
--('2024-07-19 06:55:14', 4, 1011162.43),
--('2024-06-30 21:11:48', 14, 1012055.47),
--('2024-09-18 12:22:34', 19, 621874.16),
--('2025-01-09 23:18:39', 18, 1273981.03),
--('2024-08-21 00:02:17', 8, 522503.88),
--('2024-11-16 17:21:22', 5, 725237.27),
--('2024-10-04 22:38:36', 16, 1564219.34);

GO
INSERT INTO CompraDetalle (IdCompra, IdProducto, Cantidad, PrecioUnit) VALUES

(1, 8, 8, 42000.00),
(1, 20, 6, 165000.00),
(2, 10, 7, 82000.00),
(2, 3, 5, 550000.00),
(2, 1, 9, 95000.00),
(3, 20, 5, 165000.00),
(3, 4, 8, 185000.00);

GO
INSERT INTO Clientes (Nombre, Apellido, Dni, Telefono, Email, Direccion) VALUES
('Juan', 'Pérez', '30111222', '1122334455', 'juan.perez@mail.com', 'Av. Siempre Viva 123'),
('María', 'Gómez', '29333444', '1133445566', 'maria.gomez@mail.com', 'Calle Falsa 456'),
('Carlos', 'Lopez', '28444555', '1144556677', 'carlos.lopez@mail.com', 'Ruta 9 Km 23');

GO
INSERT INTO Ventas (Fecha, IdCliente, IdUsuario, Total) VALUES
(GETDATE(), 1, 1, 268650.00),  -- Juan
(GETDATE(), 2, 1, 1006550.00),  -- María
(GETDATE(), 3, 2, 1297000.00);  -- Carlos

GO
-- Venta 1: Juan compró 1 microondas y 2 auriculares
INSERT INTO VentaDetalle (IdVenta, IdProducto, Cantidad, PrecioUnit) VALUES
(1, 1, 1, 128250.00),  -- Microondas ME731K (95000 + 35%)
(1, 15, 2, 70200.00),  -- Auriculares WH-CH520 (52000 + 35%)
-- Venta 2: María compró 1 PS5, 1 TV Samsung 32” y 1 monitor HP
(2, 3, 1, 687500.00), -- PS5 Standard (550000 + 25%)
(2, 20, 1, 217800.00), -- Samsung TV 32” (165000 + 32%)
(2, 13, 1, 101250.00), -- Monitor HP M24f (75000 + 35%)
-- Venta 3: Carlos compró 1 ROG Ally y 2 celulares Redmi Note 12
(3, 9, 1, 816000.00), -- ROG Ally Z1 Extreme (680000 + 20%)
(3, 4, 2, 240500.00), -- Redmi Note 12 (185000 + 30%)

(1, 8, 8, 54769.73),
(1, 20, 6, 16691.84),
(2, 10, 7, 116063.26),
(2, 3, 5, 112823.17),
(2, 1, 9, 24012.86),
(3, 20, 5, 276403.83),
(3, 4, 8, 118275.66);

INSERT INTO CompraDetalle (IdCompra, IdProducto, Cantidad, PrecioUnit) VALUES
(4, 1, 5, 95000.00),  -- Microondas ME731K
(4, 2, 3, 215000.00), -- Lavarropas WLF800
(5, 3, 2, 275000.00), -- PlayStation 5 Standard
(5, 4, 4, 185000.00), -- Redmi Note 12
(6, 5, 1, 350000.00), -- Laptop 15-dw3000la
(6, 6, 2, 385000.00), -- Smart TV 55UQ7500
(7, 7, 6, 42000.00),  -- Parlante Bluetooth BT100
(7, 8, 3, 680000.00), -- ROG Ally Z1 Extreme
(8, 9, 5, 82000.00),  -- Microondas MS2042D
(8, 10, 2, 115000.00), -- Tablet Galaxy Tab A9 64GB
(9, 11, 4, 75000.00),  -- Monitor HP M24f
(9, 12, 1, 345000.00), -- Aire Acondicionado LG Inverter 3000W
(10, 13, 3, 35000.00),  -- Plancha a vapor Philips 4200
(10, 14, 2, 52000.00),  -- Auriculares Bluetooth Sony WH-CH520
(11, 15, 7, 285000.00), -- Smartphone Xiaomi 11T 256GB
(11, 16, 4, 89000.00),  -- Tablet Lenovo Tab M10 HD 64GB
(12, 17, 5, 140000.00), -- Monitor ASUS TUF 27" 165Hz
(12, 18, 2, 95000.00),  -- Microondas Whirlpool Grill 20L
(13, 19, 6, 165000.00), -- Smart TV Samsung 32” T4300
(13, 20, 1, 215000.00), -- Lavarropas WLF800
(14, 1, 3, 95000.00);   -- Microondas ME731K

*/
/*
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

go

create procedure SP_ListarClientes
as
begin
select IdCliente, Nombre, Apellido, Dni, Telefono, Email, Direccion from Clientes
end
*/