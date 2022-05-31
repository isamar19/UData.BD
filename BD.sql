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

-- Insertamos información a la tabla Medicamentos
INSERT INTO Medicamentos VALUES ('Paracetamol', '500mg', 'Comprimido')
INSERT INTO Medicamentos VALUES ('Bisolvon', '2mg', 'Jarabe')
INSERT INTO Medicamentos VALUES ('Crema N° 4', '110g', 'Tópico')

-- Insertamos información a la tabla DatosClinicos
INSERT INTO DatosClinicos 
VALUES (
'1 comprimido de 500 mg cada 4-6 horas', 
'Alivio ó tratamiento sintomático del dolor ocasional leve o moderado, como dolor de cabeza, dental, muscular (contracturas) o de espalda (lumbalgia) y estados febriles en adultos y niños mayores de 12 años.',
'Hipersensibilidad al paracetamol o a alguno de los excipientes incluidos en la sección 6.1.',
'En alcohólicos crónicos, no se debe administrar más de 2 g/día de paracetamol repartidos en variastomas.',
1)

SELECT * FROM Medicamentos
SELECT * FROM DatosClinicos