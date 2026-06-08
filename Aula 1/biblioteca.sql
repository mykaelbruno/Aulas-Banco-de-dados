CREATE DATABASE biblioteca;

USE biblioteca; --Seleciona o BD no inicio da execução pra os comandos serem direcionados a ele

CREATE TABLE Usuarios (
	idUsuario int NOT NULL IDENTITY,
	nome VARCHAR(80) NOT NULL, -- o not null é opcional, depende da regra de negócio
	rg VARCHAR (20),
	sexo VARCHAR, --sem o valor, guarda apenas 1 caractere
	tipo VARCHAR(30),
	PRIMARY KEY(idUsuario),
	UNIQUE(rg),
	CHECK(sexo in ('F','M')),
	);

SELECT * FROM Usuarios;

CREATE TABLE Livros(
	idLivro int NOT NULL PRIMARY KEY,
	titulo VARCHAR(255) NOT NULL,
	genero VARCHAR(255) NOT NULL,
	ano VARCHAR(255) NOT NULL,
	situacao VARCHAR(255) NOT NULL,
	precoCusto float NOT NULL

);

-- esqueci de adicionar a pk na hora de criar, logo:
ALTER TABLE Livros
ADD CONSTRAINT PK_Livros
PRIMARY KEY (idLivro);

CREATE TABLE Emprestimo(
	idEmprestimo int NOT NULL,
	idUsuario int NOT NULL,
	idLivro int NOT NULL,
	dataSaida date,
	dataDevolucao date
	PRIMARY KEY (idEmprestimo),
	FOREIGN KEY (idUsuario) REFERENCES Usuarios,
	FOREIGN KEY (idLivro) REFERENCES Livros
);


INSERT INTO Usuarios(nome, rg, sexo, tipo) --Assim, ou apenas colocando na ordem da tabela. Quando coloco assim posso colocar apenas as tabelas que vou adiciona
VALUES(
	'João',
	'222',
	'M',
	'Docente'
)

INSERT INTO Usuarios(nome, rg, sexo, tipo) --Assim, ou apenas colocando na ordem da tabela. Quando coloco assim posso colocar apenas as tabelas que vou adiciona
VALUES(
	'MARIA',
	'212',
	'F',
	'Docente'
)