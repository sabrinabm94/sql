-- create database
CREATE DATABASE database02;
USE database02;

-- create tables
CREATE TABLE Street (
	streetName VARCHAR(30) NOT NULL,
	streetId INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE District (
	districtName VARCHAR(20) NOT NULL,
	districtId INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE City (
	cityName VARCHAR(20) NOT NULL,
	cityId INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Country (
	countryName VARCHAR(20) NOT NULL UNIQUE,
	countryId INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Clients (
	id INT AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(20) UNIQUE,
	nameClient VARCHAR(20) NOT NULL,
	streetNumber INT,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	phone VARCHAR(15),
	sex CHAR(1) NOT NULL,
	streetId INT,
	districtId INT,
	cityId INT,
	countryId INT
);

-- alter tables for foreign key
ALTER TABLE Clients ADD FOREIGN KEY(streetId) REFERENCES Street (streetId);
ALTER TABLE Clients ADD FOREIGN KEY(districtId) REFERENCES District (districtId);
ALTER TABLE Clients ADD FOREIGN KEY(cityId) REFERENCES City (cityId);
ALTER TABLE Clients ADD FOREIGN KEY(countryId) REFERENCES Country (countryId);

DESC Clients;

-- inserts

-- insert Street
INSERT INTO Street(streetName)
VALUES('Santa Catarina');

INSERT INTO Street(streetName) 
VALUES('Tenente Antônio João');

INSERT INTO Street(streetName) 
VALUES('Iririú');

INSERT INTO Street(streetName) 
VALUES('Pica Pau');

INSERT INTO Street(streetName) 
VALUES('Guaíra');

INSERT INTO Street(streetName) 
VALUES('Alexandre Dohler');

INSERT INTO Street(streetName) 
VALUES('Blumenau');

-- insert district
INSERT INTO District(districtName) 
VALUES('Santa Catarina');

INSERT INTO District(districtName)  
VALUES('Bom Retiro');

INSERT INTO District(districtName)  
VALUES('Iririú');

INSERT INTO District(districtName)  
VALUES('Aventureiro');

INSERT INTO District(districtName)  
VALUES('Guaíra');

INSERT INTO District(districtName)  
VALUES('América');

INSERT INTO District(districtName)  
VALUES('Centro');

-- insert City
INSERT INTO City(cityName)  
VALUES('Joinville');

INSERT INTO City(cityName)  
VALUES('Florianópolis');

INSERT INTO City(cityName)  
VALUES('Porto');

-- insert Country
INSERT INTO Country(countryName)   
VALUES('Brasil');

INSERT INTO Country(countryName) 
VALUES('Portugal');

INSERT INTO Country(countryName) 
VALUES('Colômbia');

INSERT INTO Country(countryName) 
VALUES('México');

SELECT * FROM Street;
SELECT * FROM District;
SELECT * FROM City;

-- insert Client
INSERT INTO Clients(email, nameClient, streetNumber, cpf, phone, sex, streetId, districtId, cityId, countryId) 
VALUES('sabrina@email.com', 'Sabrina', 65, 00000000000, 5500000000000, 'F', 3, 3, 1, 1), 
('veronica@email.com', 'Veronica', 70, 11111111111, 5511111111111, 'F', 1, 1, 1, 1),
('erick@email.com', 'Erick', 1, 22222222222, 5522222222222, 'M', 7, 7, 1, 1),
('dereck@email.com', 'Dereck', 5, 33333333333, 553333333333, 'M', NULL, NULL, 3, 2),
(NULL, 'Guardalupe', 882, 44444444444, 55444444444, 'F', NULL, NULL, 3, 2);

SELECT * FROM Clients;

-- update
UPDATE Clients
SET email = 'guardalupe@email.com'
WHERE cpf = '44444444444';

SELECT nameClient, email 
FROM Clients
WHERE cpf = '44444444444';

SELECT nameClient, NOW() AS "DATA"
FROM Clients;

-- select (teoria dos conjuntos)
SELECT nameClient, sex
FROM Clients
WHERE sex = 'M';

SELECT nameClient, sex, districtName, cityName, NOW() AS "DATA"
FROM Clients, District, City
WHERE Clients.districtId = District.districtId
AND Clients.cityId = City.cityId;

-- order by
SELECT nameClient, sex, cityName, districtName
FROM Clients, City, District
WHERE cityName = 'Joinville' 
AND districtName = 'Santa Catarina'
ORDER BY sex DESC; -- sort the results by male

-- inner join
SELECT nameClient, sex, cityName, districtName
FROM Clients
INNER JOIN City
ON Clients.cityId = City.cityId
INNER JOIN District
ON Clients.districtId = District.districtId
WHERE districtName = 'Santa Catarina';

-- inner join
SELECT Clients.nameClient, Clients.sex, City.cityName, District.districtName
FROM Clients
INNER JOIN City
ON Clients.cityId = City.cityId
INNER JOIN District
ON Clients.districtId = District.districtId
WHERE districtName = 'Santa Catarina';

-- inner join
SELECT Clients.nameClient, Clients.email, Clients.phone
FROM Clients
INNER JOIN Street
ON Clients.streetId = Street.streetId
INNER JOIN District
ON Clients.districtId = District.districtId
INNER JOIN City
ON Clients.cityId = City.cityId
WHERE districtName = 'Iririú';

-- inner join
SELECT Clients.nameClient, Clients.email, Clients.phone
FROM Clients
INNER JOIN Country
ON Clients.countryId = Country.countryId
WHERE sex = 'F'
AND countryName = 'Brasil';

-- view
CREATE VIEW view_clients AS
SELECT Clients.nameClient, Clients.email, Clients.phone, Street.streetName, District.districtName, City.cityName, Country.countryName
FROM Clients
INNER JOIN Street
ON Clients.streetId = Street.streetId
INNER JOIN District
ON Clients.districtId = District.districtId
INNER JOIN City
ON Clients.cityId = City.cityId
INNER JOIN Country
ON Clients.countryId = Country.countryId;

SELECT * FROM view_clients; 

SELECT * FROM view_clients
WHERE cityName = 'Joinville'; -- Access a query through another query

SHOW TABLES; -- how to differentiate views from tables? use prefixes.

-- view deletar
DROP VIEW view_clients;

-- table courses
CREATE TABLE Courses (
	idCourse INT PRIMARY KEY AUTO_INCREMENT,
	nameCourse VARCHAR(30) NOT NULL,
	hoursCourse INT(3),
	valueCourse FLOAT(10, 2)
);

INSERT INTO Courses VALUES (NULL, 'Database fundaments', 25, 200.00);

SELECT * FROM Courses
DROP TABLE Courses;

-- table sellers
CREATE TABLE Sellers (
	idSeller INT PRIMARY KEY AUTO_INCREMENT,
	nameSeller VARCHAR(30) NOT NULL,
	sex CHAR(1),
    january FLOAT(10, 2),
    february FLOAT(10, 2),
	march FLOAT(10, 2)
);

INSERT Sellers 
VALUES (NULL, 'Maria', 'F', 10, 20, 30),
	   (NULL, 'Rodrigo', 'M', 5, 30, 10),
       (NULL, 'Rebeca', 'F', 15, 88, 50);

SELECT * FROM Sellers;
DROP TABLE Sellers;

-- sun
SELECT MAX(february) AS Max_Sun_Feb
FROM Sellers;

-- max
SELECT MAX(february) AS Max_Sel_Feb
FROM Sellers;

-- min
SELECT MIN(february) AS Max_Sel_Feb
FROM Sellers;

-- avg (média)
SELECT AVG(february) AS Max_Sel_Feb
FROM Sellers;

-- all in one function
SELECT MAX(january) AS Max_Sel_Jan,
	   MIN(february) AS Max_Sel_Feb,
       AVG(march) AS Max_Sel_Mar
FROM Sellers;

-- truncate (first parameter is a number and secound is a number of decimal places)
SELECT MAX(january) AS Max_Sel_Jan,
	   MIN(february) AS Max_Sel_Feb,
       TRUNCATE (AVG(march), 2) AS Max_Sel_Mar
FROM Sellers;

-- count per sex
SELECT sex, SUM(january) AS Total_Jan
FROM Sellers
GROUP BY sex;

-- SUBQUERIES
-- value and name of the worse sellers of march
SELECT nameSeller, march 
FROM Sellers
WHERE march = (SELECT MIN(march) FROM Sellers); -- the inner query is done first

-- value and name of the best sellers of march
SELECT nameSeller, march 
FROM Sellers
WHERE march = (SELECT MAX(march) FROM Sellers);

-- value and name of the best sellers of march
SELECT nameSeller, march 
FROM Sellers
WHERE march = (SELECT MAX(march) FROM Sellers);

-- procedures with parameters
DELIMITER $
CREATE PROCEDURE countNumbers(n1 INT, n2 INT)
BEGIN
SELECT n1 + n2 AS "Count";
END
$
DELIMITER ;

CALL countNumbers(5, 5);
CALL countNumbers(25, 23);

DROP PROCEDURE countNumbers;

-- procedure with insert
DELIMITER $
CREATE PROCEDURE coursesInsert(nameCourse VARCHAR(30), hoursCourse INT(3), valueCourse FLOAT(10, 2))
BEGIN
INSERT INTO Courses VALUES(NULL, nameCourse, hoursCourse, valueCourse);
END
$
DELIMITER ;
CALL coursesInsert('BI SQL SERVER', 35, 200.00);

-- procedure with select
DELIMITER $
CREATE PROCEDURE searchCourses()
BEGIN	
	SELECT idCourse, nameCourse, hoursCourse, valueCourse
    FROM Courses;
END
$
DELIMITER ;

CALL searchCourses();


