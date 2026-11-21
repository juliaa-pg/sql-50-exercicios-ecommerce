-- NÍVEL 2: INTERMEDIÁRIO (EXERCÍCIOS 16 A 30)

-- 16. Quantos clientes a loja tem no total?

SELECT COUNT(*) AS total_clientes
FROM clientes;

-- 17. Qual foi o faturamento total da loja (soma de todos os pedidos)?

SELECT SUM(valor_total) AS faturamento
FROM pedidos;

-- 18. Qual é o valor médio dos pedidos (o ticket médio)?

SELECT AVG(valor_total) AS ticket_medio
FROM pedidos;

-- 19. Qual o preço do produto mais caro e do mais barato da loja?

SELECT 
	MAX(preco) AS mais_caro, 
	MIN(preco) AS mais_barato
FROM produtos;

-- 20. Quantos clientes existem em cada estado?

SELECT estado, COUNT(*) AS total_clientes
FROM clientes 
GROUP BY estado;

-- 21. Qual o faturamento total de pedidos em cada status?

SELECT status, SUM(valor_total) AS faturamento_por_status
FROM pedidos
GROUP BY status;

-- 22. Quantos produtos diferentes existem em cada categoria?

SELECT categoria, COUNT(*) AS produto_por_categoria
FROM produtos
GROUP BY categoria;

-- 23. Qual o preço médio dos produtos em cada categoria?

SELECT categoria, AVG(preco) AS preco_medio
FROM produtos
GROUP BY categoria;

-- 24. Quantos pedidos cada cliente fez?

SELECT id_cliente, COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY id_cliente;

-- 25. Mostre apenas os estados que têm mais de 50 clientes.

SELECT estado, COUNT(*) AS total_clientes
FROM clientes
GROUP BY estado
HAVING COUNT(*) > 50;

-- 26. Mostre as categorias cujo preço médio dos produtos passa de R$ 200.

SELECT categoria, AVG(preco) AS preco_medio
FROM produtos
GROUP BY categoria
HAVING AVG(preco) > 200;

-- 27. Liste os clientes que fizeram mais de 5 pedidos.

SELECT id_cliente, COUNT(*) AS qtd_pedidos
FROM pedidos
GROUP BY id_cliente
HAVING COUNT(*) > 5;

-- 28. Considerando só os pedidos com status 'Entregue', mostre os estados... na verdade, mostre os clientes que gastaram mais de R$ 1.000 no total.

SELECT id_cliente, SUM(valor_total) AS total_em_pedidos
FROM pedidos
WHERE status = 'Entregue'
GROUP BY id_cliente
HAVING SUM(valor_total) > 1000;

-- 29. Qual o faturamento total agrupado por status, mostrando do maior pro menor?

SELECT status, SUM(valor_total) AS faturamento
FROM pedidos
GROUP BY status
ORDER BY faturamento DESC;

-- 30. Em quantos estados diferentes a loja tem clientes?

SELECT COUNT(DISTINCT estado) AS total_estados
FROM clientes;
