--crea el esquema
create schema transporte;
GO
--creacion de la tabla Bus
create table transporte.Bus(
    ID int IDENTITY(1,1) primary key,
    placa varchar(8) not null unique,
    modelo varchar(50),
    capacidad int
)

--Creacion de la tabla ruta
create table transporte.Ruta(
    ID int IDENTITY(1,1) primary key,
    origen varchar(100) not NULL,
    destino varchar(100) NOT NULL,
)

--creacion de la tabla conductor
create table transporte.Conductor(
    ID INT PRIMARY KEY,
    licencia INT NOT NULL,
    nombre VARCHAR(100)
)

--creacion de la tabla Bus_Ruta
create table transporte.Bus_Ruta(
    ID_bus int not null,
    ID_ruta int not null,
    CONSTRAINT PK_Bus_Ruta PRIMARY KEY (ID_bus, id_ruta),
    CONSTRAINT FK_Bus FOREIGN KEY (ID_bus) REFERENCES transporte.Bus(ID),
    CONSTRAINT FK_Ruta FOREIGN KEY (ID_ruta) REFERENCES transporte.Ruta(ID)
)

--creacion de la tabla Bus_Conductor
create table transporte.Bus_Conductor(
    ID_conductor int not null,
    ID_bus int not null,
    CONSTRAINT PK_Bus_Conductor PRIMARY KEY (ID_conductor, ID_bus),
    CONSTRAINT FK_Conductor FOREIGN KEY (ID_conductor) REFERENCES transporte.Conductor(ID),
    CONSTRAINT FK_Bus FOREIGN KEY (ID_Bus) REFERENCES transporte.Bus(ID)   
)

