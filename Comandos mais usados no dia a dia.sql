SELECT *
FROM Person.Person
WHERE FirstName = 'Roberto' AND LastName = 'ALONSO'

SELECT *
FROM Production.Product
WHERE ListPrice > 1500


/* A equipe precisa do nome das peças com peso maior que 500kg e não maior que 700kg*/
SELECT Name
FROM Production.Product
WHERE Weight > 500 AND Weight <= 700

/*Solicitação de todos os empegados casados e assalariados*/

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'm' and SalariedFlag = 1

/*temos que conseguir o e-mail de Peter Krebs para enviar-lhe cobrança.*/

SELECT *
FROM Person.Person
WHERE FirstName = 'peter' and LastName = 'krebs'
SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = 26

/* pra saber quantos produtoS temos na tabela de produtos*/

SELECT COUNT(Name)
FROM Production.Product

/*pra saber quantos tamanhos temos cadastrados em nossa tabela
*/
SELECT COUNT(Size)
FROM Production.Product

/*pra saber quantos tamanhos DIFERENTES temos cadastrados em nossa tabela
*/

SELECT COUNT(DISTINCT Size)
FROM Production.Product

-- Comando TOP

SELECT TOP 10 *
FROM Production.Product

--ORDER BY

SELECT FirstName,LastName
FROM Person.Person
ORDER BY FirstName asc

--trazendo o ID dos 10 produtos mais caros

SELECT TOP 10 ProductID FROM Production.Product
ORDER BY ListPrice desc

--Between - encontra valores entre um mínimo e um máximo

SELECT *
FROM Production.Product
WHERE Listprice BETWEEN 500 AND 700

-- Encontrando tudo que não é entre o mínimo e o máximo

SELECT *
FROM Production.Product
WHERE Listprice NOT BETWEEN 500 AND 700

-- ENcontrando os empregados cadastrados entre 2009 e 2010

SELECT * FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate

-- COMANDO IN - verifica se um valor corresponde a uma referência passada numa lista

SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (2,7,13)

SELECT *
FROM Person.Person
WHERE BusinessEntityID NOT IN (2,7,13)

-- COMANDO LIKE - LOCALIZA COM PARTES

SELECT * 
FROM Person.Person
WHERE FirstName LIKE 'OVI%' -- PARA LOCALIZAR QUALQUER NOME QUE COMECE COM OVI

SELECT * 
FROM Person.Person
WHERE FirstName LIKE '%ERTO' -- QUALQUER NOME QUE TERMINE COM ERTO

SELECT * 
FROM Person.Person
WHERE FirstName LIKE '%essa%' -- qualquer conjunto de caracteres no meio

SELECT * 
FROM Person.Person
WHERE FirstName LIKE '%ro_' -- com 1 underline podemos buscar o "ro" com 1 caracter após,alterar o número de underline altera o número de caracteres a localizar

--estudos------------------------------------------------------------

SELECT ProductID,Name,ProductNumber,ReorderPoint
FROM Production.Product
WHERE ReorderPoint BETWEEN 300 AND 1200 AND Name LIKE '%UB'
ORDER BY ReorderPoint asc

--Soma,minimo,MÁXIMO E MÉDIA

SELECT TOP 10 SUM(linetotal) AS ValorTotal
FROM Sales.SalesOrderDetail

SELECT TOP 10 MIN(linetotal) AS ValorMinimo
FROM Sales.SalesOrderDetail

SELECT TOP 10 Max(linetotal) AS ValorMaximo
FROM Sales.SalesOrderDetail

SELECT TOP 10 avg (linetotal) AS Media
FROM Sales.SalesOrderDetail


--Group by

SELECT *
FROM Sales.SalesTerritory

SELECT Name,SUM (SalesLastYear)
FROM Sales.SalesTerritory
GROUP BY Name
ORDER BY Name

SELECT *
FROM Production.Product

SELECT Name,SUM (Distinct ListPrice) AS Preco_item
FROM Production.Product
WHERE ListPrice > 0
GROUP BY Name
Order BY Preco_item asc

SELECT *
FROM Person.Person

SELECT FirstName,COUNT (FirstName) AS Contagem
FROM Person.Person
GROUP BY FirstName

SELECT *
FROM Production.Product

SELECT Color, AVG (ListPrice) AS Media
FROM Production.Product
WHERE Color = 'Silver'
GROUP BY Color

--desafio group by

SELECT * FROM Person.Person

SELECT MiddleName,COUNT (MiddleName)
FROM Person.Person
GROUP BY MiddleName

SELECT *
FROM Sales.SalesOrderDetail

SELECT ProductID,AVG(OrderQty) AS Media
FROM Sales.SalesOrderDetail
GROUP BY ProductID

SELECT * FROM Sales.SalesOrderDetail

SELECT TOP 10 ProductID,SUM (LineTotal) AS '10_ VENDAS'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
OrDER BY SUM (LineTotal) DESC

SELECT * FROM Production.WorkOrder

SELECT ProductID, COUNT(ProductID) AS CONTAGEM,AVG (orderQty) AS MEDIA
FROM Production.WorkOrder
GROUP BY ProductID

-- Join--

--INNER JOIN

--BUSINESSENTITYID,FIRSTNAME,LASTNAME,EMAILADDRESS
--ex1
	SELECT TOP 10 *
	FROM Person.Person

	SELECT TOP 10 *
	FROM Person.EmailAddress

	SELECT c.BusinessEntityID,c.FirstName,c.LastName,b.EmailAddress
	FROM Person.Person as c
	INNER JOIN Person.EmailAddress AS b on c.BusinessEntityID = b.BusinessEntityID

	--ex2

		SELECT TOP 10 *
	FROM Production.Product

	SELECT TOP 10 *
	FROM Production.WorkOrder

	SELECT c.ProductID AS Item,c.Name AS Nome,c.Color AS Cor,b.StockedQty AS Estoque
	FROM Production.Product AS c
	INNER JOIN Production.WorkOrder as b on c.ProductID = b.ProductID

	--ex 3

	SELECT TOP 10 *
	FROM Production.Product

	SELECT TOP 10 *
	FROM Production.ProductSubcategory

	SELECT c.Name AS Descricao,b.Name AS Subcategoria,c.ListPrice AS Preco
	FROM Production.Product as c
	INNER JOIN Production.ProductSubcategory AS b on c.ProductSubcategoryID = b.ProductSubcategoryID

	--Desafios INNER JOIN

	--1

	SELECT TOP 10*
	FROM Person.PhoneNumberType

	SELECT TOP 10*
	FROM Person.PersonPhone

	--BusinessEntityID,Name,PhoneNumberTypeID,PhoneNumber

	SELECT b.BusinessEntityID AS Matricula,c.Name AS Nome,b.PhoneNumberTypeID AS Tipo,b.PhoneNumber AS Número
	FROM Person.PhoneNumberType AS c
	INNER JOIN Person.PersonPhone AS b ON c.PhoneNumberTypeID = b.PhoneNumberTypeID

	--2

	SELECT TOP 10*
	FROM Person.StateProvince

	SELECT TOP 10*
	FROM Person.Address

	--AddressID,City,StateProvinceID,Nome do Estado

	SELECT b.AddressID,b.City,c.StateProvinceID,c.Name AS "Nome do Estado"
	FROM Person.StateProvince as c
	INNER JOIN Person.Address as b ON c.StateProvinceID = b.StateProvinceID


	--Tipos de Joins

SELECT *
FROM dbo.Nomes_A

SELECT *
FROM dbo.Nomes_B


--INNER JOIN - Retorna somente o que há nos dois conjuntos (intercessão)
SELECT * FROM Nomes_A
INNER JOIN Nomes_B
ON Nomes_A = [Nomes _B]

--FULL OUTER JOIN -  Retorna Retorna todos os registros 
--correspondentes entre as tabelas quando TA=TB. Os campos
--onde TA<>TB são preenchidos com NULL (Nulo).

SELECT* FROM Nomes_A
FULL OUTER JOIN Nomes_B
ON Nomes_A = [Nomes _B]

--LEFT OUTER JOIN - Retorna tudo da tabela A e corresp da tab B
--Se não houver correspondentes preenche com Null
SELECT* FROM Nomes_A
LEFT JOIN Nomes_B
ON Nomes_A = [Nomes _B]

--Joins

SELECT * FROM Person.Person

SELECT* FROM Sales.PersonCreditCard

SELECT*
FROM Person.Person AS PP
LEFT JOIN Sales.PersonCreditCard AS PC
ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL
--INNER JOIN: 19118
--LEFT JOIN : 19972
--QUER DIZER QUE EXISTEM PESSOAS QUE NÃO TEM CARTÃO DE CRÉDITO
SELECT 19972 - 19118
-- 854