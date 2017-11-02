CREATE DATABASE bookRegistry;
USE bookRegistry;


CREATE TABLE Client (
	name VARCHAR(50) NOT NULl,
	user VARCHAR(10) NOT NULL UNIQUE,
	description VARCHAR(255),
	password VARCHAR(10) NOT NULL,
	birtDate DATE,
	idClient INT IDENTITY PRIMARY KEY
)

CREATE TABLE Collection (
	name VARCHAR(50) NOT NULL UNIQUE,
	description VARCHAR(255),
	size INT,
	idCollection INT IDENTITY PRIMARY KEY,
	idClient INT,
	FOREIGN KEY(idClient) REFERENCES Client (idClient)
)

CREATE TABLE Book (
	isbn INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	year INT,
	descripton VARCHAR(255),
	startsRanking INT,
	releaseData DATE,
	edition INT,
	idBook INT IDENTITY,
	idCollection INT,
	-FOREIGN KEY(idCollection) REFERENCES Collection (idCollection)
)

CREATE TABLE Author (
	idAuthor INT IDENTITY PRIMARY KEY,
	nameAuthor VARCHAR(50) NOT NULL
)

CREATE TABLE Publisher (
	idPublisher INT IDENTITY PRIMARY KEY,
	namePublisher VARCHAR(50) NOT NUll
)

-- gerado pelo diagrama isso, pela relação n-n de livro e autor, revisar

CREATE TABLE bookAuth (
	isbn INT,
	idBookAuth INT IDENTITY,
	FOREIGN KEY(isbn) REFERENCES Book (isbn),
	FOREIGN KEY(idPublisher) REFERENCES Author (idPublisher)
)

ALTER TABLE Book ADD FOREIGN KEY(idPublisher) REFERENCES Publisher (idPublisher)
