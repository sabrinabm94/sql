-- trigger
-- DELIMITER $
-- CREATE TRIGGER triggerName
-- BEFORE/AFTER INSERT/DELETE/UPDATE ON tableName
-- FOR EACH ROW (rowsName to be affected)
-- BEGIN 
-- 	queries
-- END
-- $
-- DELIMITER ;

CREATE DATABASE clientsDataBase03;
USE clientsDataBase03;

CREATE TABLE clients (
	idClient INT PRIMARY KEY AUTO_INCREMENT,
    nameClient VARCHAR(50),
    loginClient VARCHAR(50),
    passwordClient VARCHAR(10)
);

CREATE TABLE clientsBk (
	idClientBk INT PRIMARY KEY AUTO_INCREMENT,
    idClient INT,
    nameClient VARCHAR(50),
    loginClient VARCHAR(50),
    passwordClient VARCHAR(10)
);

INSERT INTO clients
	VALUES(NULL, 'Ariana Grande', 'arianagrande', 0123456789);

SELECT * FROM clients;

DELETE FROM clients
WHERE idClient = 1;

SELECT * FROM clientsBk;

-- trigger delete and backup
DELIMITER $
CREATE TRIGGER clientsBackup
BEFORE DELETE ON clients
FOR EACH ROW
BEGIN 
	INSERT INTO clientsBk
		VALUES(NULL, OLD.idClient, OLD.nameClient, OLD.loginClient, OLD.passwordClient); 
END
$
DELIMITER ;

-- DROP TRIGGER clientsBackup;
