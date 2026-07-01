--Para prova, até a F
--letra A):
SELECT * FROM pedido WHERE datapedido BETWEEN '2009-01-01' AND '2009-12-31';

--Letra B)
SELECT f.codigo, f.nome From funcionario f, pedido pe 
Where pe.vendedor = f.codigo 
AND pe.datapedido BETWEEN '2010-01-01' AND '2020-12-31'
AND f.nome LIKE ('%Silva%')
-- %A a no final, A% a no começo, %A% tem a em qualquer parte (O % siginifica 'qualquer cadeia de caracteres)
-- Caso não queira repetir, basta colocar DISTINCT após o SELECT. Ele funciona pra a tupla inteira (todas as tabelas que vem na consulta)

--Letra C)
SELECT DISTINCT pr.nome, pr.descricao FROM Cliente c, produto pr,pedido pe, itens i
WHERE i.produto = pr.codigo
AND pe.cliente = c.codigo 
AND i.pedido = pe.codigo
AND c.tipo = 'PJ' 

--Letra h)
Select distinct f.nome from cliente cl, funcionario f, pedido p, cidade ci --define as tabelas
where p.vendedor = f.codigo
and cl.codigo = p.cliente
and ci.nome = 'Rio de janeiro'
and cl.cidade = ci.codigo

Select * from cidade