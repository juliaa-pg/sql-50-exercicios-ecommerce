
BEGIN;

TRUNCATE TABLE
    itens_pedido,
    entregas,
    pedidos,
    produtos,
    clientes
RESTART IDENTITY CASCADE;


INSERT INTO clientes
    (nome, email, cidade, estado, data_cadastro)
SELECT
    CASE
        WHEN i % 10 = 1 THEN 'Ana Silva ' || i
        WHEN i % 10 = 2 THEN 'Amanda Costa ' || i
        WHEN i % 10 = 3 THEN 'Arthur Oliveira ' || i
        ELSE 'Cliente ' || i
    END,
    'cliente' || i || '@email.com',
    CASE
        WHEN i % 19 = 0 THEN NULL
        WHEN i <= 52 THEN 'São Paulo'
        WHEN i <= 55 THEN 'Rio de Janeiro'
        WHEN i <= 58 THEN 'Belo Horizonte'
        ELSE 'Curitiba'
    END,
    CASE
        WHEN i = 60 THEN NULL
        WHEN i <= 52 THEN 'SP'
        WHEN i <= 55 THEN 'RJ'
        WHEN i <= 58 THEN 'MG'
        ELSE 'PR'
    END,
    CASE
        WHEN i % 3 = 0
            THEN DATE '2026-01-01' + ((i * 7) % 250)
        ELSE DATE '2025-01-01' + ((i * 7) % 365)
    END
FROM generate_series(1, 60) AS s(i);


INSERT INTO produtos
    (nome_produto, categoria, preco, estoque)
SELECT
    (ARRAY[
        'Notebook', 'Mouse', 'Teclado', 'Monitor',
        'Cadeira', 'Headset', 'Webcam', 'Impressora',
        'Tablet', 'Smartphone'
    ])[((i - 1) % 10) + 1] || ' ' || i,
    (ARRAY[
        'Eletrônicos', 'Acessórios', 'Informática',
        'Móveis', 'Periféricos'
    ])[((i - 1) % 5) + 1],
    ROUND((100 + (i * 173 % 2500))::numeric, 2),
    CASE
        WHEN i % 5 = 0 THEN 0
        ELSE (i * 13) % 100
    END
FROM generate_series(1, 20) AS s(i);


INSERT INTO pedidos
    (id_cliente, data_pedido, status, valor_total, valor_frete)
SELECT
    CASE
        WHEN i <= 64 THEN ((i - 1) % 8) + 1
        ELSE ((i - 65) % 32) + 9
    END,
    DATE '2026-01-01' + ((i * 2) % 180),
    (ARRAY[
        'Entregue',
        'Em transporte',
        'Processando',
        'Enviado',
        'Cancelado',
        'Pendente'
    ])[((i - 1) % 6) + 1],
    0,
    CASE
        WHEN i % 10 = 0 THEN 0
        ELSE ROUND((12 + (i * 3.5 % 50))::numeric, 2)
    END
FROM generate_series(1, 120) AS s(i);


INSERT INTO itens_pedido
    (id_pedido, id_produto, quantidade, preco_unitario)
SELECT
    CASE
        WHEN i <= 120 THEN i
        ELSE i - 120
    END,
    ((i * 7 - 1) % 20) + 1,
    ((i - 1) % 4) + 1,
    pr.preco
FROM generate_series(1, 180) AS s(i)
JOIN produtos pr
    ON pr.id_produto = ((i * 7 - 1) % 20) + 1;


UPDATE pedidos p
SET valor_total = (
    SELECT COALESCE(
        SUM(ip.quantidade * ip.preco_unitario), 0
    )
    FROM itens_pedido ip
    WHERE ip.id_pedido = p.id_pedido
) + p.valor_frete;


INSERT INTO entregas
    (id_pedido, id_produto, transportadora,
     data_envio, data_entrega, status_entrega)
SELECT
    p.id_pedido,
    item.id_produto,
    (ARRAY[
        'Correios', 'Jadlog', 'Loggi',
        'Total Express', 'Mercado Envios'
    ])[((p.id_pedido - 1) % 5) + 1],
    CASE
        WHEN p.id_pedido % 11 = 0
            THEN p.data_pedido + 2
        WHEN p.status IN ('Processando', 'Pendente', 'Cancelado')
            THEN NULL
        ELSE p.data_pedido + 1
    END,
    CASE
        WHEN p.status = 'Entregue'
             AND p.id_pedido % 11 <> 0
            THEN p.data_pedido + 5
        ELSE NULL
    END,
    CASE
        WHEN p.id_pedido % 11 = 0 THEN 'Atrasada'
        WHEN p.status = 'Entregue' THEN 'Entregue'
        WHEN p.status = 'Cancelado' THEN 'Cancelada'
        WHEN p.status IN ('Processando', 'Pendente')
            THEN 'Aguardando envio'
        ELSE 'Em transporte'
    END
FROM pedidos p
JOIN (
    SELECT DISTINCT ON (id_pedido)
        id_pedido,
        id_produto
    FROM itens_pedido
    ORDER BY id_pedido, id_item
) item
    ON item.id_pedido = p.id_pedido;


COMMIT;


SELECT 'Clientes' AS tabela, COUNT(*) AS total FROM clientes
UNION ALL
SELECT 'Produtos', COUNT(*) FROM produtos
UNION ALL
SELECT 'Pedidos', COUNT(*) FROM pedidos
UNION ALL
SELECT 'Itens de pedidos', COUNT(*) FROM itens_pedido
UNION ALL
SELECT 'Entregas', COUNT(*) FROM entregas;