-- Aula pratica 5
-- a) Aqui eu vou usar um right join, para exibir todos os itens da tabela da direita, mesmo que eles não tenham uma correspondencia na esquerda
SELECT cl.nome, ci.nome from Cliente cl
RIGHT JOIN CIDADE ci ON cl.cidade = ci.codigo

-- b) Uso do INTO para criar uma nova tabela com # para ser temporária
Select pr.nome, (pr.venda - pr.custo) as diferenca 
into #Comprados 
from Pedido pe
join Itens i on i.pedido = pe.codigo
join Produto pr on pr.codigo = i.produto
WHERE pe.dataPedido between '2022-01-01' and '2022-06-30'

Select * from #Comprados
Drop table #Comprados

-- c)
Select distinct  pr.nome from produto pr
join Itens i on i.produto = pr.codigo
join Pedido pe on i.pedido = pe.codigo
where YEAR(pe.dataPedido) > YEAR(GETDATE()) - 2 --Pega 2025 e 2026

-- d)
select f.nome, f.estcivil from Funcionario f
join pedido pe on f.codigo = pe.vendedor
join Itens i on i.pedido = pe.codigo
join produto pr on pr.codigo = i.produto
where YEAR(pe.dataPedido) between 2021 and 2023
and pr.venda = (select MAX(venda) from Produto)

-- e)
Select c.nome, count(*) as Qtd
into #Lista
from Cliente c
join pedido pe on pe.cliente = c.codigo
where YEAR(dataPedido) = 2022
group by c.nome
Select * from #Lista

Select nome from #Lista where Qtd = (select MAX(qtd) from #Lista)

-- f)
Select ci.nome from cidade ci
join Cliente cl on cl.cidade = ci.codigo
join Pedido pe on pe.cliente = cl.codigo
where pe.dataPedido = (select max(dataPedido) from Pedido)

-- g)
select f.nome, f.gratific from Funcao f
join Funcionario fu on fu.funcao = f.codigo
where fu.codigo in (
	select codigo from Funcionario where cidade = (
		select codigo from cidade where nome = 'João Pessoa'
	)
)

-- h)
Select * from Cliente cl
where cl.codigo in (
	select pe.cliente from Pedido pe
	join itens i on i.pedido = pe.codigo
	where YEAR(pe.dataPedido) between 2020 and 2025
	and i.produto in (
		select codigo from produto where nome in ('Bicicleta Caloi','Notebook Dell')
	)
)
-- pegar os produtos que são bicicleta  ou notebbok
-- pegar os pedidos na data que ele queria
-- pegar os dados dos cliente que estão naquele pedido

-- Mostre o nome dos clientes que realizaram mais de 5 pedidos no ano de 2023. Exiba também a quantidade de pedidos realizados por cada um.
Select cl.nome, count(*) as QuantidadePedidos from Cliente cl
join pedido pe on pe.cliente = cl.codigo
where YEAR(pe.dataPedido) = 2023
group by cl.nome
having count(*) > 1