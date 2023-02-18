--EXAMEN ADMON. DE DATOS 386
--Sonia Madrid
--61811001
--18/02/2023
create database Mercadito
go
use Mercadito
--TABLAS DE PROVEEDORES, PRODUCTOS, CLIENTES, COMPRAS, GASTOS, ETC. DEL MERCADITO
--1NF
/*
Create table Proveedores(
id_proveedor varchar(20) primary key,
nombre varchar (50),
direccion varchar (50),
telefono varchar (50)
);

Create table Productos(
id_producto varchar(20) primary key,
nombre varchar (50),
descripcion varchar (50),
precio decimal,
id_proveedor varchar(20),
foreign key (id_proveedor) references Proveedores (id_proveedor)
);

Create table Compras(
id_compra varchar(20) primary key,
id_producto varchar(20),
foreign key (id_producto) references Productos (id_producto),
fecha_compra date,
cantidad int,
precio_unitario decimal
);

Create table PagoProveedores(
id_pago varchar(20) primary key,
id_proveedor varchar(20),
foreign key (id_proveedor) references Proveedores (id_proveedor),
fecha_pago date,
total decimal
);

Create table Clientes(
id_cliente varchar(10) primary key,
nombre varchar (50),
direccion varchar (50), 
telefono varchar (50),
linea_credito decimal
);

Create table Ventas(
id_venta varchar(20) primary key,
id_cliente varchar(10),
foreign key (id_cliente) references Clientes (id_cliente),
id_producto varchar(20),
foreign key (id_producto) references Productos (id_producto),
fecha_venta date,
cantidad int,
precio_unitario decimal
);

Create table Gastos(
id_gasto varchar (20) primary key,
fecha_gasto date,
descripcion varchar (50),
total decimal
);
Create table Pago_Cliente(
id_pagoCliente varchar(10) primary key,
id_cliente varchar(10),
foreign key (id_cliente) references Clientes (id_cliente),
fecha_pago date,
total decimal
);

Create table Caja(
id_caja varchar(10) primary key,
fecha_caja date,
empleado varchar (50), /* quien abre o cierra la caja*/
id_venta varchar(20),
foreign key (id_venta) references Ventas (id_venta),
ingresos decimal /*lo que se vendió en ese período de tiempo y lo que ingresó a la caja */
);
---------------------------------------------------------------------------------------------------------------------------------------------------------

--2FN

Create table Proveedores(
id_proveedor varchar(20) primary key,
nombre varchar (50),
direccion varchar (50),
telefono varchar (50)
);

Create table Productos(
id_producto varchar(20) primary key,
nombre varchar (50),
descripcion varchar (50),
precio decimal,
id_proveedor varchar(20),
foreign key (id_proveedor) references Proveedores (id_proveedor)
);

Create table Compras(
id_compra varchar(20) primary key,
id_producto varchar(20),
foreign key (id_producto) references Productos (id_producto),
fecha_compra date,
cantidad varchar (50),
precio_unitario decimal,
id_proveedor varchar(20),
foreign key (id_proveedor) references Proveedores (id_proveedor)

);

Create table PagoProveedores(
id_pago varchar(20) primary key,
id_proveedor varchar(20),
foreign key (id_proveedor) references Proveedores (id_proveedor),
fecha_pago date,
total decimal
);

Create table Gastos(
id_gasto varchar (20) primary key,
fecha_gasto date,
descripcion varchar(50),
total decimal
);

Create table Clientes(
id_cliente varchar(10) primary key,
nombre varchar (50),
direccion varchar (50), 
telefono varchar (50),
linea_credito decimal
);

Create table Ventas(
id_venta varchar(20) primary key,
id_cliente varchar(10),
foreign key (id_cliente) references Clientes (id_cliente),
id_producto varchar(20),
foreign key (id_producto) references Productos (id_producto),
fecha_venta date,
cantidad int,
precio_unitario decimal
);

Create table Pago_Cliente(
id_pagoCliente varchar(10) primary key,
id_cliente varchar(10),
foreign key (id_cliente) references Clientes (id_cliente),
fecha_pago date,
total decimal
);

Create table Caja(
id_caja varchar(10) primary key,
fecha_caja date,
empleado varchar (50), /* quien abre o cierra la caja*/
id_venta varchar(20),
foreign key (id_venta) references Ventas (id_venta),
ingresos decimal /*lo que se vendió en ese período de tiempo y lo que ingresó a la caja */
);

*/
---------------------------------------------------------------------------------------------------------------------------------------------------------
--3FN
Create table Proveedores(
id_proveedor varchar(20) primary key,
nombre varchar(50),
direccion varchar (50),
telefono varchar (50)
);

Create table Productos(
id_producto varchar(20) primary key,
nombre varchar(50),
descripcion varchar (50),
precio decimal,
id_proveedor varchar(20),
foreign key (id_proveedor) references Proveedores (id_proveedor)
);

Create table Compras(
id_compra varchar(20) primary key,
id_producto varchar(20),
foreign key (id_producto) references Productos (id_producto),
fecha_compra date,
cantidad int,
precio_unitario decimal,
id_proveedor varchar(20),
foreign key (id_proveedor) references Proveedores (id_proveedor)

);

Create table PagoProveedores(
id_pago varchar(20) primary key,
id_proveedor varchar(20),
foreign key (id_proveedor) references Proveedores (id_proveedor),
fecha_pago date,
total decimal
);

Create table Gastos(
id_gasto varchar (20) primary key,
fecha_gasto date,
descripcion varchar (50),
total decimal
);

Create table DetallesCompras(
id_detalleCompra varchar(20) primary key,
id_compra varchar(20),
foreign key (id_compra) references Compras(id_compra),
id_producto varchar(20),
foreign key (id_producto) references Productos (id_producto),
id_gasto varchar (20),
foreign key (id_gasto) references Gastos (id_gasto),
cantidad int,
precio_unitario decimal
);


Create table Clientes(
id_cliente varchar(10) primary key,
nombre varchar(50),
direccion varchar(50), 
telefono varchar(50),
linea_credito decimal
);

Create table Ventas(
id_venta varchar(20) primary key,
id_cliente varchar(10),
foreign key (id_cliente) references Clientes (id_cliente),
id_producto varchar(20),
foreign key (id_producto) references Productos (id_producto),
fecha_venta date,
cantidad int ,
precio_unitario decimal
);

Create table Pago_Cliente(
id_pagoCliente varchar(10) primary key,
id_cliente varchar(10),
foreign key (id_cliente) references Clientes (id_cliente),
fecha_pago date,
total decimal
);

Create table Caja(
id_caja varchar(10) primary key,
fecha_caja date,
empleado varchar (50), /* quien abre o cierra la caja*/
id_venta varchar(20),
foreign key (id_venta) references Ventas (id_venta),
ingresos decimal /*lo que se vendió en ese período de tiempo y lo que ingresó a la caja */
);

Create table DetallesVentas(
id_detalleVenta varchar(20) primary key,
id_venta varchar(20),
foreign key (id_venta) references Ventas (id_venta),
id_producto varchar(20),
foreign key (id_producto) references Productos (id_producto),
cantidad varchar (50),
precio_unitario decimal
);



--Registros
insert into Proveedores (id_proveedor,nombre,direccion,telefono)values 
(1001,'Bimbo', 'San Pedro Sula', 5044521562),
(1002,'Pepsi', 'San Pedro Sula', 50445218862),
(1003,'Coca Cola', 'San Pedro Sula', 5044521563),
(1004,'Copan Dry', 'San Pedro Sula', 5044526582),
(1005,'Yummies', 'San Pedro Sula', 5044535442),
(1006,'Sarita', 'San Pedro Sula', 5044598722),
(1007,'Agua Arroyo', 'San Pedro Sula', 5044981567),
(1008,'Agua Azul', 'San Pedro Sula', 50445257564),
(1009,'Frozen Foods', 'San Pedro Sula', 5048821563),
(1110,'Pollo Norteño', 'San Pedro Sula', 5044588561);

insert into Productos (id_producto,nombre,descripcion,precio,id_proveedor)values 
(1010,'Variedades Bimbo','Variedades de Pan', 2042.60, 1001),
(1011,'Refrescos','Refrescos varios', 3506.99, 1002),
(1012,'Refrescos Coca Cola','Refrescos varios',4506.32, 1003),
(1013,'Refrescos','Refrescos varios', 1620.52, 1004),
(1014,'Churros','Pan Molde', 5023.45, 1005),
(1015,'Helados Sarita','Variedad de sabores', 5620.35, 1006),
(1016,'Botellos Agua Arroyo','Pan Molde',5782, 1007),
(1017,'Botellos Agua Azul','Pan Molde', 6987, 1008),
(1018,'Helados Frozen','Variedad helados', 2342.23, 1009),
(1019,'Pollo Norteño','Piezas de pollo', 7851, 1110);

insert into Compras (id_compra,id_producto,fecha_compra,cantidad,precio_unitario,id_proveedor)values 
(2001,1010,GETDATE(), 32, 40.48, 1001),
(2002,1011,GETDATE(), 50, 50.12, 1002),
(2003,1012,GETDATE(), 50, 46.23, 1003),
(2004,1013,GETDATE(), 40, 44.77, 1004),
(2005,1014,GETDATE(), 50, 50.64, 1005),
(2006,1015,GETDATE(), 50, 150.55, 1006),
(2007,1016,GETDATE(), 25, 40.78, 1007),
(2008,1017,GETDATE(), 40, 35.99, 1008),
(2009,1018,GETDATE(), 25, 160.54, 1009),
(2010,1019,GETDATE(), 34, 190.45, 1110);

insert into PagoProveedores (id_pago,id_proveedor,fecha_pago,total)values 
(111,1001,GETDATE(),50000),
(112,1002,GETDATE(),70000),
(113,1003,GETDATE(),95000),
(114,1004,GETDATE(),98512),
(115,1005,GETDATE(),68511),
(116,1006,GETDATE(),50000),
(117,1007,GETDATE(),89521),
(118,1008,GETDATE(),40256),
(119,1009,GETDATE(),68920),
(110,1110,GETDATE(),60000);

insert into Gastos (id_gasto,fecha_gasto,descripcion,total)values 
(712,GETDATE(), 'Agua', 1500),
(713,GETDATE(), 'Energia Electrica', 4600),
(714,GETDATE(), 'Comida', 10000),
(715,GETDATE(), 'Varios Gastos', 1900),
(716,GETDATE(), 'Varios Gastos', 3300),
(717,GETDATE(), 'Varios Gastos', 4000),
(718,GETDATE(), 'Varios Gastos', 6214),
(719,GETDATE(), 'Varios Gastos', 1230),
(720,GETDATE(), 'Varios Gastos', 8230),
(721,GETDATE(), 'Impuestos', 12600);

insert into DetallesCompras (id_detalleCompra,id_compra,id_producto,id_gasto,cantidad,precio_unitario)values 
(331,2001,1010,712,40,45.45),
(332,2002,1011,713,80,32.45),
(333,2003,1012,714,90,98.45),
(334,2004,1013,715,20,55.45),
(335,2005,1014,716,60,54),
(336,2006,1015,717,100,61),
(337,2007,1016,718,156,20),
(338,2008,1017,719,50,61.25),
(339,2009,1018,720,50,40.45),
(310,2010,1019,721,160,60);

insert into Clientes (id_cliente,nombre,direccion, telefono,linea_credito)values 
(10,'Yolanda Cruz', 'Col. Angeles', 504123654, 4000 ),
(11,'Adrian Arenales','Col. Angeles', 50414585,0 ),
(13,'Patricia Mendoza','Col. Angeles', 504544585,105),
(14,'Tania Mejia','Col. Angeles', 50458585,50),
(15,'Salvador Esquil','Col. Angeles', 50454425,0),
(16,'Celia Cruz','Col. Angeles', 504545585,620),
(17,'Raul Colindes','Col. Angeles', 5045474585,0),
(18,'Bella Stew','Col. Angeles', 504544585,0),
(19,'Aitana Mejia','Col. Angeles', 504587585,92),
(120,'Zoila Perez','Col. Angeles', 504545685,0);

insert into Ventas (id_venta,id_cliente,id_producto,fecha_venta,cantidad,precio_unitario)values 
(22,10,1010,GETDATE(),16, 4000),
(23,11,1010,GETDATE(),2, 123),
(24,120,1010,GETDATE(),12, 320),
(25,13,1010,GETDATE(),3, 160),
(26,14,1010,GETDATE(),56, 324),
(27,15,1010,GETDATE(),20, 854),
(28,16,1010,GETDATE(),23, 60),
(29,17,1010,GETDATE(),8, 4000),
(222,18,1010,GETDATE(),7, 160),
(223,19,1010,GETDATE(),5, 250);

insert into Pago_Cliente (id_pagoCliente,id_cliente,fecha_pago,total)values 
(70,10,GETDATE(), 4000),
(71,11,GETDATE(), 320),
(72,120,GETDATE(),512 ),
(73,19,GETDATE(),5666 ),
(74,13,GETDATE(), 5454),
(75,14,GETDATE(), 5612),
(76,15,GETDATE(), 741),
(77,16,GETDATE(), 864),
(78,17,GETDATE(), 216),
(79,18,GETDATE(), 453.54);

insert into Caja (id_caja,fecha_caja,empleado,id_venta,ingresos)values 
(41,GETDATE(),'Karla',22,4000),
(42,GETDATE(),'Karla',222,4521),
(43,GETDATE(),'Maria',23,200),
(44,GETDATE(),'Maria',24,320),
(45,GETDATE(),'Karla',25,453),
(46,GETDATE(),'Maria',26,1235),
(47,GETDATE(),'Karla',27,478),
(48,GETDATE(),'Maria',28,954),
(49,GETDATE(),'Karla',29,356.35),
(410,GETDATE(),'Maria',223, 1000);

insert into DetallesVentas (id_detalleVenta,id_venta,id_producto,cantidad,precio_unitario)values 
(930,22,1010,160,4512),
(931,23,1011,80,451.21),
(932,24,1012,260,456),
(933,25,1013,150,576),
(934,26,1014,186,123),
(935,27,1015,240,4512),
(936,28,1016,160,315),
(937,29,1017,456,445),
(938,222,1018,510,495),
(939,223,1019,165,325);




