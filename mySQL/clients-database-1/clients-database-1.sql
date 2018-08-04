CREATE DATABASE clientsDataBase01;
USE clientsDataBase01;

CREATE TABLE clients (
	cpf INT PRIMARY KEY,
	clientName VARCHAR(20),
	address VARCHAR(100),
	sex CHAR(1),
	phone VARCHAR(20),
	email VARCHAR(20)
)

-- varchar (20) input with the word john = 20 bits, 4 characts of john and 16 others in empty
-- char (20) input with the word john = 4 bits

-- TABLE INFORMATION
SHOW TABLES;
DESC clients;

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
-- Where the address field has between yours characters Bom Retiro
-- % Bom Retiro starts with anything and ends with Bom Retiro
-- Bom Retiro% starts with Bom Retiro and ends with anything
-- like diminishes the search performace

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
-- wrong, it showed all the results of sex, male and female how only female, fix using groupby

SELECT sex, COUNT(*)
FROM clients
GROUP BY sex;
-- correctly

SELECT clientName, address, sex 
FROM clients
WHERE sex = "F"
OR address LIKE '%Iririú%'; 

SELECT clientName, address, sex 
FROM clients
WHERE email = NULL;

-- update e delete should always have where!
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





