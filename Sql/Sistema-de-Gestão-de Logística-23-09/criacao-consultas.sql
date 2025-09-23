DROP DATABASE IF EXISTS sistema_logistica;

CREATE DATABASE sistema_logistica
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;
USE sistema_logistica;

-- Tabela Clientes
CREATE TABLE clientes (
    cnpj VARCHAR(18) NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    contato VARCHAR(200),
    status_pagamento ENUM('ativo','inadimplente','em_analise') DEFAULT 'ativo'
);

-- Tabela Motoristas
CREATE TABLE motoristas (
    cnh VARCHAR(20) NOT NULL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    telefone VARCHAR(30),
    situacao ENUM('ativo','suspenso','demitido') DEFAULT 'ativo'
);

-- Tabela Veiculos
CREATE TABLE veiculos (
    placa VARCHAR(12) NOT NULL PRIMARY KEY,
    modelo VARCHAR(120),
    ano SMALLINT,
    capacidade DECIMAL(9,2),
    status ENUM('disponivel','em_viagem','manutencao') DEFAULT 'disponivel'
);

-- Tabela Rotas
CREATE TABLE rotas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    origem VARCHAR(200),
    destino VARCHAR(200),
    distancia_km DECIMAL(9,2),
    prazo_horas INT
);

-- Tabela Funcionarios_Administrativos
CREATE TABLE funcionarios_adm (
    matricula VARCHAR(30) PRIMARY KEY,
    nome VARCHAR(200),
    setor VARCHAR(100),
    contato VARCHAR(100)
);

-- Tabela Entregas
CREATE TABLE entregas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_cnpj VARCHAR(18) NULL,
    motorista_cnh VARCHAR(20) NULL,
    veiculo_placa VARCHAR(12) NULL,
    rota_id INT NULL,
    data_saida DATETIME,
    previsao DATETIME,
    entrega_real DATETIME,
    status ENUM('planejada','em_andamento','concluida','cancelada') DEFAULT 'planejada',
    registrado_por VARCHAR(30) NULL,
    CONSTRAINT fk_entregas_cliente FOREIGN KEY (cliente_cnpj) REFERENCES clientes(cnpj) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_entregas_motorista FOREIGN KEY (motorista_cnh) REFERENCES motoristas(cnh) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_entregas_veiculo FOREIGN KEY (veiculo_placa) REFERENCES veiculos(placa) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_entregas_rota FOREIGN KEY (rota_id) REFERENCES rotas(id) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_entregas_registrado_por FOREIGN KEY (registrado_por) REFERENCES funcionarios_adm(matricula) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabela Ocorrencias
CREATE TABLE ocorrencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entrega_id INT NOT NULL,
    tipo VARCHAR(100),
    descricao TEXT,
    data_ocorrencia DATETIME,
    CONSTRAINT fk_ocorrencias_entrega FOREIGN KEY (entrega_id) REFERENCES entregas(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela Pagamentos
CREATE TABLE pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_cnpj VARCHAR(18) NULL,
    entrega_id INT NULL,
    valor DECIMAL(12,2),
    forma ENUM('dinheiro','cartao','boleto','pix','transferencia') DEFAULT 'boleto',
    status ENUM('pendente','pago','parcial','cancelado') DEFAULT 'pendente',
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamentos_cliente FOREIGN KEY (cliente_cnpj) REFERENCES clientes(cnpj) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_pagamentos_entrega FOREIGN KEY (entrega_id) REFERENCES entregas(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabela Frotas
CREATE TABLE frotas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120),
    setor VARCHAR(100),
    descricao TEXT
);


ALTER TABLE motoristas
  ADD COLUMN tipo ENUM('empregado','terceirizado') DEFAULT 'empregado';

ALTER TABLE veiculos
  ADD COLUMN frota_id INT NULL;
 
ALTER TABLE veiculos
  ADD CONSTRAINT fk_veiculos_frota FOREIGN KEY (frota_id) REFERENCES frotas(id) ON DELETE SET NULL ON UPDATE CASCADE;

CREATE INDEX idx_veiculos_placa ON veiculos(placa);
CREATE INDEX idx_motoristas_cnh ON motoristas(cnh);
CREATE INDEX idx_clientes_cnpj ON clientes(cnpj);
CREATE INDEX idx_entregas_status_data ON entregas(status, data_saida);
CREATE INDEX idx_pagamentos_status_data ON pagamentos(status, data_pagamento);

-- ////////////////////// --

SELECT e.id, e.status, e.data_saida, m.nome AS motorista, v.modelo AS veiculo, r.origem, r.destino
FROM entregas e
LEFT JOIN motoristas m ON e.motorista_cnh = m.cnh
LEFT JOIN veiculos v ON e.veiculo_placa = v.placa
LEFT JOIN rotas r ON e.rota_id = r.id
WHERE e.status = 'em_andamento';


SELECT c.cnpj, c.nome, COUNT(e.id) AS total_entregas
FROM clientes c
LEFT JOIN entregas e ON e.cliente_cnpj = c.cnpj
GROUP BY c.cnpj, c.nome
ORDER BY total_entregas DESC
LIMIT 20;


SELECT m.cnh, m.nome,
  COUNT(*) AS total_entregas,
  SUM(CASE WHEN e.entrega_real IS NOT NULL AND e.entrega_real > e.previsao THEN 1 ELSE 0 END) AS total_atrasos,
  ROUND(100 * SUM(CASE WHEN e.entrega_real IS NOT NULL AND e.entrega_real > e.previsao THEN 1 ELSE 0 END) / COUNT(*),2) AS perc_atraso
FROM motoristas m
JOIN entregas e ON e.motorista_cnh = m.cnh
WHERE e.previsao IS NOT NULL AND e.status = 'concluida'
GROUP BY m.cnh, m.nome
HAVING COUNT(*) >= 1
ORDER BY perc_atraso DESC;

SELECT v.placa, v.modelo, COUNT(e.id) AS qtd_entregas
FROM veiculos v
JOIN entregas e ON e.veiculo_placa = v.placa
WHERE e.data_saida >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY v.placa, v.modelo
ORDER BY qtd_entregas DESC;

SELECT r.id, r.origem, r.destino, COUNT(o.id) AS qtd_ocorrencias
FROM rotas r
LEFT JOIN entregas e ON e.rota_id = r.id
LEFT JOIN ocorrencias o ON o.entrega_id = e.id
GROUP BY r.id, r.origem, r.destino
ORDER BY qtd_ocorrencias DESC;

SELECT c.cnpj, c.nome, SUM(p.valor) AS total_devido, GROUP_CONCAT(DISTINCT p.id) AS pagamentos_pendentes
FROM clientes c
JOIN pagamentos p ON p.cliente_cnpj = c.cnpj
WHERE p.status = 'pendente'
GROUP BY c.cnpj, c.nome
HAVING total_devido > 0
ORDER BY total_devido DESC;

SELECT v.placa, v.modelo, ROUND(AVG(r.distancia_km),2) AS media_distancia_km, COUNT(e.id) AS qtd_entregas
FROM veiculos v
JOIN entregas e ON e.veiculo_placa = v.placa
JOIN rotas r ON e.rota_id = r.id
GROUP BY v.placa, v.modelo
ORDER BY media_distancia_km DESC;

SELECT f.matricula, f.nome, f.setor, COUNT(e.id) AS qtd_registros
FROM funcionarios_adm f
LEFT JOIN entregas e ON e.registrado_por = f.matricula
GROUP BY f.matricula, f.nome, f.setor
ORDER BY qtd_registros DESC;

SELECT DATE_FORMAT(e.entrega_real,'%Y-%m') AS mes, COUNT(*) AS total_concluidas
FROM entregas e
WHERE e.status = 'concluida' AND e.entrega_real IS NOT NULL
GROUP BY mes
ORDER BY mes DESC;

SELECT tipo, COUNT(*) AS qtd
FROM ocorrencias
GROUP BY tipo
ORDER BY qtd DESC;

SELECT cnh, nome, tipo
FROM motoristas
WHERE tipo = 'terceirizado';

SELECT forma, SUM(valor) AS total_recebido, COUNT(*) AS qtd_pagamentos
FROM pagamentos
WHERE status = 'pago'
GROUP BY forma
ORDER BY total_recebido DESC;

SELECT t.cnpj, t.nome, t.total_entregas, ROUND(t.total_pago / t.total_entregas,2) AS media_pago_por_entrega
FROM (
  SELECT c.cnpj, c.nome, COUNT(e.id) AS total_entregas,
    COALESCE(SUM(p.valor),0) AS total_pago
  FROM clientes c
  LEFT JOIN entregas e ON e.cliente_cnpj = c.cnpj
  LEFT JOIN pagamentos p ON p.cliente_cnpj = c.cnpj AND p.status='pago'
  GROUP BY c.cnpj, c.nome
) t
WHERE t.total_entregas >= 1
ORDER BY t.total_entregas DESC;

SELECT e.id AS entrega_id, c.nome AS cliente, m.nome AS motorista, r.origem, r.destino, o.tipo, o.descricao, o.data_ocorrencia
FROM ocorrencias o
JOIN entregas e ON o.entrega_id = e.id
LEFT JOIN clientes c ON e.cliente_cnpj = c.cnpj
LEFT JOIN motoristas m ON e.motorista_cnh = m.cnh
LEFT JOIN rotas r ON e.rota_id = r.id
ORDER BY o.data_ocorrencia DESC;

-- 15. Clientes com maior receita total.
SELECT c.cnpj, c.nome, SUM(p.valor) AS total_receita
FROM clientes c
JOIN pagamentos p ON p.cliente_cnpj = c.cnpj AND p.status='pago'
GROUP BY c.cnpj, c.nome
ORDER BY total_receita DESC
LIMIT 20;

SELECT e.id, e.data_saida, e.previsao, m.nome AS motorista, v.placa, r.origem, r.destino,
  TIMESTAMPDIFF(HOUR, e.previsao, NOW()) AS horas_atraso
FROM entregas e
LEFT JOIN motoristas m ON e.motorista_cnh = m.cnh
LEFT JOIN veiculos v ON e.veiculo_placa = v.placa
LEFT JOIN rotas r ON e.rota_id = r.id
WHERE e.previsao < NOW() AND e.entrega_real IS NULL AND e.status <> 'concluida';

SELECT c.cnpj, c.nome, ROUND(AVG(p.valor),2) AS media_valor_pago, COUNT(p.id) AS qtd_pagamentos
FROM clientes c
JOIN pagamentos p ON p.cliente_cnpj = c.cnpj AND p.status='pago'
GROUP BY c.cnpj, c.nome
ORDER BY media_valor_pago DESC;

SELECT v.placa, v.modelo,
  COUNT(e.id) AS qtd_entregas,
  ROUND(AVG(TIMESTAMPDIFF(MINUTE, e.previsao, e.entrega_real)),2) AS media_minutos_diferenca
FROM veiculos v
JOIN entregas e ON e.veiculo_placa = v.placa
WHERE e.entrega_real IS NOT NULL AND e.previsao IS NOT NULL
GROUP BY v.placa, v.modelo
HAVING qtd_entregas >= 1
ORDER BY media_minutos_diferenca DESC;

SELECT r.id, r.origem, r.destino, COUNT(e.id) AS qtd_entregas,
  ROUND(SUM(p.valor) / SUM(r.distancia_km),2) AS custo_medio_por_km
FROM rotas r
JOIN entregas e ON e.rota_id = r.id
JOIN pagamentos p ON p.entrega_id = e.id AND p.status='pago'
GROUP BY r.id, r.origem, r.destino
ORDER BY custo_medio_por_km DESC
LIMIT 10;

SELECT m.cnh, m.nome, COUNT(o.id) AS qtd_ocorrencias
FROM motoristas m
JOIN entregas e ON e.motorista_cnh = m.cnh
JOIN ocorrencias o ON o.entrega_id = e.id
GROUP BY m.cnh , m.nome
HAVING qtd_ocorrencias >= 1
ORDER BY qtd_ocorrencias DESC;




INSERT INTO clientes (cnpj, nome, contato, status_pagamento) VALUES
('00.000.000/0001-01','Transportes Alfa SA','contato@alfa.com.br | (11) 9999-0001','ativo'),
('11.111.111/0001-11','Logistica Brasil LTDA','financeiro@logbrasil.com','inadimplente'),
('22.222.222/0001-22','Mercado Norte Distribuidora','contato@mercadonorte.com','ativo'),
('33.333.333/0001-33','SuperVarejo S.A.','financeiro@supervarejo.com','ativo'),
('44.444.444/0001-44','Distribuidora Rio Sul','vendas@riosul.com.br','em_analise'),
('55.555.555/0001-55','EletroHome Comércio','contato@eletrohome.com','ativo'),
('66.666.666/0001-66','Construtora Delta','fiscal@deltaconstr.com','inadimplente'),
('77.777.777/0001-77','Farmacia Central Ltda','contato@farmacentral.com','ativo'),
('88.888.888/0001-88','Oficina AutoCenter','financeiro@autocenter.com','ativo'),
('99.999.999/0001-99','Loja Techshop','contato@techshop.com','ativo');

INSERT INTO motoristas (cnh, nome, telefone, situacao, tipo) VALUES
('CNH-0001','João Silva','(21) 99991-0001','ativo','empregado'),
('CNH-0002','Carlos Pereira','(21) 99991-0002','ativo','terceirizado'),
('CNH-0003','Marcos Souza','(11) 99992-0003','ativo','empregado'),
('CNH-0004','Fernando Lima','(61) 99993-0004','suspenso','empregado'),
('CNH-0005','Paula Ramos','(31) 99994-0005','ativo','terceirizado'),
('CNH-0006','Ricardo Alves','(41) 99995-0006','ativo','empregado'),
('CNH-0007','Ana Costa','(51) 99996-0007','ativo','terceirizado'),
('CNH-0008','Roberto Dias','(71) 99997-0008','ativo','empregado');

INSERT INTO veiculos (placa, modelo, ano, capacidade, status) VALUES
('ABC1D23','Volvo FH',2018,18000,'disponivel'),
('BCD2E34','Mercedes Actros',2019,17000,'em_viagem'),
('CDE3F45','Iveco Stralis',2017,15000,'manutencao'),
('DEF4G56','Volks 24-250',2016,12000,'disponivel'),
('EFG5H67','Scania R440',2020,20000,'disponivel'),
('FGH6I78','Hyundai HR',2021,3500,'em_viagem'),
('GHI7J89','Ford Cargo 2429',2015,10000,'disponivel'),
('HIJ8K90','Renault Master',2022,3000,'disponivel');

INSERT INTO frotas (nome, setor, descricao) VALUES
('Frota Nordeste','Norte/Nordeste','Veiculos para rotas do nordeste'),
('Frota Sudoeste','Sudeste/Sul','Veiculos para clientes do sudeste e sul');

UPDATE veiculos SET frota_id = 1 WHERE placa IN ('ABC1D23','BCD2E34');
UPDATE veiculos SET frota_id = 2 WHERE placa IN ('EFG5H67','GHI7J89');

INSERT INTO rotas (id, origem, destino, distancia_km, prazo_horas) VALUES
(1,'São Paulo - SP','Rio de Janeiro - RJ',430.00,6),
(2,'Belo Horizonte - MG','Salvador - BA',1500.00,20),
(3,'Brasília - DF','Goiânia - GO',200.00,3),
(4,'Porto Alegre - RS','Curitiba - PR',710.00,10),
(5,'Manaus - AM','Belém - PA',1000.00,14),
(6,'Fortaleza - CE','Recife - PE',650.00,9),
(7,'Campinas - SP','São José dos Campos - SP',95.00,2),
(8,'Contagem - MG','Uberlândia - MG',420.00,6);

INSERT INTO funcionarios_adm (matricula, nome, setor, contato) VALUES
('MATR-001','Luciana Souza','Operacoes','luciana@empresa.com.br'),
('MATR-002','Andre Gomes','Financeiro','andre@empresa.com.br'),
('MATR-003','Patricia Alves','Agendamento','patricia@empresa.com.br'),
('MATR-004','Felipe Rocha','Qualidade','felipe@empresa.com.br');

INSERT INTO entregas (id, cliente_cnpj, motorista_cnh, veiculo_placa, rota_id, data_saida, previsao, entrega_real, status, registrado_por) VALUES
(1,'00.000.000/0001-01','CNH-0001','ABC1D23',1,'2025-09-01 06:00:00','2025-09-01 12:00:00','2025-09-01 11:30:00','concluida','MATR-001'),
(2,'11.111.111/0001-11','CNH-0002','BCD2E34',2,'2025-08-10 07:00:00','2025-08-11 03:00:00',NULL,'em_andamento','MATR-002'),
(3,'22.222.222/0001-22','CNH-0003','CDE3F45',3,'2025-07-15 09:00:00','2025-07-15 12:00:00','2025-07-15 13:30:00','concluida','MATR-003'),
(4,'33.333.333/0001-33','CNH-0004','DEF4G56',4,'2025-09-10 04:00:00','2025-09-10 14:00:00',NULL,'em_andamento','MATR-001'),
(5,'44.444.444/0001-44','CNH-0005','EFG5H67',5,'2025-08-01 05:00:00','2025-08-02 19:00:00','2025-08-02 20:30:00','concluida','MATR-002'),
(6,'55.555.555/0001-55','CNH-0006','FGH6I78',6,'2025-09-11 10:00:00','2025-09-11 19:00:00',NULL,'em_andamento','MATR-003'),
(7,'66.666.666/0001-66','CNH-0007','GHI7J89',7,'2025-06-20 08:00:00','2025-06-20 10:00:00','2025-06-20 10:00:00','concluida','MATR-004'),
(8,'77.777.777/0001-77','CNH-0008','HIJ8K90',8,'2025-07-02 05:30:00','2025-07-02 11:30:00','2025-07-02 12:45:00','concluida','MATR-001'),
(9,'88.888.888/0001-88','CNH-0001','ABC1D23',1,'2025-09-12 06:00:00','2025-09-12 12:00:00',NULL,'em_andamento','MATR-003'),
(10,'99.999.999/0001-99','CNH-0002','BCD2E34',2,'2025-05-10 07:00:00','2025-05-11 03:00:00','2025-05-11 01:50:00','concluida','MATR-002'),
(11,'00.000.000/0001-01','CNH-0003','CDE3F45',3,'2025-04-15 09:00:00','2025-04-15 12:00:00','2025-04-15 12:05:00','concluida','MATR-002'),
(12,'11.111.111/0001-11','CNH-0004','DEF4G56',4,'2025-03-18 04:00:00','2025-03-18 14:00:00','2025-03-18 15:30:00','concluida','MATR-001'),
(13,'22.222.222/0001-22','CNH-0005','EFG5H67',5,'2025-02-01 05:00:00','2025-02-02 19:00:00','2025-02-02 21:00:00','concluida','MATR-001'),
(14,'33.333.333/0001-33','CNH-0006','FGH6I78',6,'2025-05-11 10:00:00','2025-05-11 19:00:00','2025-05-11 19:45:00','concluida','MATR-004'),
(15,'44.444.444/0001-44','CNH-0007','GHI7J89',7,'2025-09-14 08:00:00','2025-09-14 10:00:00',NULL,'em_andamento','MATR-002'),
(16,'55.555.555/0001-55','CNH-0008','HIJ8K90',8,'2025-01-02 05:30:00','2025-01-02 11:30:00','2025-01-02 11:00:00','concluida','MATR-003'),
(17,'66.666.666/0001-66','CNH-0001','ABC1D23',1,'2025-09-05 06:00:00','2025-09-05 12:00:00',NULL,'em_andamento','MATR-001'),
(18,'77.777.777/0001-77','CNH-0002','BCD2E34',2,'2025-07-20 07:00:00','2025-07-21 03:00:00','2025-07-21 04:10:00','concluida','MATR-002'),
(19,'88.888.888/0001-88','CNH-0003','CDE3F45',3,'2025-08-20 09:00:00','2025-08-20 12:00:00','2025-08-20 11:59:00','concluida','MATR-004');

INSERT INTO ocorrencias (id, entrega_id, tipo, descricao, data_ocorrencia) VALUES
(1,2,'atraso','Trânsito intenso na rodovia; previsão de atraso','2025-08-10 14:30:00'),
(2,4,'problema_mecanico','Falha na bomba de combustível','2025-09-10 08:15:00'),
(3,5,'acidente','Colisão traseira leve; sem vítimas','2025-08-02 17:30:00'),
(4,9,'roubo','Carga violada durante parada não autorizada','2025-09-12 08:45:00'),
(5,14,'problema_mecanico','Pneu estourado, substituição necessária','2025-03-18 09:00:00'),
(6,16,'atraso','Obras na pista provocaram desvio','2025-01-02 06:30:00'),
(7,11,'atraso','Fila de embarque no terminal','2025-04-15 10:05:00'),
(8,17,'acidente','Capotamento leve; carga avariada','2025-09-05 09:20:00'),
(9,19,'extravio','Volume extraviado entre baldeação','2025-08-20 10:40:00'),
(10,6,'atraso','Condições climáticas adversas','2025-09-11 15:00:00');

INSERT INTO pagamentos (id, cliente_cnpj, entrega_id, valor, forma, status, data_pagamento) VALUES
(1,'00.000.000/0001-01',1,1250.00,'transferencia','pago','2025-09-02 10:00:00'),
(2,'11.111.111/0001-11',2,4200.00,'boleto','pendente',NULL),
(3,'22.222.222/0001-22',3,980.00,'pix','pago','2025-07-16 09:00:00'),
(4,'33.333.333/0001-33',4,2200.00,'cartao','parcial','2025-09-11 18:00:00'),
(5,'44.444.444/0001-44',5,3000.00,'transferencia','pago','2025-08-03 11:00:00'),
(6,'55.555.555/0001-55',6,750.00,'boleto','pendente',NULL),
(7,'66.666.666/0001-66',7,1100.00,'pix','pago','2025-06-21 08:00:00'),
(8,'77.777.777/0001-77',8,640.00,'cartao','pago','2025-07-02 13:00:00'),
(9,'88.888.888/0001-88',9,2100.00,'pix','pendente',NULL),
(10,'99.999.999/0001-99',10,4200.00,'transferencia','pago','2025-05-12 10:30:00'),
(11,'00.000.000/0001-01',11,950.00,'pix','pago','2025-04-16 14:00:00'),
(12,'11.111.111/0001-11',12,1800.00,'boleto','pago','2025-03-20 09:00:00'),
(13,'22.222.222/0001-22',13,1250.00,'pix','pago','2025-02-03 12:00:00'),
(14,'33.333.333/0001-33',14,500.00,'cartao','pago','2025-03-19 15:30:00');