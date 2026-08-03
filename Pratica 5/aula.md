# Utilização do Join
```sql
SELECT c.nome
FROM cliente c JOIN pedido pe ON c.codigo = pe.cliente
WHERE Year(pe.datapedido) = 2024
```

Basicamente: *"Tabeala 1 Join Tabela 2 ON PK1 = PK2"*

## Tipos de junção (join)

**Inner join**: É o join padrão por si só; Compara o par de PK e traz o resultado

**Left join**: Quando eu quero que o resultado traga dados da tabela da esquerda mesmo que não tenha nada na tabela na direita. No exemplo do execício, traz a cidade mesmo que não tenha nenhum cliente morando nela


**Right join**:

**Full join**: Left + Right

**Cross join**: Funciona como fazíamos sem join, junta cada item da tabela A com todos da tabela B, sem considerar a PK e FK.

# Utilização do INTO
Entre o FROM e o FROM salva os dados daquela consulta em uma nova tabela nomeada

```sql
SELECT ci.nome 
INTO resultado
FROM cidade ci
join cliente c on c.cidade = ci.codigo
join pedido pe on pe.cliente = c.codigo
Where pe.datapedido = (
    Select MAX(datapedido) from pedido
)
```
(Apenas SQL SERVER)
No INTO, eu posso colocar um # no nome da tabela para ser uma tabela temporária

Quando eu fechar minha conexão com o sevidor (Fecho meu SGPD) ela é excluida do banco de dados

```sql
SELECT ci.nome 
INTO #resultado
FROM cidade ci...
```

# Utilização do view (Não cai na prova)

É uma view da tabela, uma cópia que pode ser acessada por umapessoa em específico, co permissões e tals

Ela é atualizada automáticamente quando sua base é modificada
