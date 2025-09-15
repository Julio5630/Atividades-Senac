-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS desafio;
USE desafio;

-- Criar a tabela categorias sem restrição UNIQUE na coluna descricao
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Inserir os dados
INSERT INTO categorias (nome, descricao) VALUES
    ('Roupas', 'Categoria de roupas'),
    ('Esportes', 'Categoria de esportes'),
    ('Livros', 'Categoria de livros'),
    ('Roupas', 'Categoria de roupas'),
    ('Roupas', 'Categoria de roupas'),
    ('Roupas', 'Categoria de roupas'),
    ('Livros', 'Categoria de livros'),
    ('Roupas', 'Categoria de roupas'),
    ('Esportes', 'Categoria de esportes'),
    ('Roupas', 'Categoria de roupas'),
    ('Roupas', 'Categoria de roupas'),
    ('Eletrônicos', 'Categoria de eletrônicos'),
    ('Eletrônicos', 'Categoria de eletrônicos'),
    ('Eletrônicos', 'Categoria de eletrônicos'),
    ('Livros', 'Categoria de livros'),
    ('Eletrônicos', 'Categoria de eletrônicos'),
    ('Livros', 'Categoria de livros'),
    ('Eletrônicos', 'Categoria de eletrônicos'),
    ('Eletrônicos', 'Categoria de eletrônicos'),
    ('Eletrônicos', 'Categoria de eletrônicos'),
    ('Esportes', 'Categoria de esportes'),
    ('Eletrônicos', 'Categoria de eletrônicos'),
    ('Eletrônicos', 'Categoria de eletrônicos'),
    ('Eletrônicos', 'Categoria de eletrônicos'),
    ('Brinquedos', 'Categoria de brinquedos'),
    ('Eletrônicos', 'Categoria de eletrônicos'),
    ('Roupas', 'Categoria de roupas'),
    ('Brinquedos', 'Categoria de brinquedos'),
    ('Livros', 'Categoria de livros'),
    ('Esportes', 'Categoria de esportes');

-- Consultar os dados
SELECT * FROM categorias;
