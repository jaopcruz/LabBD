SELECT 
    nome,
    CASE 
        WHEN tipo = 'A' THEN 22.0
        WHEN tipo = 'B' THEN 75.0
        WHEN tipo = 'C' THEN 53.5
    END AS preco
FROM 
    produto
ORDER BY 
    CASE tipo
        WHEN 'A' THEN 1
        WHEN 'B' THEN 2
        WHEN 'C' THEN 3
    END,
    id DESC;
