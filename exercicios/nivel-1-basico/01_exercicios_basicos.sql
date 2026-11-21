-- NÍVEL 1: BÁSICO (EXERCÍCIOS 01 A 15)

-- 1. Mostre o nome e o email de todos os clientes cadastrados.

SELECT nome,email
FROM clientes;

-- 2. Mostre todos os produtos da categoria 'Eletrônicos'.

SELECT id_produto,nome_produto, categoria
FROM produtos
WHERE categoria = 'Eletrônicos';

-- 3. Liste os produtos que custam mais de R$ 500.

SELECT id_produto, nome_produto, preco
FROM produtos
WHERE (preco > 500);

-- 4. Mostre os clientes que moram no estado 'SP'.

SELECT nome,estado 
FROM clientes
WHERE estado = 'SP';

-- 5. Liste todos os pedidos, do maior valor total para o menor.

SELECT id_pedido, VALOR_TOTAL 
FROM pedidos
ORDER BY valor_total DESC;

-- 6. Mostre apenas os 5 produtos mais caros da loja.

SELECT nome_produto, preco
FROM produtos
ORDER BY preco DESC LIMIT 5;

-- 7. Liste os produtos que custam entre R$ 100 e R$ 300.

SELECT nome_produto, preco
FROM produtos
WHERE preco BETWEEN 100 AND 300;

-- 8. Mostre os clientes que moram em 'SP', 'RJ' ou 'MG'.

SELECT nome,estado
FROM clientes
WHERE estado IN ('SP','RJ','MG');

-- 9. Encontre os clientes cujo nome começa com a letra 'A'.

SELECT nome 
FROM clientes
WHERE nome LIKE 'A%';

-- 10. Liste os pedidos que não tiveram custo de frete (frete igual a zero).

SELECT id_pedido, valor_frete
FROM pedidos
WHERE valor_frete = 0;

-- 11. Mostre os produtos da categoria 'Eletrônicos' que custam menos de R$ 1.000.

SELECT nome_produto, categoria, preco
FROM produtos
WHERE categoria = 'Eletrônicos' AND preco < 1000;

-- 12. Liste os pedidos com status 'Cancelado' ou 'Pendente'.

SELECT id_pedido, status
FROM pedidos
WHERE status IN ('Cancelado', 'Pendente');

-- 13. Encontre os produtos que estão com estoque zerado.

SELECT nome_produto, estoque
FROM produtos
WHERE estoque = 0;

-- 14. Mostre os clientes que se cadastraram a partir de 01/01/2026, do mais recente pro mais antigo.

SELECT nome, data_cadastro
FROM clientes
WHERE data_cadastro >= '2026-01-01'
ORDER BY DATA_CADASTRO DESC;

-- 15. Liste os 10 pedidos mais recentes da loja.

SELECT id_pedido, data_pedido 
FROM pedidos
ORDER BY data_pedido DESC
LIMIT 10;







