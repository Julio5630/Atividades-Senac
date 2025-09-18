-- 1. Selecione todos os dados da tabela `usuarios`.
SELECT * FROM usuarios;

-- 2. Selecione os nomes e e-mails de todos os usuários.
SELECT nome, email FROM usuarios;

-- 3. Selecione todos os produtos da tabela `produtos`.
SELECT * FROM produtos;

-- 4. Encontre todos os pedidos que têm o status 'Pendente'.
SELECT * FROM pedidos WHERE status = 'Pendente';

-- 5. Selecione o `nome` e o `preco` dos produtos com preço superior a R$ 500,00.
SELECT nome, preco FROM produtos WHERE preco > 500.00;

-- 6. Liste os usuários cujo nome começa com a letra 'A'.
SELECT * FROM usuarios WHERE nome LIKE 'A%';

-- 7. Encontre todos os endereços que pertencem ao estado 'SP'.
SELECT * FROM enderecos WHERE estado = 'SP';

-- 8. Selecione os pedidos com status 'Enviado' e que foram criados após '2025-01-01'.
SELECT * FROM pedidos WHERE status = 'Enviado' AND data_pedido > '2025-01-01';

-- 9. Selecione os produtos com estoque igual a zero.
SELECT * FROM produtos WHERE estoque = 0;

-- 10. Liste todas as categorias, mas sem repetições de nome.
SELECT DISTINCT nome FROM categorias;

-- 11. Liste os usuários em ordem alfabética de nome.
SELECT * FROM usuarios ORDER BY nome;

-- 12. Encontre os 5 produtos mais caros.
SELECT nome, preco FROM produtos ORDER BY preco DESC LIMIT 5;

-- 13. Calcule o número total de usuários cadastrados.
SELECT COUNT(*) FROM usuarios;

-- 14. Calcule o preço médio de todos os produtos.
SELECT AVG(preco) FROM produtos;

-- 15. Calcule o valor total de todos os pedidos somados.
SELECT SUM(total) FROM pedidos;

-- 16. Conte quantos pedidos estão com o status 'Pago'.
SELECT COUNT(*) FROM pedidos WHERE status = 'Pago';

-- 17. Encontre o produto mais barato.
SELECT nome, preco FROM produtos ORDER BY preco ASC LIMIT 1;

-- 18. Calcule o número total de itens vendidos na tabela `itens_pedido`.
SELECT SUM(quantidade) FROM itens_pedido;

-- 19. Calcule a soma total do estoque de todos os produtos.
SELECT SUM(estoque) FROM produtos;

-- 20. Liste as 10 categorias com o menor ID.
SELECT * FROM categorias ORDER BY id ASC LIMIT 10;

-- 21. Encontre o nome do cliente e a rua do endereço para cada endereço cadastrado.
SELECT u.nome, e.rua
FROM usuarios AS u
JOIN enderecos AS e ON u.id = e.cliente_id;

-- 22. Liste os nomes dos produtos e suas respectivas categorias.
SELECT p.nome AS produto, c.nome AS categoria
FROM produtos AS p
JOIN categorias AS c ON p.categoria_id = c.id;

-- 23. Mostre o nome do cliente e o status de todos os seus pedidos.
SELECT u.nome, p.status
FROM usuarios AS u
JOIN pedidos AS p ON u.id = p.cliente_id;

-- 24. Para cada item de pedido, liste o nome do produto e o nome do pedido.
-- Nota: Aqui, o "nome do pedido" pode ser o ID do pedido para identificação.
SELECT ip.pedido_id, prod.nome AS nome_produto
FROM itens_pedido AS ip
JOIN produtos AS prod ON ip.produto_id = prod.id;

-- 25. Encontre o nome do cliente, o status do pedido e o nome do produto para todos os pedidos realizados.
SELECT u.nome AS cliente, p.status AS status_pedido, prod.nome AS nome_produto
FROM pedidos AS p
JOIN usuarios AS u ON p.cliente_id = u.id
JOIN itens_pedido AS ip ON p.id = ip.pedido_id
JOIN produtos AS prod ON ip.produto_id = prod.id;

-- 26. Liste todos os produtos que foram pedidos, juntamente com a quantidade e o preço unitário do item de pedido.
SELECT p.nome AS nome_produto, ip.quantidade, ip.preco_unitario
FROM produtos AS p
JOIN itens_pedido AS ip ON p.id = ip.produto_id;

-- 27. Encontre o nome dos clientes que fizeram pedidos com status 'Enviado'.
SELECT u.nome
FROM usuarios AS u
JOIN pedidos AS p ON u.id = p.cliente_id
WHERE p.status = 'Enviado';

-- 28. Liste o nome dos produtos de uma categoria específica (por exemplo, `categoria_id` 3).
SELECT p.nome
FROM produtos AS p
JOIN categorias AS c ON p.categoria_id = c.id
WHERE c.id = 3;

-- 29. Para cada pedido, mostre o nome do cliente, o número total de itens no pedido e o valor total.
-- Nota: Usaremos o SUM() para somar a quantidade de cada item em cada pedido.
SELECT
    u.nome AS nome_cliente,
    SUM(ip.quantidade) AS total_itens,
    p.total AS valor_total_pedido
FROM pedidos AS p
JOIN usuarios AS u ON p.cliente_id = u.id
JOIN itens_pedido AS ip ON p.id = ip.pedido_id
GROUP BY u.nome, p.total;

-- 30. Crie uma lista com o nome do cliente, o nome do produto e a quantidade comprada, ordenando pelo nome do cliente.
SELECT
    u.nome AS nome_cliente,
    p.nome AS nome_produto,
    ip.quantidade
FROM usuarios AS u
JOIN pedidos AS ped ON u.id = ped.cliente_id
JOIN itens_pedido AS ip ON ped.id = ip.pedido_id
JOIN produtos AS p ON ip.produto_id = p.id
ORDER BY u.nome;

