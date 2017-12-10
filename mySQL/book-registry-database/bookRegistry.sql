CREATE DATABASE bookRegistry;
USE bookRegistry;

CREATE TABLE Publisher (
	idPublisher INT AUTO_INCREMENT PRIMARY KEY,
	namePublisher VARCHAR(50) NOT NUll
);

CREATE TABLE Author (
	idAuthor INT AUTO_INCREMENT PRIMARY KEY,
	nameAuthor VARCHAR(50) NOT NULL
);

CREATE TABLE Client (
	idClient INT AUTO_INCREMENT PRIMARY KEY,
	nameClient VARCHAR(50) NOT NULL,
	userClient VARCHAR(10) NOT NULL UNIQUE,
	descriptionClient VARCHAR(255),
	passwordClient VARCHAR(10) NOT NULL,
	birtDate DATE
);

CREATE TABLE Collection (
	idCollection INT AUTO_INCREMENT PRIMARY KEY,
	nameCollection VARCHAR(50) NOT NULL UNIQUE,
	descriptionCollection VARCHAR(255),
	sizeCollection INT,
	idClient INT,
	FOREIGN KEY(idClient) REFERENCES Client (idClient)
);

CREATE TABLE Book (
	idBook INT AUTO_INCREMENT PRIMARY KEY,
	isbn INT,
	nameBook VARCHAR(50) NOT NULL,
	yearBook INT,
	descriptonBook VARCHAR(255),
	startsRanking INT,
	releaseDataBook DATE,
	editionBook INT,
	idAuthorBook INT,
	idCollection INT,
    idPublisher INT,
	FOREIGN KEY(idCollection) REFERENCES Collection (idCollection),
    FOREIGN KEY(idPublisher) REFERENCES Publisher (idPublisher)
);




