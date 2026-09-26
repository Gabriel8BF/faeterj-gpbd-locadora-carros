-- ==========================================================
-- TRABALHO DE GESTÃO DE BANCO DE DADOS - ETAPA 1
-- Parte 1: Estrutura do Banco e Tabelas (DDL)
-- ==========================================================

CREATE DATABASE IF NOT EXISTS locadora_carros;
USE locadora_carros;

-- 1. Criando a tabela Cliente
CREATE TABLE Cliente (
    CNH VARCHAR(100) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Cartao INT NOT NULL,
    Telefone VARCHAR(100) NOT NULL,
    PRIMARY KEY (CNH)
);

-- 2. Criando a tabela Agencia (normalizada com Rua, Cidade e Estado)
CREATE TABLE Agencia (
    NumAg INT NOT NULL,
    Rua VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Estado VARCHAR(100) NOT NULL,
    Contato VARCHAR(100) NOT NULL,
    PRIMARY KEY (NumAg)
);

-- 3. Criando a tabela Carro
CREATE TABLE Carro (
    Placa VARCHAR(100) NOT NULL,
    Modelo VARCHAR(100) NOT NULL,
    Ano INT NOT NULL,
    NumAg INT NOT NULL,
    PRIMARY KEY (Placa),
    FOREIGN KEY (NumAg) REFERENCES Agencia(NumAg)
);

-- 4. Criando a tabela Aluguel (Relação N:N entre Cliente e Carro)
CREATE TABLE Aluguel (
    Data DATE NOT NULL,
    CNH VARCHAR(100) NOT NULL,
    Placa VARCHAR(100) NOT NULL,
    PRIMARY KEY (CNH, Placa),
    FOREIGN KEY (CNH) REFERENCES Cliente(CNH),
    FOREIGN KEY (Placa) REFERENCES Carro(Placa)
);