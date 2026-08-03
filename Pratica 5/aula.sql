-- Letra A)
Select c.nome, ci.nome from cliente c RIGHT JOIN cidade ci ON ci.codigo = c.cidade
-- O resultado vai trazer os nomes de todas as cidades, mesmo que nenhuma cliente more nela (O cliente fica como null)

--Letra D
Select f.nome, f.estcivil
FROM funcionario f 
Join pedido pe on f.codigo = pe.vendedor
Join itens i on pe.codigo = i.pedido 
join produto pr on pr.codigo = i.produto
Where Year(pe.datapedido) between 2021 and 2023 and pr.venda = (
	Select MAX(venda) from Produto
)

--Letra F
-- Primeiro eu faço o from mostrando e onde é o dado que eu quero exibir, depois eu saio fazendo join pra unir ela com todo mundo
SELECT ci.nome FROM cidade ci
join cliente c on c.cidade = ci.codigo
join pedido pe on pe.cliente = c.codigo
Where pe.datapedido = (
    Select MAX(datapedido) from pedido
)

-- Resposta do chat corrigida 

