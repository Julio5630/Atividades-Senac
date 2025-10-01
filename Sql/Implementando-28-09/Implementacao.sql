-- ===============================================
-- 1. DROP TRIGGERS EXISTENTES (PARA RE-EXECUÇÃO SEGURA)
-- ===============================================

DROP TRIGGER IF EXISTS trg_baixa_estoque;
DROP TRIGGER IF EXISTS trg_log_status_pedido;
DROP TRIGGER IF EXISTS trg_validacao_cliente;

-- ===============================================
-- 2. PRÉ-REQUISITO: TABELA DE AUDITORIA (Desafio 2)
-- ===============================================

CREATE TABLE IF NOT EXISTS log_status_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    status_antigo VARCHAR(50),
    status_novo VARCHAR(50),
    data_mudanca TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===============================================
-- 3. DESAFIO 1: CONTROLE DE ESTOQUE (Automação)
-- ===============================================
DELIMITER //

CREATE TRIGGER trg_baixa_estoque
-- Acionado DEPOIS de inserir um item de pedido
AFTER INSERT ON itens_pedido
FOR EACH ROW
BEGIN
    -- Subtrai a quantidade comprada do estoque do produto
    UPDATE produtos
    SET estoque = estoque - NEW.quantidade
    WHERE id = NEW.produto_id;
END //

DELIMITER ;

-- ===============================================
-- 4. DESAFIO 2: LOG DE STATUS (Auditoria)
-- ===============================================
DELIMITER //

CREATE TRIGGER trg_log_status_pedido
-- Acionado ANTES de alterar um pedido
BEFORE UPDATE ON pedidos
FOR EACH ROW
BEGIN
    -- Verifica se o status foi realmente alterado
    IF OLD.status <> NEW.status THEN
        -- Insere o registro de auditoria com os status antigo e novo
        INSERT INTO log_status_pedidos (
            pedido_id,
            status_antigo,
            status_novo
        )
        VALUES (
            OLD.id,
            OLD.status,
            NEW.status
        );
    END IF;
END //

DELIMITER ;

-- ===============================================
-- 5. DESAFIO 3: VALIDAÇÃO DE CLIENTES (Qualidade e Padronização)
-- ===============================================
DELIMITER //

CREATE TRIGGER trg_validacao_cliente
-- Acionado ANTES de inserir um novo usuário
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    -- Padronização: força o nome a ser salvo em letras maiúsculas
    SET NEW.nome = UPPER(NEW.nome);

    -- Validação: bloqueia a inserção se o CPF for nulo ou vazio
    IF NEW.cpf IS NULL OR NEW.cpf = '' THEN
        -- Retorna um erro customizado e interrompe a operação
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERRO: O CPF do usuário não pode ser nulo ou vazio.';
    END IF;
END //

DELIMITER ;


-- ===============================================
-- 6. TESTES E DEMONSTRAÇÃO
-- ===============================================

-- OBSERVAÇÃO: Garanta que o banco de dados e os dados iniciais (02.BancoEcommerce.sql) estejam carregados antes de executar os testes.

-- TESTE 1: trg_baixa_estoque (Produto 1: Smartphone X. Estoque inicial 50 - assumindo que o teste 04.BancoEcommerce.sql reverteu a transação)
SELECT '--- TESTE 1: BAIXA DE ESTOQUE (Produto ID 1) ---' AS Teste;
SELECT nome, estoque FROM produtos WHERE id = 1;

-- Simula a compra de 3 unidades do Produto 1. O trigger deve reduzir o estoque para 47.
INSERT INTO itens_pedido (id, pedido_id, produto_id, quantidade, preco_unitario)
VALUES (33, 1, 1, 3, 1500.00);

SELECT nome, estoque FROM produtos WHERE id = 1;


-- TESTE 2: trg_log_status_pedido (Pedido 1: Status 'Pago' ou 'Finalizado' - dependendo de 04.BancoEcommerce.sql)
SELECT '--- TESTE 2: LOG DE STATUS (Pedido ID 1) ---' AS Teste;
SELECT id, status FROM pedidos WHERE id = 1;

-- Altera o status do Pedido 1. O trigger deve registrar a mudança.
UPDATE pedidos
SET status = 'Processando'
WHERE id = 1;

SELECT * FROM log_status_pedidos WHERE pedido_id = 1;


-- TESTE 3: trg_validacao_cliente

-- Teste 3a: Padronização (Nome em minúsculas)
SELECT '--- TESTE 3a: PADRONIZAÇÃO DE NOME ---' AS Teste;
INSERT INTO usuarios (id, nome, email, senha, celular, cpf, criado_em)
VALUES (34, 'novo cliente para padronizar', 'cliente34@exemplo.com', 'teste123', '(00) 00000-0000', '111.222.333-55', NOW());

SELECT nome FROM usuarios WHERE id = 34;

-- Teste 3b: Bloqueio (CPF NULO)
SELECT '--- TESTE 3b: BLOQUEIO POR CPF NULO (DEVE FALHAR) ---' AS Teste;
-- Tenta inserir um novo usuário com CPF NULO. O trigger deve BLOQUEAR.
INSERT INTO usuarios (id, nome, email, senha, celular, cpf, criado_em)
VALUES (35, 'Cliente Sem Cpf', 'cliente35@exemplo.com', 'teste123', '(00) 00000-0000', NULL, NOW());