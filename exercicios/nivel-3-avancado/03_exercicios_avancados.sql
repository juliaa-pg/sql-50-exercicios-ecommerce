-- NÍVEL 3: AVANÇADO (EXERCÍCIOS 31 A 45)

-- 31. Liste cada pedido com o nome do cliente que o fez.

SELECT c.nome, p.id_pedido
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id_cliente = p.id_cliente;

-- 32. Mostre os itens de pedido com o nome do produto de cada um.

SELECT it.id_item, p.nome_produto
FROM itens_pedido AS it
INNER JOIN produtos AS p ON it.id_produto = p.id_produto;

-- 33. Liste os pedidos com a transportadora e o status da entrega.

SELECT p.id_pedido, e.transportadora, e.status_entrega
FROM pedidos AS p
INNER JOIN entregas AS e ON p.id_pedido = e.id_pedido;

-- 34. Liste todos os clientes e, se tiverem, os pedidos. Clientes sem pedido também devem aparecer.

SELECT c.nome, p.id_pedido
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id_cliente = p.id_cliente;

-- 35. Encontre os clientes que nunca fizeram nenhum pedido.

SELECT c.nome, p.id_pedido
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id_cliente = p.id_cliente
WHERE id_pedido IS NULL;

-- 36. Mostre o nome de cada cliente e o total que ele já gastou.

SELECT c.nome, SUM(p.valor_total) AS total_gasto
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id_cliente = p.id_cliente
GROUP BY c.nome;

-- 37. Mostre os 10 clientes que mais gastaram na loja.

SELECT c.nome, SUM(p.valor_total) AS total_gasto
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id_cliente = p.id_cliente
GROUP BY c.nome
ORDER BY total_gasto DESC
LIMIT 10;

-- 38. Qual categoria de produto gerou mais faturamento?

SELECT pr.categoria, SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM produtos AS pr
INNER JOIN itens_pedido AS ip ON pr.id_produto = ip.id_produto
GROUP BY pr.categoria
ORDER BY faturamento DESC
LIMIT 1;

-- 39. Quais são os 5 produtos mais vendidos em quantidade?

SELECT pr.nome_produto, SUM(ip.quantidade) AS total_vendido
FROM produtos AS pr
INNER JOIN itens_pedido AS ip ON pr.id_produto = ip.id_produto
GROUP BY pr.nome_produto
ORDER BY total_vendido DESC
LIMIT 5;

-- 40. Quantos pedidos foram feitos por clientes de cada cidade?

SELECT c.cidade, COUNT(p.id_pedido) AS total_pedidos
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id_cliente = p.id_cliente
GROUP BY c.cidade
ORDER BY total_pedidos DESC;

-- 41. Mostre o nome do cliente, o id do pedido e o nome dos produtos comprados.

SELECT c.nome, p.id_pedido, pr.nome_produto
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id_cliente = p.id_cliente
INNER JOIN itens_pedido AS ip ON p.id_pedido = ip.id_pedido
INNER JOIN produtos AS pr ON ip.id_produto = pr.id_produto;

-- 42. Qual o valor médio dos pedidos em cada estado?

SELECT c.estado, AVG(p.valor_total) AS media_pedidos
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id_cliente = p.id_cliente -- aparece apenas a média em SP
GROUP BY c.estado
ORDER BY media_pedidos DESC;

SELECT DISTINCT estado -- verificando quais estados tem na tabela
FROM clientes;

SELECT c.estado, COUNT(*) AS total_pedidos				--verifica quantos pedidos estão associados a cada estado
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id_cliente = p.id_cliente
GROUP BY c.estado;

SELECT c.estado, AVG(p.valor_total) AS media_pedidos
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id_cliente = p.id_cliente -- trocando para LEFT JOIN
GROUP BY c.estado
ORDER BY media_pedidos DESC;

SELECT
    c.estado,
    COUNT(DISTINCT c.id_cliente) AS total_clientes, -- não existe pedidos nos demais estados
    COUNT(p.id_pedido) AS total_pedidos
FROM clientes AS c
LEFT JOIN pedidos AS p
    ON c.id_cliente = p.id_cliente
GROUP BY c.estado
ORDER BY c.estado;

-- 43. Quantas entregas com status 'Atrasada' cada transportadora teve?

SELECT transportadora, COUNT(status_entrega) AS total_atrasos
FROM entregas
WHERE status_entrega = 'Atrasada'
GROUP BY transportadora
ORDER BY total_atrasos DESC;

-- 44. Qual o faturamento por estado, considerando apenas pedidos entregues?

SELECT c.estado, SUM(p.valor_total) AS faturamento
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id_cliente = p.id_cliente
WHERE p.status = 'Entregue'
GROUP BY c.estado
ORDER BY faturamento DESC;

-- 45. Quantos produtos diferentes cada cliente já comprou?

SELECT c.nome, COUNT(DISTINCT ip.id_produto) AS total_produtos
FROM clientes AS c
INNER JOIN pedidos AS p ON c.id_cliente = p.id_cliente
INNER JOIN itens_pedido AS ip ON p.id_pedido = ip.id_pedido
GROUP BY c.nome
ORDER BY total_produtos DESC;



























