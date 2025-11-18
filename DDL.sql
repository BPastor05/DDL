--crea el esquema
create schema transporte;
GO
--creacion de la tabla Bus
create table transporte.Bus(
    ID int IDENTITY(1,1) primary key,
    placa nvarchar(8) not null unique,
    modelo nvarchar(50),
    capacidad int not null
)

--Creacion de la tabla ruta
create table transporte.Ruta(
    ID int IDENTITY(1,1) primary key,
    origen nvarchar(100) not NULL,
    destino nvarchar(100) NOT NULL,
)

--creacion de la tabla conductor
create table transporte.Conductor(
    ID INT PRIMARY KEY,
    licencia INT NOT NULL,
    nombre NVARCHAR(100)
)

---Cambiar licencia a unico 
ALTER TABLE transporte.conductor
ALTER COLUMN licencia INT NOT NULL 

---Creacion de la tabla recorrido
create table transporte.recorrido(
ID INT IDENTITY(1,1) PRIMARY KEY,
ID_Bus INT not null,
ID_Ruta INT not null,
ID_Conductor INT not null,
fecha_inicio DATE not null,
fecha_fin DATE not null
)

ALTER TABLE transporte.recorrido
alter COLUMN fecha_fin DATETIME NULL

ALTER TABLE transporte.recorrido
alter COLUMN fecha_inicio DATETIME NOT NULL

---llaves foraneas de la tabla recorrido con alter table
alter table transporte.recorrido
add CONSTRAINT FK_Bus FOREIGN KEY (ID_Bus) REFERENCES transporte.Bus(ID);

alter table transporte.recorrido
add CONSTRAINT FK_Ruta FOREIGN KEY (ID_Ruta) REFERENCES transporte.Ruta(ID);

alter table transporte.recorrido
add CONSTRAINT FK_Conductor FOREIGN KEY (ID_Conductor) REFERENCES transporte.Conductor(ID);