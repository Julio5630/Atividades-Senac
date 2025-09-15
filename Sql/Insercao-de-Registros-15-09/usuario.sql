-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS desafio;
USE desafio;

-- Deleta a tabela se já existir (boa prática para evitar erros em desenvolvimento)
DROP TABLE IF EXISTS usuario;

-- Criar a tabela usuario
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(50) NOT NULL,
    celular VARCHAR(50),
    cpf VARCHAR(50),
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Inserir dados válidos na tabela 'usuario'
INSERT INTO usuario (nome, email, senha, celular, cpf, criado_em) VALUES
('Breno Garcia', 'alexia96@example.net', 't2D3s9Q4f', '(88) 8901-5134', '817.432.695-28', NOW()),
('Brayan Barbosa', 'barboza@example.net', 'jsl2gU8H', '(55) 6 6638-5493', '862.791.835-26', NOW()),
('Iliam Ferreira', 'osousa@example.com', 'n0i2D5Q4', '71 7271 5411', '563.871.264-62', NOW()),
('Arthur Miguel Montenegro', 'luiz-otaviofreitas@example.net', 'y5z8P8Q9i', '55 553 1624', '588.542.937-68', NOW()),
('Caul Pastor', 'ana-ceciliaria@example.org', 'u5k1bCaC1', '598-951-4206', '786.419.182-62', NOW()),
('Sophia Albuquerque', 'apollofonseca@example.org', 's8d3eRf5p', '(4816) 695 5965', '755.126.389-46', NOW()),
('Stella Nascimento', 'herry-rodrigoalmeida@example.org', 'p7_q6qf_V', '(55) 0881 2817', '743.511.756-17', NOW()),
('João Guilherme Monteiro', 'ricardimont@example.com', 'w7eR4h65t', '(084) 7553 8162', '984.678.100-15', NOW()),
('Sr. Gustavo Henrique Sales', 'isabel82@example.com', 'uNalU5yN', '(053) 9396-9974', '838.674.295-39', NOW()),
('Thales Albuquerque', 'natali3@example.com', 'y56T7h7k', '0880-518-2385', '489.655.792-38', NOW()),
('Giovanna Rios', 'fernanda@example.org', 'j5igD5hN', '8441-9464-9861', '842.367.505-96', NOW()),
('Valentina Barbosa', 'camaralaixe@example.org', 'c9eN9uR5i', '51 9382 3598', '518.427.965-03', NOW()),
('Valentim Brito', 'mayra08@example.net', 'i2D3g5rV', '0508 135 3757', '179.615.208-21', NOW()),
('Diogo Ribeiro', 'abreausama@example.org', 'cwo9rghF8', '(081) 6698-2753', '629.083.751-48', NOW()),
('Arthur da Cunha', 'portobruna@example.net', '2xDhf9g3', '0859 9259-7862', '952.846.391-89', NOW()),
('Derci Lucas Arajo', 'e4c8h5w5@example.net', 'uxA92hG9Z', '84 6615 4642', '357.096.824-21', NOW()),
('Diogo Vargas', 'bernardo@example.com', 'a3t4uQ93D', '0388-886-2826', '169.157.382-46', NOW()),
('Maria Helena Vieira', 'maria-alice1@example.net', 'b9d1yT9f', '0729-587-2380', '978.105.939-76', NOW()), -- Corrigido CPF
('Levi Moreira', 'calebcapo@example.com', 'b1j8tG46h', '55 (82) 1134 0008', '469.375.522-55', NOW()),
('Helena Fomes', 'helenaf@example.net', 'y5J2hC5s', '61 9558 8396', '836.196.745-57', NOW()),
('Kevin Montenegro', 'mandiradoran@example.org', 'u9UKfCKY9', '41 8984 4927', '427.955.061-87', NOW()),
('Luna Pastor', 'ceciliaalvez@example.org', 'a3t9g4qR', '(031) 9855 6865', '234.376.145-66', NOW()),
('Dra. Lavinia das Neves', 'oda-mota@example.org', 's5Q2h_8W', '55 (81) 4800 3477', '281.451.876-44', NOW()),
('Pietra Caldeira', 'mascellac@example.net', '8w4c5sD4s', '9398-338-939', '659.542.872-40', NOW()),
('Lucas Caldeira', 'vascaconstantino@example.net', 'h4q4w5rD', '55 11 6139 8519', '572.388.483-20', NOW()),
('Miguel de Cabo', 'yroche@example.com', 'v5K4tU8H', '0500 8558 157', '329.628.794-87', NOW()),
('Carlos Souza', 'juandana@example.org', 'O3s5K1t8i', '(014) 9348 48124', '683.927.548-00', NOW()), -- Nome corrigido
('Luis Lima', 'jimentolima@example.com', 'a9d9s8iW', '51 2937 9712', '588.481.653-60', NOW()),
('Deirdo Luiz Borges', 'alansilomera@example.net', 'yM9jHsW8h', '55 41 6894 2867', '486.515.791-08', NOW()),
('Leandro Almeida', 'henriquedg@example.com', 'DH9S3hA7H', '84 8593-9784', '872.432.851-44', NOW());

-- Verificar os dados
SELECT * FROM usuario;
