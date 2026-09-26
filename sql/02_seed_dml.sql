-- ==========================================================
-- TRABALHO DE GESTÃO DE BANCO DE DADOS - ETAPA 1
-- Parte 2: Inserção de Dados Iniciais (DML)
-- ==========================================================

USE locadora_carros;

-- 1. Adicionando dados na tabela Cliente
INSERT INTO Cliente (CNH, Nome, Cartao, Telefone)
VALUES ('111111', 'André', 123456, '99999-9999');

INSERT INTO Cliente (CNH, Nome, Cartao, Telefone)
VALUES ('222222', 'Bruna', 654321, '88888-8888');

INSERT INTO Cliente (CNH, Nome, Cartao, Telefone)
VALUES ('333333', 'Caio', 321654, '77777-7777');

-- 2. Adicionando dados na tabela Agencia
INSERT INTO Agencia (NumAg, Rua, Cidade, Estado, Contato)
VALUES (1, 'Dias Coelho', 'Rio de Janeiro', 'RJ', '2222-2222');

INSERT INTO Agencia (NumAg, Rua, Cidade, Estado, Contato)
VALUES (2, 'Alfredo Bittencourt', 'São Paulo', 'SP', '3333-3333');

-- 3. Adicionando dados na tabela Carro
INSERT INTO Carro (Placa, Modelo, Ano, NumAg)
VALUES ('ABC-123', 'Honda Civic', 2019, 1);

INSERT INTO Carro (Placa, Modelo, Ano, NumAg)
VALUES ('DDE-890', 'Chevrolet Onix', 2021, 1);

INSERT INTO Carro (Placa, Modelo, Ano, NumAg)
VALUES ('FGI-314', 'Fiat Cronos', 2020, 2);

-- 4. Adicionando dados na tabela Aluguel
INSERT INTO Aluguel (Data, CNH, Placa)
VALUES ('2023-01-10', '111111', 'DDE-890');

INSERT INTO Aluguel (Data, CNH, Placa)
VALUES ('2023-01-11', '222222', 'FGI-314');

INSERT INTO Aluguel (Data, CNH, Placa)
VALUES ('2023-01-11', '333333', 'ABC-123');