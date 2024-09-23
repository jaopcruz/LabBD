WITH cliente_counts AS (
    SELECT 
        nome AS nome_advogado,
        numero_cliente
    FROM 
        advogado
),
max_clientes AS (
    SELECT 
        nome_advogado,
        numero_cliente
    FROM 
        cliente_counts
    WHERE 
        numero_cliente = (SELECT MAX(numero_cliente) FROM cliente_counts)
),
min_clientes AS (
    SELECT 
        nome_advogado,
        numero_cliente
    FROM 
        cliente_counts
    WHERE 
        numero_cliente = (SELECT MIN(numero_cliente) FROM cliente_counts)
),
media_clientes AS (
    SELECT 
        ROUND(AVG(numero_cliente), 1) AS media
    FROM 
        cliente_counts
)

SELECT 
    nome_advogado,
    numero_cliente
FROM 
    max_clientes
UNION ALL
SELECT 
    nome_advogado,
    numero_cliente
FROM 
    min_clientes
UNION ALL
SELECT 
    'Média' AS nome_advogado,
    media AS numero_cliente
FROM 
    media_clientes
ORDER BY 
    nome_advogado ASC;
