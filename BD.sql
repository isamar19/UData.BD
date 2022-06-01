-- Creación de la base de datos si no existe
IF (NOT EXISTS (SELECT name FROM master.sys.databases WHERE ('[' + name + ']' = 'Laboratorio' OR name = 'Laboratorio')))
BEGIN
	CREATE DATABASE Laboratorio
END
GO

-- Creación de la tabla Medicamentos
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'Medicamentos')
BEGIN
  CREATE TABLE Medicamentos (
	Id INT IDENTITY PRIMARY KEY,
	Nombre VARCHAR(100),
	Composicion VARCHAR(10),
	FormaFarmaceutica VARCHAR(50)	
)
END
GO

-- Creación de la tabla DatosClinicos
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'DatosClinicos')
BEGIN
	CREATE TABLE DatosClinicos (
		Id INT IDENTITY PRIMARY KEY,
		Posologia VARCHAR(MAX),
		Indicaciones VARCHAR(MAX),
		Contraindicaciones VARCHAR(MAX),
		Precauciones VARCHAR(MAX),
		MedicamentoId INT,
	
		FOREIGN KEY (MedicamentoId) REFERENCES Medicamentos(Id)
	)
END
GO
