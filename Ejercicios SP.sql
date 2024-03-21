--Crear un SP que permitre insertar registro en la tabla customers
Create proc Prod1
@CustomerID nchar (5),
@ComapnyName nvarchar (40),
@ContactName nvarchar(30), 
@ContacTitle nvarchar(30),
@Addres nvarchar(60),
@City nvarchar (15), 
@Region nvarchar (15), 
@PostalCode nvarchar (10), 
@Country nvarchar (15),
@Phone nvarchar (24), 
@Fax nvarchar (24)
as 
begin 
Insert Into Customers (CustomerID,CompanyName,ContactName,ContactTitle,[Address],City,Region,PostalCode,Country,Phone,Fax)
values (@CustomerID,@ComapnyName,@ContactName,@ContacTitle,@Addres,@City, @Region, @PostalCode, @Country,@Phone , @Fax )
end
go
select * from Customers
exec Prod1 @CustomerID = 'UTTTT',@ComapnyName = 'UTTT',@ContactName = 'UTTT',@ContacTitle = 'UTTT',@Addres='UTTT',@City='UTTTT', 
@Region='UT', @PostalCode='42806', @Country='UTTTT',@Phone='111111111', @Fax='111-111-111'


--Crear un SP que permite eliminar registro en la tabla customers, por CustormeID
Create proc Prod2
@CustomerID nchar (5)
as
begin
Delete from  Customers
Where CustomerID = @CustomerID
end 
go

exec Prod2 @CustomerID = 'UTTTT'

select * from Customers

--Crear un sp que permite eliminar un producto de una orden dada
Create proc Prod3
@OrderID int,
@ProductID int
as
begin
Delete from [Order Details]
Where OrderID = @OrderID and ProductID = @ProductID

select * from [Order Details]

exec Prod3  @OrderID = '10248',  @ProductID = '11'




--Crear un sp que permita eliminar un producto de una orden, y modificar el stock (unitstock del producto)
create proc Prod4
@OrderID int,
@ProductID int
as 
begin 
declare @Quantity int 
select @Quantity = Quantity from [Order Details]
where OrderID = @OrderID and ProductID = @ProductID
--Update
Update Products
	set UnitsInStock = UnitsInStock - @Quantity
	where ProductID = @ProductID
--Delete
Delete from [Order Details]
where OrderID = @OrderID and ProductID = @ProductID
end
go

exec Prod4 @OrderID = '10249', @ProductID = '14'