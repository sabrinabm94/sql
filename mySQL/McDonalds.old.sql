CREATE DATABASE mcDonalds;
USE mcDonalds;

CREATE TABLE produto (
idProduto INT AUTO_INCREMENT PRIMARY KEY,
nomeProduto VARCHAR(20),
descricaoProduto VARCHAR(100),
precoProduto INT
);

CREATE TABLE combo (
idCombo INT AUTO_INCREMENT PRIMARY KEY,
nomeCombo VARCHAR(20),
descricaoCombo VARCHAR(100),
idCombo INT,
precoCombo INT
);

ALTER TABLE combo ADD FOREIGN KEY(idProduto) REFERENCES produto (idProduto);

CREATE TABLE pedido (
idPedido INT AUTO_INCREMENT PRIMARY KEY,
idCombo INT,
quantidadeCombo INT,
quantidadePedido INT,
dataPedido DATE,
CONSTRAINT idPedidoCombo PRIMARY KEY (idPedido, idCombo),
CONSTRAINT idPedidoproduto PRIMARY KEY (idPedido, idProduto)
);

ALTER TABLE pedido ADD FOREIGN KEY(idCombo) REFERENCES combo (idCombo);
ALTER TABLE pedido ADD FOREIGN KEY(idProduto) REFERENCES combo (idProduto);

CREATE TABLE itensPedido (
idItensPedido INT AUTO_INCREMENT PRIMARY KEY,
idPedido INT,
quantidadeItemPedido INT, -- verificar o id do compo e adicionar os produtos relacionados aqui!!
idProduto VARCHAR(20), -- como adicionar essa informação na tabela sem foreign key?? quero pegar o mesmo do produto
precoProduto INT,
precoCombo INT,
valorTotalCompra INT
);

ALTER TABLE itensPedido ADD FOREIGN KEY(idPedido) REFERENCES pedido (idPedido);

INSERT produto 
(
nomeProduto,
descricaoProduto,
idCombo
)
VALUES ('Batata pequena', 'Batata frita pequena', 1), ('Batata média', 'Batata frita média', 2), ('Batata grande', 'Batata frita grande', 3), ('Refrigerante', 'Refil de refrigerante', 1), ('Refrigerante', 'Refil de refrigerante', 2), ('Refrigerante', 'Refil de refrigerante', 3), ('Hamburger pequeno', 'Sanduiche simples pequeno com hamburger, queijo, alface, cebola e molho especial', 1), ('Hamburger médio', 'Sanduiche simples médio com hamburger, queijo, alface, cebola e molho especial', 2), ('Hamburger grande', 'Sanduiche simples grande com hamburger, queijo, alface, cebola e molho especial', 3),  ('Salada', 'Salada de alface com tomate e molho especial', 0);  

INSERT pedido 
(
quantidadeCombo,
dataPedido
)
VALUES (1, '2017-10-10'),  (1, '2017-01-10'), (1, '2017-05-02');

SELECT * FROM produto;

DELIMITER $
CREATE PROCEDURE adicaoItensdoCombo()
BEGIN
    CASE WHEN @idCombo = 1 THEN -- adicionar os itens do combo na tabela itensPedido
		
    -- verificar o id do combo da tabela pedido
    -- verificar a quantidade de itens do combo da tabela produto
    -- adicionar os itens do combo (considerando a quantidade) na tabela itensPedido
    
    DECLARE @idCombo INT, @quantCombo INT;
    
    INSERT itensPedido
    SELECT @idCombo = produto.idCombo, @quantCombo = pedido.quantidadeCombo
    FROM produto, pedido
    WHERE produto.idCombo = pedido.idCombo;
    
END

CREATE PROCEDURE calcularTotalCompra()
BEGIN
	DECLARE @valorTotalCompra INT;
    
    -- verificar todos os produtos da compra e combos e adicionar a soma na tabela itensPedido
END

DELIMITER ;
CALL calcularTotalCompra();

