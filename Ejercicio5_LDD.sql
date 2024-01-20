use Practica4

-- Crear una tabla que contenga un campo calculado

create table pruebaCalculado(
Id int not null identity (1,1),
nombre varchar (50),
precio decimal(10,2) not null,
existencia int not null,
importe as
(precio * existencia),
constraint pk_pruebacalculo 
primary key (Id)

)
go

select * from pruebaCalculado

insert into pruebaCalculado
values ('Chanclotas', 345, 4)
