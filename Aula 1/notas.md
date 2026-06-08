## Tipos DDL e DNL e DCL:
- DDL = Descrição de dados;
- DML = Manipulação de dados;
- DCL = Controle de dados;

## Sintaxe básica do sql
```sql
CREATE TABLE nome(
	coluna tipo,
);
```

- IDENTITY:
    - Caracterísitco do SQL Server, incrementa automaticamente quanodo um objeto é aidicionado
    - Mesmo que vc exclua um item, nenhum outro ocupa o mesmo id
        - Ele incrementa mesmo no erro
- VARCHAR(tamanho)
    - String, se não colocar o número ele vai guardar apenas um caractere
    - Máximo de 8k caracteres, acima disso é TEXT
    - Pode usar o tamanho "max" pra usar o maximo
    - Existe também o CHAR, funciona da mesma maneira, mas ta caindo em desusu
       - A diferença é que o VARCHAR é mais dinamico, o CHAR é físico
        VARCHAR libera os espaços que não estão sendo usados

- PRIMARY KEY:
    - Indica quem é a chave primária do objeto
    pode ser colocada ao fim do item ou ao final da tabela com () indicando qual é
    - Se colocar duas da erro, pra adicionar uma composta eu coloco vírgula
- UNIQUE
    - Pra colocar mais de um eu crio outro unique
    - O dado não deve se repetir na coluna

```sql
SELECT * FROM Usuarios

FLOAT
NUMERIC(max, casasDecimais) 12345,22

DATE guarda data
DATETIME Epecifico do SQL server, guarda data e hora
TIMESTAMP do postgree

inserir dados para uma tabela
INSERT INTO tabela
VALUES(

)
````

- Como adicionar a FK nas teblas pois ela nn pega automaticament
```sql
INSERT INTO Emprestimo
VALUES (1,1,1, 2026-02-01, ....)
```

- aqui estamos adicionando pela ordem da tabela, PK, FK, FK
- O formato da data é por tentativa e erro, pq tem o formato que o ano vem primiero e o normal, depende do pc