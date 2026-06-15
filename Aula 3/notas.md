
# Consunta e manipulação SQL
Sempre que for manipular um banco de dados, analisa primeiro o Modelo Relacional, pra endender como funcina

O campo null é desconsiderado nas consuntas, tanto em funções matemáticas, quanto em counts, no geral o null representa a falta de informações.

## Sintaxe básica para consultas em SQL com SELECT
```SQL
SELECT colunas;
FROM tabelas
WHERE condições;
-- Mostre as colunas, das tabelas, com essas condições
```

```SQL
SELECT * FROM Hospedes; -- Vai retornar todos os dados da tabela hóspedes.
```

Aqui ele vai mostrar apenas as tabelas escolhidas, separadas por vírgula (É simples)
```SQL
SELECT nome,endereco FROM Hospedes;
```
O Where é opcional, pois só vai ser usado se tiver critério de busca/consulta

Tem como fazer operações matemáticas direto na consulta, em tempo de execução.
```SQL
SELECT tipo, valorDiaria * 1.1 FROM Quartos; -- Já retorna o cálculo pedido
```

^ Retorna uma coluna _"Nenhum nome de coluna"_ pois não é uma coluna existente, ela não está salva no BD, ela aparece em tempo de execução apenas para o cálculo pedido.

Para dar um nome depois dela usa-se a palavra reservada _AS_ ao final. **OPCIONAL**

```SQL
SELECT tipo, valorDiaria, ValorDiaria * 1.1 AS Diaria10PorCento FROM Quartos;
```
Se for ter caracteres especial ou espaço, usa 'aspas', se não, nem precisa.

### Funções matemáticas:
Funciona de maneira parecida com excel, funções que retornam valores de operações

```SQL
SELECT SUM(ValorDiaria) FROM Quartos; -- Pega todas as linhas e retorna a soma total da coluna passada
```
^Também posso usar o _AS_ para renomear a coluna dos resultados

**Agora uma consulta mais complexa**
```SQL
SELECT SUM(valorDiaria) AS soma, AVG(valorDiaria) AS media, MAX(valorDiaria) AS maximo, MIN(valorDiaria) AS minimo FROM Quartos;
```
- SUM() Soma os dados de uma coluna específica
- AVG() Mostra a média entre os dados da coluna
- MAX() e MIN() Mostra o valor máximo e mínimo de uma coluna

Conta quantos itens estão cadastrados na tabela, por exemplo, contar todas as estadias do hotel
```SQL
SELECT COUNT(idEstadia) FROM Estadias;
```
^ É Bom sempre contar usando a coluna que é PK, pq ele não conta com itens que são nulos nas tabelas

^ _COUNT(*)_ Vai contar todas as linhas da coluna, na prática funciona igual contar as PK's

## Sintaxe básica para consultas em SQL com Where
```SQL
SELECT * FROM Hospedes WHERE Sexo = 'F' AND dataNascimento >= '1980-01-01' AND dataNascimento <= '1989-12-31';
```
Para reduzir o tamanho do código, usamos _BETWEN_ para informar um intervalo

```SQL
SELECT * FROM Hospedes WHERE Sexo = 'F' AND dataNascimento BETWEEN '1980-01-01' AND '1989-12-31';
```

## Sintaxe comando _IN_


```SQL
SELECT * FROM Servicos WHERE descricao = 'Lavanderia' OR descricao = 'baba'
```
para ficar mais compacto poderia usa-se o IN, que substitui os vários _OR_
```SQL
SELECT * FROM Servicos WHERE descricao IN ('Lavanderia', 'Baba')
```

## Como fazer um _FROM_ com duas tabelas ?
- Mostre o nome dos hóspedes que tiveram estadia em 2025.

    ^ Para isso, temos que pegar a tebela de hóspede, procurar se está na tabela estadia e buscar se ela está em 2025.
    
    Pra isso, temos que usar as duas tabelas

```SQL
SELECT * FROM Hospedes, Estadia
```

Quando tu junta duas tabelas, ela junta uma linha de uma com todas as outras fazendo uma combinação. Cada item da tabela A, se junta com todos os itens da tabela B.

Nesse caso, ela vai retornar tudo, então é bom verificar se a PK de uma é igual a FK do outro, pra garantir que estão tratando realmente do mesmo item

```SQL
SELECT CPF,nome,idEstadia,Hospede,dataEntrada FROM Hospedes, Estadias WHERE CPF = Hospede;
```
Pra facilitar uso alias pra modificar o nome da tabela na consulta e referenciar ela pra ter certeza que a coluna é dela:
```SQL
SELECT h.CPF, h.nome ,e.idEstadia ,e.Hospede ,e.dataEntrada FROM Hospedes AS h, Estadias AS e WHERE h.CPF = e.Hospede;
```

- _Mostre os nomes de hóspedes que tiveram estadias em 2025_:

```SQL
SELECT h.CPF, h.nome ,e.idEstadia ,e.Hospede ,e.dataEntrada FROM Hospedes AS h, Estadias AS e WHERE CPF = Hospede; AND dataEntrada BETWEEN '2025-01-01' AND '2025-12-31'
```