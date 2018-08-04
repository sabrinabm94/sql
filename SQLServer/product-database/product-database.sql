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
VALUES('Chair', 'Home products', 30.00),
	  ('Table', 'Home products', 100.00),
	  ('Pool', 'Home products', 30.00),
	  ('Teddy Bear', 'Kids products', 50.00),
	  ('Dress', 'Woman products', 200.00),
	  ('Book', 'Books', 12.00),
	  ('Notebook', 'Tecnology products', 3150.00);

CREATE TRIGGER valueUpdate
ON dbo.products
FOR UPDATE
AS
	IF UPDATE(valueProduct)
	BEGIN
		DECLARE @idProduct INT,
				@product VARCHAR(50), 
				@category VARCHAR(50),
				@value NUMERIC (10, 2),
				@valueNew NUMERIC(10, 2),
				@date DATETIME,
				@user VARCHAR(30),
				@action VARCHAR(100);

		-- values coming from tables must be assigned with select, and values coming from functions or literal values must be assigned with set
		SELECT @idProduct = idProduct, @product = nameProduct, @category = categoryProduct, @valueNew = valueProduct 
		FROM INSERTED;
		
		SELECT @value = valueProduct 
		FROM DELETED;

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