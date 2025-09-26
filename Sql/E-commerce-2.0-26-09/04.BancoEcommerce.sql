START TRANSACTION;

-- Passo 1: Inserir um novo pedido
INSERT INTO pedidos (id, cliente_id, data_pedido, status, total)
VALUES (31, 1, NOW(), 'Pago', 360.00);

-- Passo 2: Inserir os itens do pedido
INSERT INTO itens_pedido (id, pedido_id, produto_id, quantidade, preco_unitario)
VALUES (31, 31, 1, 2, 180.00);

-- Passo 3: Atualizar o estoque do produto
UPDATE produtos
SET estoque = estoque - 2
WHERE id = 1;

-- Confirma todas as alterações
COMMIT;

START TRANSACTION;

-- Passo 1: Atualizar o status do pedido para 'Cancelado'
UPDATE pedidos
SET status = 'Cancelado'
WHERE id = 31;

-- Passo 2: Repor o estoque do produto
UPDATE produtos
SET estoque = estoque + 2
WHERE id = 1;

-- Confirma todas as alterações
COMMIT;


START TRANSACTION;

-- Passo 1: Atualizar o preço dos produtos da categoria 1
UPDATE produtos
SET preco = 900.00
WHERE categoria_id = 1;

-- Passo 2: Verificar as alterações (opcional, apenas para demonstração)
SELECT nome, preco FROM produtos WHERE categoria_id = 1;

-- Passo 3: Reverter todas as alterações
ROLLBACK;

-- Passo 4: Verificar se as alterações foram desfeitas (opcional)
SELECT nome, preco FROM produtos WHERE categoria_id = 1;
