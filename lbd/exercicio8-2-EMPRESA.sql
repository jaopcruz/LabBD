---Liste o nome, cpf e salario dos funcionários que nunca trabalharam em nenhum projeto.

SELECT 
    f.pnome,
    f.cpf,
    f.salario
FROM
    funcionario f
WHERE
    f.cpf NOT IN (SELECT fcpf FROM trabalha_em)
ORDER BY
    f.salario ASC;
