
--DESAFIO - FUNDAMENTOS SQL

--Produtos cadastrados com valor de maior que 1500 doletas
SELECT COUNT (ListPrice)
FROM Production.Product
WHERE ListPrice > 1500

--Quantas pessoas temos com o sobrenome que inicia com a letra P?

SELECT COUNT(LastName)
FROM Person.Person
WHERE LastName LIKE 'P%'

--Em quantas cidades únicas estão cadastrados nossos clientes?

SELECT COUNT(DISTINCT City)
FROM Person.Address

--Quais são as cidades únicas que temos cadastradas em nosso sistema?

Select DISTINCT (City)
FROM Person.Address
ORDER BY City asc

--Quantos produtos vermelhos têm o preço entre 500 e 1000 doletas?

SELECT COUNT(*)
FROM Production.Product
WHERE Color = 'red' AND ListPrice BETWEEN 500 AND 1000

--Quantos produtos cadastrados têm a palavra "road" no nome deles?

SELECT COUNT(*)
FROM Production.Product
WHERE Name LIKE 'ROAD%'
