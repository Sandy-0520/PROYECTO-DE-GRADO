DROP DATABASE PROYECTO_DENTAL_BI_AI_SOFTCON;

create database PROYECTO_DENTAL_BI_AI_SOFTCON

drop table DIM_CALENDARIO
drop table FACT_ESTADO_RESULTADOS

CREATE TABLE DIM_CODIGO_CUENTA (
    ID_Nivel4 INT PRIMARY KEY NOT NULL, 
    Nivel_Cuenta4 VARCHAR(255) NOT NULL,
	ID_Nivel3 INT NOT NULL, 
    Nivel_Cuenta3 VARCHAR(255) NOT NULL,
	ID_Nivel2 INT NOT NULL, 
    Nivel_Cuenta2 VARCHAR(255) NOT NULL,
	ID_Nivel1 INT NOT NULL, 
    Nivel_Cuenta1 VARCHAR(255) NOT NULL
    
);

CREATE TABLE DIM_TERCEROS (
  ID_Tercero INT PRIMARY KEY NOT NULL,
  Tipo_Tercero VARCHAR(50) -- (Cliente, Proveedor, etc.)
);



CREATE TABLE DIM_CALENDARIO (
    Fecha DATE NOT NULL,                       -- Fecha del calendario
    Año INT NOT NULL,                          -- Año de la fecha
    Trimestre INT NOT NULL,                    -- Trimestre de la fecha (1-4)
    Mes INT NOT NULL,                          -- Mes de la fecha (1-12)
    NombreMes VARCHAR(20) NOT NULL,           -- Nombre del mes 
    SemanaDelMes INT NOT NULL,                 -- Semana del mes 
    Dia INT NOT NULL,                          -- Día del mes 
    NombreDia VARCHAR(20) NOT NULL             -- Nombre del día 
);


--Llave primaria CALENDARIO

ALTER TABLE [DIM_CALENDARIO]
ADD CONSTRAINT PK_Fecha PRIMARY KEY ([Fecha]);



CREATE TABLE FACT_ESTADO_RESULTADOS (
    ID_Movimiento INT IDENTITY(1,1) PRIMARY KEY,
    ID_Nivel4  INT NOT NULL, -- Foreign Key de la tabla CODIGOS
    ID_Tercero INT NOT NULL, -- Foreign Key de la tabla TERCEROS
    Fecha DATE, -- Foreign Key de la tabla CALENDARIO
    Valor FLOAT
);

-- Agregar llave foráneas en [ESTADO_RESULTADOS
ALTER TABLE [FACT_ESTADO_RESULTADOS]
ADD CONSTRAINT FK_Estado_Codigo
FOREIGN KEY ([ID_Nivel4])
REFERENCES [DIM_CODIGO_CUENTA]([ID_Nivel4]);

ALTER TABLE [FACT_ESTADO_RESULTADOS]
ADD CONSTRAINT FK_Estado_Terceros
FOREIGN KEY ([ID_Tercero])
REFERENCES [DIM_TERCEROS ]([ID_Tercero]);

ALTER TABLE [FACT_ESTADO_RESULTADOS]
ADD CONSTRAINT FK_Estado_Fecha
FOREIGN KEY ([Fecha])
REFERENCES [DIM_CALENDARIO]([Fecha]);

