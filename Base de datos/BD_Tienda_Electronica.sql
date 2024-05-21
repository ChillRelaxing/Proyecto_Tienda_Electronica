create database DB_Tienda_Electronica
go

use DB_Tienda_Electronica
go

----------------------------------
----------------------------------

select * from Categoria ---F

select * from DetalleVenta ---Yo

select * from Inventario ---Yo

select * from Precio ---F

select * from Producto ---Yo

select * from Venta --F

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spVenta_GetAll
AS
BEGIN
	SELECT ID_Venta, FechaVenta, Total_Venta, Descripcion_Venta FROM Venta
END;

EXEC dbo.spVenta_GetAll

----------------------------------

CREATE PROCEDURE dbo.spVenta_GetById
(@ID_Venta INT)
AS
BEGIN
	SELECT ID_Venta, FechaVenta, Total_Venta, Descripcion_Venta
	FROM Venta
    WHERE ID_Venta = @ID_Venta
END;

EXEC dbo.spVenta_GetById 1

----------------------------------

CREATE PROCEDURE dbo.spVenta_Update
(
	@FechaVenta datetime,
	@Total_Venta decimal(10,2),
	@Descripcion_Venta nvarchar(255),
	@ID_Venta int
)
AS
BEGIN
	UPDATE Venta 
	SET FechaVenta = @FechaVenta,
	Total_Venta = @Total_Venta,
	Descripcion_Venta = @Descripcion_Venta
    WHERE ID_Venta = @ID_Venta
END;

EXEC dbo.spVenta_Update '2025-05-13 00:00:00.000', 2000.98, 'Venta televisores', 1

select * from Venta

----------------------------------

CREATE PROCEDURE dbo.spVenta_Insert
(
	@FechaVenta datetime,
	@Total_Venta decimal(10,2),
	@Descripcion_Venta nvarchar(255)
)
AS
BEGIN
	INSERT INTO Venta 
	VALUES(@FechaVenta, @Total_Venta, @Descripcion_Venta)
END;

EXEC dbo.spVenta_Insert '2026-05-13 00:00:00.000', 300.25, 'Venta de Comida'

----------------------------------

CREATE PROCEDURE dbo.spVenta_Delete
(@ID_Venta int)
AS
BEGIN
	DELETE FROM Venta WHERE ID_Venta = @ID_Venta
END;

EXEC dbo.spVenta_Delete 6

select * from Venta


----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------

EXEC sp_rename 'dbo.DetalleVenta_GetAll', 'dbo.spDetalleVenta_GetAll';

CREATE PROCEDURE dbo.spDetalleVenta_GetAll -----
AS
BEGIN
	SELECT DetalleVenta.ID_DetalleVenta, DetalleVenta.Cantidad,
	DetalleVenta.SubTotal, Venta.ID_Venta, Producto.ID_Producto,
	Venta.FechaVenta, Producto.Nombre_Producto
	FROM DetalleVenta
	INNER JOIN  Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta
	INNER JOIN  Producto ON DetalleVenta.ID_Producto = Producto.ID_Producto
END;

EXEC dbo.spDetalleVenta_GetAll

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spDetalleVenta_GetByID ----
(@ID_DetalleVenta INT)
AS
BEGIN
	SELECT DetalleVenta.ID_DetalleVenta, DetalleVenta.Cantidad,
	DetalleVenta.SubTotal, Venta.ID_Venta, Producto.ID_Producto,
	Venta.FechaVenta, Producto.Nombre_Producto
	FROM DetalleVenta
	INNER JOIN  Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta
	INNER JOIN  Producto ON DetalleVenta.ID_Producto = Producto.ID_Producto
	WHERE ID_DetalleVenta = @ID_DetalleVenta
END;

EXEC dbo.spDetalleVenta_GetByID 3

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spDetalleVenta_GetByIdVenta
(@ID_Venta INT)
AS
BEGIN
	SELECT DetalleVenta.ID_DetalleVenta, DetalleVenta.Cantidad,
	DetalleVenta.SubTotal, Venta.ID_Venta, Producto.ID_Producto,
	Venta.FechaVenta, Producto.Nombre_Producto
	FROM DetalleVenta
	INNER JOIN  Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta
	INNER JOIN  Producto ON DetalleVenta.ID_Producto = Producto.ID_Producto
	WHERE DetalleVenta.ID_Venta = @ID_Venta
END;

EXEC dbo.spDetalleVenta_GetByIdVenta 2

----------------------------------
----------------------------------
CREATE PROCEDURE dbo.spDetalleVenta_Insert ----
(
	@Cantidad int,
	@SubTotal decimal(18,2),
	@Id_Venta int,
	@Id_Producto int
)
AS
BEGIN
	INSERT INTO DetalleVenta
	VALUES(@Cantidad, @SubTotal, @Id_Venta, @Id_Producto)
END

EXEC dbo.spDetalleVenta_Insert 25,56.25,2,2

select * from DetalleVenta

----------------------------------
----------------------------------
 
CREATE PROCEDURE dbo.spDetalleVenta_Update ---
(
	@ID_DetalleVenta int,
	@Cantidad int,
	@SubTotal decimal(18,2),
	@Id_Venta int,
	@Id_Producto int
)
AS
BEGIN
	UPDATE DetalleVenta
	SET Cantidad = @Cantidad,
		SubTotal = @SubTotal,
		Id_Venta = @Id_Venta,
		Id_Producto = @Id_Producto
	WHERE ID_DetalleVenta = @ID_DetalleVenta
END

EXEC dbo.spDetalleVenta_Update 1, 3, 500, 2,2

select * from DetalleVenta

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spDetalleVenta_Delete ---
(@ID_DetalleVenta int)
AS
BEGIN
	DELETE FROM DetalleVenta
	WHERE ID_DetalleVenta = @ID_DetalleVenta
END

EXEC dbo.spDetalleVenta_Delete 2

SELECT * FROM DetalleVenta


----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------

---Posible correcion
ALTER PROCEDURE dbo.spProducto_GetAll --Categoria.Nombre_Categoria
AS
BEGIN
	SELECT Producto.ID_Producto, Producto.Nombre_Producto, Producto.Descripcion_Producto, Categoria.ID_Categoria, Categoria.Nombre_Categoria
	FROM Producto
	INNER JOIN  Categoria ON Producto.ID_Categoria = Categoria.ID_Categoria
END;

EXEC dbo.spProducto_GetAll

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spProducto_GetByID
(@ID_Producto INT)
AS
BEGIN
	SELECT Producto.ID_Producto, Producto.Nombre_Producto, Producto.Descripcion_Producto, Categoria.ID_Categoria, Categoria.Nombre_Categoria
	FROM Producto
	INNER JOIN  Categoria ON Producto.ID_Categoria = Categoria.ID_Categoria
	WHERE ID_Producto = @ID_Producto
END;

EXEC dbo.spProducto_GetByID 1

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spProducto_GetByID_Categoria
(@ID_Categoria INT)
AS
BEGIN
	SELECT Producto.ID_Producto, Producto.Nombre_Producto, Producto.Descripcion_Producto, Categoria.ID_Categoria, Categoria.Nombre_Categoria
	FROM Producto
	INNER JOIN  Categoria ON Producto.ID_Categoria = Categoria.ID_Categoria
	WHERE Producto.ID_Categoria = @ID_Categoria
END;

EXEC dbo.spProducto_GetByID_Categoria 1

----------------------------------
----------------------------------
CREATE PROCEDURE dbo.spProducto_Insert ----
(
	@Nombre_Producto nvarchar(100),
	@Descripcion_Producto nvarchar(255),
	@ID_Categoria int
)
AS
BEGIN
	INSERT INTO Producto
	VALUES(@Nombre_Producto, @Descripcion_Producto, @ID_Categoria)
END

EXEC dbo.spProducto_Insert 'Prue', 'Pre2', 1

select * from Producto

----------------------------------
----------------------------------
 
CREATE PROCEDURE dbo.spProducto_Update ---
(
	@ID_Producto int,
	@Nombre_Producto nvarchar(100),
	@Descripcion_Producto nvarchar(255),
	@ID_Categoria int
)
AS
BEGIN
	UPDATE Producto
	SET Nombre_Producto = @Nombre_Producto,
		Descripcion_Producto = @Descripcion_Producto,
		ID_Categoria = @ID_Categoria
	WHERE ID_Producto = @ID_Producto
END

EXEC dbo.spProducto_Update 12 ,'Leo', 'sal', 2

select * from Producto

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spProducto_Delete ---
(@ID_Producto int)
AS
BEGIN
	DELETE FROM Producto
	WHERE ID_Producto = @ID_Producto
END

EXEC dbo.spProducto_Delete 3

SELECT * FROM Producto

----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
--Todo bien

CREATE PROCEDURE dbo.spCategoria_GetAll
AS
BEGIN
	SELECT ID_Categoria, Nombre_Categoria, Descripcion_Categoria FROM  Categoria
END;

EXEC dbo.spCategoria_GetAll

----------------------------------

CREATE PROCEDURE dbo.spCategoria_GetById
(@ID_Categoria INT)
AS
BEGIN
	SELECT ID_Categoria, Nombre_Categoria, Descripcion_Categoria
	FROM Categoria
    WHERE ID_Categoria = @ID_Categoria
END;

EXEC dbo.spCategoria_GetById 1

----------------------------------

CREATE PROCEDURE dbo.spCategoria_Update
(
	@Nombre_Categoria nvarchar(50),
	@Descripcion_Categoria nvarchar(255),
	@ID_Categoria int
)
AS
BEGIN
	UPDATE Categoria 
	SET Nombre_Categoria = @Nombre_Categoria,
	Descripcion_Categoria = @Descripcion_Categoria
    WHERE ID_Categoria = @ID_Categoria
END;

EXEC dbo.spCategoria_Update 'Prueba 1', 'Prueba 1', 6

select * from Categoria

----------------------------------

CREATE PROCEDURE dbo.spCategoria_Insert
(
	@Nombre_Categoria nvarchar(50),
	@Descripcion_Categoria nvarchar(255)
)
AS
BEGIN
	INSERT INTO Categoria 
	VALUES(@Nombre_Categoria, @Descripcion_Categoria)
END;

EXEC dbo.spCategoria_Insert 'pRUEBA 2', 'pRUEBA 2'

----------------------------------

CREATE PROCEDURE dbo.spCategoria_Delete
(@ID_Categoria int)
AS
BEGIN
	DELETE FROM Categoria WHERE ID_Categoria = @ID_Categoria
END;

EXEC dbo.spCategoria_Delete 2

select * from Categoria

----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------


-- Insertar dos registros en la tabla Categoria
INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria) VALUES
('sol', 'Productos electrónicos de consumo'),
('Hogar', 'Productos para el hogar');

-- Insertar dos registros en la tabla Producto
INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, ID_Categoria) VALUES
('Smartphone', 'Teléfono inteligente con pantalla táctil', 2),
('Televisor LED', 'Televisor de alta definición con tecnología LED', 2);

-- Insertar dos registros en la tabla Precio
INSERT INTO Precio (PrecioUnitario, ID_Producto) VALUES
(599.99, 1),
(799.99, 2);

-- Insertar dos registros en la tabla Venta
INSERT INTO Venta (FechaVenta, Total_Venta, Descripcion_Venta) VALUES
('2024-05-13', 1199.98, 'Venta de smartphones y televisores'),
('2024-05-13', 239.98, 'Venta de accesorios para teléfonos móviles');

-- Insertar dos registros en la tabla DetalleVenta
INSERT INTO DetalleVenta (Cantidad, SubTotal, ID_Venta, ID_Producto) VALUES
(2, 1199.98, 1, 1),
(1, 239.98, 2, 1);

-- Insertar dos registros en la tabla Inventario
INSERT INTO Inventario (ID_Producto, Cantidad, FechaRegistro) VALUES
(1, 5, '2024-05-13'),
(2, 10, '2024-05-13');

----------------------------------
----------------------------------

-- Tabla Producto
CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Producto NVARCHAR(100) NOT NULL,
    Descripcion_Producto NVARCHAR(255) NOT NULL,
    ID_Categoria INT NOT NULL,
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria)
);

-- Tabla Precio
CREATE TABLE Precio (
    ID_Precio INT PRIMARY KEY IDENTITY(1,1),
    PrecioUnitario MONEY NOT NULL,
	ID_Producto INT NOT NULL
    CONSTRAINT FK_Precio_Producto FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Categoria
CREATE TABLE Categoria (
    ID_Categoria INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Categoria NVARCHAR(50) NOT NULL,
	Descripcion_Categoria NVARCHAR(255) NOT NULL
);

-- Tabla DetalleVenta
CREATE TABLE DetalleVenta (
    ID_DetalleVenta INT PRIMARY KEY IDENTITY(1,1),
    Cantidad INT NOT NULL,
    SubTotal DECIMAL(10, 2) NOT NULL,
	ID_Venta INT NOT NULL,
    ID_Producto INT NOT NULL,
    CONSTRAINT FK_DetalleVenta_Venta FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta),
    CONSTRAINT FK_DetalleVenta_Producto FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Venta
CREATE TABLE Venta (
    ID_Venta INT PRIMARY KEY IDENTITY(1,1),
    FechaVenta DATETIME NOT NULL,
	Total_Venta DECIMAL(10,2) NOT NULL,
	Descripcion_Venta NVARCHAR(255) NOT NULL
);

-- Tabla Inventario
CREATE TABLE Inventario (
    ID_Inventario INT PRIMARY KEY IDENTITY(1,1),
    Cantidad INT NOT NULL,
    FechaRegistro DATETIME NOT NULL,
	ID_Producto INT NOT NULL,
    CONSTRAINT FK_Inventario_Producto FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);
