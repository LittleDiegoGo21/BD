Use NORTHWND

--Realizar un sp para Calcular el Total de una orden
SELECT * FROM Orders
create proc Totalorden
@total int 
as begin 
select sum (unitprice*quantity) from Orders as o
inner join [Order Details] as od on  o.OrderID = od.OrderID
where  o.OrderID = @total
end
go

exec Totalorden '10248'


--Realizar un sp para Actualizar la Cantidad de Productos en Stock
SELECT * FROM Products
create proc ProductosStock
@UnitStok smallint, @Id int
as 
begin
UpDate Products 
 set UnitsInStock = @UnitStok
 where ProductID = @Id
 end
go


--Realizar un SP para Calcular el Total de Ventas de un Empleado
SELECT * FROM Employees
create proc Emple
@totalemp int 
as begin 
select sum (unitprice*quantity) from Employees as e
inner join Orders as o on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od on  o.OrderID = od.OrderID
where  e.EmployeeID = @totalemp
end
go

exec Emple '1'


--Realizar un SP para Actualizar el Nombre de un Empleado
create proc NombreEmpleado
@Id int, @Nombre nvarchar (40)
as 
begin
UpDate Employees 
 set FirstName = @Nombre
 where EmployeeID = @Id
 end
go


--Realizar un SP para Obtener el Total de Ventas por País
SELECT * FROM Customers
create proc TotaCustomer
@country nvarchar(15)
as begin 
select sum (unitprice*quantity) as 'Total de ventas por pais' from Customers as c
inner join Orders as o on c.CustomerID = o.CustomerID
inner join [Order Details] as od on  o.OrderID = od.OrderID
where  Country = @country
end
go

exec TotaCustomer 'Germany'

--Realizar un SP para Obtener el Número de Órdenes por Cliente
SELECT * FROM Customers
create proc OrdenesCliente
@Cliente nchar(5)
as begin 
select count (quantity) as 'Numero de ordenes por cliente' from Customers as c
inner join Orders as o on c.CustomerID = o.CustomerID
inner join [Order Details] as od on o.OrderID = od.OrderID
where c.CustomerID = @Cliente
end
go
exec OrdenesCliente 'ALFKI'

--Realizar un SP para Calcular el Total de Productos Vendidos por Categoría
SELECT * FROM Categories
create proc Ventascategoria
@Categoria int
as begin 
select count (quantity) as 'Productos vendidos por categoria' from Categories as c
inner join Products as p on c.CategoryID = p.CategoryID
inner join [Order Details] as od on p.ProductID = od.ProductID
where c.CategoryID = @Categoria
end
go
exec  Ventascategoria '1'

--SP para Calcular el Total de Ventas por Año
SELECT * FROM Orders
create proc VentasAño
@fecha nchar(4) 
as begin 
select sum (unitprice*quantity) as 'Ventas por año' from Orders as o
inner join [Order Details] as od on  o.OrderID = od.OrderID
where year (o.OrderDate) = @fecha
end
go

exec  VentasAño '1996'