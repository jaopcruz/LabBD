select f.cpf as cpf_funcionario, 
f.pnome as nome_funcionario, 
f.salario as salario_funcionario, 
d.cpf_gerente,f1.pnome as nome_gerente, 
f1.salario as salario_gerente 
from funcionario as f left join departamento as d on f.dnr=dnumero 
left join funcionario as f1 on d.cpf_gerente=f1.cpf
where salario_funcionario<=salario_gerente
Order by salario_funcionario desc;