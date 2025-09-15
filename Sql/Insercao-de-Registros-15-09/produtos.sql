-- Criar o banco de dados (se não existir)
CREATE DATABASE IF NOT EXISTS desafio;
USE desafio;

-- Excluir a tabela se ela já existir
DROP TABLE IF EXISTS produtos;

-- Criar a tabela produtos com os tipos corretos
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT,
    categoria_id INT,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Inserir os dados
INSERT INTO produtos (nome, descricao, preco, estoque, categoria_id) VALUES
    ('Blanditiis', 'Earun consectetur ut adipisci.', 291.33, 62, 3),
    ('Culpa', 'Iure asperiores cupiditate et maiores possimus.', 813.10, 30, 4),
    ('Ipsam', 'Recusandae vel saepe doloribus et.', 734.41, 80, 3),
    ('Cum', 'Nostrum incidunt maiores.', 715.79, 15, 5),
    ('Vel', 'Placet veniam enim.', 628.13, 58, 5),
    ('Recusandae', 'Deleniti distinctio neque sit assumenda dolore natus sit.', 370.25, 45, 1),
    ('Asperiores', 'Dolor modi omnis maiores alias.', 226.26, 7, 4),
    ('Ipsam', 'Cumque assumenda excepturi at.', 837.26, 27, 4),
    ('Vero', 'Adipisci sequi laboriosam nostrum recusandae ipsum ducimus pariatur.', 989.69, 3, 2),
    ('Aliquam', 'Id fugit nam nulla animi occaecati.', 30.71, 7, 3),
    ('Sequi', 'Corrupti itaque labore necessitatibus maxime id.', 430.21, 77, 3),
    ('Consequatur', 'Dicta alias ipsa hic numquam.', 262.96, 57, 4),
    ('Error', 'Tempora harum sunt veniam pariatur ut quaerat.', 409.99, 89, 5),
    ('Dignissimos', 'Reprehenderit aliquid dignissimos eos debitis provident corrupti.', 240.34, 2, 2),
    ('Cumque', 'Saepe dolor nobis assumenda officia.', 35.03, 71, 1),
    ('Non', 'Occaecati suscipit eum id assumenda nemo.', 261.35, 21, 4),
    ('Doloremque', 'Error dolore maxime distinctio minus optio.', 415.93, 70, 2),
    ('Iure', 'Numquam error placeat repellendus reiciendis nam odio.', 107.83, 70, 4),
    ('Corrupti', 'Atque itaque ipsa totam consectetur alias.', 402.05, 49, 4),
    ('Natus', 'Molestias optio libero quae nostrum cum eveniet.', 836.20, 51, 4),
    ('Doloremque', 'Excepturi ullam assumenda eaque.', 856.47, 75, 1),
    ('Distinctio', 'Exercitationem consequuntur incidunt deserunt voluptatibus quasi provident.', 37.15, 88, 5),
    ('Eligendi', 'Amet asperiores inventore adipisci.', 667.17, 43, 2),
    ('Facere', 'Maxime commodi ad nam tenetur nobis.', 305.24, 78, 4),
    ('Nemo', 'Saepe accusamus repellendus eligendi ullam deleniti minima.', 289.29, 19, 1),
    ('Ab', 'Nostrum vel harum eius sed.', 384.87, 33, 2),
    ('Occaecati', 'Corrupti expedita ea minima.', 951.24, 63, 4),
    ('Dolorum', 'Ducimus eos vitae debitis iusto possimus nesciunt architecto.', 880.57, 61, 5),
    ('Provident', 'Quam eaque error modi dolores expedita totam.', 465.19, 0, 5),
    ('Ratione', 'Fuga illum fugiat nisi optio veniam soluta.', 65.21, 27, 4);

-- Ver os dados inseridos
SELECT * FROM produtos;
