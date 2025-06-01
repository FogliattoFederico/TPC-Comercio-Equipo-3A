/*CREATE DATABASE Tienda 
COLLATE Latin1_General_CI_AI

go */
USE Tienda;
GO
/*
CREATE TABLE Perfiles(
IdPerfil INT NOT NULL PRIMARY KEY  IDENTITY(1, 1),
Perfil VARCHAR(100) NOT NULL,
)

CREATE TABLE Usuarios( 
IdUsuario INT NOT NULL PRIMARY KEY  IDENTITY(1, 1), 
NombreUsuario VARCHAR(100) NOT NULL, 
Pass VARCHAR(100) NOT NULL, 
IdPerfil INT NOT NULL FOREIGN KEY REFERENCES Perfiles (IdPerfil),
)

INSERT INTO Perfiles(Perfil)
 VALUES ('Vendedor'), 
 ('Compras'),
 ('Administrador'),
 ('Expedicion'),
 ('Contabilidad'),
 ('Sistemas')


 INSERT INTO Usuarios(NombreUsuario, Pass,IdPerfil)
 VALUES ('Federico.F','11aa',1), 
 ('Alejandro.O','22bb',4),
 ('Fernando.C','33cc',2),
 ('Maxi.F','Admin123',3),
 ('Regina.L','44dd',5),
 ('Agustin.L','55ee',6)

 */
 --select U.IdUsuario,U.NombreUsuario, U.Pass, P.Perfil from Usuarios U, Perfiles P where U.IdPerfil=P.IdPerfil

 select NombreUsuario, Pass, IdPerfil from Usuarios  where NombreUsuario='Fernando.C' and Pass='33cc'

 --select * from Perfiles

 select U.NombreUsuario, U.Pass, U.IdPerfil, P.Perfil from Usuarios U inner join Perfiles P on U.IdPerfil = P.IdPerfil where U.NombreUsuario='Fernando.C' and U.Pass='33cc'