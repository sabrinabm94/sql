CREATE DATABASE database01
USE database01

CREATE TABLE clients (
	cpf INT PRIMARY KEY,
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
VALUES (111111111, 'Veronica', 'Rua Santa Catarina, Bairro Santa Catarina, Joinville, Santa Catarina, Brasil', 'F', '+5547000000000', 'veronica@email.com'),
(222222222, 'Eduardo', 'Rua Tenente Antônio João, Bairro Bom Retiro, Joinville, Santa Catarina, Brasil', 'M', '+55471111111111', 'eduardo@email.com'),
(333333333, 'Marcos', 'Rua Guaíra, Bairro Iririú, Joinville, Santa Catarina, Brasil', 'M', '+55472222222222', 'marcos@email.com'),
(444444444, 'Carlos', 'Rua Pica Pau, Bairro Aventureiro, Joinville, Santa Catarina, Brasil', 'M', '+55472222222222', NULL),
(555555555, 'Maicon', 'Rua Alexandre Dohler, Bairro Centro, Joinville, Santa Catarina, Brasil', 'M', '+55472222222222', NULL),
(666666666, 'Sara', 'Rua Blumenal, Bairro Centro, Joinville, Santa Catarina, Brasil', 'F', '+55472222222222', NULL);


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

-- update e deletesempre deve acompanhar where!
SELECT clientName
FROM clients
WHERE email IS NULL;

SELECT clientName, address, sex 
FROM clients
WHERE email IS NOT NULL;

UPDATE clients
SET email = 'carlos@email.com'
WHERE cpf = 444444444;

DELETE FROM clients
WHERE cpf = 555555555;

SELECT clientName, COUNT(*)
FROM clients;

SELECT COUNT(clientName) AS TotalClients 
FROM clients; 

UPDATE clients
SET email = NULL
WHERE cpf = 111111111;

SELECT cpf, clientName, email
FROM clients;

UPDATE clients
SET email = 'veronica@email.com'
WHERE cpf = 111111111;



