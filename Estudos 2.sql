SELECT* FROM Production.Product

SELECT TOP 10 Name,ProductNumber,Color,ListPrice
FROM Production.Product
WHERE ListPrice <> 0 AND Color <> ' '
ORDER BY Name asc

SELECT COUNT(DISTINCT Color)
FROM Production.Product

SELECT DISTINCT (Color) Name,Color
FROM Production.Product
WHERE Color <> ' '

SELECT ProductNumBer AS IDProduto,Name AS Nome,Color AS Cor,ListPrice AS Preço
FROM Production.Product
WHERE ListPrice BETWEEN 50 AND 120 AND Color IN ('Black','Red')
ORDER BY ListPrice asc