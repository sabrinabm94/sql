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

CREATE TABLE Clients (
	nameClient VARCHAR(50) NOT NULl,
	userClient VARCHAR(10) NOT NULL UNIQUE,
	descriptionClient VARCHAR(255),
	passwordClient VARCHAR(10) NOT NULL,
	birtDate DATE,
	idClient INT AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE Collection (
	nameCollection VARCHAR(50) NOT NULL UNIQUE,
	descriptionCollection VARCHAR(255),
	sizeCollection INT,
	idCollection INT AUTO_INCREMENT PRIMARY KEY,
	idClient INT,
	FOREIGN KEY(idClient) REFERENCES Clients (idClient)
);

CREATE TABLE Book (
	isbn INT,
	nameBook VARCHAR(50) NOT NULL,
	yearBook INT,
	descriptonBook VARCHAR(255),
	startsRanking INT,
	releaseDataBook DATE,
	editionBook INT,
	idBook INT AUTO_INCREMENT PRIMARY KEY,
	idCollection INT,
    idPublisher INT,
	FOREIGN KEY(idCollection) REFERENCES Collection (idCollection),
    FOREIGN KEY(idPublisher) REFERENCES Publisher (idPublisher)
);

-- gerado pelo diagrama isso, pela relação n-n de livro e autor, revisar
CREATE TABLE bookAuth (
	idBook INT,
    idPublisher INT,
	idBookAuth INT AUTO_INCREMENT,
	FOREIGN KEY(idBook) REFERENCES Book (idBook),
	FOREIGN KEY(idPublisher) REFERENCES Publisher (idPublisher)
);


