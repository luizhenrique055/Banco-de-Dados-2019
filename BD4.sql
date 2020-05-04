CREATE DATABASE BIBLIOTECA_TURMA;
USE BIBLIOTECA_TURMA;

CREATE TABLE PERFIL(
CODIGO INT NOT NULL,
NOME VARCHAR(45) NOT NULL,
PRIMARY KEY (CODIGO)
);

INSERT INTO PERFIL(CODIGO,NOME)
VALUES(33221,'ANA MARIA');
INSERT INTO PERFIL(CODIGO,NOME)
VALUES(55111,'GIOVANA VASCONCELOS');
INSERT INTO PERFIL(CODIGO,NOME)
VALUES(99881,'MARIA CLARA');

CREATE TABLE EDITORA(
CNPJ INT NOT NULL,
NOME VARCHAR(50) NOT NULL,
PRIMARY KEY (CNPJ)
); 

INSERT INTO EDITORA(CNPJ,NOME)
VALUES(112233,'GABRIEL LUCA');
INSERT INTO EDITORA(CNPJ,NOME)
VALUES(555551,'LUCA NEGRAO');
INSERT INTO EDITORA(CNPJ,NOME)
VALUES(112233,'UCHART UCHICHA');

CREATE TABLE AUTOR(
CODIGO INT NOT NULL,
NOME VARCHAR(50),
PRIMARY KEY(CODIGO)
);

INSERT INTO AUTOR(CODIGO,NOME)
VALUES(9881,'ARTHUR JOSELINO');
INSERT INTO AUTOR(CODIGO,NOME)
VALUES(2221,'JONATO LUKA');
INSERT INTO AUTOR(CODIGO,NOME)
VALUES(1124,'RENATO CLEITON');

CREATE TABLE LINGUA(
CODIGO INT NOT NULL,
NOME VARCHAR(45) NOT NULL,
PRIMARY KEY (CODIGO)
);

INSERT INTO LINGUA(CODIGO,NOME)
VALUES(3555,'KLEITON JOSEF');
INSERT INTO LINGUA(CODIGO,NOME)
VALUES(6666,'JOSEFINO VASCAINO');
INSERT INTO LINGUA(CODIGO,NOME)
VALUES(3682,'NOSALF CLEITON');

CREATE TABLE MIDIA(
CODIGO INT NOT NULL,
NOME VARCHAR(45) NOT NULL,
PRIMARY KEY (CODIGO)
);

INSERT INTO MIDIA(CODIGO,NOME)
VALUES(1222,'CARLÃO JOSE');
INSERT INTO MIDIA(CODIGO,NOME)
VALUES(3212,'JOSE CARLOS');
INSERT INTO MIDIA(CODIGO,NOME)
VALUES(7111,'NILTON ALMEIDA');

CREATE TABLE CLASSIFICACAO(
CODIGO INT NOT NULL,
NOME VARCHAR(45) NOT NULL,
PRIMARY KEY (CODIGO)
);

INSERT INTO CLASSIFICACAO(CODIGO,NOME)
VALUES(3122,'LUIZ HENRIQUE');
INSERT INTO CLASSIFICACAO(CODIGO,NOME)
VALUES(1112,'CARLOS HENRIQUE');
INSERT INTO CLASSIFICACAO(CODIGO,NOME)
VALUES(5552,'JOSE HENRIQUE');

CREATE TABLE USUARIOS(
NUMERO INT NOT NULL,
NOME VARCHAR(45) NOT NULL,
DATA DATE NOT NULL,
PERFIL_CODIGO INT NOT NULL,
PRIMARY KEY (NUMERO),
FOREIGN KEY(PERFIL_CODIGO) REFERENCES PERFIL(CODIGO)
);

CREATE TABLE CURSOS(
CODIGO INT NOT NULL,
DESCRICAO VARCHAR(60) NOT NULL,
USUARIOS_NUMERO INT NOT NULL,
PRIMARY KEY (CODIGO),
FOREIGN KEY (USUARIOS_NUMERO) REFERENCES USUARIOS(NUMERO)
);

CREATE TABLE EMPRESTIMO(
NUMERO INT NOT NULL,
VALOR DOUBLE(9,2) NOT NULL,
DATA DATE NOT NULL,
DEVOLUCAO DATE NOT NULL,
USUARIOS_NUMERO INT NOT NULL,
OBRAS_ID INT NOT NULL,
PRIMARY KEY (NUMERO),
FOREIGN KEY (USUARIOS_NUMERO) REFERENCES USUARIOS(NUMERO),
FOREIGN KEY (OBRAS_ID) REFERENCES OBRAS(ID)
);

CREATE TABLE OBRAS(
ID INT NOT NULL,
PAGINAS INT NOT NULL,
NOME VARCHAR(50) NOT NULL,
CLASSIFICACAO_CODIGO INT NOT NULL,
AUTOR_CODIGO INT NOT NULL,
LINGUA_CODIGO INT NOT NULL,
MIDIA_CODIGO INT NOT NULL,
EDITORA_CNPJ INT NOT NULL,
PRIMARY KEY (ID),
FOREIGN KEY(AUTOR_CODIGO) REFERENCES AUTOR(CODIGO),
FOREIGN KEY(LINGUA_CODIGO) REFERENCES LINGUA(CODIGO),
FOREIGN KEY(MIDIA_CODIGO) REFERENCES MIDIA(CODIGO),
FOREIGN KEY(EDITORA_CNPJ) REFERENCES EDITORA(CNPJ)
);

INSERT INTO OBRAS(ID,PAGINAS,NOME,CLASSIFICACAO_CODIGO,AUTOR_CODIGO,
LINGUA_CODIGO,MIDIA_CODIGO,EDITORA_CNPJ)
VALUES(5112,300,'O LIVRO',1111,3111,41,111,33322111);
INSERT INTO OBRAS(ID,PAGINAS,NOME,CLASSIFICACAO_CODIGO,AUTOR_CODIGO,
LINGUA_CODIGO,MIDIA_CODIGO,EDITORA_CNPJ)
VALUES(6622,344,'O PESADELO',4441,32221,11,211,55322111);
INSERT INTO OBRAS(ID,PAGINAS,NOME,CLASSIFICACAO_CODIGO,AUTOR_CODIGO,
LINGUA_CODIGO,MIDIA_CODIGO,EDITORA_CNPJ)
VALUES(1112,600,'O COTOVELO',4411,3441,41,311,99322111);


DELETE FROM OBRAS WHERE PAGINAS > 10;
SELECT * FROM EDITORA;
SELECT * FROM EMPRESTIMO DATA WHERE DATA BETWEEN "2012/10/01" AND "2012/10/30";
SELECT * FROM USUARIOS WHERE PERFIL_CODIGO >= 2; 
SELECT COUNT(*) FROM AUTOR;
SELECT AVG(VALOR) FROM EMPRESTIMO WHERE DATA BETWEEN "2013/04/30" AND "2013/04/30";
SELECT * FROM CURSOS WHERE CODIGO != 2; 
SELECT * FROM OBRAS WHERE AUTOR_CODIGO = 10;
SELECT * FROM AUTOR ORDER BY NOME;
SELECT COUNT(*) FROM AUTOR WHERE CODIGO = 2;
DELETE FROM EDITORA WHERE CNPJ > 123.456/0001;
DELETE FROM OBRAS WHERE PAGINAS BETWEEN 250 AND 350;
DELETE FROM EMPRESTIMO WHERE VALOR BETWEEN 50 AND 150;
Update OBRAS set NOME  = 'LIVRO 1' where CODIGO = 10;
Update OBRAS set VALOR  = 20 where EMPRESTIMO = 20;


/*
SELECT * FROM ENDERECO WHERE NUMERO < 200;
SELECT * FROM IMOVEL WHERE VR_VENDA = 100000;
SELECT NOME,ENDERECO FROM IMOBILIARIA;
SELECT AVG(VALOR) FROM VENDA WHERE DATA BETWEEN "2013/04/30" AND "2013/04/30";
SELECT SUM(VALOR) FROM VENDA WHERE CODIGO > 30;
UPDATE IMOBILIARIA SET ENDERECO="RUA AMAZONAS" WHERE NOME = 'IMOBILIARIA X';
DELETE FROM ENDERECO WHERE NUMERO  BETWEEN 10 AND 230;  
SELECT MAX(VALOR) FROM VENDA;
SELECT MIN(VALOR) FROM VENDA;
SELECT COUNT(*) FROM CORRETOR;
SELECT * FROM PROPIETARIO WHERE ESTADOCIVIL = 'Solteiro';