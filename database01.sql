CREATE DATABASE database01
USE database01

CREATE TABLE clients (
	cpf INT(10) PRIMARY KEY,
    clientName VARCHAR(20),
    address VARCHAR(100),
    sex CHAR(1),
    phone VARCHAR(20),
    email VARCHAR(20)
)

-- varchar(20) entrada da palavra joão = 20 bits, sendo 4 de joão e outros 16 em branco
-- char(20) entrada palavra joão = 4 bits

-- TABLE INFORMATION
SHOW TABLES
DESC clients

-- INSET
INSERT INTO clients(cpf, clientName, address, sex, phone, email)
VALUES (1, 'Veronica', 'Rua Santa Catarina, Bairro Santa Catarina, Joinville, Santa Catarina, Brasil', 'F', '+5547000000000', 'veronica@email.com'),
	   (2, 'Eduardo', 'Rua Tenente Antônio João, Bairro Bom Retiro, Joinville, Santa Catarina, Brasil', 'M', '+55471111111111', 'eduardo@email.com'),
       (3, 'Marcos', 'Rua Guaíra, Bairro Iririú, Joinville, Santa Catarina, Brasil', 'M', '+55472222222222', 'marcos@email.com'),
	   (4, 'Carlos', 'Rua Pica Pau, Bairro Aventureiro, Joinville, Santa Catarina, Brasil', 'M', '+55472222222222'),
	   (5, 'Maicon', 'Rua Alexandre Dohler, Bairro Centro, Joinville, Santa Catarina, Brasil', 'M', '+55472222222222'),
       (6, 'Sara', 'Rua Blumenal, Bairro Centro, Joinville, Santa Catarina, Brasil', 'F', '+55472222222222');


-- SELECT
SELECT clientName AS name, address, email FROM clients;

SELECT clientName AS name, sex, email 
FROM clients
WHERE sex = 'M';

SELECT clientName, address, sex 
FROM clients
WHERE address LIKE '%Bom Retiro%'; 
-- like diminui muito a performace da busca
-- Onde o campo address tem entre seus caracteres Bom Retiro
-- %Bom Retiro começa com qualquer coisa e termina com Bom Retiro
-- Bom Retiro% começa com Bom Retiro e termina com qualquer coisa

SELECT COUNT(*) FROM clients;

SELECT COUNT(clientName) FROM clients;

SELECT COUNT(clientName)
FROM clients
WHERE sex = "M";

SELECT COUNT(clientName)
FROM clients
WHERE sex = "F";

SELECT sex, COUNT(*)
FROM clients;
-- errado, ele mostrou todos os resultados de sexo, masculino e feminino somente no feminino, arrume usando groupby

SELECT sex, COUNT(*)
FROM clients
GROUP BY sex;
-- C:

SELECT clientName, address, sex 
FROM clients
WHERE sex = "F"
OR address LIKE '%Iririú%'; 

SELECT clientName, address, sex 
FROM clients
WHERE email = NULL;

-- update sempre deve acompanhar where
SELECT clientName
FROM clients
WHERE email = NULL;

SELECT clientName, address, sex 
FROM clients
WHERE email IS NOT NULL;

UPDATE clients
SET email = 'carlos@email.com'
WHERE clientName = "Carlos";

DELETE FROM clients
WHERE clientName = "Sara"



