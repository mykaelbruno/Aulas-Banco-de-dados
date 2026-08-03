# SQL - Parte 2 DML.pdf
## Order by
O Order by ordena o dado pela coluna apontada

Posso usar o DESC pra inverter a ordem
```SQL
select * from Hospedes where sexo = 'F' 
order by nome DESC
```
Tem como usar duas colunas pra ordenar
```SQL
select * from Hospedes where sexo = 'F' 
order by nome,dataNasc
```
## Group By
Digamos que você queira uma tabela com Sexo e um contador, tentaremos fazer:
```SQL
Select sexo, count(*) from Hospedes --Vai quebrar!
```
O count só retorna uma linha, contando tudo de uma vez, já o sexo, várias, isso quebra o conceito de retorno em tupla do sql

Com o **Group BY** ele agrupa, pra depois contar. Primeiro ele junta os iguais, depois conta
```SQL
Select sexo, count(*) from Hospedes group by sexo; -- Agrupa os sexos iguais, e conta quantos
```

```SQL
-- Mostre para cada serviço, a sua descrição, o valor individual, a quantidade de veze que ele foi solicitado e e valor total dos valores, apenas se o serviço for lavanderia ou baba

select se.descricao, se.preco, count(*), SUM(se.preco) 
from Servicos se, Solicitacoes so 
where se.codServico = so.servico and se.descricao IN ('babá', 'lavanderia')
group by se.descricao, se.preco
-- SUM e e count são calculadas
-- As outras são simples, vem direto do BD, todas as simples tem que ser agrupadas
```
## Heaving
```sql
--Seguindo o ultimo exemplo, Mostre apenas os resultados cujo o valor total seja > 500
-- Agora vamos condicionar uma função calculada
select se.descricao, se.preco, count(*), SUM(se.preco) 
from Servicos se, Solicitacoes so 
where se.codServico = so.servico and se.descricao IN ('babá', 'lavanderia')
group by se.descricao, se.preco
Having SUM(se.preco) > 500
-- A clausula having funciona com o group by para condicionar funções calculadas
-- Não pode haver condição dentro do select
```

## SubConsulta
-> Mostre o nome do hóspede e a data de estadia, para o hóspede que teve a estadia mais recente
```sql
Select  h.nome, e.dataEntrada from Hospedes h , Estadias e where h.CPF = e.hospede and e.dataEntrada = (
	SELECT max(e.dataEntrada) from Estadias e
);
```

-> Exiba os hóspedes que solicitaram algum serviço cujo o valor sseja maior que a média de valors de todos os serviços

```sql
where h.CPF = so.hospede and se.codServico = so.servico 
and se.preco > (select AVG(preco) from Servicos)
```

```sql
-- consultas aninhadas que a mais externa espera o resultado da mais interna
-- Usa '=' quando a subconsulta retornar só um, 'in' quando retornar um resultado ou uma lisa

-- Consulta comum unindo tabelas:
Select h.* From Hospedes h, Servicos se, Solicitacoes so 
where h.CPF = so.hospede and se.codServico = so.servico 
and se.preco > (select AVG(preco) from Servicos)
-- Usando subconsulta (tira as repetições), mais rápida
Select * from Hospedes 
where cpf in (
	Select Hospede from Solicitacoes
	where servico in (
		SELECT codServico from Servicos
		where preco > (Select avg(preco) from Servicos)
		)
);
-- Só da pra fazer assim, se o retorno for de uma tabela só
-- Se for só o hospede pode, se for mostrar o nome do hóspede e a data da separação
```

-> Mostre os tipos e valores de diárias dos quartos que tiveram estadias por hóspedes do sexo feminino se hospedaram entre 2023 e 2025
```sql
select tipo, valorDiaria from Quartos where numero in (
	select quarto from estadias where YEAR(dataEntrada) between '2023' and '2025' and hospede in (
		select cpf from hospedes where sexo = 'F'
		)
	)
```