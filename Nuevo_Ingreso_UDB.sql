create database Nuevo_Ingreso_UDB;
go

use Nuevo_Ingreso_UDB;
go



create table Paises(
	Id_Pais int identity(1,1) primary key not null,
	Nombre_Pais varchar(max) not null
);
go


create table Departamentos(
	Id_Departamento int identity(1,1) primary key not null,
	Nombre_Departamento varchar(max) not null
);
go


create table Municipios(
	Id_Municipio int identity(1,1) primary key not null,
	Nombre_Municipio varchar(max) not null
);
go


create table Campus(
	Id_Campus int identity(1,1) primary key not null,
	Nombre_Campus varchar(max) not null
);
go


create table Carreras(
	Id_Carrera int identity(1,1) primary key not null,
	Nombre_Carrera varchar(max) not null
);
go


create table Datos_Padre(
	Id_Padre int identity(1,1) primary key not null,
	Primer_NombrePadre Varchar(max) not null,
	Segundo_NombrePadre Varchar(max) null,
	Primer_ApellidoPadre Varchar(max) not null,	
	Segundo_ApellidoPadre Varchar(max) null,
	DUI_Padre Varchar(10) not null,
	Correo_Padre Varchar(Max) not null,
	Telefono_Padre Varchar(9) not null,
	Domicilio_Padre Varchar(MAX) not null
);
go


create table Discapacidades(
	Id_Discapacidad int identity(1,1) primary key not null,
	Descripcion_Discapacidad Varchar(MAX) not null
);
go



create table Estudiante(
	Carnet_Estudiane varchar(8) primary key not null,
	Primer_Nombre Varchar(max) not null,
	Segundo_Nombre Varchar(max) null,
	Primer_Apellido Varchar(max) not null,
	Segundo_Apellido Varchar(max) null,
	DUI_Estudiante Varchar(10) not null,
	NIT_Estudiante Varchar(17) not null,
	Pasaporte_Estudiante Varchar(40) null,
	Correo_Estudiante Varchar(Max) not null,
	Telefono_Estudiante Varchar(9) not null,
	foto VARBINARY(MAX) not null,
	Titulo_Bachiller Varchar(MAX) not null,
	Institucion_Bachillerato Varchar(MAX) not null,
	Domicilio_Estudiante Varchar(MAX) not null,
	Tipo_Carrera Varchar(50) not null,
	Id_Padre int FOREIGN KEY REFERENCES Datos_Padre (Id_Padre) not null,
	Id_Pais int FOREIGN KEY REFERENCES Paises (Id_Pais) not null,
	Id_Departamento int FOREIGN KEY REFERENCES Departamentos (Id_Departamento) not null,
	Id_Municipio int FOREIGN KEY REFERENCES Municipios (Id_Municipio) not null,
	Id_Campus int FOREIGN KEY REFERENCES Campus (Id_Campus) not null,
	Id_Carrera int FOREIGN KEY REFERENCES Carreras (Id_Carrera) not null
);
go


create table Discapacidades_Estudiante(
	Carnet_Estudiane varchar(8) FOREIGN KEY REFERENCES Estudiante (Carnet_Estudiane) not null,
	Id_Discapacidad int FOREIGN KEY REFERENCES Discapacidades (Id_Discapacidad) null,
	Posee_Discapacidad varchar(2) not null,
	Otra_Discapacidad varchar(max) null
);
go



create table Datos_Socioeconomicos(
	Id_DatoSE int identity(1,1) primary key not null,
	Numero_Personas int not null,
	Constancia_Sueldo VARBINARY(MAX) not null,
	Comprobante_Alquiler VARBINARY(MAX) null,
	Comprobantes_Mensuales VARBINARY(MAX) not null,
	Carnet_Estudiane varchar(8) FOREIGN KEY REFERENCES Estudiante (Carnet_Estudiane) not null
);
go


create table Pagos(
	Id_Pago int identity(1,1) primary key not null,
	Descripcion_pago varchar(max) not null,
	Monto_pago decimal(6,2) not null,
	Fecha_Pago datetime not null,
	Forma_Pago Varchar(max) not null,
	Carnet_Estudiane varchar(8) FOREIGN KEY REFERENCES Estudiante (Carnet_Estudiane) not null
);
go