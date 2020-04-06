Create database Muebleria;
use Muebleria;

Create table T_Login (

ID_Login char (8),
ID_Empleado char (8),
Usuario varchar (10),
Contraseña int 
primary key (ID_Login)
); 
----------------------------------------------------------------------------------------------------
                                 --Insertar Datos--
----------------------------------------------------------------------------------------------------

insert into T_Login ( ID_Login,ID_Empleado,Usuario,Contraseña) values 
('001','02','Ramon','1634'),
('002','01','Maria','2345'),
('003','04','Carlos','4765'),
('004','03','Rosa','7435');

------------------------------------------------------------------------------------------------------
                                 --Siguiente Tabla--
-----------------------------------------------------------------------------------------------------

Create Table T_Empleado (

ID_Empleado char (8),
Nombre Varchar (10),
Apellido varchar (15),
Sexo char (5),
Telefono varchar (14),
Dirreccion varchar (25),
primary key (ID_Empleado)
);

------------------------------------------------------------------------------------------------------
                                      --Insertar Datos--
------------------------------------------------------------------------------------------------------

insert into T_Empleado(ID_Empleado,Nombre,Apellido,Sexo,Telefono,Dirreccion) values 
('02','Rmon','Gonzales','M','809-345-7664','En sanche la paz'),
('01','Maria','Alcantara','F','809-996-8872','AveIndependenciakm8'),
('04','Carlos','Montero','M','809-008-7765','El Invi km10'),
('03','Rosa','Fernandez','F','829-765-8819','KM11 Independencia');

------------------------------------------------------------------------------------------------------
                                        --Nueva Tabla--
------------------------------------------------------------------------------------------------------

Create Table T_Departamento(

ID_Departamento char (8),
ID_Empleado char (8),
Nombre_Dep varchar (15),
Encargado_Dep varchar (10),
Primary Key (ID_Departamento)
);

---------------------------------------------------------------------------------------------------------
                                        -- Insertar Datos--
---------------------------------------------------------------------------------------------------------

insert into T_Departamento (ID_Departamento,ID_Empleado,Nombre_Dep,Encargado_Dep) Values
('0002','01','Compras','Maria'),
('0003','02','Ventas','Ramon'),
('0001','04','Servicio Cli','Rosa'),
('0004','03','Almacen','Carlos');


--------------------------------------------------------------------------------------------------------
                                             --Nueva Tabla--
--------------------------------------------------------------------------------------------------------

Create Table T_Proveedor(

ID_Proveedor char (8),
ID_Empleado char (8),
Nombre_Prove varchar (20),
Fecha_Entrega date 
primary key (ID_Proveedor)
);

--------------------------------------------------------------------------------------------------------
                                             --Insertar Datos--
--------------------------------------------------------------------------------------------------------

insert into T_Proveedor (ID_Proveedor,ID_Empleado,Nombre_Prove,Fecha_Entrega) values
('014','02','OmarMuebles','03/23/2020'),
('015','02','MadeRuth','03/23/2020');

---------------------------------------------------------------------------------------------------------
                                        --Tabla Relacional- 
---------------------------------------------------------------------------------------------------------

Create Table T_Relacional(

ID_Relacional char (8),
ID_Empleado char (8),
ID_Departamento char (8),
ID_Proveedor char (8),
Primary key (ID_Relacional)
);
------------------------------------------------------------------------------------------------------------
                                          --Alteracion De Tablas--
-------------------------------------------------------------------------------------------------------------


Alter table T_Login
add constraint fk_T_Login_T_Empleado foreign key (ID_Empleado) references T_Empleado (ID_Empleado); 
------------------------------------------------------------------------------------------------------------- 

Alter table T_Departamento
add constraint fk_T_Departamento_T_Empleado foreign key (ID_Empleado) references T_Empleado (ID_Empleado); 
------------------------------------------------------------------------------------------------------------

Alter table T_Proveedor
add constraint fk_T_Proveedor_T_Empleado foreign key (ID_Empleado) references T_Empleado (ID_Empleado); 
-----------------------------------------------------------------------------------------------------------

Alter table T_Relacional
add constraint fk_T_Relacional_T_Empleado foreign key (ID_Empleado) references T_Empleado (ID_Empleado); 
----------------------------------------------------------------------------------------------------------

Alter table T_Relacional
add constraint fk_T_Relacional_T_Departamento foreign key (ID_Departamento) references T_Departamento (ID_Departamento);
------------------------------------------------------------------------------------------------------------

Alter table T_Relacional
add constraint fk_T_Relacional_T_Proveedor foreign key (ID_Proveedor) references T_Proveedor (ID_Proveedor); 

----------------------------------------------------------------------------------------------------------------------------
                                                  --Inner join--
-----------------------------------------------------------------------------------------------------------------------------
 select [Nombre],[Nombre_Dep],[Nombre_Prove],[Fecha_Entrega]
 from [dbo].[T_Departamento] inner join [dbo].[T_Empleado] 
 on [dbo].[T_Departamento].Nombre_Dep =  [dbo].[T_Empleado].Nombre inner join [dbo].[T_Proveedor]
 on [dbo].[T_Empleado].ID_Empleado =[dbo].[T_Proveedor].ID_Proveedor