-- Criando arquivo
create database ecommerce;
-- Acessando arquivo
use ecommerce;
-- Criado tabelas
-- Create the database schema
CREATE TABLE usuarios (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    senha VARCHAR(255),
    celular VARCHAR(255),
    cpf VARCHAR(14) UNIQUE,
    criado_em TIMESTAMP
);

CREATE TABLE enderecos (
    id INT PRIMARY KEY,
    cliente_id INT,
    rua VARCHAR(255),
    numero VARCHAR(50),
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    estado VARCHAR(2),
    cep VARCHAR(10)
);

CREATE TABLE categorias (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT
);

CREATE TABLE produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao TEXT,
    preco DECIMAL(10, 2),
    estoque INT,
    categoria_id INT
);

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido TIMESTAMP,
    status VARCHAR(50),
    total DECIMAL(10, 2)
);

CREATE TABLE itens_pedido (
    id INT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2)
);
-- Índices para otimizar buscas e junções
CREATE INDEX idx_enderecos_cliente_id ON enderecos (cliente_id);
CREATE INDEX idx_produtos_categoria_id ON produtos (categoria_id);
CREATE INDEX idx_pedidos_cliente_id ON pedidos (cliente_id);
CREATE INDEX idx_itens_pedido_pedido_id ON itens_pedido (pedido_id);
CREATE INDEX idx_itens_pedido_produto_id ON itens_pedido (produto_id);
-- Chaves Estrangeiras para garantir a integridade referencial
ALTER TABLE enderecos
ADD CONSTRAINT fk_enderecos_cliente_id FOREIGN KEY (cliente_id) REFERENCES usuarios(id);

ALTER TABLE produtos
ADD CONSTRAINT fk_produtos_categoria_id FOREIGN KEY (categoria_id) REFERENCES categorias(id);

ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_cliente_id FOREIGN KEY (cliente_id) REFERENCES usuarios(id);

ALTER TABLE itens_pedido
ADD CONSTRAINT fk_itens_pedido_pedido_id FOREIGN KEY (pedido_id) REFERENCES pedidos(id);

ALTER TABLE itens_pedido
ADD CONSTRAINT fk_itens_pedido_produto_id FOREIGN KEY (produto_id) REFERENCES produtos(id);