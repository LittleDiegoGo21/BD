create database Practica2
go

use Practica2
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
check (Salario <= 400 and Salario <= 50000)
)
go

create table tbVenta (
IdVenta int not null,
fecha date,
IdCliente_fk int,
idEmpleado_fk int,
constraint pk_IdVenta
primary key (IdVenta),
constraint fk_Cliente
foreign key (IdCliente_fk)
references tbCliente (IdCliente),
constraint unico_nombre
unique (IdCliente_fk)

)
go