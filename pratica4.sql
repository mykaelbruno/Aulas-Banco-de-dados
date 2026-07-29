-- letra C, selecionar o funcionário mais jovem. (pego a maior data de nascimento e vejo se meu funcionário é igual
SELECT nome FROM funcionario 
WHERE datanasc = (SELECT MAX(datanasc) from funcionario)

--LETRA B Mostre os nomes dos produtos que foram comprados no pedido mais recente.
-- Restposta 1: Juntando as tabelas manualmente
SELECT pr.nome from produto pr, itens i, pedido pe 
where pr.codigo = i.produto 
and pe.codigo = i.pedido
and pe.datapedido = (SELECT MAX(datapedido) from pedido)
-- Resposta 2: Fazendo 100% com subconsulta (A junção continua feita por PK e FK, mas com subconsunta ao invés de junção de tabelas, ela está na mesma ordem)
-- A mais externa e a que eu quero que seja retonado
SELECT nome FROM produto where codigo in(
	SELECT produto FROM itens WHERE pedido in (
		SELECT codigo FROM pedido WHERE datapedido = (
			SELECT MAX(datapedido) FROM pedido
		)
	)
)

-- SUBCONSULTA É MAIS RÁPIDA E NN TRAZ VALORES REPETIDOS
-- SÓ PODE USAR A SUBCONSULTA SE O RETORNO FINAL FOR APENAS UM RETORNO DE UMA TABELA, SE FOR MAIS DE UMA NÃO DÁ

-- LETRA G:
SELECT nome FROM produto WHERE codigo in (
    SELECT produto FROM itens WHERE pedido IN (
        SELECT codigo FROM pedido WHERE YEAR(dataPedido) = 2022 and cliente IN (
            SELECT codigo FROM cliente WHERE tipo ='PF'
        )
    )
)