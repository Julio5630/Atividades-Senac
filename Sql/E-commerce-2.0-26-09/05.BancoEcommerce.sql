DELIMITER //

CREATE PROCEDURE listar_produtos_por_categoria(IN categoria_id_param INT)
BEGIN
    SELECT p.nome, p.preco, p.estoque, c.nome AS categoria
    FROM produtos AS p
    JOIN categorias AS c ON p.categoria_id = c.id
    WHERE p.categoria_id = categoria_id_param;
END //

DELIMITER ;

-- Para executar a procedure:
CALL listar_produtos_por_categoria(1);

DELIMITER //

CREATE PROCEDURE atualizar_preco_categoria(
    IN categoria_id_param INT,
    IN novo_preco DECIMAL(10, 2)
)
BEGIN
    UPDATE produtos
    SET preco = novo_preco
    WHERE categoria_id = categoria_id_param;
END //

DELIMITER ;

-- Para executar a procedure:
CALL atualizar_preco_categoria(3, 150.00);