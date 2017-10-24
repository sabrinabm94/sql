CREATE DATABASE mcDonalds
USE mcDonalds

CREATE TABLE produto (
idProduto INT IDENTITY PRIMARY KEY,
nomeProduto VARCHAR(20),
descricaoProduto VARCHAR(100),
idCombo INT
)

CREATE TABLE pedido (
idPedido INT IDENTITY PRIMARY KEY,
quantidadeCombo INT,
dataPedido DATE,
)

CREATE TABLE itensPedido (
idPedido INT,
quantidadeCombo INT,
idProduto INT,
nomeProduto VARCHAR(20),
descricaoProduto VARCHAR(100),
CONSTRAINT idPedidoidItem PRIMARY KEY (idPedido, idProduto),
)

ALTER TABLE itensPedido ADD FOREIGN KEY(idPedido) REFERENCES pedido (idPedido);
ALTER TABLE itensPedido ADD FOREIGN KEY(quantidadeCombo) REFERENCES pedido (quantidadeCombo);
ALTER TABLE itensPedido ADD FOREIGN KEY(idProduto) REFERENCES produto (idProduto);
ALTER TABLE itensPedido ADD FOREIGN KEY(nomeProduto) REFERENCES produto (nomeProduto);
ALTER TABLE itensPedido ADD FOREIGN KEY(descricaoProduto) REFERENCES produto (descricaoProduto);

INSERT dbo.produto 
(
nomeProduto,
descricaoProduto,
idCombo
)
VALUES ('Batata pequena', 'Batata frita pequena', 1), ('Batata média', 'Batata frita média', 2), ('Batata grande', 'Batata frita grande', 3), ('Refrigerante', 'Refil de refrigerante', 1), ('Refrigerante', 'Refil de refrigerante', 2), ('Refrigerante', 'Refil de refrigerante', 3), ('Hamburger pequeno', 'Sanduiche simples pequeno com hamburger, queijo, alface, cebola e molho especial', 1), ('Hamburger médio', 'Sanduiche simples médio com hamburger, queijo, alface, cebola e molho especial', 2), ('Hamburger grande', 'Sanduiche simples grande com hamburger, queijo, alface, cebola e molho especial', 3),  ('Salada', 'salada de alface com tomate e molho especial', 0)  

INSERT dbo.pedido 
(
quantidadeCombo,
dataPedido
)
VALUES (1, '10/10/2017'),  (1, '05/10/2017'), (1, '08/10/2017')

INSERT dbo.itensPedido 
(
idPedido,
quantidadeCombo,
idProduto,
nomeProduto,
descricaoProduto
)
VALUES (1, 1, 1), (2, 4, 7), (3, 5, 8)

SELECT * FROM produto 

--Procedure: cadastrar pedido

CREATE PROCEDURE CadastrosItensCombo()
BEGIN
	-- if combo == 1 {adiciona os itens no pedido}
END

--Trigger cadastrar intens pedido