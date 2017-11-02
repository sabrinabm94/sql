CREATE DATABASE mcDonaldsDB;
USE mcDonaldsDB;

CREATE TABLE Produtos (
idProduto INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
descricaoProduto VARCHAR(100),
nomeProduto VARCHAR(20) NOT NULL,
precoProduto INT NOT NULL,
idCombo INT
);

CREATE TABLE Combos (
idCombo INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
descricaoCombo VARCHAR(100),
nomeCombo VARCHAR(20) NOT NULL,
precoCombo INT
);

CREATE TABLE Pedidos (
idPedido INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
idCombo INT,
quantidadeCombo INT,
idProduto INT,
quantidadeProduto INT,
dataPedido DATE NOT NULL
);

CREATE TABLE itensPedidos (
idItensPedid INT AUTO_INCREMENT PRIMARY KEY PRIMARY KEY,
totalPrecoCompra INT,
idPedido INT
);
ALTER TABLE itensPedidos ADD FOREIGN KEY(idPedido) REFERENCES Pedidos (idPedido);

CREATE TABLE combPedido (
idCombPedido INT AUTO_INCREMENT PRIMARY KEY,
idPedido INT,
idCombo INT,
FOREIGN KEY(idPedido) REFERENCES Pedidos (idPedido),
FOREIGN KEY(idCombo) REFERENCES Combos (idCombo)
);

CREATE TABLE prodPedido (
idProdPedido INT AUTO_INCREMENT PRIMARY KEY,
idPedido INT,
idProduto INT,
FOREIGN KEY(idPedido) REFERENCES Pedidos (idPedido),
FOREIGN KEY(idProduto) REFERENCES Produtos (idProduto)
);

-- INSERT
INSERT Produtos 
(
nomeProduto,
descricaoProduto,
precoProduto,
idCombo
)
VALUES ('Hamburger pequeno', 'Hamburger pequeno com queijo', 6, 1), 
	   ('Hamburger médio', 'Hamburger médio com queijo', 8, 2), 
       ('Hamburger grande', 'Hamburger grande com queijo', 10, 3), 
       ('Batata pequena', 'Batata frita pequena', 5, 1), 
       ('Batata média', 'Batata frita Média', 8, 2), 
       ('Batata média', 'Batata frita Grande', 12, 3), 
       ('Refrigerante pequeno', 'Copo de refrigerante pequeno', 4, 1), 
       ('Refrigerante médio', 'Copo de refrigerante médio', 5, 2), 
       ('Refrigerante grande', 'Copo de refrigerante grande', 7, 3),
       ('Refrigerante refil', 'Refrigerante refil por 1 hora', 8, NULL); 

INSERT Combos 
(
nomeCombo,
descricaoCombo,
precoCombo
)
VALUES ('Combo pequeno', 'Um delicioso combo pequeno', NULL), 
       ('Combo médio', 'Um delicioso combo médio', NULL), 
       ('Combo grande', 'Um delicioso combo grande', NULL);

INSERT Pedidos 
(
idCombo, -- como fazer com multiplos combos
quantidadeCombo,
idProduto, -- como fazer com multiplos produtos
quantidadeProduto,
dataPedido
)
VALUES (1, 2, NULL, NULL, '2017-10-10'), 
       (NULL, NULL, 1, 1, '2017-01-12');

-- SELECTS DE VERIFICAÇÃO DAS TABELAS       
SELECT * FROM Produtos;

 -- identificar informações dos produtos do combo do pedido (quando é comprado combo)
SELECT Pedidos.idCombo, Produtos.idProduto, Produtos.descricaoProduto, Produtos.nomeProduto, Produtos.precoProduto
FROM Pedidos
INNER JOIN Produtos
ON Produtos.idCombo = Pedidos.idCombo;

-- identifica informações dos produtos do pedido (quando não é comprado combo)
SELECT Pedidos.idCombo, Produtos.idProduto, Produtos.descricaoProduto, Produtos.nomeProduto, Produtos.precoProduto
FROM Pedidos
INNER JOIN Produtos
ON Produtos.idProduto = Pedidos.idProduto;

-- PROCEDURES
DELIMITER $
CREATE PROCEDURE adicaoItensdoCombo()
BEGIN          
    DECLARE @idPedido INT, @idCombo INT; -- as variaveis não está funcionando
    SELECT @idPedido=idPedido, @idCombo=idCombo 
    FROM Pedidos
    WHERE idCombo IS NOT NULL;
    
    CASE WHEN @idCombo IS NOT NULL THEN -- se tem uma numeração de combo, então adiciona os produtos em itensPedidos
		INSERT itensPedidos
		SELECT Pedidos.idCombo, Produtos.idProduto, Produtos.descricaoProduto, Produtos.nomeProduto, Produtos.precoProduto
		FROM Pedidos
		INNER JOIN Produtos
		ON Produtos.idCombo = Pedidos.idCombo;
        
        
	CASE WHEN @idCombo IS NULL THEN -- se não tenha combo então so adiciona os produtos em itensPedidos
		SELECT Pedidos.idCombo, Produtos.idProduto, Produtos.descricaoProduto, Produtos.nomeProduto, Produtos.precoProduto
		FROM Pedidos
		INNER JOIN Produtos
		ON Produtos.idProduto = Pedidos.idProduto;

   -- calcular valor total compra (o insert dos produtos no itensPedidos deve estar okay para continuar)
    CALL calcularTotalCompra();
END

CREATE PROCEDURE calcularTotalCompra()
BEGIN
	DECLARE @valorTotalCompra INT;
    SELECT idProduto, nomeProduto, SET @valorTotalCompra = SUM(precoProduto)
	FROM itensPedidos
    GROUP BY idProduto;
    
    INSERT itensPedidos 
	(
	totalPrecoCompra
	)
	VALUES (@valorTotalCompra);
END

DELIMITER ;
CALL adicaoItensdoCombo();


