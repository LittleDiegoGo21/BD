use NORTHWND

--Seleccionar el numero de orden, nombre del cliente y la fecha de la orden

select orderId,CompanyName,OrderDate
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID

--Mostar el numero de ordenes de cada cliente mostrando el nombre de la compañia

select CompanyName, count (*) as 'Total de pedidos'
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
group by CompanyName
order by 2 desc

--Seleccionar el numero de producto el nombre del producto y el nombre de la categoria
--Ordenados de forma ascendente con respecto al nombre de la categoria

select ProductID, ProductName, CategoryName
from Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID
order by 3 asc

--Seleccionar todas las ordenes de compra 
--Mostrar las fechas ordenes de compra 
--nombre del shipper y el nombre al cliente 
--al que se le vendio 

select c.CompanyName as 'Cliente',
o.OrderDate as 'Fecha de Orden',
s.CompanyName as 'Nombre Flete'
from Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join Shippers as s
on o.ShipVia = s.ShipperID

select c.CompanyName as 'Cliente',
o.OrderDate as 'Fecha de Orden',
s.CompanyName as 'Nombre Flete'
from 
Customers as c
join Orders as o
on c.CustomerID = o.CustomerID
join Shippers as s
on o.ShipVia = s.ShipperID


--Seleccionar el nombre del producto y su categoria 

select ProductName as 'Producto',
CategoryName as 'Categoria'
from Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID

--Listar el nombre del cliente, la fecha de la orden 
-- y los nombres de los productos que fueron vendidos

Select c.CompanyName, o.OrderDate, p.ProductName 
from 
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID

--Seleccionar el nombre completo de los empleados,
--los nombres de los productos que vendio y la cantidad de ellos
--y calcular el importe 

select  CONCAT (e.FirstName,'' ,e.LastName) as 'Nombre Completo',
p.ProductName as 'Descripción',
od.Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe'
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID


--Seleccionar el nombre completo de los empleados,
--los nombres de los productos que vendio y la cantidad de ellos
--y calcular el importe pero de suiza, alemania y francia

select  CONCAT (e.FirstName,'' ,e.LastName) as 'Nombre Completo',
p.ProductName as 'Descripción',
od.Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe',
o.ShipCountry 
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID
where ShipCountry in ('France', 'Germany',  'Switzerland')

--Seleccionar el nombre completo de los empleados,
--los nombres de los productos que vendio y la cantidad de ellos
--y calcular el importe pero de suiza, alemania y francia
--Agrupados por la cantidad total de ordenes hechas por los empleados

select  CONCAT (e.FirstName,'' ,e.LastName) as 'Nombre Completo',
p.ProductName as 'Descripción',
od.Quantity as 'Cantidad',
(od.Quantity * od.UnitPrice) as 'Importe',
o.ShipCountry,
count (*) as 'Total de Ordenes'
from 
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID
where ShipCountry in ('France', 'Germany',  'Switzerland')
group by CONCAT (e.FirstName,'' ,e.LastName)


select companyName as 'Cliente',
sum(UnitPrice * Quantity) as 'Total de venta'
from
[Order Details] as od
inner join
Orders as o
on od.OrderID = o.OrderID
inner join Customers as c
on o.CustomerID = c.CustomerID
where year(o.OrderDate) = '1996'
group by companyName
order by 2 desc

Select year(o.OrderDate) as 'Año',sum(od.Quantity * od.UnitPrice) as total
from
[Order Details] as od
inner join Orders as o
on o.OrderID = od.OrderID
group by year(o.OrderDate)

select c.CategoryName,
sum(od.Quantity * od.UnitPrice) as 'Total'
from Categories as c
inner join Products as p
on p.CategoryID =  c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName
order by 2 Desc

--De la consulta anterior, solamente mostrar aquellos totales 
-- que son mayores a 20000

select c.CategoryName,
sum(od.Quantity * od.UnitPrice) as 'Total'
from Categories as c
inner join Products as p
on p.CategoryID =  c.CategoryID
inner join [Order Details] as od
on od.ProductID = p.ProductID
group by c.CategoryName, p.ProductName
having sum(od.Quantity * od.UnitPrice) > 20000
order by 2 Desc

--Seleccionar el numero de clientes por cada pais
--donde solo sean incluidos los que tengan más de 5 clientes y ordendos de forma descendente 
--por el numero de clientes

select country, count (*) as 'Clientes' from Customers
where Country not in ('Brazil')
group by Country 
having count(*) > 5


-- selecciona los clientes que han realizado pedidos en mas de un pais
--(CustomerID, nombre del cliente, shipcountry, suma total de las ordenes)
select c.CustomerID, c.CompanyName,shipcountry
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
select * from Customers

--Nombre de categoria, ordenados de forma ascendente con respecto al nombre de la categoria.
Select p.ProductID, p.ProductName,c.CategoryName
from Products as p
inner join Categories as c
on p.CategoryID = c.CategoryID
order by c.CategoryName asc

--left join 
select c.CompanyName, o.OrderID
from Customers as c
left outer join Orders as o
on c.CustomerID = o.CustomerID
where o.OrderID is null

