-- #################################################################
-- #                       MÓDULO BÁSICO E DDL                     #
-- #################################################################

-- Criação do Banco de Dados e Seleção
CREATE DATABASE IF NOT EXISTS eventos;
USE eventos;

-- Criação da tabela Eventos
CREATE TABLE IF NOT EXISTS Eventos (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    local VARCHAR(255) NOT NULL,
    data_evento DATE NOT NULL,
    vagas_totais INT NOT NULL,
    vagas_disponiveis INT NOT NULL,
    CONSTRAINT chk_vagas_nao_negativas CHECK (vagas_disponiveis >= 0)
);

-- Criação da tabela Participantes
CREATE TABLE IF NOT EXISTS Participantes (
    id_participante INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Criação da tabela Palestras
CREATE TABLE IF NOT EXISTS Palestras (
    id_palestra INT PRIMARY KEY AUTO_INCREMENT,
    id_evento INT NOT NULL,
    nome_palestrante VARCHAR(255) NOT NULL,
    duracao_minutos INT NOT NULL,
    CONSTRAINT fk_palestras_eventos FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento)
);

-- Criação da tabela Inscricoes (Com restrição de chave única para evitar duplicidade de inscrição)
CREATE TABLE IF NOT EXISTS Inscricoes (
    id_inscricao INT PRIMARY KEY AUTO_INCREMENT,
    id_participante INT NOT NULL,
    id_evento INT NOT NULL,
    data_inscricao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_inscricoes_participantes FOREIGN KEY (id_participante) REFERENCES Participantes(id_participante),
    CONSTRAINT fk_inscricoes_eventos FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento),
    CONSTRAINT uk_inscricao_unica UNIQUE (id_participante, id_evento)
);

-- #################################################################
-- #                       INSERÇÃO DE DADOS                       #
-- #################################################################

-- 50 Linhas para Eventos
INSERT INTO Eventos (nome, local, data_evento, vagas_totais, vagas_disponiveis) VALUES
('Conferência de IA 2025', 'Auditório Principal', '2025-04-10', 500, 350),
('Workshop de Devops Prático', 'Sala 201', '2025-05-20', 150, 50),
('Fórum de Cibersegurança', 'Centro de Convenções', '2025-06-01', 800, 780),
('Seminário de Banco de Dados NoSQL', 'Sala de Reuniões A', '2025-07-15', 100, 10),
('Feira de Tecnologia Sustentável', 'Pavilhão de Exposições', '2025-08-05', 1200, 1150),
('Encontro de UX/UI Designers', 'Sala 305', '2025-09-12', 200, 195),
('Hackathon de Inovação', 'Espaço Colaborativo', '2025-10-25', 100, 0),
('Congresso Internacional de Software', 'Grande Teatro', '2025-11-03', 1500, 1450),
('Meetup de Python e Django', 'Sala de Aula 1', '2025-12-08', 80, 75),
('Lançamento de Produto Tech', 'Sala VIP', '2026-01-20', 50, 45),
('Web Summit Local', 'Centro de Eventos B', '2026-02-14', 1000, 900),
('Treinamento em Cloud Computing', 'Sala de Treinamento', '2026-03-22', 75, 60),
('Simpósio de IoT', 'Auditório Azul', '2026-04-05', 300, 290),
('Jornada de Engenharia de Dados', 'Sala 404', '2026-05-18', 120, 110),
('Encontro de Startups', 'Incubadora Tech', '2026-06-30', 400, 350),
('Conferência de JavaScript', 'Auditório Principal', '2026-07-10', 600, 450),
('Workshop de Produtividade', 'Sala 102', '2026-08-01', 90, 85),
('Semana de Game Design', 'Lab de Criação', '2026-09-19', 110, 100),
('Fórum de Tecnologias Emergentes', 'Centro de Exposições C', '2026-10-15', 700, 680),
('Meetup de Rust Language', 'Sala de Reuniões B', '2026-11-29', 60, 58),
('Cúpula de Liderança Tech', 'Sala Presidencial', '2026-12-10', 40, 35),
('Maratona de Programação', 'Ginásio de Esportes', '2027-01-05', 200, 150),
('Encontro de Mulheres na Tech', 'Auditório Verde', '2027-02-08', 250, 240),
('Bootcamp de Full Stack', 'Sala de Treinamento B', '2027-03-17', 50, 20),
('Conferência de Realidade Virtual', 'Espaço 3D', '2027-04-24', 350, 340),
('Workshop de SEO e Marketing Digital', 'Sala 101', '2027-05-07', 80, 70),
('Seminário de Computação Quântica', 'Laboratório Avançado', '2027-06-18', 30, 30),
('Feira de Robótica', 'Pavilhão de Ciências', '2027-07-29', 1000, 950),
('Meetup de Elixir', 'Sala de Coworking', '2027-08-14', 40, 38),
('Congresso de Mobile Development', 'Auditório Laranja', '2027-09-01', 450, 420),
('Fórum de Open Source', 'Sala Comunitária', '2027-10-10', 180, 170),
('Jantar de Networking Tech', 'Restaurante Exclusivo', '2027-11-05', 50, 50),
('Apresentação de Teses em TI', 'Sala de Defesas', '2027-12-15', 60, 55),
('Retrospectiva Anual de Tecnologia', 'Auditório Principal', '2028-01-02', 500, 490),
('Curso Rápido de Git e GitHub', 'Sala 202', '2028-02-19', 70, 65),
('Simpósio de Bioinformática', 'Laboratório de Biologia', '2028-03-25', 130, 120),
('Encontro de Administradores de Redes', 'Sala de Servidores', '2028-04-09', 90, 80),
('Workshop de Kubernetes', 'Sala 301', '2028-05-14', 110, 100),
('Conferência de Ethical Hacking', 'Auditório Preto', '2028-06-21', 300, 250),
('Feira de Empregos em TI', 'Pavilhão Principal', '2028-07-07', 1500, 1400),
('Seminário de Machine Learning', 'Sala 401', '2028-08-18', 200, 180),
('Meetup de PHP', 'Sala de Programação', '2028-09-23', 60, 50),
('Fórum de Inclusão Digital', 'Auditório Social', '2028-10-04', 400, 390),
('Treinamento de Liderança Ágil', 'Sala de Coaching', '2028-11-11', 80, 75),
('Jornada de AR/VR', 'Espaço Imersivo', '2028-12-05', 150, 140),
('Conferência de Big Data', 'Grande Auditório D', '2029-01-15', 700, 650),
('Workshop de Design Thinking', 'Sala de Criação', '2029-02-28', 90, 85),
('Simpósio de Blockchain', 'Sala de Teses', '2029-03-10', 200, 195),
('Encontro de Analistas de Sistemas', 'Sala 103', '2029-04-20', 120, 115),
('Hackathon de Saúde Digital', 'Laboratório Médico', '2029-05-05', 100, 90);

-- 100 Linhas para Participantes
INSERT INTO Participantes (nome, email) VALUES
('Ana Silva', 'ana.silva@email.com'), ('Bruno Santos', 'bruno.santos@email.com'),
('Carla Oliveira', 'carla.oliveira@email.com'), ('Daniel Pereira', 'daniel.pereira@email.com'),
('Erica Costa', 'erica.costa@email.com'), ('Felipe Almeida', 'felipe.almeida@email.com'),
('Giovana Rocha', 'giovana.rocha@email.com'), ('Hugo Lima', 'hugo.lima@email.com'),
('Isabela Fernandes', 'isabela.fernandes@email.com'), ('João Ribeiro', 'joao.ribeiro@email.com'),
('Kelly Souza', 'kelly.souza@email.com'), ('Lucas Martins', 'lucas.martins@email.com'),
('Mariana Nogueira', 'mariana.nogueira@email.com'), ('Nelson Vieira', 'nelson.vieira@email.com'),
('Olivia Barros', 'olivia.barros@email.com'), ('Pedro Gomes', 'pedro.gomes@email.com'),
('Quiteria Dantas', 'quiteria.dantas@email.com'), ('Rafael Barbosa', 'rafael.barbosa@email.com'),
('Sofia Castro', 'sofia.castro@email.com'), ('Thiago Pires', 'thiago.pires@email.com'),
('Ursula Mendes', 'ursula.mendes@email.com'), ('Vicente Duarte', 'vicente.duarte@email.com'),
('Wagner Esteves', 'wagner.esteves@email.com'), ('Xenia Ferreira', 'xenia.ferreira@email.com'),
('Yago Rodrigues', 'yago.rodrigues@email.com'), ('Zelia Vasconcelos', 'zelia.vasconcelos@email.com'),
('Alice Silva', 'alice.silva2@email.com'), ('Breno Santos', 'breno.santos2@email.com'),
('Cecília Oliveira', 'cecilia.oliveira2@email.com'), ('Davi Pereira', 'davi.pereira2@email.com'),
('Elisa Costa', 'elisa.costa2@email.com'), ('Fernando Almeida', 'fernando.almeida2@email.com'),
('Gabriela Rocha', 'gabriela.rocha2@email.com'), ('Henrique Lima', 'henrique.lima2@email.com'),
('Ingrid Fernandes', 'ingrid.fernandes2@email.com'), ('Júlio Ribeiro', 'julio.ribeiro2@email.com'),
('Larissa Souza', 'larissa.souza2@email.com'), ('Marcelo Martins', 'marcelo.martins2@email.com'),
('Natália Nogueira', 'natalia.nogueira2@email.com'), ('Osvaldo Vieira', 'osvaldo.vieira2@email.com'),
('Patrícia Barros', 'patricia.barros2@email.com'), ('Quirino Gomes', 'quirino.gomes2@email.com'),
('Renata Barbosa', 'renata.barbosa2@email.com'), ('Sérgio Castro', 'sergio.castro2@email.com'),
('Tainá Pires', 'taina.pires2@email.com'), ('Ubiratan Mendes', 'ubiratan.mendes2@email.com'),
('Valéria Duarte', 'valeria.duarte2@email.com'), ('Wellington Esteves', 'wellington.esteves2@email.com'),
('Yasmin Ferreira', 'yasmin.ferreira2@email.com'), ('Zeca Rodrigues', 'zeca.rodrigues2@email.com'),
('Amélia Vasconcelos', 'amelia.vasconcelos2@email.com'), ('Beatriz Alves', 'beatriz.alves@email.com'),
('Cássio Bernardes', 'cassio.bernardes@email.com'), ('Diana Cruz', 'diana.cruz@email.com'),
('Eduardo Diniz', 'eduardo.diniz@email.com'), ('Flávia Elias', 'flavia.elias@email.com'),
('Guilherme Franco', 'guilherme.franco@email.com'), ('Helena Guedes', 'helena.guedes@email.com'),
('Ícaro Hermínio', 'icaro.herminio@email.com'), ('Janaína Ivo', 'janaina.ivo@email.com'),
('Kauã Jesus', 'kaua.jesus@email.com'), ('Laura Klein', 'laura.klein@email.com'),
('Miguel Lopes', 'miguel.lopes@email.com'), ('Noemi Matos', 'noemi.matos@email.com'),
('Otávio Neves', 'otavio.neves@email.com'), ('Priscila Ornellas', 'priscila.ornellas@email.com'),
('Queiroz Pinho', 'queiroz.pinho@email.com'), ('Rodrigo Quadros', 'rodrigo.quadros@email.com'),
('Suzana Ramos', 'suzana.ramos@email.com'), ('Tadeu Rocha', 'tadeu.rocha@email.com'),
('Ulisses Sales', 'ulisses.sales@email.com'), ('Viviane Telles', 'viviane.telles@email.com'),
('Walter Uchôa', 'walter.uchoa@email.com'), ('Yara Viana', 'yara.viana@email.com'),
('Zoe Xavier', 'zoe.xavier@email.com'), ('Alvaro Zandoná', 'alvaro.zandona@email.com'),
('Bárbara Assunção', 'barbara.assuncao@email.com'), ('César Borba', 'cesar.borba@email.com'),
('Denise Camargo', 'denise.camargo@email.com'), ('Enzo Delgado', 'enzo.delgado@email.com'),
('Fabiana Esteves', 'fabiana.esteves@email.com'), ('Gustavo Freitas', 'gustavo.freitas@email.com'),
('Hélio Gonzaga', 'helio.gonzaga@email.com'), ('Irene Haddad', 'irene.haddad@email.com'),
('Joel Iunes', 'joel.iunes@email.com'), ('Karen Jardim', 'karen.jardim@email.com'),
('Léo Koury', 'leo.koury@email.com'), ('Márcia Lemos', 'marcia.lemos@email.com'),
('Newton Matarazzo', 'newton.matarazzo@email.com'), ('Olga Novaes', 'olga.novaes@email.com'),
('Paulo Oviedo', 'paulo.oviedo@email.com'), ('Quênia Paiva', 'quenia.paiva@email.com'),
('Ricardo Quinto', 'ricardo.quinto@email.com'), ('Sara Rocha', 'sara.rocha@email.com'),
('Tomás Sampaio', 'tomas.sampaio@email.com'), ('Ulla Tavares', 'ulla.tavares@email.com'),
('Vitor Uchoa', 'vitor.uchoa@email.com'), ('Wanda Vasconcelos', 'wanda.vasconcelos@email.com'),
('Yago Werner', 'yago.werner@email.com'), ('Zara Zen', 'zara.zen@email.com');

-- 100 Linhas para Palestras (Associações aos 50 Eventos)
INSERT INTO Palestras (id_evento, nome_palestrante, duracao_minutos) VALUES
(1, 'Dr. Elias Gomes', 60), (1, 'Dra. Sofia Mendes', 45), (2, 'Eng. Carlos Braga', 90), (2, 'Maria Clara Pires', 60),
(3, 'Prof. Renato Costa', 50), (3, 'Ana Paula Lima', 50), (4, 'João Marcelo Silva', 75), (5, 'Dr. Ricardo Nogueira', 40),
(5, 'Elena Alves', 55), (6, 'Luciana Santos', 60), (6, 'Pedro Henrique', 45), (7, 'Marcos Oliveira', 90),
(7, 'Juliana Reis', 90), (8, 'Prof. Sérgio Barros', 60), (8, 'Gabriela Dantas', 40), (9, 'Guilherme Rocha', 50),
(10, 'Fábio Viana', 30), (11, 'Dr. Lucas Ribeiro', 60), (11, 'Dra. Patrícia Gomes', 45), (12, 'Eng. Rodrigo Dias', 90),
(13, 'Cristina Soares', 50), (13, 'Alexandre Ferraz', 50), (14, 'André Torres', 75), (15, 'Larissa Costa', 40),
(15, 'Daniel Vilar', 55), (16, 'Márcia Ferreira', 60), (16, 'Roberto Cintra', 45), (17, 'Vitor Hugo', 90),
(18, 'Camila Prado', 90), (18, 'Gustavo Martins', 60), (19, 'Prof. Helena Mendes', 40), (19, 'Tiago Souza', 50),
(20, 'Bianca Azevedo', 30), (21, 'Dra. Mônica Castro', 60), (22, 'Wagner Junior', 45), (22, 'Elaine Vasconcelos', 90),
(23, 'Felipe Queiroz', 50), (23, 'Isabel Ramos', 50), (24, 'Mauro Diniz', 75), (25, 'Nelson Fontes', 40),
(25, 'Olga Peixoto', 55), (26, 'Paulo Quirino', 60), (26, 'Quiteria Rocha', 45), (27, 'Prof. Roberto Silva', 90),
(28, 'Sara Teixeira', 90), (28, 'Tomás Ulisses', 60), (29, 'Vanda Xavier', 40), (30, 'Yuri Zeca', 50),
(30, 'Alice Bastos', 30), (31, 'Breno Campos', 60), (32, 'Carla Duarte', 45), (33, 'Denis Elias', 90),
(34, 'Ester Freitas', 50), (34, 'Fabio Guedes', 50), (35, 'Gisele Horta', 75), (36, 'Henrique Ivo', 40),
(36, 'Inês Jesus', 55), (37, 'Jonas Klein', 60), (37, 'Kátia Lopes', 45), (38, 'Luiz Moura', 90),
(38, 'Marta Neves', 90), (39, 'Noel Ornellas', 60), (39, 'Oswaldo Pires', 40), (40, 'Pâmela Quadros', 50),
(40, 'Quirino Ramos', 30), (41, 'Ricardo Santos', 60), (42, 'Silvana Teixeira', 45), (43, 'Túlio Ulisses', 90),
(44, 'Valéria Vasconcelos', 50), (44, 'Wagner Xavier', 50), (45, 'Yara Zeca', 75), (46, 'Álvaro Alves', 40),
(46, 'Bárbara Borba', 55), (47, 'Cássio Camargo', 60), (47, 'Diana Delgado', 45), (48, 'Eduardo Elias', 90),
(48, 'Flávia Franco', 90), (49, 'Guilherme Guedes', 60), (49, 'Helena Horta', 40), (50, 'Ícaro Ivo', 50),
(50, 'Janaína Jesus', 30), (1, 'Fernando Souza', 60), (2, 'Gabriel Antunes', 45), (3, 'Hélio Medeiros', 90),
(4, 'Isadora Neres', 60), (5, 'Jeferson Pires', 50), (6, 'Kátia Quintela', 50), (7, 'Leonardo Rangel', 75),
(8, 'Mirella Soares', 40), (9, 'Nicole Tavares', 55), (10, 'Orlando Uchoa', 60), (11, 'Paloma Viana', 45),
(12, 'Quênia Xavier', 90), (13, 'Raul Yago', 90), (14, 'Sandra Zeca', 60), (15, 'Tadeu Almeida', 40),
(16, 'Úrsula Braga', 50), (17, 'Valter Caldeira', 30), (18, 'Wilson Diniz', 60), (19, 'Xenia Freire', 45),
(20, 'Yago Guedes', 90), (21, 'Zilda Hermínio', 50), (22, 'Aldo Ivo', 50), (23, 'Bia Jesus', 75),
(24, 'César Klein', 40), (25, 'Dora Lopes', 55), (26, 'Elias Moura', 60), (27, 'Fani Neves', 45),
(28, 'Geraldo Ornellas', 90), (29, 'Heloísa Pires', 90), (30, 'Igor Quadros', 60), (31, 'Júlia Ramos', 40),
(32, 'Klaus Santos', 50), (33, 'Lívia Teixeira', 30), (34, 'Mauro Ulisses', 60), (35, 'Nádia Viana', 45),
(36, 'Otto Xavier', 90), (37, 'Pietra Yuri', 50), (38, 'Quito Zeca', 50), (39, 'Rafaela Borges', 75),
(40, 'Samuel Cunha', 40), (41, 'Tatiana Duarte', 55), (42, 'Uriel Esteves', 60), (43, 'Vera França', 45),
(44, 'Wesley Guedes', 90), (45, 'Ximena Horta', 90), (46, 'Yago Iunes', 60), (47, 'Zuleica Jorge', 40),
(48, 'Adriano Klein', 50), (49, 'Bruna Lopes', 30), (50, 'Carlos Matos', 60);


INSERT INTO Inscricoes (id_participante, id_evento, data_inscricao) VALUES
(1, 1, '2025-03-01 10:00:00'), (2, 1, '2025-03-02 11:30:00'), (3, 2, '2025-04-15 14:00:00'), (4, 2, '2025-04-16 09:00:00'),
(5, 3, '2025-05-10 16:30:00'), (6, 3, '2025-05-11 12:00:00'), (7, 4, '2025-06-20 08:45:00'), (8, 4, '2025-06-21 17:00:00'),
(9, 5, '2025-07-01 10:30:00'), (10, 5, '2025-07-02 13:00:00'), (11, 6, '2025-08-01 15:00:00'), (12, 6, '2025-08-02 10:00:00'),
(13, 7, '2025-09-01 11:00:00'), (14, 7, '2025-09-02 14:30:00'), (15, 8, '2025-10-01 09:30:00'), (16, 8, '2025-10-02 16:00:00'),
(17, 9, '2025-11-01 10:45:00'), (18, 9, '2025-11-02 12:00:00'), (19, 10, '2025-12-01 14:00:00'), (20, 10, '2025-12-02 10:00:00'),
(21, 11, '2026-01-15 11:30:00'), (22, 11, '2026-01-16 15:00:00'), (23, 12, '2026-02-01 09:00:00'), (24, 12, '2026-02-02 16:30:00'),
(25, 13, '2026-03-01 10:00:00'), (26, 13, '2026-03-02 11:00:00'), (27, 14, '2026-04-01 13:00:00'), (28, 14, '2026-04-02 14:30:00'),
(29, 15, '2026-05-01 09:30:00'), (30, 15, '2026-05-02 16:00:00'), (31, 16, '2026-06-01 10:45:00'), (32, 16, '2026-06-02 12:00:00'),
(33, 17, '2026-07-01 14:00:00'), (34, 17, '2026-07-02 10:00:00'), (35, 18, '2026-08-01 11:30:00'), (36, 18, '2026-08-02 15:00:00'),
(37, 19, '2026-09-01 09:00:00'), (38, 19, '2026-09-02 16:30:00'), (39, 20, '2026-10-01 10:00:00'), (40, 20, '2026-10-02 11:00:00'),
(41, 21, '2026-11-01 13:00:00'), (42, 21, '2026-11-02 14:30:00'), (43, 22, '2026-12-01 09:30:00'), (44, 22, '2026-12-02 16:00:00'),
(45, 23, '2027-01-01 10:45:00'), (46, 23, '2027-01-02 12:00:00'), (47, 24, '2027-02-01 14:00:00'), (48, 24, '2027-02-02 10:00:00'),
(49, 25, '2027-03-01 11:30:00'), (50, 25, '2027-03-02 15:00:00'), (51, 26, '2027-04-01 09:00:00'), (52, 26, '2027-04-02 16:30:00'),
(53, 27, '2027-05-01 10:00:00'), (54, 27, '2027-05-02 11:00:00'), (55, 28, '2027-06-01 13:00:00'), (56, 28, '2027-06-02 14:30:00'),
(57, 29, '2027-07-01 09:30:00'), (58, 29, '2027-07-02 16:00:00'), (59, 30, '2027-08-01 10:45:00'), (60, 30, '2027-08-02 12:00:00'),
(61, 31, '2027-09-01 14:00:00'), (62, 31, '2027-09-02 10:00:00'), (63, 32, '2027-10-01 11:30:00'), (64, 32, '2027-10-02 15:00:00'),
(65, 33, '2027-11-01 09:00:00'), (66, 33, '2027-11-02 16:30:00'), (67, 34, '2027-12-01 10:00:00'), (68, 34, '2027-12-02 11:00:00'),
(69, 35, '2028-01-01 13:00:00'), (70, 35, '2028-01-02 14:30:00'), (71, 36, '2028-02-01 09:30:00'), (72, 36, '2028-02-02 16:00:00'),
(73, 37, '2028-03-01 10:45:00'), (74, 37, '2028-03-02 12:00:00'), (75, 38, '2028-04-01 14:00:00'), (76, 38, '2028-04-02 10:00:00'),
(77, 39, '2028-05-01 11:30:00'), (78, 39, '2028-05-02 15:00:00'), (79, 40, '2028-06-01 09:00:00'), (80, 40, '2028-06-02 16:30:00'),
(81, 41, '2028-07-01 10:00:00'), (82, 41, '2028-07-02 11:00:00'), (83, 42, '2028-08-01 13:00:00'), (84, 42, '2028-08-02 14:30:00'),
(85, 43, '2028-09-01 09:30:00'), (86, 43, '2028-09-02 16:00:00'), (87, 44, '2028-10-01 10:45:00'), (88, 44, '2028-10-02 12:00:00'),
(89, 45, '2028-11-01 14:00:00'), (90, 45, '2028-11-02 10:00:00'), (91, 46, '2028-12-01 11:30:00'), (92, 46, '2028-12-02 15:00:00'),
(93, 47, '2029-01-01 09:00:00'), (94, 47, '2029-01-02 16:30:00'), (95, 48, '2029-02-01 10:00:00'), (96, 48, '2029-02-02 11:00:00'),
(97, 49, '2029-03-01 13:00:00'), (98, 49, '2029-03-02 14:30:00'), (99, 50, '2029-04-01 09:30:00'), (100, 50, '2029-04-02 16:00:00'),
(1, 2, '2025-04-20 10:00:00'), (2, 3, '2025-05-15 11:30:00'), (3, 4, '2025-06-25 14:00:00'), (4, 5, '2025-07-10 09:00:00'),
(5, 6, '2025-08-15 16:30:00'), (6, 7, '2025-09-05 12:00:00'), (7, 8, '2025-10-10 08:45:00'), (8, 9, '2025-11-15 17:00:00'),
(9, 10, '2025-12-05 10:30:00'), (10, 11, '2026-01-20 13:00:00'), (11, 12, '2026-02-15 15:00:00'), (12, 13, '2026-03-10 10:00:00'),
(13, 14, '2026-04-15 11:00:00'), (14, 15, '2026-05-20 13:00:00'), (15, 16, '2026-06-25 14:30:00'), (16, 17, '2026-07-15 09:30:00'),
(17, 18, '2026-08-20 16:00:00'), (18, 19, '2026-09-10 10:45:00'), (19, 20, '2026-10-25 12:00:00'), (20, 21, '2026-11-15 14:00:00'),
(21, 22, '2026-12-10 10:00:00'), (22, 23, '2027-01-20 11:30:00'), (23, 24, '2027-02-15 15:00:00'), (24, 25, '2027-03-10 09:00:00'),
(25, 26, '2027-04-15 16:30:00'), (26, 27, '2027-05-10 10:00:00'), (27, 28, '2027-06-20 11:00:00'), (28, 29, '2027-07-15 13:00:00'),
(29, 30, '2027-08-10 14:30:00'), (30, 31, '2027-09-15 09:30:00'), (31, 32, '2027-10-10 16:00:00'), (32, 33, '2027-11-20 10:45:00'),
(33, 34, '2027-12-10 12:00:00'), (34, 35, '2028-01-20 14:00:00'), (35, 36, '2028-02-15 10:00:00'), (36, 37, '2028-03-10 11:30:00'),
(37, 38, '2028-04-20 15:00:00'), (38, 39, '2028-05-15 09:00:00'), (39, 40, '2028-06-10 16:30:00'), (40, 41, '2028-07-20 10:00:00'),
(41, 42, '2028-08-15 11:00:00'), (42, 43, '2028-09-10 13:00:00'), (43, 44, '2028-10-20 14:30:00'), (44, 45, '2028-11-15 09:30:00'),
(45, 46, '2028-12-10 16:00:00'), (46, 47, '2029-01-20 10:45:00'), (47, 48, '2029-02-15 12:00:00'), (48, 49, '2029-03-10 14:00:00'),
(49, 50, '2029-04-20 10:00:00'), (50, 1, '2025-03-05 11:30:00'), (51, 2, '2025-04-25 15:00:00'), (52, 3, '2025-05-20 09:00:00'),
(53, 4, '2025-06-30 16:30:00'), (54, 5, '2025-07-25 10:00:00'), (55, 6, '2025-08-20 11:00:00'), (56, 7, '2025-09-15 13:00:00'),
(57, 8, '2025-10-25 14:30:00'), (58, 9, '2025-11-20 09:30:00'), (59, 10, '2025-12-15 16:00:00'), (60, 11, '2026-01-25 10:45:00'),
(61, 12, '2026-02-20 12:00:00'), (62, 13, '2026-03-25 14:00:00'), (63, 14, '2026-04-20 10:00:00'), (64, 15, '2026-05-25 11:30:00'),
(65, 16, '2026-06-30 15:00:00'), (66, 17, '2026-07-25 09:00:00'), (67, 18, '2026-08-30 16:30:00'), (68, 19, '2026-09-25 10:00:00'),
(69, 20, '2026-10-20 11:00:00'), (70, 21, '2026-11-30 13:00:00'), (71, 22, '2026-12-25 14:30:00'), (72, 23, '2027-01-25 09:30:00'),
(73, 24, '2027-02-20 16:00:00'), (74, 25, '2027-03-25 10:45:00'), (75, 26, '2027-04-20 12:00:00'), (76, 27, '2027-05-25 14:00:00'),
(77, 28, '2027-06-20 10:00:00'), (78, 29, '2027-07-25 11:30:00'), (79, 30, '2027-08-20 15:00:00'), (80, 31, '2027-09-25 09:00:00'),
(81, 32, '2027-10-20 16:30:00'), (82, 33, '2027-11-25 10:00:00'), (83, 34, '2027-12-20 11:00:00'), (84, 35, '2028-01-25 13:00:00'),
(85, 36, '2028-02-20 14:30:00'), (86, 37, '2028-03-25 09:30:00'), (87, 38, '2028-04-20 16:00:00'), (88, 39, '2028-05-25 10:45:00'),
(89, 40, '2028-06-20 12:00:00'), (90, 41, '2028-07-25 14:00:00'), (91, 42, '2028-08-20 10:00:00'), (92, 43, '2028-09-25 11:30:00'),
(93, 44, '2028-10-20 15:00:00'), (94, 45, '2028-11-25 09:00:00'), (95, 46, '2028-12-20 16:30:00'), (96, 47, '2029-01-25 10:00:00'),
(97, 48, '2029-02-20 11:00:00'), (98, 49, '2029-03-25 13:00:00'), (99, 50, '2029-04-20 14:30:00'), (1, 11, '2026-01-05 10:00:00'),
(2, 12, '2026-02-10 11:30:00'), (3, 13, '2026-03-05 14:00:00'), (4, 14, '2026-04-10 09:00:00'), (5, 15, '2026-05-05 16:30:00'),
(6, 16, '2026-06-10 12:00:00'), (7, 17, '2026-07-05 08:45:00'), (8, 18, '2026-08-10 17:00:00'), (9, 19, '2026-09-05 10:30:00'),
(10, 20, '2026-10-10 13:00:00'), (11, 21, '2026-11-05 15:00:00'), (12, 22, '2026-12-01 10:00:00'), (13, 23, '2027-01-05 11:00:00'),
(14, 24, '2027-02-10 13:00:00'), (15, 25, '2027-03-05 14:30:00'), (16, 26, '2027-04-10 09:30:00'), (17, 27, '2027-05-05 16:00:00'),
(18, 28, '2027-06-10 10:45:00'), (19, 29, '2027-07-05 12:00:00'), (20, 30, '2027-08-10 14:00:00'), (21, 31, '2027-09-05 10:00:00'),
(22, 32, '2027-10-10 11:30:00'), (23, 33, '2027-11-05 15:00:00'), (24, 34, '2027-12-10 09:00:00'), (25, 35, '2028-01-05 16:30:00'),
(26, 36, '2028-02-10 10:00:00'), (27, 37, '2028-03-05 11:00:00'), (28, 38, '2028-04-10 13:00:00'), (29, 39, '2028-05-05 14:30:00'),
(30, 40, '2028-06-10 09:30:00'), (31, 41, '2028-07-05 16:00:00'), (32, 42, '2028-08-10 10:45:00'), (33, 43, '2028-09-05 12:00:00'),
(34, 44, '2028-10-10 14:00:00'), (35, 45, '2028-11-05 10:00:00'), (36, 46, '2028-12-10 11:30:00'), (37, 47, '2029-01-05 15:00:00'),
(38, 48, '2029-02-10 09:00:00'), (39, 49, '2029-03-05 16:30:00'), (40, 50, '2029-04-10 10:00:00'), (5, 1, '2025-03-03 10:30:00'),
(10, 2, '2025-04-18 11:00:00'), (15, 3, '2025-05-13 13:00:00'), (20, 4, '2025-06-23 14:30:00'), (25, 5, '2025-07-05 09:30:00'),
(30, 6, '2025-08-07 16:00:00'), (35, 7, '2025-09-07 10:45:00'), (40, 8, '2025-10-07 12:00:00'), (45, 9, '2025-11-07 14:00:00'),
(50, 10, '2025-12-07 10:00:00'), (55, 11, '2026-01-22 11:30:00'), (60, 12, '2026-02-17 15:00:00'), (65, 13, '2026-03-07 09:00:00'),
(70, 14, '2026-04-07 16:30:00'), (75, 15, '2026-05-07 10:00:00'), (80, 16, '2026-06-07 11:00:00'), (85, 17, '2026-07-07 13:00:00'),
(90, 18, '2026-08-07 14:30:00'), (95, 19, '2026-09-07 09:30:00'), (100, 20, '2026-10-07 16:00:00'), (6, 21, '2026-11-10 10:45:00'),
(11, 22, '2026-12-05 12:00:00'), (16, 23, '2027-01-10 14:00:00'), (21, 24, '2027-02-05 10:00:00'), (26, 25, '2027-03-15 11:30:00'),
(31, 26, '2027-04-10 15:00:00'), (36, 27, '2027-05-05 09:00:00'), (41, 28, '2027-06-15 16:30:00'), (46, 29, '2027-07-10 10:00:00'),
(51, 30, '2027-08-05 11:00:00'), (56, 31, '2027-09-10 13:00:00'), (61, 32, '2027-10-05 14:30:00'), (66, 33, '2027-11-10 09:30:00'),
(71, 34, '2027-12-05 16:00:00'), (76, 35, '2028-01-10 10:45:00'), (81, 36, '2028-02-05 12:00:00'), (86, 37, '2028-03-15 14:00:00'),
(91, 38, '2028-04-10 10:00:00'), (96, 39, '2028-05-05 11:30:00'), (100, 40, '2028-06-15 15:00:00'), (99, 41, '2028-07-10 09:00:00'),
(98, 42, '2028-08-05 16:30:00'), (97, 43, '2028-09-15 10:00:00'), (96, 44, '2028-10-05 11:00:00'), (95, 45, '2028-11-10 13:00:00'),
(94, 46, '2028-12-05 14:30:00'), (93, 47, '2029-01-10 09:30:00'), (92, 48, '2029-02-05 16:00:00'), (91, 49, '2029-03-15 10:45:00'),
(90, 50, '2029-04-05 12:00:00'), (5, 50, '2029-04-15 14:00:00'), (10, 49, '2029-03-20 10:00:00'), (15, 48, '2029-02-25 11:30:00'),
(20, 47, '2029-01-20 15:00:00'), (25, 46, '2028-12-15 09:00:00'), (30, 45, '2028-11-20 16:30:00'), (35, 44, '2028-10-15 10:00:00'),
(40, 43, '2028-09-20 11:00:00'), (45, 42, '2028-08-25 13:00:00'), (50, 41, '2028-07-20 14:30:00'), (55, 40, '2028-06-25 09:30:00'),
(60, 39, '2028-05-20 16:00:00'), (65, 38, '2028-04-25 10:45:00'), (70, 37, '2028-03-20 12:00:00'), (75, 36, '2028-02-25 14:00:00'),
(80, 35, '2028-01-15 10:00:00'), (85, 34, '2027-12-15 11:30:00'), (90, 33, '2027-11-25 15:00:00'), (95, 32, '2027-10-25 09:00:00'),
(100, 31, '2027-09-20 16:30:00'), (8, 2, '2025-04-17 10:00:00'), (13, 3, '2025-05-12 11:30:00'), (18, 4, '2025-06-22 14:00:00'),
(23, 5, '2025-07-03 09:00:00'), (28, 6, '2025-08-04 16:30:00'), (33, 7, '2025-09-03 12:00:00'), (38, 8, '2025-10-03 08:45:00'),
(43, 9, '2025-11-03 17:00:00'), (48, 10, '2025-12-03 10:30:00'), (53, 11, '2026-01-18 13:00:00'), (58, 12, '2026-02-13 15:00:00'),
(63, 13, '2026-03-08 10:00:00'), (68, 14, '2026-04-08 11:00:00'), (73, 15, '2026-05-08 13:00:00'), (78, 16, '2026-06-08 14:30:00'),
(83, 17, '2026-07-08 09:30:00'), (88, 18, '2026-08-08 16:00:00'), (93, 19, '2026-09-08 10:45:00'), (98, 20, '2026-10-08 12:00:00'),
(4, 21, '2026-11-03 14:00:00'), (9, 22, '2026-12-03 10:00:00'), (14, 23, '2027-01-03 11:30:00'), (19, 24, '2027-02-03 15:00:00'),
(24, 25, '2027-03-03 09:00:00'), (29, 26, '2027-04-03 16:30:00'), (34, 27, '2027-05-03 10:00:00'), (39, 28, '2027-06-03 11:00:00'),
(44, 29, '2027-07-03 13:00:00'), (49, 30, '2027-08-03 14:30:00'), (54, 31, '2027-09-03 09:30:00'), (59, 32, '2027-10-03 16:00:00'),
(64, 33, '2027-11-03 10:45:00'), (69, 34, '2027-12-03 12:00:00'), (74, 35, '2028-01-03 14:00:00'), (79, 36, '2028-02-03 10:00:00'),
(84, 37, '2028-03-03 11:30:00'), (89, 38, '2028-04-03 15:00:00'), (94, 39, '2028-05-03 09:00:00'), (99, 40, '2028-06-03 16:30:00'),
(5, 41, '2028-07-03 10:00:00'), (10, 42, '2028-08-03 11:00:00'), (15, 43, '2028-09-03 13:00:00'), (20, 44, '2028-10-03 14:30:00'),
(25, 45, '2028-11-03 09:30:00'), (30, 46, '2028-12-03 16:00:00'), (35, 47, '2029-01-03 10:45:00'), (40, 48, '2029-02-03 12:00:00'),
(45, 49, '2029-03-03 14:00:00'), (50, 50, '2029-04-03 10:00:00');


-- #################################################################
-- #                              CRUD                             #
-- #################################################################

-- UPDATE: Corrigir o local do Evento ID 1.
UPDATE Eventos
SET local = 'Novo Centro de Inovação Tech'
WHERE id_evento = 1;

-- DELETE: Deletar a palestra ID 3 (exemplo).
DELETE FROM Palestras
WHERE id_palestra = 3;

-- #################################################################
-- #                           OTIMIZAÇÃO                          #
-- #################################################################

-- Adicionar INDEX para otimizar consultas por e-mail e data do evento.
CREATE INDEX idx_participantes_email ON Participantes (email);
CREATE INDEX idx_eventos_data ON Eventos (data_evento);


-- #################################################################
-- #                            TRIGGERS                           #
-- #################################################################

-- Trigger para restaurar vagas ao deletar uma inscrição.
DELIMITER //

CREATE TRIGGER trg_restaurar_vaga_delete
AFTER DELETE ON Inscricoes
FOR EACH ROW
BEGIN
    -- OLD.id_evento refere-se ao valor da coluna antes da exclusão
    UPDATE Eventos
    SET vagas_disponiveis = vagas_disponiveis + 1
    WHERE id_evento = OLD.id_evento;
END //

DELIMITER ;

-- #################################################################
-- #                     STORED PROCEDURE e ACID                   #
-- #################################################################

-- Procedure para inscrever participante, atualizar vagas, e gerenciar transações e erros.
DELIMITER //

CREATE PROCEDURE InscreverParticipante(
    IN p_id_participante INT,
    IN p_id_evento INT
)
BEGIN
    DECLARE vagas_atual INT;
    
    -- Gerenciamento de Erro: Em caso de qualquer erro (ex: chave única duplicada), faz o ROLLBACK
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        -- Sinaliza um erro customizado para o usuário
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro na transação. Verifique se o participante já está inscrito neste evento ou se o Evento/Participante ID é válido.';
    END;

    -- Inicia a Transação (Garantia de Atomicidade)
    START TRANSACTION;

    -- 1. Verifica a disponibilidade de vagas (com bloqueio para garantir Isolamento)
    SELECT vagas_disponiveis INTO vagas_atual
    FROM Eventos
    WHERE id_evento = p_id_evento
    FOR UPDATE;

    -- 2. Gerenciamento de Erro: Se vaga for zero, força o ROLLBACK
    IF vagas_atual <= 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Evento Lotado. Inscrição não realizada.';
    ELSE
        -- 3. Insere a Inscrição
        INSERT INTO Inscricoes (id_participante, id_evento)
        VALUES (p_id_participante, p_id_evento);

        -- 4. Atualiza o contador de vagas (Consistência)
        UPDATE Eventos
        SET vagas_disponiveis = vagas_disponiveis - 1
        WHERE id_evento = p_id_evento;

        -- 5. Confirma a Transação (Durabilidade)
        COMMIT;
    END IF;
END //

DELIMITER ;

-- #################################################################
-- #                             VIEWS                             #
-- #################################################################

-- Criar VIEW para simplificar relatórios de eventos com alta lotação (> 100 inscritos)
CREATE OR REPLACE VIEW View_Eventos_Alta_Lotacao AS
SELECT
    nome,
    local,
    data_evento,
    vagas_totais,
    (vagas_totais - vagas_disponiveis) AS total_inscritos
FROM Eventos
WHERE (vagas_totais - vagas_disponiveis) > 100
ORDER BY total_inscritos DESC;


-- #################################################################
-- #                            CONSULTAS                          #
-- #################################################################

-- CONSULTA 1: Filtrar Participantes de um evento (WHERE com AND/OR)
SELECT
    P.nome,
    E.nome AS nome_evento,
    P.email
FROM Participantes P
INNER JOIN Inscricoes I ON P.id_participante = I.id_participante
INNER JOIN Eventos E ON I.id_evento = E.id_evento
WHERE
    (E.id_evento = 1 OR E.id_evento = 2) -- Participantes do Evento 1 OU Evento 2
    AND P.email NOT LIKE '%@email.com%'  -- Que NÃO são do domínio '@email.com'
ORDER BY P.nome;

-- CONSULTA 2: Ordenar e Limitar (ORDER BY e LIMIT)
-- Listar os primeiros 50 inscritos em ordem alfabética
SELECT
    P.nome,
    P.email,
    I.data_inscricao
FROM Participantes P
INNER JOIN Inscricoes I ON P.id_participante = I.id_participante
ORDER BY
    P.nome ASC
LIMIT 50;

-- CONSULTA 3: JOINs (INNER JOIN para Palestras e Eventos)
-- Listar todas as palestras, mostrando o nome do evento
SELECT
    E.nome AS nome_do_evento,
    P.nome_palestrante,
    P.duracao_minutos
FROM Palestras P
INNER JOIN Eventos E ON P.id_evento = E.id_evento
ORDER BY E.nome, P.nome_palestrante;

-- CONSULTA 4: UNION ALL
-- Combinar a lista de todos os palestrantes e participantes em uma única coluna
SELECT
    nome AS Nome_Unificado,
    'Participante' AS Tipo
FROM Participantes
UNION ALL
SELECT
    nome_palestrante AS Nome_Unificado,
    'Palestrante' AS Tipo
FROM Palestras
ORDER BY Nome_Unificado;

-- CONSULTA 5: Agregação e HAVING
-- Contar o número de palestrantes por evento e mostrar apenas os eventos com MAIS de 3 palestrantes
SELECT
    E.nome AS nome_do_evento,
    COUNT(P.id_palestra) AS total_palestrantes
FROM Eventos E
INNER JOIN Palestras P ON E.id_evento = P.id_evento
GROUP BY
    E.nome
HAVING
    COUNT(P.id_palestra) > 3
ORDER BY
    total_palestrantes DESC;

-- CONSULTA 6: Subqueries
-- Identificar o evento com a palestra de maior duração (MAX(duracao_minutos))
SELECT
    E.nome AS nome_do_evento,
    E.data_evento
FROM Eventos E
WHERE E.id_evento = (
    SELECT id_evento
    FROM Palestras
    ORDER BY duracao_minutos DESC
    LIMIT 1 -- Seleciona apenas o ID do evento com a maior duração
);

-- CONSULTA 7: Funções de Data
-- Listar eventos do próximo fim de semana (assumindo MySQL: 6=Sex, 7=Sáb, 1=Dom)
SELECT
    nome,
    data_evento
FROM Eventos
WHERE
    data_evento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
    AND DAYOFWEEK(data_evento) IN (6, 7, 1)
ORDER BY
    data_evento;