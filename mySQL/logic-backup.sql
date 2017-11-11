-- logic backup
CREATE DATABASE store;
USE store;

CREATE TABLE product (
	idProduct INT PRIMARY KEY AUTO_INCREMENT,
    nameProduct VARCHAR(50),
    valueProduct FLOAT(10, 2)
);

CREATE DATABASE storeBk;
USE storeBk;

CREATE TABLE productBkInsert (
	idProductBk INT PRIMARY KEY AUTO_INCREMENT,
	idProduct INT,
    nameProduct VARCHAR(50),
    valueProduct FLOAT(10, 2)
);

CREATE TABLE productBkDelete (
	idProductBk INT PRIMARY KEY AUTO_INCREMENT,
	idProduct INT,
    nameProduct VARCHAR(50),
    valueProduct FLOAT(10, 2)
);

USE store;

-- insert in a table from another database
INSERT INTO storeBK.productBkInsert
	VALUES(NULL, 100, 'teste', 0.0);
    
SELECT * FROM storeBk.productBkInsert;

-- trigger to do backup after has a new insert
DELIMITER $
CREATE TRIGGER productBkInsert
AFTER INSERT ON product
FOR EACH ROW
BEGIN
	INSERT INTO storeBk.productBkInsert VALUES(NULL, NEW.idProduct, NEW.nameProduct, NEW.valueProduct);
END
$
-- atention about the auto_increment numbers, it has only create AFTER the insert !

-- triger to do backup when has delete
CREATE TRIGGER productBkDelete
BEFORE DELETE ON product
FOR EACH ROW
BEGIN
	INSERT INTO storeBk.productBkDelete VALUES(NULL, OLD.idProduct, OLD.nameProduct, OLD.valueProduct);
END
$

DELIMITER ;

-- activate trigger productBkInsert insering new products
INSERT INTO product
VALUES (NULL, 'Product A', 10.05),
	   (NULL, 'Product B', 41.75),
	   (NULL, 'Product C', 71.33);

SELECT * FROM product;
SELECT * FROM storeBk.productBkInsert;

-- activate trigger productBkDelete
DELETE FROM product
WHERE idProduct = 1;

SELECT * FROM storeBk.productBkDelete;
       

		  