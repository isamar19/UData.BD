-- Creaci�n de la base de datos
CREATE DATABASE Laboratorio
GO

-- Creaci�n de la tabla Medicamentos
CREATE TABLE Medicamentos (
	Id INT IDENTITY PRIMARY KEY,
	Nombre VARCHAR(100),
	Composicion VARCHAR(10),
	FormaFarmaceutica VARCHAR(50)	
)
GO

-- Creaci�n de la tabla DatosClinicos
CREATE TABLE DatosClinicos (
	Id INT IDENTITY PRIMARY KEY,
	Posologia VARCHAR(MAX),
	Indicaciones VARCHAR(MAX),
	Contraindicaciones VARCHAR(MAX),
	Precauciones VARCHAR(MAX),
	MedicamentoId INT,
	
	FOREIGN KEY (MedicamentoId) REFERENCES Medicamentos(Id)
)
GO

-- Insertamos informaci�n a la tabla Medicamentos
INSERT INTO Medicamentos VALUES ('Paracetamol', '500mg', 'Comprimido')
INSERT INTO Medicamentos VALUES ('Bisolvon', '2mg', 'Jarabe')
INSERT INTO Medicamentos VALUES ('Crema N� 4', '110g', 'T�pico')

-- Insertamos informaci�n a la tabla DatosClinicos
INSERT INTO DatosClinicos 
VALUES (
'1 comprimido de 500 mg cada 4-6 horas', 
'Alivio � tratamiento sintom�tico del dolor ocasional leve o moderado, como dolor de cabeza, dental, muscular (contracturas) o de espalda (lumbalgia) y estados febriles en adultos y ni�os mayores de 12 a�os.',
'Hipersensibilidad al paracetamol o a alguno de los excipientes incluidos en la secci�n 6.1.',
'En alcoh�licos cr�nicos, no se debe administrar m�s de 2 g/d�a de paracetamol repartidos en variastomas.',
1)

SELECT * FROM Medicamentos
SELECT * FROM DatosClinicos