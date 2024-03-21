use NORTHWND
select * from Orders
-- Los primeros 10 registros
select top 10 * from Orders

select top 10 CustomerID as 'Numero de Cliente',
OrderDate as 'Fecha de Orden', ShipCountry as 'Pais de Entrega'
from Orders
order by OrderID desc

--Seleccionar 50% de los registros 

select top 50 percent * from Orders

select top 25 percent * from Orders


-- Seleccionar los primeros 3 clientes de alemania

select top 3 * from Customers
where Country='Germany'

Select top 3 CompanyName as 'Cliente', country as pais, address as direccion
from Customers
where Country='Germany'


--Seleccionar el producto con el precio mayor

select * from Products
order by UnitPrice desc


--Muestra el precio más alto de los productos (Max) 
select max (UnitPrice) as 'Precio maximo' from Products


--Mostrar el precio minimo de los productos (min)
select min (UnitPrice) as 'Precio minimo' from Products

--Seleccionar todas las ordenes de compra
select * from Orders

--Seleccionar el numero total de ordenes (Count)

select count (*) as 'Total de ordenes' from Orders

select count (ShipRegion) as 'Total de ordenes' from Orders

--Seleccionar todas aquellas ordenes donde la region de envio no sea null
select count (*) from Orders
where ShipRegion is not null

--De forma ascendente los productos por precio

select * from Products
order by UnitPrice

--Seleccionar el numero de precios de los productos
select count (distinct UnitPrice) from Products

--Seleccionar todos los diferentes paises de los clientes 
select count (distinct Country ) as 'numero de paises' from Customers

--Seleccionar la suma total de cantidades de las ordenes de compra

select sum (Quantity) from [Order Details]

select * from [Order Details]

--Seleccionar todos los registros de order details calculando su importe (Campo calculado)

select *, (Quantity * UnitPrice) as 'Importe' from [Order Details]


--Seleccionar el total de dinero que ha vendido la empresa
select sum (Quantity * UnitPrice) as 'total' from [Order Details]

--Seleccionar el total de venta del producto chang

select sum (Quantity * UnitPrice) as 'total' from [Order Details]
where ProductID='2'

--Seleccionar el promedio de los precios de los productos
select avg (UnitPrice) as 'Promedio' from Products

--Seleccionar el promedio total y el total de venta de los productos 41,60 y 31
select sum (UnitPrice*Quantity)  as total, avg (UnitPrice*Quantity) 
from [Order Details]
where ProductID = 41 or ProductID= 60 or ProductID=31


--Seleccionar el numero de ordenes realizadas entre 1996 y 1997
select * from Orders

select Country, count (*)
from Customers
group by Country


select Country, count (*)  as 'Total de clientes'
from Customers
group by 1 desc

--seleccionar el numero de ordenes enviadas por el shippervia
select shipvia, count (*) as 'Numero de ordenes' from Orders
group by ShipVia

select s.CompanyName as 'Nombre compañia', count (*) as total
from Orders as o
inner join Shippers as s
on o.ShipVia = s.ShipperID
group by s.CompanyName

