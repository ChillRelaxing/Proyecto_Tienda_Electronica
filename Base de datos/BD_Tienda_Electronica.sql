create database DB_Tienda_Electronica
go

use DB_Tienda_Electronica
go

----------------------------------
----------------------------------

select * from Categoria ---F

select * from DetalleVenta ---Yo

select * from Inventario ---Yo

select * from Cliente ---F

select * from Producto ---Yo

select * from Venta --F

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spVenta_GetAll
AS
BEGIN
    SELECT Venta.ID_Venta, Venta.FechaVenta, Venta.Total_Venta, Venta.Descripcion_Venta, 
           Cliente.ID_Cliente, Cliente.Nombre_Cliente
    FROM Venta
    INNER JOIN Cliente ON Venta.ID_Cliente = Cliente.ID_Cliente
END;

EXEC dbo.spVenta_GetAll

----------------------------------

CREATE PROCEDURE dbo.spVenta_GetById
(@ID_Venta INT)
AS
BEGIN
    SELECT Venta.ID_Venta, Venta.FechaVenta, Venta.Total_Venta, Venta.Descripcion_Venta, 
           Cliente.ID_Cliente, Cliente.Nombre_Cliente
    FROM Venta
    INNER JOIN Cliente ON Venta.ID_Cliente = Cliente.ID_Cliente
    WHERE Venta.ID_Venta = @ID_Venta
END;

EXEC dbo.spVenta_GetById 1


----------------------------------

CREATE PROCEDURE dbo.spVenta_Update
(
    @FechaVenta datetime,
    @Total_Venta decimal(10,2),
    @Descripcion_Venta nvarchar(255),
    @ID_Cliente int,
    @ID_Venta int
)
AS
BEGIN
    UPDATE Venta 
    SET FechaVenta = @FechaVenta,
        Total_Venta = @Total_Venta,
        Descripcion_Venta = @Descripcion_Venta,
        ID_Cliente = @ID_Cliente
    WHERE ID_Venta = @ID_Venta
END;

EXEC dbo.spVenta_Update '2025-05-13 00:00:00.000', 2000.98, 'Venta televisores', 1, 1

SELECT * FROM Venta


----------------------------------

CREATE PROCEDURE dbo.spVenta_Insert
(
    @FechaVenta datetime,
    @Total_Venta decimal(10,2),
    @Descripcion_Venta nvarchar(255),
    @ID_Cliente int
)
AS
BEGIN
    INSERT INTO Venta (FechaVenta, Total_Venta, Descripcion_Venta, ID_Cliente)
    VALUES(@FechaVenta, @Total_Venta, @Descripcion_Venta, @ID_Cliente)
END;

EXEC dbo.spVenta_Insert '2026-05-13 00:00:00.000', 300.25, 'Venta de Comida', 1

SELECT * FROM Venta


----------------------------------

CREATE PROCEDURE dbo.spVenta_Delete
(@ID_Venta int)
AS
BEGIN
    DELETE FROM Venta WHERE ID_Venta = @ID_Venta
END;

EXEC dbo.spVenta_Delete 3

----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spDetalleVenta_GetAll
AS
BEGIN
	SELECT DetalleVenta.ID_DetalleVenta, DetalleVenta.Cantidad, DetalleVenta.SubTotal, DetalleVenta.PrecioUnitario,
	       Venta.ID_Venta, Producto.ID_Producto, Venta.FechaVenta, Producto.Nombre_Producto
	FROM DetalleVenta
	INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta
	INNER JOIN Producto ON DetalleVenta.ID_Producto = Producto.ID_Producto
END;

EXEC dbo.spDetalleVenta_GetAll

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spDetalleVenta_GetByID
(@ID_DetalleVenta INT)
AS
BEGIN
	SELECT DetalleVenta.ID_DetalleVenta, DetalleVenta.Cantidad, DetalleVenta.SubTotal, DetalleVenta.PrecioUnitario,
	       Venta.ID_Venta, Producto.ID_Producto, Venta.FechaVenta, Producto.Nombre_Producto
	FROM DetalleVenta
	INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta
	INNER JOIN Producto ON DetalleVenta.ID_Producto = Producto.ID_Producto
	WHERE ID_DetalleVenta = @ID_DetalleVenta
END;

EXEC dbo.spDetalleVenta_GetByID 3

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spDetalleVenta_GetByIdVenta
(@ID_Venta INT)
AS
BEGIN
	SELECT DetalleVenta.ID_DetalleVenta, DetalleVenta.Cantidad, DetalleVenta.SubTotal, DetalleVenta.PrecioUnitario,
	       Venta.ID_Venta, Producto.ID_Producto, Venta.FechaVenta, Producto.Nombre_Producto
	FROM DetalleVenta
	INNER JOIN Venta ON DetalleVenta.ID_Venta = Venta.ID_Venta
	INNER JOIN Producto ON DetalleVenta.ID_Producto = Producto.ID_Producto
	WHERE DetalleVenta.ID_Venta = @ID_Venta
END;

EXEC dbo.spDetalleVenta_GetByIdVenta 2

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spDetalleVenta_Insert
(
	@Cantidad int,
	@SubTotal decimal(18,2),
	@PrecioUnitario money,
	@Id_Venta int,
	@Id_Producto int
)
AS
BEGIN
	INSERT INTO DetalleVenta (Cantidad, SubTotal, PrecioUnitario, Id_Venta, Id_Producto)
	VALUES(@Cantidad, @SubTotal, @PrecioUnitario, @Id_Venta, @Id_Producto)
END;

EXEC dbo.spDetalleVenta_Insert 25, 56.25, 100.00, 2, 2

SELECT * FROM DetalleVenta

----------------------------------
----------------------------------
 
CREATE PROCEDURE dbo.spDetalleVenta_Update
(
	@ID_DetalleVenta int,
	@Cantidad int,
	@SubTotal decimal(18,2),
	@PrecioUnitario money,
	@Id_Venta int,
	@Id_Producto int
)
AS
BEGIN
	UPDATE DetalleVenta
	SET Cantidad = @Cantidad,
		SubTotal = @SubTotal,
		PrecioUnitario = @PrecioUnitario,
		Id_Venta = @Id_Venta,
		Id_Producto = @Id_Producto
	WHERE ID_DetalleVenta = @ID_DetalleVenta
END;

EXEC dbo.spDetalleVenta_Update 1, 3, 500, 100.00, 2, 2

SELECT * FROM DetalleVenta

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spDetalleVenta_Delete
(@ID_DetalleVenta int)
AS
BEGIN
	DELETE FROM DetalleVenta WHERE ID_DetalleVenta = @ID_DetalleVenta
END;

EXEC dbo.spDetalleVenta_Delete 2

----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spProducto_GetAll
AS
BEGIN
	SELECT Producto.ID_Producto, Producto.Nombre_Producto, Producto.Descripcion_Producto, Producto.PrecioUnitario, 
	       Categoria.ID_Categoria, Categoria.Nombre_Categoria
	FROM Producto
	INNER JOIN Categoria ON Producto.ID_Categoria = Categoria.ID_Categoria
END;

EXEC dbo.spProducto_GetAll

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spProducto_GetByID
(@ID_Producto INT)
AS
BEGIN
	SELECT Producto.ID_Producto, Producto.Nombre_Producto, Producto.Descripcion_Producto, Producto.PrecioUnitario,
	       Categoria.ID_Categoria, Categoria.Nombre_Categoria
	FROM Producto
	INNER JOIN Categoria ON Producto.ID_Categoria = Categoria.ID_Categoria
	WHERE ID_Producto = @ID_Producto
END;

EXEC dbo.spProducto_GetByID 1

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spProducto_GetByID_Categoria
(@ID_Categoria INT)
AS
BEGIN
	SELECT Producto.ID_Producto, Producto.Nombre_Producto, Producto.Descripcion_Producto, Producto.PrecioUnitario,
	       Categoria.ID_Categoria, Categoria.Nombre_Categoria
	FROM Producto
	INNER JOIN Categoria ON Producto.ID_Categoria = Categoria.ID_Categoria
	WHERE Producto.ID_Categoria = @ID_Categoria
END;

EXEC dbo.spProducto_GetByID_Categoria 1

----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spProducto_Insert
(
	@Nombre_Producto nvarchar(100),
	@Descripcion_Producto nvarchar(255),
	@PrecioUnitario money,
	@ID_Categoria int
)
AS
BEGIN
	INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, PrecioUnitario, ID_Categoria)
	VALUES(@Nombre_Producto, @Descripcion_Producto, @PrecioUnitario, @ID_Categoria)
END;

EXEC dbo.spProducto_Insert 'Producto1', 'Descripción del Producto1', 50.00, 1

----------------------------------
----------------------------------
 
CREATE PROCEDURE dbo.spProducto_Update
(
	@ID_Producto int,
	@Nombre_Producto nvarchar(100),
	@Descripcion_Producto nvarchar(255),
	@PrecioUnitario money,
	@ID_Categoria int
)
AS
BEGIN
	UPDATE Producto
	SET Nombre_Producto = @Nombre_Producto,
		Descripcion_Producto = @Descripcion_Producto,
		PrecioUnitario = @PrecioUnitario,
		ID_Categoria = @ID_Categoria
	WHERE ID_Producto = @ID_Producto
END;

EXEC dbo.spProducto_Update 1, 'Producto Actualizado', 'Descripción Actualizada', 75.00, 2

SELECT *FROM Producto
----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spProducto_Delete
(@ID_Producto int)
AS
BEGIN
	DELETE FROM Producto
	WHERE ID_Producto = @ID_Producto
END;

EXEC dbo.spProducto_Delete 8

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

EXEC dbo.spCategoria_Delete 4

select * from Categoria

----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spCliente_GetAll
AS
BEGIN
	SELECT ID_Cliente, Nombre_Cliente, Direccion_Cliente, Telefono_Cliente, Email_Cliente FROM Cliente
END;

EXEC dbo.spCliente_GetAll

----------------------------------

CREATE PROCEDURE dbo.spCliente_GetByID
(@ID_Cliente INT)
AS
BEGIN
	SELECT ID_Cliente, Nombre_Cliente, Direccion_Cliente, Telefono_Cliente, Email_Cliente
	FROM Cliente
	WHERE ID_Cliente = @ID_Cliente
END;

EXEC dbo.spCliente_GetByID 1

----------------------------------

CREATE PROCEDURE dbo.spCliente_Insert
(
	@Nombre_Cliente NVARCHAR(100),
	@Direccion_Cliente NVARCHAR(255),
	@Telefono_Cliente NVARCHAR(20),
	@Email_Cliente NVARCHAR(100)
)
AS
BEGIN
	INSERT INTO Cliente (Nombre_Cliente, Direccion_Cliente, Telefono_Cliente, Email_Cliente)
	VALUES (@Nombre_Cliente, @Direccion_Cliente, @Telefono_Cliente, @Email_Cliente)
END;

EXEC dbo.spCliente_Insert 'Cliente1', 'Direccion1', '1234567890', 'cliente1@example.com'

SELECT * FROM Cliente
----------------------------------

CREATE PROCEDURE dbo.spCliente_Update
(
	@ID_Cliente INT,
	@Nombre_Cliente NVARCHAR(100),
	@Direccion_Cliente NVARCHAR(255),
	@Telefono_Cliente NVARCHAR(20),
	@Email_Cliente NVARCHAR(100)
)
AS
BEGIN
	UPDATE Cliente
	SET Nombre_Cliente = @Nombre_Cliente,
		Direccion_Cliente = @Direccion_Cliente,
		Telefono_Cliente = @Telefono_Cliente,
		Email_Cliente = @Email_Cliente
	WHERE ID_Cliente = @ID_Cliente
END;

EXEC dbo.spCliente_Update 1, 'Cliente Actualizado', 'Direccion Actualizada', '0987654321', 'clienteactualizado@example.com'

SELECT * FROM Cliente

----------------------------------

CREATE PROCEDURE dbo.spCliente_Delete
(@ID_Cliente INT)
AS
BEGIN
	DELETE FROM Cliente WHERE ID_Cliente = @ID_Cliente
END;

EXEC dbo.spCliente_Delete 3

----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------
----------------------------------

CREATE PROCEDURE dbo.spInventario_GetAll
AS
BEGIN
	SELECT Inventario.ID_Inventario, Inventario.Cantidad, Inventario.FechaRegistro, 
	       Inventario.ID_Producto, Producto.Nombre_Producto
	FROM Inventario
	INNER JOIN Producto ON Inventario.ID_Producto = Producto.ID_Producto
END;

EXEC dbo.spInventario_GetAll

----------------------------------

CREATE PROCEDURE dbo.spInventario_GetByID
(@ID_Inventario INT)
AS
BEGIN
	SELECT Inventario.ID_Inventario, Inventario.Cantidad, Inventario.FechaRegistro, 
	       Inventario.ID_Producto, Producto.Nombre_Producto
	FROM Inventario
	INNER JOIN Producto ON Inventario.ID_Producto = Producto.ID_Producto
	WHERE Inventario.ID_Inventario = @ID_Inventario
END;

EXEC dbo.spInventario_GetByID 1

----------------------------------

CREATE PROCEDURE dbo.spInventario_Insert
(
	@Cantidad INT,
	@FechaRegistro DATETIME,
	@ID_Producto INT
)
AS
BEGIN
	INSERT INTO Inventario (Cantidad, FechaRegistro, ID_Producto)
	VALUES (@Cantidad, @FechaRegistro, @ID_Producto)
END;

EXEC dbo.spInventario_Insert 100, '2023-05-13 00:00:00.000', 1

----------------------------------

CREATE PROCEDURE dbo.spInventario_Update
(
	@ID_Inventario INT,
	@Cantidad INT,
	@FechaRegistro DATETIME,
	@ID_Producto INT
)
AS
BEGIN
	UPDATE Inventario
	SET Cantidad = @Cantidad,
		FechaRegistro = @FechaRegistro,
		ID_Producto = @ID_Producto
	WHERE ID_Inventario = @ID_Inventario
END;

EXEC dbo.spInventario_Update 1, 150, '2023-06-01 00:00:00.000', 2

SELECT * FROM Inventario

----------------------------------

CREATE PROCEDURE dbo.spInventario_Delete
(@ID_Inventario INT)
AS
BEGIN
	DELETE FROM Inventario WHERE ID_Inventario = @ID_Inventario
END;

EXEC dbo.spInventario_Delete 7

----------------------------------

-- Tabla Producto (actualizada con PrecioUnitario)
CREATE TABLE Producto (
    ID_Producto INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Producto NVARCHAR(100) NOT NULL,
    Descripcion_Producto NVARCHAR(255) NOT NULL,
    PrecioUnitario MONEY NOT NULL, -- Nueva columna añadida
    ID_Categoria INT NOT NULL,
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria)
);

-- Tabla Categoria (sin cambios)
CREATE TABLE Categoria (
    ID_Categoria INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Categoria NVARCHAR(50) NOT NULL,
    Descripcion_Categoria NVARCHAR(255) NOT NULL
);

-- Tabla DetalleVenta (actualizada con PrecioUnitario)
CREATE TABLE DetalleVenta (
    ID_DetalleVenta INT PRIMARY KEY IDENTITY(1,1),
    Cantidad INT NOT NULL,
    SubTotal DECIMAL(10, 2) NOT NULL,
    PrecioUnitario MONEY NOT NULL, -- Nueva columna añadida
    ID_Venta INT NOT NULL,
    ID_Producto INT NOT NULL,
    CONSTRAINT FK_DetalleVenta_Venta FOREIGN KEY (ID_Venta) REFERENCES Venta(ID_Venta),
    CONSTRAINT FK_DetalleVenta_Producto FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Venta (sin cambios)
CREATE TABLE Venta (
    ID_Venta INT PRIMARY KEY IDENTITY(1,1),
    FechaVenta DATETIME NOT NULL,
    Total_Venta DECIMAL(10,2) NOT NULL,
    Descripcion_Venta NVARCHAR(255) NOT NULL,
    ID_Cliente INT NOT NULL, -- Nueva columna añadida para la relación con Cliente
    CONSTRAINT FK_Venta_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

-- Tabla Inventario (sin cambios)
CREATE TABLE Inventario (
    ID_Inventario INT PRIMARY KEY IDENTITY(1,1),
    Cantidad INT NOT NULL,
    FechaRegistro DATETIME NOT NULL,
    ID_Producto INT NOT NULL,
    CONSTRAINT FK_Inventario_Producto FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Tabla Cliente (nueva tabla añadida)
CREATE TABLE Cliente (
    ID_Cliente INT PRIMARY KEY IDENTITY(1,1),
    Nombre_Cliente NVARCHAR(100) NOT NULL,
    Direccion_Cliente NVARCHAR(255) NOT NULL,
    Telefono_Cliente NVARCHAR(20) NOT NULL,
    Email_Cliente NVARCHAR(100) NOT NULL
);


INSERT INTO Categoria (Nombre_Categoria, Descripcion_Categoria)
VALUES ('Electrónica', 'Productos electrónicos como televisores, radios, etc.'),
       ('Ropa', 'Ropa y accesorios'),
       ('Alimentos', 'Productos alimenticios');

INSERT INTO Producto (Nombre_Producto, Descripcion_Producto, PrecioUnitario, ID_Categoria)
VALUES ('Televisor', 'Televisor de 40 pulgadas', 300.00, 1),
       ('Radio', 'Radio AM/FM', 50.00, 1),
       ('Camisa', 'Camisa de algodón', 20.00, 2),
       ('Pantalones', 'Pantalones de mezclilla', 30.00, 2),
       ('Manzanas', 'Manzanas frescas por kg', 3.00, 3),
       ('Leche', 'Leche en cartón de 1 litro', 1.50, 3);


INSERT INTO Cliente (Nombre_Cliente, Direccion_Cliente, Telefono_Cliente, Email_Cliente)
VALUES ('Juan Pérez', 'Calle Falsa 123', '123456789', 'juan.perez@example.com'),
       ('María López', 'Avenida Siempre Viva 456', '987654321', 'maria.lopez@example.com'),
       ('Carlos Sánchez', 'Boulevard de los Sueños 789', '456123789', 'carlos.sanchez@example.com');

-- Suponiendo que ya tienes IDs de clientes existentes
INSERT INTO Venta (FechaVenta, Total_Venta, Descripcion_Venta, ID_Cliente)
VALUES (GETDATE(), 10, 'Venta de prueba', 1),
       (GETDATE(), 20, 'Venta de prueba 2', 2);

-- Suponiendo que ya tienes IDs de ventas y productos existentes
INSERT INTO DetalleVenta (Cantidad, SubTotal, PrecioUnitario, ID_Venta, ID_Producto)
VALUES (1, 300.00, 300.00, 1, 1),
       (2, 60.00, 30.00, 1, 4),
       (5, 7.50, 1.50, 2, 6);


-- Suponiendo que ya tienes IDs de productos existentes
INSERT INTO Inventario (Cantidad, FechaRegistro, ID_Producto)
VALUES (50, GETDATE(), 1),
       (100, GETDATE(), 2),
       (200, GETDATE(), 3),
       (150, GETDATE(), 4),
       (500, GETDATE(), 5),
       (300, GETDATE(), 6);




---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
---------------------------------------------
--SP ACTUALIZADOS

CREATE PROCEDURE dbo.spActualizarTotalVenta
(
    @ID_Venta INT
)
AS
BEGIN
    DECLARE @Total_Venta DECIMAL(10, 2);

    SELECT @Total_Venta = SUM(SubTotal)
    FROM DetalleVenta
    WHERE ID_Venta = @ID_Venta;

    UPDATE Venta
    SET Total_Venta = @Total_Venta
    WHERE ID_Venta = @ID_Venta;
END;

---------------------------------------------
---------------------------------------------

ALTER PROCEDURE dbo.spDetalleVenta_Insert
(
    @Cantidad INT,
    @SubTotal DECIMAL(18, 2),
    @PrecioUnitario MONEY,
    @ID_Venta INT,
    @ID_Producto INT
)
AS
BEGIN
    INSERT INTO DetalleVenta (Cantidad, SubTotal, PrecioUnitario, ID_Venta, ID_Producto)
    VALUES (@Cantidad, @SubTotal, @PrecioUnitario, @ID_Venta, @ID_Producto);

    -- Actualizar el Total_Venta
    EXEC dbo.spActualizarTotalVenta @ID_Venta;
END;

---------------------------------------------
---------------------------------------------


ALTER PROCEDURE dbo.spDetalleVenta_Update
(
    @ID_DetalleVenta INT,
    @Cantidad INT,
    @SubTotal DECIMAL(18, 2),
    @PrecioUnitario MONEY,
    @ID_Venta INT,
    @ID_Producto INT
)
AS
BEGIN
    UPDATE DetalleVenta
    SET Cantidad = @Cantidad,
        SubTotal = @SubTotal,
        PrecioUnitario = @PrecioUnitario,
        ID_Venta = @ID_Venta,
        ID_Producto = @ID_Producto
    WHERE ID_DetalleVenta = @ID_DetalleVenta;

    -- Actualizar el Total_Venta
    EXEC dbo.spActualizarTotalVenta @ID_Venta;
END;

---------------------------------------------
---------------------------------------------

ALTER PROCEDURE dbo.spDetalleVenta_Delete
(
    @ID_DetalleVenta INT
)
AS
BEGIN
    DECLARE @ID_Venta INT;

    SELECT @ID_Venta = ID_Venta
    FROM DetalleVenta
    WHERE ID_DetalleVenta = @ID_DetalleVenta;

    DELETE FROM DetalleVenta
    WHERE ID_DetalleVenta = @ID_DetalleVenta;

    -- Actualizar el Total_Venta
    EXEC dbo.spActualizarTotalVenta @ID_Venta;
END;