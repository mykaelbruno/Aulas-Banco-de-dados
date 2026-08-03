-- CREATE DATABASE Clinica;

CREATE TABLE Convenio(
	Codigo int NOT NULL,
	Nome VARCHAR(25) NOT NULL,

	CONSTRAINT PK_Convenio PRIMARY KEY (Codigo)
);

CREATE TABLE Paciente(
	CPF VARCHAR(15) NOT NULL,
	Nome VARCHAR (80) NOT NULL,
	Sexo VARCHAR NOT NULL,
	CONSTRAINT CK_Paciente_Sexo
		CHECK (Sexo IN('M', 'F')),
	DataNascimento DATE NOT NULL, 
	Telefone VARCHAR(15),
	CodigoConvenio int NOT NULL,

	CONSTRAINT PK_Paciente PRIMARY KEY (CPF),
	CONSTRAINT FK_Paciente_Convenio
		FOREIGN KEY (CodigoConvenio)	
		REFERENCES Convenio(Codigo)

	--CONSTRAINT NomeDaRestricao
		--FOREIGN KEY (coluna_da_tabela_atual)
		--REFERENCES TabelaReferenciada(coluna_referenciada)
);

CREATE TABLE Especialidade(
	Codigo int NOT NULL,
	Nome VARCHAR(25) NOT NULL ,
	
	CONSTRAINT UQ_Especialidade_Nome
		UNIQUE(Nome),
	CONSTRAINT PK_Especialidade PRIMARY KEY (Codigo)
);

CREATE TABLE Medico(
	CRM VARCHAR(15) NOT NULL,
	Nome VARCHAR(80) NOT NULL,
	Salario Numeric(8,2) NOT NULL,
	CodEspecialidade int NOT NULL,

	CONSTRAINT CK_Medico_Salario
		CHECK (Salario > 0),
	CONSTRAINT PK_Medico PRIMARY KEY (CRM),
	CONSTRAINT FK_Medico_Especialidade
		FOREIGN KEY (CodEspecialidade)
		References Especialidade(Codigo)
);


CREATE TABLE Consulta(
	Codigo VARCHAR(15) NOT NULL,
	DataConsulta DATE NOT NULL,
	Hora TIME NOT NULL,
	CPF_Paciente VARCHAR(15) NOT NULL,
	CRM_Medico VARCHAR(15) NOT NULL,

	CONSTRAINT PK_Consulta 
		PRIMARY KEY (Codigo),
	CONSTRAINT FK_Consulta_Medico
		FOREIGN KEY (CRM_Medico)
		REFERENCES Medico(CRM),
	CONSTRAINT FK_Consulta_Paciente
		FOREIGN KEY (CPF_PACIENTE)
		REFERENCES Paciente(CPF)
);

Select * FROM Paciente

SELECT * FROM Medico

ALTER TABLE Medico
ADD Turno VARCHAR(10) NOT NULL DEFAULT 'Manha';

UPDATE Medico
SET Salario = Salario * 2
WHERE Turno = 'Manha'