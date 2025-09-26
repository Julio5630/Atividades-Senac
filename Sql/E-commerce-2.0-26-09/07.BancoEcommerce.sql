-- Altera o delimitador para //
DELIMITER //

CREATE TRIGGER trg_baixa_estoque
-- Executa DEPOIS de um INSERT na tabela 'itens_pedido'
AFTER INSERT ON itens_pedido
FOR EACH ROW
BEGIN
    -- Atualiza o estoque do produto, subtraindo a quantidade comprada (NEW.quantidade).
    UPDATE produtos
    SET estoque = estoque - NEW.quantidade
    WHERE id = NEW.produto_id;
END //

-- Restaura o delimitador
DELIMITER ;

-- Tabela de Auditoria (executar antes do Trigger)
CREATE TABLE IF NOT EXISTS log_status_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    status_antigo VARCHAR(50),
    status_novo VARCHAR(50),
    data_mudanca TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Altera o delimitador
DELIMITER //

CREATE TRIGGER trg_log_status_pedido
-- Executa ANTES de um UPDATE na tabela 'pedidos'
BEFORE UPDATE ON pedidos
FOR EACH ROW
BEGIN
    -- Verifica se o valor da coluna 'status' foi realmente alterado.
    IF OLD.status <> NEW.status THEN
        -- Insere o registro de auditoria, usando OLD e NEW para capturar os valores.
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

-- Restaura o delimitador
DELIMITER ;

-- Altera o delimitador
DELIMITER //

CREATE TRIGGER trg_validacao_cliente
-- Executa ANTES de um INSERT na tabela 'usuarios'
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    -- Padronização: força o nome a ser salvo em letras maiúsculas.
    SET NEW.nome = UPPER(NEW.nome);

    -- Validação: rejeita a inserção se o CPF não estiver preenchido.
    IF NEW.cpf IS NULL OR NEW.cpf = '' THEN
        -- Retorna um erro customizado e interrompe a operação.
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERRO: O CPF do usuário não pode ser nulo ou vazio.';
    END IF;
END //

-- Restaura o delimitador
DELIMITER ;

-- Comando para remover o Gatilho de Estoque
DROP TRIGGER IF EXISTS trg_baixa_estoque;

-- Comando para remover o Gatilho de Auditoria
DROP TRIGGER IF EXISTS trg_log_status_pedido;

-- Comando para remover o Gatilho de Validação
DROP TRIGGER IF EXISTS trg_validacao_cliente;