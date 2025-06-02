-- Crear base de datos
CREATE DATABASE Comercio_DB;
GO

USE Comercio_DB;
GO
CREATE TABLE Usuario (
    IdUsuario INT PRIMARY KEY IDENTITY(1,1),
    NombreUsuario VARCHAR(100) NOT NULL,
	Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Contrasena VARCHAR(200) NOT NULL, -- Guardar encriptada
    FechaAlta DATE NOT NULL DEFAULT GETDATE(),
    Rol VARCHAR(50) NOT NULL -- Ej: 'Vendedor', 'Admin'
);
-- Tabla: Categorias (ELECTRODOMESTICOS-AUDIO-INFORMATICA-GAMING-TELEFONIA)
CREATE TABLE Categorias (
    IdCategoria INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL
);

-- Tabla: Marcas
CREATE TABLE Marcas (
    IdMarca INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL
);

-- Tabla: TiposProducto (MICROONDAS, LAVARROPAS, CONSOLAS, CELULARES, NOTEBOOKS, AURICULARES, TV, PARLANTES)
CREATE TABLE TiposProducto (
    IdTipoProducto INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    IdCategoria INT NOT NULL,
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
    Email VARCHAR(100)
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
    IdCompra INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnit DECIMAL(18,2) NOT NULL,
    PRIMARY KEY (IdCompra, IdProducto),
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
    Direccion VARCHAR(150)
);

-- Tabla: Ventas
CREATE TABLE Ventas (
    IdVenta INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME NOT NULL DEFAULT GETDATE(),
    IdCliente INT NOT NULL,
    Total DECIMAL(18,2) NOT NULL,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);

-- Tabla: VentaDetalle
CREATE TABLE VentaDetalle (
    IdVenta INT NOT NULL,
    IdProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnit DECIMAL(18,2) NOT NULL,
    PRIMARY KEY (IdVenta, IdProducto),
    FOREIGN KEY (IdVenta) REFERENCES Ventas(IdVenta),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);
