--Consultas Simples con Select - SQL-LMD
use NORTHWND
--Seleccionar todos los clientes
select * from Customers

--Seleccionar el nombre del cliente, nombre contacto y la ciudad

select CompanyName, ContactName, City  from Customers

--Selccionar todos los paises de los clientes (distinct)

select country from Customers

select distinct country from Customers /quita valores repetidos/

--seleciona el mumero de paises de donde son mis clientes (count)
select COUNT(*) from Customers

select COUNT(Country) from Customers

select COUNT(distinct country) from Customers

--Where condicion
--Seleccionar el cliente que tenga un id Anton

select * from Customers
where CustomerID = 'ANTON'

--seleccionar todos los clientes de Mexico

select * from Customers
where Country = 'Mexico'

--Seleccionar todos los registros de los clientes de berlin
 
 select * from Customers
 where City = 'Berlin'

  select CompanyName, City, Country from Customers
 where City = 'Berlin'

 --Order by
--Seleccionar todos los productos ordenados por precio

select * from Products
order by UnitPrice

--Seleccionar todos los productos ordenados por el precio de mayor a menor

select * from Products
order by UnitPrice DESC

--Seleccionar todos los productos alfabeticamente

select * from Products
order by ProductName 

select * from Products
order by ProductName desc

--Seleccionar todos los clienttes por ciudad y dentro por el nombre de forma ascendente

select Country, CompanyName, City from Customers
order by Country desc, CompanyName asc

--Operador and
--Seleccionar todos los clientes de españa y que su nombre comience con g
select * from Customers
where Country='spain' and CompanyName like 'G%'


--Selecionar todos los clientes de Berlin, Alemania con un codigo postal mayor a 1200
Select * from Customers
where City='Berlin' and Country='Germany' and PostalCode > 1200

--Seleccionar todos los clientes de españa y que su nombre comience con G o R
Select * from Customers
where Country = 'Spain' and (CompanyName like 'G%' or CompanyName like 'R%')

--Clausula or
--Seleccionar todos los clientes de alemania o españa
Select * from Customers
where Country = 'Spain' or CompanyName = 'Germany'

-- Seleccionar todos los clientes de Berlin o Noruega o que Comience su nombre en G

Select * from Customers
where City='Berlin' or Country='Norway' or CompanyName like 'G%'

--Seleccionar solo los clientes que no son de España

select * from Customers
where not Country = 'Spain'

--Seleccionar todos los clientes  que no tengan un precio entre 
--18 y 20 USD

select * from Products
where not (UnitPrice >= 18 and UnitPrice <= 20)

select * from Products
where  UnitPrice not between 18 and 20

--Seleccionar todos los clientes que no son de paris o de londres

select CompanyName,City from Customers
where not (City = 'Paris' or City= 'London')

select * from Customers
where City in ('paris', 'london')

--Seleccionar todos los productos que no tienen precios mayores a 30

select * from Products
where not UnitPrice > 30

--Seleccionar todos los productos que no tienen precios menores a 30

select * from Products
where not UnitPrice < 30

--Instruccion Like
--Seleccionar todos los clientes que comienzan con la letra "a"

Select * from Customers
where CompanyName like 'A%'

--Seleccionar todos los clientes que finalizan con la palabra "es"
Select * from Customers
where CompanyName like '%Es'

--Seleccionar todos los clientes que contengan la palabra "mer"
 Select * from Customers
where CompanyName like '%mer%'

--seleccionar todos los clientes con una ciudad que comience con 
--cualquier caracter seguido de la palabra ondon
Select * from Customers
where City like '_ondon'


--Seleccionar todos 
select * from Customers
where Country in ('Germany', 'spain','uk')


--Selecciona todos los clientes que no son de alemania, españa y reino unido
select *from Customers
where Country not in ('Germany', 'spain', 'uk')

-- instruccion between
--seeccionar todos los productos con un precio entre 10 y 20 dolares

select * from Products
where UnitPrice between 10 and 20

-- Alias de columnas y alias de tablas 

--seleccionar el nombre del producto, su stock y su precio
select ProductName as 'Nombre del Producto', UnitsInStock as existencia, UnitPrice precio 
from Products

