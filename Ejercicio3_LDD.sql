create database Practica3
go

use Practica3
go

create table tbCliente (
IdCliente int not null,
Nombre varchar(100),
Direccion varchar(100),
Telefono varchar(20),
constraint pk_tbCliente
primary key (IdCliente),
constraint unique_nombre
unique (Nombre)
)
go

create table tbEmpleado(
IdEmpleado int not null,
Nombre varchar(50),
Apellidos varchar(80),
Sexo char(1),
Salario decimal(10,2),
constraint pk_tbEmpleado
primary key (IdEmpleado),
constraint chk_Salario
check (Salario >= 400 and Salario <= 50000)
)
go

create table tbProducto (
IdProducto int not null,
Descripcion varchar (100),
Existencia int not null,
PrecioUnitario decimal (10,2),
constraint pk_IdProducto
Primary key (IdProducto),
constraint unico_descripcion
unique (Descripcion)

)
go

create table tbVenta (
IdVenta int not null,
fecha date not null,
IdCliente_fk int not null,
idEmpleado_fk int not null,
constraint pk_IdVenta
primary key (IdVenta),
constraint fk_Cliente
foreign key (IdCliente_fk)
references tbCliente (IdCliente),
constraint fk_Empleado
foreign key (idEmpleado_fk)
references tbEmpleado (IdEmpleado)
)
go

create table tbDetalleVenta (
IdVenta_fk int not null,
IdProducto_fk int not null,
Cantidad int not null,
Precio decimal(10,2),
constraint pk_DetalleVenta
primary key (IdVenta_fk, IdProducto_fk),
constraint fk_IdVenta
foreign key (IdVenta_fk)
references tbVenta (IdVenta),
foreign key (IdProducto_fk)
references tbProducto (IdProducto)

) 
go

