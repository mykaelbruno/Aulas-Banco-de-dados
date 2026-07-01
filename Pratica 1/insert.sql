-- =========================
-- INSERTS Convenios
-- =========================
INSERT INTO Convenios (Tipo, valor) VALUES
('ENF', 120.00),
('APT', 250.00),
('ENF', 135.50),
('APT', 300.00),
('ENF', 110.00),
('APT', 275.75),
('ENF', 140.00),
('APT', 320.00),
('ENF', 125.25),
('APT', 290.00);


-- =========================
-- INSERTS Pacientes
-- =========================
INSERT INTO Pacientes (nome, CPF, Sexo, idConvenio) VALUES
('Ana Clara Souza', '111.111.111-11', 'F', 1),
('Bruno Henrique Lima', '222.222.222-22', 'M', 2),
('Carla Mendes Rocha', '333.333.333-33', 'F', 3),
('Daniel Oliveira Costa', '444.444.444-44', 'M', 4),
('Eduarda Martins Alves', '555.555.555-55', 'F', 5),
('Felipe Santos Pereira', '666.666.666-66', 'M', 6),
('Gabriela Nunes Dias', '777.777.777-77', 'F', 7),
('Henrique Castro Ramos', '888.888.888-88', 'M', 8),
('Isabela Ferreira Gomes', '999.999.999-99', 'F', 9),
('Joao Pedro Barbosa', '000.000.000-00', 'M', 10);

-- =========================
-- INSERTS Especialidades
-- =========================
INSERT INTO Especialidades (nome) VALUES
('Cardiologia'),
('Dermatologia'),
('Pediatria'),
('Ortopedia'),
('Neurologia'),
('Ginecologia'),
('Oftalmologia'),
('Psiquiatria'),
('Endocrinologia'),
('Urologia');


-- =========================
-- INSERTS Medicos
-- =========================
INSERT INTO Medicos (CRM, nome, dataEntrada, idEspecialidade, Salario) VALUES
('CRM001', 'Marcos Vinicius Andrade', '2018-03-15', 1, 12500.00),
('CRM002', 'Patricia Almeida Torres', '2019-07-22', 2, 11800.00),
('CRM003', 'Ricardo Gomes Batista', '2020-01-10', 3, 10500.00),
('CRM004', 'Fernanda Lopes Martins', '2017-11-05', 4, 13200.00),
('CRM005', 'Lucas Moreira Teixeira', '2021-04-18', 5, 14000.00),
('CRM006', 'Juliana Ribeiro Castro', '2016-09-30', 6, 12750.00),
('CRM007', 'Rafael Cardoso Lima', '2022-02-12', 7, 11000.00),
('CRM008', 'Camila Duarte Rocha', '2015-06-25', 8, 15000.00),
('CRM009', 'Thiago Barbosa Melo', '2023-08-01', 9, 12200.00),
('CRM010', 'Larissa Fernandes Dias', '2019-12-14', 10, 11950.00);


-- =========================
-- INSERTS Consultas
-- =========================
INSERT INTO Consultas (Valor, dataConsulta, CrmMedico, idPaciente) VALUES
(250.00, '2024-01-10', 'CRM001', 1),
(180.00, '2024-01-15', 'CRM002', 2),
(200.00, '2024-02-05', 'CRM003', 3),
(300.00, '2024-02-20', 'CRM004', 4),
(350.00, '2024-03-12', 'CRM005', 5),
(280.00, '2024-03-25', 'CRM006', 6),
(220.00, '2024-04-08', 'CRM007', 7),
(400.00, '2024-04-18', 'CRM008', 8),
(260.00, '2024-05-03', 'CRM009', 9),
(310.00, '2024-05-21', 'CRM010', 10);