-- Pesquisar Cliente Especifico

DELIMITER //
CREATE PROCEDURE pesquisar_cliente()
BEGIN
	SELECT * FROM clientes WHERE cnpj = '00.000.000/0001-01';
END //
DELIMITER ;

--  Pesquisar Quantidade de ocorrencias

DELIMITER //
CREATE PROCEDURE pesquisar_QTD_ocorrencias()
BEGIN
	SELECT 
    m.cnh, m.nome, COUNT(o.id) AS qtd_ocorrencias
FROM
    motoristas m
        JOIN
    entregas e ON e.motorista_cnh = m.cnh
        JOIN
    ocorrencias o ON o.entrega_id = e.id
GROUP BY m.cnh , m.nome
HAVING qtd_ocorrencias >= 1
ORDER BY qtd_ocorrencias DESC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE pesquisar_status_pagamento(pesquisar varchar(50))
BEGIN
	SELECT c.cnpj, c.nome, ROUND(AVG(p.valor),2) AS media_valor_pago, COUNT(p.id) AS qtd_pagamentos
	FROM clientes c
	JOIN pagamentos p ON p.cliente_cnpj = c.cnpj AND p.status= pesquisar
	GROUP BY c.cnpj, c.nome
	ORDER BY media_valor_pago DESC;
END //
DELIMITER ;




CALL pesquisar_cliente;
CALL pesquisar_ocorrencias;
CALL pesquisar_status_pagamento('Pago');

