--Descrição: Liste todos os veículos com tipo 'SUV Compacta' e valor inferior a 30.000,00.

select * from veiculos
where valor <30000
and tipo='SUV Compacta'

--Exiba o nome dos clientes e o nome das concessionárias onde realizaram suas compras.

select
clientes.cliente ,
concessionarias.concessionaria 
from clientes
inner join concessionarias on clientes.id_concessionarias = concessionarias.id_concessionarias 
order by  clientes.cliente


---Conte quantos vendedores existem em cada concessionária.

select
    COUNT(v.id_vendedores) AS quantidade_vendedoresk,
    c.id_concessionarias,
    c.concessionaria

FROM
    public.concessionarias c
LEFT JOIN
    public.vendedores v ON c.id_concessionarias = v.id_concessionarias
GROUP BY
    c.id_concessionarias, c.concessionaria;
   
--- Encontre os veículos mais caros vendidos em cada tipo de veículo.


SELECT tipo, MAX(valor) AS valor_maximo
FROM veiculos
GROUP BY tipo;

--- Identifique as concessionárias que venderam mais de 5 veículos.

select 
id_concessionarias, 
count(id_veiculos) as vendas
 from vendas
group by id_concessionarias,id_veiculos HAVING COUNT(*) > 5
order by id_concessionarias

--Liste os três veículos mais caros disponíveis.

SELECT nome, valor
FROM veiculos
ORDER BY valor DESC
LIMIT 3;

--Selecione todos os veículos adicionados no último mês.


SELECT nome, data_inclusao
FROM veiculos
WHERE data_inclusao > CURRENT_TIMESTAMP - INTERVAL '1 month';

--Liste todas as cidades e qualquer concessionária nelas, se houver.

SELECT c.cidade, con.concessionaria
FROM cidades c
LEFT JOIN concessionarias con ON c.id_cidades = con.id_cidades

--Encontre clientes que compraram veículos 'SUV Premium Híbrida' ou veículos com valor acima de 60.000,00.
SELECT cl.cliente, v.nome AS veiculo, v.valor
FROM vendas vd
JOIN veiculos v ON vd.id_veiculos = v.id_veiculos
JOIN clientes cl ON vd.id_clientes = cl.id_clientes
WHERE v.tipo = 'SUV Premium Híbrida' OR v.valor > 60000.00;

