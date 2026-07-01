CREATE DATABASE Clinica;

CREATE TABLE Convenios(
  id int IDENTITY(1,1),
  Tipo VARCHAR(3) NOT NULL,
  valor DECIMAL(6,2)

  CONSTRAINT PK_Convenios Primary Key(id),
  CONSTRAINT CK_Convenios_Tipo CHECK(Tipo in ('ENF', 'APT'))
)

CREATE TABLE Pacientes(
  idPaciente int IDENTITY(1,1) Primary Key,
  nome VARCHAR(80),
  CPF VARCHAR (20),
  Sexo VARCHAR,
  idConvenio int

  CONSTRAINT FK_Pacientes_Convenios Foreign key(idConvenio) References Convenios(id),
  CONSTRAINT UQ_Pacientes_CPF UNIQUE(CPF),
  CONSTRAINT CK_Pacientes_Sexo CHECK(Sexo in  ('F', 'M'))
)

CREATE TABLE Especialidades(
  id int IDENTITY(1,1),
  nome VARCHAR(30) NOT NULL

  CONSTRAINT PK_Especialidade Primary Key(id),
  CONSTRAINT UQ_Especialidades_Nome UNIQUE(nome)
)

CREATE TABLE Medicos(
  CRM VARCHAR(20),
  nome VARCHAR(80),
  dataEntrada date,
  idEspecialidade int NOT NULL,
  Salario decimal(10,2)

  CONSTRAINT PK_Medicos Primary Key(CRM),
  CONSTRAINT FK_Medicos_Especilidades Foreign Key(idEspecialidade) References Especialidades(id)
)

CREATE TABLE Consultas (
  id int IDENTITY(1,1),
  Valor decimal(10,2),
  dataConsulta date NOT NULL,
  CrmMedico VARCHAR(20),
  idPaciente int

  CONSTRAINT PK_Consultas Primary Key(id),
  CONSTRAINT FK_Consultas_Medicos Foreign key(CrmMedico) References Medicos(CRM),
  CONSTRAINT FK_Consultas_Pacientes Foreign key(idPaciente) References Pacientes(idPaciente)
)

