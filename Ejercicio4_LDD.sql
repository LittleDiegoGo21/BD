create database Practica4
go

use Practica4
go

create table tbCategoria(
IdCategoria int not null,
NumeroInventario int not null,
descripcion varchar(100) not null,
constraint Pk_tbCategoria
primary key (IdCategoria,NumeroInventario),
)
go


create table tbProducto (
IdProducto int not null,
descripcion varchar (100) not null,
cantidad int not null,
Precio decimal (10, 2) not null,
IdCategoria int not null,
NumeroInventario int not null,
constraint pk_tbProducto
primary key (IdProducto),
constraint fk_tbCategoria
foreign key (IdCategoria,NumeroInventario)
references tbCategoria (IdCategoria,NumeroInventario),
)
go
