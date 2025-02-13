DROP DATABASE PROYECTO_DENTAL_BI_AI;


create database PROYECTO_DENTAL_BI_AI;

CREATE TABLE DIM_PACIENTES (
    ID_Paciente INT PRIMARY KEY,           -- Identificador único para cada paciente
    Tipo_Documento VARCHAR(50),   -- Tipo de documento (CC, TI, Pasaporte, etc.)
    Fecha_Nacimiento DATE,           -- Año de nacimiento del paciente
    Sexo VARCHAR(50),                 -- Sexo del paciente (M/F)
    Estado_Civil VARCHAR(100),              -- Estado civil del paciente (Soltero, Casado, etc.)
    Ocupacion VARCHAR(255),                -- Ocupación del paciente
    Barrio VARCHAR(255),                   -- Barrio de residencia del paciente
	Zona VARCHAR(255),                   -- Barrio de residencia del paciente
    Escolaridad VARCHAR(255),              -- Nivel de escolaridad del paciente
    Fecha DATE NOT NULL,  -- Fecha de creación del registro
    Temporal VARCHAR(2)                -- Indica si el paciente es temporal 
);

CREATE TABLE DIM_DOCTORES (
    ID_Doctor INT PRIMARY KEY,         -- Identificador único para cada doctor
    Especialidad VARCHAR(255) NOT NULL -- Especialidad del doctor 
);


CREATE TABLE DIM_SUCURSAL (
    ID_Sucursal INT PRIMARY KEY,         -- Identificador único para cada sucursal
    Sucursal VARCHAR(255) NOT NULL       -- Nombre o descripción de la sucursal
);

CREATE TABLE DIM_TRATAMIENTOS (
    ID_Tratamiento INT PRIMARY KEY,    -- Identificador único para cada tratamiento
    Tratamiento VARCHAR(255) NOT NULL, -- Nombre del tratamiento
    Valor FLOAT NOT NULL,              -- Costo o valor del tratamiento como tipo FLOAT
    Categoria VARCHAR(255) NOT NULL     -- Nombre o descripción de la categoría
);

CREATE TABLE FACT_CITAS (
    ID_Cita INT IDENTITY(1,1) PRIMARY KEY,           -- Identificador único para cada cita
    Fecha DATE NOT NULL,               -- Fecha de la cita
    Hora TIME NOT NULL,                -- Hora de la cita
    Tipo_Documento VARCHAR(20) NOT NULL, -- Tipo de documento del paciente
	EPS VARCHAR(255),                   -- Nombre de la EPS del paciente
    ID_Paciente INT NOT NULL,          -- Identificador del paciente (FK de la tabla PACIENTES)
    ID_Doctor INT NOT NULL,            -- Identificador del doctor (FK de la tabla DOCTORES)
    ID_Sucursal INT NOT NULL,          -- Identificador de la sucursal (FK de la tabla SUCURSAL)
    Asistencia  VARCHAR(10),              -- Indicador de asistencia 
	Estado_Cita VARCHAR(50), 
	Factura VARCHAR(50), 
    Valor_Pago FLOAT,                  -- Valor o costo de la cita
    Forma_Pago VARCHAR(50),            -- Forma de pago (efectivo, tarjeta, etc.)
    Fac_Anulada VARCHAR(2),          -- Indicador de si la factura fue anulada
	Duracion_min INT
);

CREATE TABLE FACT_VENTAS (
    ID_Venta INT PRIMARY KEY IDENTITY(1,1),  -- ID_Venta como clave primaria autoincremental
	Tipo_Factura VARCHAR(20) NOT NULL,
	Num_Factura INT NOT NULL,
    Fecha DATE NOT NULL,                  -- Fecha de la venta
    ID_Tratamiento INT NOT NULL,              -- ID del tratamiento
    ID_Paciente INT NOT NULL,                 -- ID del paciente
    ID_Doctor INT NOT NULL,                   -- ID del doctor
    ID_Sucursal INT NOT NULL,                 -- ID de la sucursal
    Valor_Pago_Paciente FLOAT NOT NULL,      -- Valor pagado por el paciente (tipo FLOAT)
	Forma_Pago VARCHAR(50),            -- Forma de pago (efectivo, tarjeta, etc.)
    Anulado VARCHAR(2),          -- Indica si la venta está anulada (0 = No, 1 = Sí)
    Motivo_Anulacion VARCHAR(255)       -- Motivo de anulación (puede ser NULL si no está anulado)
);

CREATE TABLE DIM_CALENDARIO (
    Fecha DATE NOT NULL,                       -- Fecha del calendario
    Año INT NOT NULL,                          -- Año de la fecha
    Trimestre INT NOT NULL,                    -- Trimestre de la fecha (1-4)
    Mes INT NOT NULL,                          -- Mes de la fecha (1-12)
    NombreMes VARCHAR(20) NOT NULL,           -- Nombre del mes 
    SemanaDelMes INT NOT NULL,                 -- Semana del mes 
    Dia INT NOT NULL,                          -- Día del mes 
    NombreDia VARCHAR(20) NOT NULL,             -- Nombre del día 
	Día_de_la_semana INT NOT NULL
);



--Llave primaria CALENDARIO

ALTER TABLE [DIM_CALENDARIO]
ADD CONSTRAINT PK_Fecha PRIMARY KEY ([Fecha]);



-- Agregar llave foráneas en [FACT_CITAS]
ALTER TABLE [FACT_CITAS]
ADD CONSTRAINT FK_Cita_Paciente
FOREIGN KEY ([ID_Paciente])
REFERENCES [DIM_PACIENTES]([ID_Paciente]);

ALTER TABLE [FACT_CITAS]
ADD CONSTRAINT FK_Cita_Doctor
FOREIGN KEY ([ID_Doctor])
REFERENCES [DIM_DOCTORES]([ID_Doctor]);

ALTER TABLE [FACT_CITAS]
ADD CONSTRAINT FK_Cita_Fecha
FOREIGN KEY ([Fecha])
REFERENCES [DIM_CALENDARIO]([Fecha]);

ALTER TABLE [FACT_CITAS]
ADD CONSTRAINT FK_Cita_Sucursal
FOREIGN KEY ([ID_Sucursal])
REFERENCES [DIM_SUCURSAL]([ID_Sucursal]);

-- Agregar llave foráneas en [FACT_Ventas]
ALTER TABLE [FACT_VENTAS]
ADD CONSTRAINT FK_Venta_Paciente
FOREIGN KEY ([ID_Paciente])
REFERENCES [DIM_PACIENTES]([ID_Paciente]);

ALTER TABLE [FACT_VENTAS]
ADD CONSTRAINT FK_Venta_Doctor
FOREIGN KEY ([ID_Doctor])
REFERENCES [DIM_DOCTORES]([ID_Doctor]);


ALTER TABLE [FACT_VENTAS]
ADD CONSTRAINT FK_Venta_Tratamiento
FOREIGN KEY ([ID_Tratamiento])
REFERENCES [DIM_TRATAMIENTOS]([ID_Tratamiento]);

ALTER TABLE [FACT_VENTAS]
ADD CONSTRAINT FK_Venta_Sucursal
FOREIGN KEY ([ID_Sucursal])
REFERENCES [DIM_SUCURSAL]([ID_Sucursal]);

ALTER TABLE [FACT_VENTAS]
ADD CONSTRAINT FK_Venta_Fecha
FOREIGN KEY ([Fecha])
REFERENCES [DIM_CALENDARIO]([Fecha]);

