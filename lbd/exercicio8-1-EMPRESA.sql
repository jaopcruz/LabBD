SELECT f.cpf
FROM funcionario f
JOIN departamento d ON f.cpf = d.cpf_gerente
WHERE f.cpf IN (SELECT cpf_supervisor FROM funcionario)
