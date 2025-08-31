-- CRIAÇÃO DO BANCO DE DADOS "SN BANK"
CREATE DATABASE sn_bank;

-- CRIAÇÃO DAS TABELAS DO "SN BANK"
CREATE TABLE tabelaclientes (
    id_cliente VARCHAR(20) NOT NULL PRIMARY KEY,
    DataNascimento DATE NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Rua VARCHAR(50) NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP CHAR(8) NOT NULL,
    funcional VARCHAR(20) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE tabelaconta (
    num_conta VARCHAR(20) PRIMARY KEY,
    TipoConta VARCHAR(50) NOT NULL,
    Saldo DECIMAL (10,2) NOT NULL,
    DataAbertura DATE
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE tabelaclienteconta (
    num_conta VARCHAR(20),
    id_cliente VARCHAR(20),
    PRIMARY KEY (num_conta, id_cliente)
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE tabeladepartamento (
    id_departamento VARCHAR(20) NOT NULL PRIMARY KEY,
    NomeDepartamento VARCHAR(50) NOT NULL CHECK (NomeDepartamento != ''),
    NumeroDepartamento VARCHAR(20) NOT NULL,
    funcional_gerente VARCHAR(20) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE tabelacolaboradores (
    funcional VARCHAR(20) NOT NULL PRIMARY KEY,
    Salario DECIMAL (10,2),
    NomeColaborador VARCHAR(50) NOT NULL,
    EmailColaborador VARCHAR(50),
    Cargo VARCHAR(50) NOT NULL,
    CPFColaborador VARCHAR(11) NOT NULL,
    TelefoneColaborador VARCHAR(11) NOT NULL,
    id_departamento VARCHAR(20) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE tabelaemprestimos (
    num_contrato VARCHAR(20) PRIMARY KEY,
    Status BOOLEAN NOT NULL,
    Prazo INTEGER NOT NULL,
    DataInicio DATE NOT NULL,
    Tipo VARCHAR(20) NOT NULL,
    Valor DECIMAL (10,2) NOT NULL,
    id_cliente VARCHAR(20) NOT NULL,
    id_colaborador VARCHAR(20) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE tabelapagamento (
    id_pagamento VARCHAR(20) PRIMARY KEY,
    DataPagamento DATE NOT NULL,
    Valor DECIMAL (10,2) NOT NULL,
    Status VARCHAR(20) NOT NULL,
    num_contrato VARCHAR(20) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE tabelascorecredito (
    id_score VARCHAR(20) NOT NULL PRIMARY KEY,
    DataConsulta DATE,
    Fonte VARCHAR(50) NOT NULL,
    Pontuacao INTEGER NOT NULL,
    Justificativa TEXT,
    id_cliente VARCHAR(20) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE tabelatelefones (
    id_telefone VARCHAR(20) PRIMARY KEY,
    Telefone VARCHAR(11) NOT NULL CHECK (Telefone >= '00000000000'),
    id_cliente VARCHAR(20) NOT NULL
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CARREGAMENTO DOS ARQUIVOS CSV DO "SN_BANK"   

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tabelaclientes.csv'
INTO TABLE tabelaclientes
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tabelaconta.csv'
INTO TABLE tabelaconta
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tabeladepartamento.csv'
INTO TABLE tabeladepartamento
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tabelacolaboradores.csv'
INTO TABLE tabelacolaboradores
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tabelaemprestimos.csv'
INTO TABLE tabelaemprestimos
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tabelapagamento.csv'
INTO TABLE tabelapagamento
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tabelascorecredito.csv'
INTO TABLE tabelascorecredito
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tabelaclienteconta.csv'
INTO TABLE tabelaclienteconta
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tabelatelefones.csv'
INTO TABLE tabelatelefones
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- ADICIONANDO AS CHAVES ESTRANGEIRAS (FOREING KEYS) ÀS COLUNAS

ALTER TABLE tabelaclienteconta
ADD FOREIGN KEY (id_cliente) REFERENCES tabelaclientes(id_cliente),
ADD FOREIGN KEY (num_conta) REFERENCES tabelaconta(num_conta);

ALTER TABLE tabelacolaboradores
ADD FOREIGN KEY (id_departamento) REFERENCES tabeladepartamento(id_departamento);

ALTER TABLE tabelaemprestimos
ADD FOREIGN KEY (id_cliente) REFERENCES tabelaclientes(id_cliente),
ADD FOREIGN KEY (id_colaborador) REFERENCES tabelacolaboradores(funcional);

ALTER TABLE tabelapagamento
ADD FOREIGN KEY (num_contrato) REFERENCES tabelaemprestimos(num_contrato);

ALTER TABLE tabelascorecredito
ADD FOREIGN KEY (id_cliente) REFERENCES tabelaclientes(id_cliente);

ALTER TABLE tabelaclientes
ADD FOREIGN KEY (funcional) REFERENCES tabelacolaboradores(funcional);

ALTER TABLE tabeladepartamento
ADD FOREIGN KEY (funcional_gerente) REFERENCES tabelacolaboradores(funcional);

ALTER TABLE tabelatelefones
ADD FOREIGN KEY (id_cliente) REFERENCES tabelaclientes(id_cliente);

-- ANALISANDO TABELAS:
-- clientes:
SELECT * FROM tabelaclientes;
-- clienteconta:
SELECT * FROM tabelaclienteconta;
-- colaboradores:
SELECT * FROM tabelacolaboradores;
-- conta:
SELECT * FROM tabelaconta;
-- departamento:
SELECT * FROM tabeladepartamento;
-- emprestimos:
SELECT * FROM tabelaemprestimos;
-- pagamento:
SELECT * FROM tabelapagamento;
-- scorecredito:
SELECT * FROM tabelascorecredito;
-- telefones:
SELECT * FROM tabelatelefones;

-- DESCRIÇÃO DOS DADOS DAS TABELAS (DESCRIBE) :
DESCRIBE tabelaclientes;
DESCRIBE tabelaclienteconta;
DESCRIBE tabelacolaboradores;
DESCRIBE tabelaconta;
DESCRIBE tabeladepartamento;
DESCRIBE tabelaemprestimos;
DESCRIBE tabelapagamento;
DESCRIBE tabelascorecredito;
DESCRIBE tabelatelefones;

-- RETORNAR VALORES ÚNICOS (DISTINCT): 
SELECT DISTINCT Status FROM tabelapagamento;
SELECT DISTINCT Estado FROM tabelaclientes;

-- SELEÇÃO DE COLUNAS ESPECÍFICAS:
SELECT nome , estado FROM tabelaclientes;
SELECT nome , cpf, bairro FROM tabelaclientes;

-- SELEÇÃO FILTRADA POR CATEGORIA DE COLUNA:
SELECT * FROM tabelaclientes WHERE estado = 'SP';
SELECT * FROM tabelaclientes WHERE bairro = 'Granja Werneck';
SELECT * FROM tabelaclientes WHERE nome = 'Milena Vieira';

-- ORDENAÇÃO POR CRESCENTE (ORDER BY .... ASC):
SELECT NomeDepartamento From tabeladepartamento ORDER BY NomeDepartamento ASC;
SELECT Nome From tabelaclientes ORDER BY Nome ASC;

-- ORDENAÇÃO POR DECRESCENTE (ORDER BY .... DESC):
SELECT NomeDepartamento From tabeladepartamento ORDER BY NomeDepartamento DESC;
SELECT Nome From tabelaclientes ORDER BY Nome DESC;
SELECT nome , cpf, bairro FROM tabelaclientes ORDER BY nome DESC;

-- LIMITANDO A VISUALIZAÇÃO (LIMIT)
SELECT * FROM tabelaclientes WHERE estado = 'SP' LIMIT 3;
SELECT nome , estado FROM tabelaclientes LIMIT 10;
SELECT * FROM tabelascorecredito LIMIT 8;
SELECT DISTINCT * FROM tabelascorecredito ORDER BY id_score DESC LIMIT 2;

-- E / OU / OU NÃO NAS CONDIÇÕES (AND, OR, NOT)
SELECT DISTINCT Cargo FROM tabelacolaboradores;

SELECT * FROM tabelacolaboradores
WHERE Salario > 2000 AND Cargo = 'Analista de Crédito';

SELECT * FROM tabelacolaboradores
WHERE Cargo = "Especialista em Risco " OR Cargo = 'Analista de Crédito';

 SELECT * FROM tabelacolaboradores
 WHERE NOT Cargo = 'Analista de Crédito';
 
 -- INSERIR VALORES À COLUNAS (INSERT)
 -- 1 Inserir um novo colaborador na tabela tabelacolaboradores
SELECT DISTINCT NomeDepartamento FROM tabeladepartamento;
SELECT * FROM tabeladepartamento WHERE NomeDepartamento = 'Tecnologia da Informação';
INSERT INTO tabelacolaboradores (funcional,salario,NomeColaborador,EmailColaborador,Cargo,CPFColaborador,TelefoneColaborador,id_departamento)
VALUES ("F0102", 6000 ,'João da Silva', 'joao.silva@sn.com', 'Desenvolvedor de Software', '12548965412','11987654321','D003');
SELECT * FROM tabelacolaboradores WHERE funcional = "F0102";

-- 2 Inserir um novo cliente
INSERT INTO tabelaclientes (id_cliente,DataNascimento,CPF,Nome,Email,Rua,Bairro,Cidade,Estado,CEP,funcional)
VALUES ('C90002', '1990-07-17' ,'39847215866', 'Laura Mendes', 'lauramendes@gmail.com', 'Rua: Rua das Palmeiras','JD. das Flores','Salvador','BA','40301000','F0031');
SELECT * FROM tabelaclientes WHERE id_cliente = "C90002";

-- 3 Inserir um novo empréstimo para um cliente existente
INSERT INTO tabelaemprestimos(num_contrato,Status,Prazo,DataInicio,Tipo,Valor,id_cliente,id_colaborador)
VALUES ('E99912345', 1,24,'2025-07-01', 'Consignado',1200,'C17744','F0091');
SELECT * FROM tabelaemprestimos WHERE num_contrato = "E99912345";
SELECT * FROM tabelaclientes WHERE id_cliente = "C17744";

-- ATUALIZAR INFORMAÇÕES DE UMA TABELA (UPDATE)
SELECT * FROM tabelapagamento WHERE num_contrato = "E18503592";
UPDATE tabelapagamento
SET Status = "Pago"
WHERE num_contrato = "E18503592";
SELECT * FROM tabelapagamento WHERE num_contrato = "E18503592";

-- DELETAR LINHA DE TABELA (DELETE)
Delete From tabelaclientes
Where id_cliente = 'C90001';

-- CONTAGEM DE COLUNA:
-- Todos os valores:
Select Count(*) As total_clientes FROM tabelaclientes;

-- Todos os valores DIFERENTES
SELECT COUNT(DISTINCT id_cliente) AS total_clientes_distintos
FROM tabelaclienteconta;

-- SOMA de uma coluna (SUM):
Select Sum(Salario) From tabelacolaboradores;

-- MAIOR VALOR de uma coluna (MAX):
Select Max(Salario) From tabelacolaboradores;

-- MENOR VALOR de uma coluna (MAX):
Select Min(Salario) From tabelacolaboradores;

-- MÉDIA do valor de uma coluna (AVG):
Select AVG(Salario) From tabelacolaboradores;
Select AVG(Saldo) From tabelaconta;


 


 
 










