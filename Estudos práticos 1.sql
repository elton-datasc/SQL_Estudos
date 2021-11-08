SELECT Name

,SUM(ROUND(StandardCost,2))AS SUM_StandartCost
,SUM(ROUND(ListPrice,2))AS SUM_ListPrice
,SUM(ROUND(ListPrice - StandardCost,2)) AS Target
,SUM(ROUND(ListPrice - StandardCost,2)) / SUM(ROUND(StandardCost,2))* 100 as 'Perc%'
FROM Production.Product
GROUP BY Name
--HAVING SUM(ListPrice - StandardCost)<>0
HAVING SUM(ROUND(ListPrice - StandardCost,2)) BETWEEN 900 AND 3000
ORDER BY Target DESC
--WHERE Name LIKE 'Road%'

SELECT Name,SUM(StandardCost) As 'Soma do valor de custo'
FROM Production.Product
GROUP BY Name
HAVING SUM(StandardCost)<>0

 

