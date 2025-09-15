-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS desafio;
USE desafio;

-- Excluir a tabela se já existir
DROP TABLE IF EXISTS pedidos;

-- Criar a tabela pedidos com os tipos corretos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    total DECIMAL(10,2),
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Inserir os dados (com NOW() sem aspas)
INSERT INTO pedidos (cliente_id, data_pedido, status, total) VALUES
    (11, NOW(), 'Cancelado', 905.56),
    (10, NOW(), 'Cancelado', 598.73),
    (30, NOW(), 'Pago', 886.63),
    (2, NOW(), 'Enviado', 1035.27),
    (25, NOW(), 'Enviado', 277.50),
    (5, NOW(), 'Pago', 382.46),
    (14, NOW(), 'Pago', 1920.37),
    (16, NOW(), 'Enviado', 1434.43),
    (5, NOW(), 'Cancelado', 496.18),
    (29, NOW(), 'Enviado', 446.04),
    (3, NOW(), 'Pendente', 1753.79),
    (5, NOW(), 'Enviado', 1660.60),
    (19, NOW(), 'Pago', 1368.96),
    (30, NOW(), 'Cancelado', 1617.92),
    (10, NOW(), 'Cancelado', 264.76),
    (23, NOW(), 'Enviado', 1837.31),
    (17, NOW(), 'Pendente', 1349.90),
    (28, NOW(), 'Pendente', 428.79),
    (2, NOW(), 'Pago', 1355.04),
    (14, NOW(), 'Pendente', 516.55),
    (8, NOW(), 'Pago', 1595.22),
    (17, NOW(), 'Enviado', 180.61),
    (24, NOW(), 'Enviado', 1046.39),
    (10, NOW(), 'Enviado', 1975.38),
    (11, NOW(), 'Cancelado', 542.86),
    (6, NOW(), 'Enviado', 496.28),
    (25, NOW(), 'Enviado', 1806.96),
    (13, NOW(), 'Pendente', 1663.17),
    (11, NOW(), 'Enviado', 945.72),
    (28, NOW(), 'Pendente', 1646.93);

-- Verificar os dados inseridos
SELECT * FROM pedidos;
