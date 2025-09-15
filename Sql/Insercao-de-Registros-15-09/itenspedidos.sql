-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS desafio;
USE desafio;

-- Excluir a tabela se já existir
DROP TABLE IF EXISTS itens_pedidos;

-- Criar a tabela com tipos corretos
CREATE TABLE itens_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Inserir os dados
INSERT INTO itens_pedidos (pedido_id, produto_id, quantidade, preco_unitario) VALUES
    (1, 7, 3, 12.97),
    (2, 26, 1, 321.53),
    (3, 18, 5, 186.05),
    (4, 24, 5, 345.67),
    (5, 15, 2, 477.32),
    (6, 14, 1, 63.44),
    (7, 20, 3, 302.83),
    (8, 21, 1, 174.41),
    (9, 1, 1, 330.07),
    (10, 29, 1, 189.62),
    (11, 12, 2, 375.75),
    (12, 12, 2, 69.62),
    (13, 16, 3, 377.08),
    (14, 15, 3, 269.40),
    (15, 18, 1, 428.92),
    (16, 4, 3, 98.72),
    (17, 3, 1, 353.02),
    (18, 21, 5, 123.72),
    (19, 14, 2, 404.81),
    (20, 4, 1, 143.73),
    (21, 22, 1, 424.38),
    (22, 2, 2, 132.86),
    (23, 28, 4, 131.85),
    (24, 15, 2, 328.23),
    (25, 8, 1, 127.88),
    (26, 27, 2, 71.17),
    (27, 22, 4, 438.16),
    (28, 19, 3, 10.52),
    (29, 1, 1, 61.99),
    (30, 5, 4, 422.43);

-- Ver os dados inseridos
SELECT * FROM itens_pedidos;
