/* Objetivo: Criar uma View que liste o ID do Pedido, o Nome do Cliente, o Status do Pedido, o Nome do Produto comprado e a Quantidade.
*/
CREATE VIEW v_pedidos_detalhados AS
SELECT
    p.id AS ID_Pedido,
    u.nome AS Nome_Cliente,
    p.status AS Status_Pedido,
    pr.nome AS Nome_Produto,
    ip.quantidade AS Quantidade_Comprada,
    ip.preco_unitario AS Preco_Unitario
FROM
    pedidos p
JOIN
    usuarios u ON p.cliente_id = u.id
JOIN
    itens_pedido ip ON p.id = ip.pedido_id
JOIN
    produtos pr ON ip.produto_id = pr.id;
    
    -- Consultando a View
    
    select * from v_pedidos_detalhados;
    
    /*
		Criando View que fornece uma lista de usuários com todos os dados essenciais exceto a senha e o CPF, que são informações sensíveis. 
    */
    
    CREATE VIEW v_clientes_sem_senha AS
SELECT
    id,
    nome,
    email,
    celular,
    criado_em
FROM
    usuarios;
    
    select * from v_clientes_sem_senha;
    
    /*
		Esta View é útil para demonstrar como incorporar uma regra de negócio (produtos com baixo estoque) e como fazer um JOIN simples para trazer informações adicionais 
        (o nome da categoria). Ela seria usada pela equipe de logística ou compras.
    */
    
    CREATE VIEW v_resumo_estoque_baixo AS
SELECT
    p.id AS ID_Produto,
    p.nome AS Nome_Produto,
    p.estoque AS Estoque_Atual,
    p.preco AS Preco_Venda,
    c.nome AS Categoria
FROM
    produtos p
JOIN
    categorias c ON p.categoria_id = c.id
WHERE
    p.estoque < 10;
    
    -- Consultando a view
    
    select * from v_resumo_estoque_baixo;