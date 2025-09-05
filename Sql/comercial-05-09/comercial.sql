CREATE DATABASE comercial;
USE comercial;

-- criação da tabela Clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20)
);

-- criação da tabela Produtos
CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);

INSERT INTO Clientes (nome, email, telefone) VALUES
('João Silva', 'joao.silva@email.com', '11987654321'),
('Maria Oliveira', 'maria.oliveira@email.com', '21912345678'),
('Pedro Souza', 'pedro.souza@email.com', '31998877665'),
('Ana Santos', 'ana.santos@email.com', '41976543210'),
('Carlos Lima', 'carlos.lima@email.com', '51987654321');

INSERT INTO Produtos (nome_produto, descricao, preco, estoque) VALUES
('Notebook Gamer', 'Notebook de alta performance para jogos.', 7500.00, 50),
('Mouse Sem Fio', 'Mouse ergonômico com conexão sem fio.', 150.50, 200),
('Teclado Mecânico', 'Teclado com switches mecânicos para digitação e jogos.', 450.00, 120),
('Monitor LED 27"', 'Monitor com tela de 27 polegadas e resolução Full HD.', 1200.00, 80),
('Webcam Full HD', 'Webcam com microfone embutido e vídeo em 1080p.', 250.75, 150);