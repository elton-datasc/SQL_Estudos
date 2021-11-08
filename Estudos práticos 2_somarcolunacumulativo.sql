SELECT * FROM Production.Product

SELECT Name
,StandardCost
,ListPrice
FROM Production.Product
WHERE StandardCost <>0

SELECT t1.Name,t1.StandardCost,t1.ListPrice,Sum(t2.ListPrice) AS CumulativeSum
FROM Production.Product AS t1
INNER JOIN Production.Product AS t2 on t1.Name >= t2.Name
GROUP BY t1.Name,t1.StandardCost,t1.ListPrice
HAVING t1.StandardCost<>0
ORDER BY t1.Name ASC