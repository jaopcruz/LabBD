SELECT id, nome
FROM produto
WHERE preco < 5 OR preco > 200
ORDER BY nome DESC;