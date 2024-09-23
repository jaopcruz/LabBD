SELECT 'Aprovado: ' || nome || '|' || nota AS aprovados
FROM aluno
WHERE nota >= 7
ORDER BY nota DESC;