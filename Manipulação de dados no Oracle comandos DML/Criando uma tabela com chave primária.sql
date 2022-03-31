CREATE TABLE PRODUTOS
(CODIGO VARCHAR(10) NOT NULL,
DESCRITOR VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMANHO VARCHAR(50) NULL,
EMBALAGEM VARCHAR(5) NULL,
PRECO_LISTA FLOAT NULL,
PRIMARY KEY (CODIGO));

CREATE TABLE VENDEDORES
(MATRICULA VARCHAR(5) NOT NULL,
NOME VARCHAR(100) NULL,
BAIRRO VARCHAR(50) NULL,
COMISSAO FLOAT NULL,
DATA_ADIMISSAO DATE NULL,
FERIAS INTEGER NULL,
PRIMARY KEY (MATRICULA));

ALTER TABLE VENDEDORES RENAME COLUMN DATA_ADIMISSAO
TO DATA_ADMISSAO;

CREATE TABLE CLIENTE
(CPF VARCHAR(11) NOT NULL,
NOME VARCHAR(100) NULL,
ENDERECO VARCHAR(150) NULL,
BAIRRO VARCHAR(50) NULL,
CIDADE VARCHAR(50) NULL,
ESTADO VARCHAR(50) NULL,
CEP VARCHAR(8) NULL ,
DATA_NASCIMENTO DATE NULL,
IDADE INTEGER NULL,
SEXO VARCHAR(1) NULL,
LIMITE_CREDITO FLOAT NULL,
VOLUME_COMPRA FLOAT NULL,
PRIMEIRA_COMPRA NUMBER(1) NULL,
PRIMARY KEY (CPF));