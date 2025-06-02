--USE master
--ALTER DATABASE Comercio_DB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
--DROP DATABASE Comercio_DB;

USE Comercio_DB

INSERT INTO Categorias (Nombre) VALUES
('Electrodomésticos'),
('Audio'),
('Informática'),
('Gaming'),
('Cocina'),
('Telefonia');

INSERT INTO TiposProducto (Nombre, IdCategoria) VALUES
('Microondas', 1),
('Consolas', 4),
('Celulares', 6),
('Notebooks', 3),
('Parlantes', 2);


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

INSERT INTO Usuario (NombreUsuario, Nombre, Apellido, Email, Contrasena, FechaAlta, Rol) VALUES
('Ale', 'Alejandro', 'Olguera', 'ale@gmail.com', 'admin', '2025-05-30', 1),
('Fede', 'Federico', 'Fogliatto', 'fede@gmail.com', 'Vendedor', '2025-05-29', 0);

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

