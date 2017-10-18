CREATE DATABASE database02;
USE database02;

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

ALTER TABLE Clients ADD FOREIGN KEY(streetId) REFERENCES Street (streetId);
ALTER TABLE Clients ADD FOREIGN KEY(districtId) REFERENCES District (districtId);
ALTER TABLE Clients ADD FOREIGN KEY(cityId) REFERENCES City (cityId);
ALTER TABLE Clients ADD FOREIGN KEY(countryId) REFERENCES Country (countryId);

DESC Clients;

-- Insert Street
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


-- Insert district
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


-- Insert City
INSERT INTO City(cityName)  
VALUES('Joinville');

INSERT INTO City(cityName)  
VALUES('Florianópolis');

INSERT INTO City(cityName)  
VALUES('Porto');

-- Insert Country
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

-- Insert Client
INSERT INTO Clients(email, nameClient, streetNumber, cpf, phone, sex, streetId, districtId, cityId, countryId) 
VALUES('sabrina@email.com', 'Sabrina', 65, 00000000000, 5500000000000, 'F', 3, 3, 1, 1), 
      ('veronica@email.com', 'Veronica', 70, 11111111111, 5511111111111, 'F', 1, 1, 1, 1),
      ('erick@email.com', 'Erick', 1, 22222222222, 5522222222222, 'M', 7, 7, 1, 1),
      ('dereck@email.com', 'Dereck', 5, 33333333333, 553333333333, 'M', NULL, NULL, 3, 2),
      (NULL, 'Guardalupe', 882, 44444444444, 55444444444, 'F', NULL, NULL, 3, 2);

SELECT * FROM Clients;

UPDATE Clients
SET email = 'guardalupe@email.com'
WHERE cpf = '44444444444';

SELECT nameClient, email 
FROM Clients
WHERE cpf = '44444444444';

-- projeção de colunas na tela
SELECT NOW() AS "DATA";

SELECT nameClient, NOW() AS "DATA"
FROM Clients;

-- seleção (teoria dos conjuntos)
SELECT nameClient, sex
FROM Clients
WHERE sex = 'M';

SELECT nameClient, sex, districtName, cityName, NOW() AS "DATA"
FROM Clients, District, City
WHERE Clients.districtId = District.districtId
AND Clients.cityId = City.cityId;

SELECT nameClient, sex, cityName, districtName
FROM Clients, City, District
WHERE cityName = 'Joinville' 
AND districtName = 'Santa Catarina';

-- Inner Join
SELECT nameClient, sex, cityName, districtName
FROM Clients
INNER JOIN City
ON Clients.cityId = City.cityId
INNER JOIN District
ON Clients.districtId = District.districtId
WHERE districtName = 'Santa Catarina';

-- Inner Join
SELECT Clients.nameClient, Clients.sex, City.cityName, District.districtName
FROM Clients
INNER JOIN City
ON Clients.cityId = City.cityId
INNER JOIN District
ON Clients.districtId = District.districtId
WHERE districtName = 'Santa Catarina';


