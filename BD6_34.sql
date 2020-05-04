create database BD6_34;
USE BD6_34;

CREATE TABLE CLIENTES(
 CODIGO INT auto_increment NOT NULL,
 NOME VARCHAR(60) NOT NULL,
 ENDERECO VARCHAR(45) NOT NULL,
 CIDADE VARCHAR(45) NOT NULL,
 ESTADO CHAR(2) NOT NULL,
 TELEFONE CHAR(15) NOT NULL,
 PRIMARY KEY(CODIGO)
 );
 
 INSERT INTO CLIENTES (CODIGO, NOME, ENDERECO, CIDADE, ESTADO, TELEFONE)
VALUES(NULL,'NOME1','ENDERECO1','CIDADE1','MG','(31) 98807-6447');
 
CREATE TABLE VENDAS(
CODIGO INT auto_increment NOT NULL,
DESCRICAO VARCHAR(60) NOT NULL,
DATA DATE NOT NULL,
TOTAL DOUBLE(9,2) NOT NULL,
OBSERVACAO VARCHAR(80) NOT NULL,
CLIENTE_CODIGO INT NOT NULL,
foreign key(CLIENTE_CODIGO) references CLIENTE(CODIGO),
FUNCIONARIOS_CPF INT NOT NULL,
foreign key (FUNCIONARIOS_CPF) references FUNCIONARIOS(CPF),
primary key(CODIGO)
);

INSERT into VENDAS(CODIGO,DESCRICAO,DATA,TOTAL,OBSERVACAO,CLIENTE_CODIGO,FUNCIONARIOS_CPF)
values(null,'descricao1','20191222',1,'observacao1','1','2');

CREATE TABLE FUNCIONARIOS(
CPF CHAR(14) NOT NULL,
NOME VARCHAR(80) NOT NULL,
ENDERECO VARCHAR(45) NOT NULL,
CIDADE varchar(45) NOT NULL,
ESTADO CHAR(2) NOT NULL,
TELEFONE CHAR(15) NOT NULL,
DAT_NASCIMENTO DATE NOT NULL,
EMAIL VARCHAR(60) NOT NULL,
LOGIN VARCHAR(15) NOT NULL,
SENHA CHAR(6) NOT NULL,
CONFIRMASENHA CHAR(6) NOT NULL,
primary key(CPF)
);

SELECT * FROM FUNCIONARIOS;

INSERT INTO FUNCIONARIOS(CPF,NOME,ENDERECO,CIDADE,ESTADO,TELEFONE,DAT_NASCIMENTO,EMAIL,LOGIN,SENHA,CONFIRMASENHA)
values('017.397.267-72','NOME1', 'ENDERECO1','CIDADE1','RJ', '(31) 98807-6447',20191221,'EMAIL1','LOGIN1',123456,654321);

CREATE TABLE ITENS_VENDAS(
CODIGO INT auto_increment  NOT NULL,
VALOR_UNITARIO DOUBLE(9,2) NOT NULL,
QUANTIDADE INT NOT NULL,
TOTAL DOUBLE(9,2) NOT NULL,
VENDAS_COIGO INT NOT NULL,
FOREIGN KEY(VENDAS_COIGO) REFERENCES VENDAS(CODIGO),
PRODUTOS_CODIGO INT NOT NULL,
FOREIGN KEY(PRODUTOS_CODIGO) REFERENCES PRUDUTOS(CODIGO),
PRIMARY KEY(CODIGO)
);

CREATE TABLE PRODUTOS(
CODIGO INT auto_increment NOT NULL,
NOME VARCHAR(60) NOT NULL,
QUANTIDADE INT NOT NULL,
VALOR DOUBLE(9,2) NOT NULL,
EMPRESA_CODIGO INT NOT NULL,
foreign key(EMPRESA_CODIGO) references EMPRESA(CODIGO),
primary key(CODIGO)
);

CREATE TABLE EMPRESA(
CODIGO INT NOT NULL,
NOME VARCHAR(60) NOT NULL,
ENDERECO VARCHAR(45) NOT NULL,
CIDADE VARCHAR(45) NOT NULL,
EMAIL VARCHAR(60) NOT NULL,
TELEFONE CHAR(15) NOT NULL,
SITE VARCHAR(60) NOT NULL,
PRIMARY KEY(CODIGO)
);  