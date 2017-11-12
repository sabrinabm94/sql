CREATE DATABASE productsDatabase;
GO
USE productsDatabase;
GO

CREATE TABLE products (
	idProduct INT IDENTITY PRIMARY KEY,
	nameProduct VARCHAR(50) NOT NULL,
	categoryProduct VARCHAR(50) NOT NULL,
	valueProduct NUMERIC(10, 2) NOT NULL 
); 

CREATE TABLE productsHistoric (
	idProductHistoric INT IDENTITY PRIMARY KEY,
	idProduct INT,
	nameProduct VARCHAR(50) NOT NULL,
	categoryProduct VARCHAR(50) NOT NULL,
	valueProductOld NUMERIC(10, 2) NOT NULL,
	valueProductNew NUMERIC(10, 2) NOT NULL,
	dateAction DATETIME,
	userAction VARCHAR(30),
	messageAction VARCHAR(100) 
); 

INSERT INTO products 
VALUES('chair', 'home products', 30.00),
	  ('table', 'home products', 100.00),
	  ('pool', 'home products', 30.00),
	  ('teddy bear', 'kids products', 50.00),
	  ('dress', 'woman products', 200.00),
	  ('book', 'books', 12.00),
	  ('notebook', 'tecnology products', 3150.00);

CREATE TRIGGER valueUpdate
ON dbo.products
FOR UPDATE
AS
	IF UPDATE(valueProduct)
	BEGIN
		DECLARE @idProduct INT;
		DECLARE @product VARCHAR(50);
		DECLARE @category VARCHAR(50);
		DECLARE @value NUMERIC (10, 2);
		DECLARE @valueNew NUMERIC(10, 2);
		DECLARE @date DATETIME;
		DECLARE @user VARCHAR(30);
		DECLARE @action VARCHAR(100);

		-- values coming from tables must be assigned with select, and values coming from functions or literal values must be assigned with set
		SELECT @idProduct = idProduct FROM INSERTED;
		SELECT @product = nameProduct FROM INSERTED;
		SELECT @category = categoryProduct FROM INSERTED;
		SELECT @value = valueProduct FROM DELETED;
		SELECT @valueNew = valueProduct FROM INSERTED;

		SET @date = GETDATE();
		SET @user = SUSER_NAME();
		SET @action = 'TRIGGER valueUpdate activate';

		INSERT INTO productsHistoric(idProduct, nameProduct, categoryProduct, valueProductOld, valueProductNew, dateAction, userAction, messageAction)
		VALUES(@idProduct, @product, @category, @value, @valueNew, @date, @user, @action);
	
		PRINT 'Trigger endend!';
	END
GO -- close network package


UPDATE products SET valueProduct = 100.00 -- changed from 30.00 to 100.00
WHERE idProduct = 1;

UPDATE products SET valueProduct = 20.00 -- changed from 100.00 to 20.00
WHERE idProduct = 2;

SELECT * FROM products;
SELECT * FROM productsHistoric;