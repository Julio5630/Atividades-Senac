create database desafio;
use desafio;


create table enderecos(
id int auto_increment primary key,
cliente_id varchar (100) not null,
rua varchar (100) unique not null,
numero varchar(100),
bairro varchar(50) not null,
cidade varchar(50),
estado varchar (50),
cep varchar(30),
criado_em datetime default current_timestamp
);
INSERT INTO enderecos (id, cliente_id, rua, numero, bairro, cidade, estado, cep) VALUES
	(1, 1, 'Colônia Rodrigo Mendes', '6774', 'Embaúbas', 'Ferreira', 'SC', '18944-467'),
    (2, 2, 'Campo Costa', '8986', 'Jardim Alvorada', 'da Conceição', 'PI', '23711-318'),
    (3, 3, 'Recanto Maria Luisa Marques', '2645', 'Eymard', 'Rocha', 'AP', '70493-924'),
    (4, 4, 'Rodovia de Casa Grande', '573', 'Distrito Industrial do Jatobá', 'Almeida', 'RO', '71542-894'),
    (5, 5, 'Alameda Viana', '1251', 'Mangueiras', 'da Cruz', 'PI', '70830-966'),
    (6, 6, 'Passarela da Conceição', '4842', 'Vila Boa Vista', 'Cunha dos Dourados', 'TO', '49770-926'),
    (7, 7, 'Rua Gomes', '5241', 'Morro Ouro Preto', 'Adorai', 'DF', '10827-869'),
    (8, 8, 'Quadra de Silveira', '4402', 'São Marcos', 'Siqueira', 'SP', '90132-551'),
    (9, 9, 'Condomínio Castro Chao', '3820', 'Minas Brasil', 'Moura', 'PB', '81642-931'),
    (10, 10, 'Recanto Araújo', '9068', 'Santa Margarida', 'Ramos', 'SC', '90055-545'),
    (11, 11, 'Aeroporto Assafe Marques', '8622', 'Jardim Alvorada', 'Cavalcante de Rezende', 'AL', '40545-901'),
    (12, 12, 'Recanto de Daniel', '7841', 'Marieta 1ª Seção', 'da Costa', 'AM', '39302-845'),
    (13, 13, 'Condomínio Davi Lucca Camargo', '9528', 'Aldemar Maldonado', 'Silva das Flores', 'PI', '31007-405'),
    (14, 14, 'Distrito Lacerda', '1460', 'Vila Independente 2ª Seção', 'Barbosa', 'MT', '35653-821'),
    (15, 15, 'Residencial Dias', '8818', 'Vale do Jatobá', 'Souza', 'SE', '23141-922'),
    (16, 16, 'Ladeira de da Cunha', '663', 'Jardim do Vale', 'Camargo', 'GO', '70282-922'),
    (17, 17, 'Vale Anchieta Profº Fonseca', '3442', 'João Paulo II', 'Garcia Dourados', 'PA', '33112-332'),
    (18, 18, 'Setor de Melo', '5698', 'Alto dos Pinheiros', 'Porto de Goiás', 'ES', '69153-076'),
    (19, 19, 'Fazenda Silval', '1025', 'São Daniel o Borges', 'Rocha', 'RO', '72921-339'),
    (20, 20, 'Estação Diogo Farias', '8801', 'Águas Claras', 'Câmara', 'AP', '34107-701'),
    (21, 21, 'Morro de Campos', '8081', 'Vila Cloris', 'Camargo', 'RN', '25143-589'),
    (22, 22, 'Largo Davi Barros', '351', 'Etelvina Carneiro', 'Costela', 'SE', '42269-092'),
    (23, 23, 'Vila de Pacheco', '9854', 'São Lucas', 'Rodrigues', 'MT', '44976-850'),
    (24, 24, 'Aeroporto Oliveira', '9669', 'Vila Itamarati', 'Barbosa', 'PR', '68681-824'),
    (25, 25, 'Chácara de Mora', '1327', 'São Gabriel', 'Cirino Grande', 'AM', '48510-279'),
    (26, 26, 'Travessa José Miguel Lado', '4397', 'Estrela', 'Moreira das Flores', 'MA', '04008-888'),
    (27, 27, 'Aeroporto de Teixeira', '3971', 'Acaiaça', 'Teixeira', 'PB', '25978-302'),
    (28, 28, 'Aeroporto de Farias', '4596', 'São Bento', 'Fogaça', 'PI', '60487-266'),
    (29, 29, 'Estação da Costa', '4960', 'Vila Paraíso', 'Bá', 'BA', '83872-925'),
    (30, 30, 'Morro Ayla Sales', '1627', 'Cidade Jardim', 'Cassiano Paulista', 'RO', '90962-671');

select * from enderecos;