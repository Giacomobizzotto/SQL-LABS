Use PracticeDatabase


Giacomo Bizzotto, Chapter 24

2.1 SELECT * FROM (SELECT CustomerState, DATEPART(WEEK, OrderDate) AS Week, Quantity * UnitPrice AS TotalOrderAmount FROM tble_dates WHERE YEAR(OrderDate) = 2022 AND MONTH(OrderDate) = 4) AS SourceTable PIVOT (SUM(TotalOrderAmount) FOR Week IN ([14], [15], [16], [17], [18])) AS PivotTable ORDER BY CustomerState
2.2 SELECT YEAR(OrderDate) AS Year, DATEPART(WEEK, OrderDate) AS Week, SUM(Quantity * UnitPrice) AS TotalOrderAmount FROM tble_dates WHERE DATEPART(WEEK, OrderDate) = 50  AND YEAR(OrderDate) IN (2020, 2021, 2022) GROUP BY YEAR(OrderDate), DATEPART(WEEK, OrderDate) ORDER BY Year
2.3 SELECT CustomerCity, SUM(Quantity * UnitPrice) AS TotalOrderAmount FROM tble_dates WHERE YEAR(OrderDate) = 2022 AND MONTH(OrderDate) IN (1, 5, 9) GROUP BY CustomerCity ORDER BY TotalOrderAmount DESC;
2.4 SELECT OrderID, CustomerLastName, OrderDate, DATEADD(DAY, 10, OrderDate) AS RequiredArrivalDate FROM tble_dates
2.5 SELECT SalesRepLastName, DATEDIFF(YEAR, MIN(SalesRepDateofHire), GETDATE()) AS NumberOfYears FROM tble_dates GROUP BY SalesRepLastName Order By SalesRepLastName


Giacomo Bizzotto, Chapter 25

2.1 SELECT * FROM tbls_SalesReps_upd  WHERE FirstName = 'John' AND LastName = 'Anderson'
    UPDATE tbls_SalesReps_upd SET City = 'Los Angeles' WHERE FirstName = 'John' AND LastName = 'Anderson'
2.2 SELECT * FROM tbls_SalesReps_upd  WHERE FirstName = 'Gerald' AND LastName = 'Williams'
    UPDATE tbls_SalesReps_upd SET Zip = 83044, DateofHire = '2018-05-10' WHERE FirstName = 'Gerald' AND LastName = 'Williams'
2.3 UPDATE tbls_products_upd SET ProductPrice = ProductPrice + 10 WHERE ProductPrice < 30
2.4 UPDATE tbls_products_upd SET ProductPrice = CASE WHEN SupplierID = 1 THEN ProductPrice * 1.20 WHEN SupplierID = 3 THEN ProductPrice * 1.10 WHEN SupplierID = 7 THEN ProductPrice * 1.04 WHEN SupplierID = 9 THEN ProductPrice * 1.08 ELSE ProductPrice END WHERE SupplierID IN (1, 3, 7, 9)
2.5 UPDATE tbls_products_upd SET ProductPrice = ProductPrice - 4 WHERE ProductID IN (SELECT ProductID FROM JoinOrdersProducts WHERE ProductPrice >= 32)


Giacomo Bizzotto, Chapter 26

2.1 DELETE FROM tble_orders_del WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE FirstName = 'Lisa' AND LastName = 'Zartons' AND City = 'Los Angeles')
2.2 SELECT * FROM tble_orders_del WHERE SalesRepID = 2 AND ShippingCost = 21    
    DELETE FROM tble_orders_del WHERE SalesRepID = 2 AND ShippingCost = 21
2.3 SELECT * FROM tble_orders_del WHERE OrderDate < '2021-12-31'
    DELETE FROM tble_orders_del WHERE OrderDate < '2021-12-31'
2.4 SELECT * FROM tble_orders_del WHERE SalesRepID IN (SELECT SalesRepID FROM tbls_SalesReps_upd WHERE City = 'Dallas')
    DELETE FROM tble_orders_del WHERE SalesRepID IN (SELECT SalesRepID FROM tbls_SalesReps_upd WHERE City = 'Dallas')
2.5 SELECT * FROM tble_orders_del WHERE OrderDate BETWEEN '2022-01-01' AND '2022-01-31' AND ShipperID IN (SELECT ShipperID FROM ShippingCompanies WHERE City = 'Boston')
    DELETE FROM tble_orders_del WHERE OrderDate BETWEEN '2022-01-01' AND '2022-01-31' AND ShipperID IN (SELECT ShipperID FROM ShippingCompanies WHERE City = 'Boston')


Giacomo Bizzotto, Chapter 27

2.1 SELECT DISTINCT CompanyName, ContactName, ContactTitle FROM Suppliers INNER JOIN  tble_products_joins ON Suppliers.SupplierID = tble_products_joins.SupplierID
2.2 SELECT s.CompanyName, s.ContactName, s.ContactTitle, p.ProductName, p.ProductPrice, p.UnitsInStock FROM Suppliers AS s LEFT JOIN tble_products_joins AS p ON s.SupplierID = p.SupplierID ORDER BY p.ProductName
2.3 SELECT s.CompanyName, s.ContactName, s.ContactTitle, p.ProductName, p.ProductPrice, p.UnitsInStock FROM Suppliers AS s RIGHT JOIN tble_products_joins AS p ON p.SupplierID = s.SupplierID ORDER BY s.CompanyName
2.4 SELECT ProductName, tble_products_joins.SupplierID, ProductPrice, UnitsInStock, ReorderLevel FROM tble_products_joins LEFT JOIN Suppliers ON tble_products_joins.SupplierID = Suppliers.SupplierID WHERE tble_products_joins.SupplierID NOT IN(SELECT SupplierID FROM Suppliers)
    SELECT ProductName, tble_products_joins.SupplierID, ProductPrice, UnitsInStock, ReorderLevel FROM tble_products_joins LEFT JOIN Suppliers ON tble_products_joins.SupplierID = Suppliers.SupplierID WHERE tble_products_joins.SupplierID IS NULL
2.5 SELECT p.ProductName, p.SupplierID, p.ProductPrice, p.QuantityPerUnit FROM tble_products_joins AS p LEFT JOIN Suppliers AS s ON p.SupplierID = s.SupplierID WHERE s.SupplierID IS NULL


Giacomo Bizzotto, Chapter 28

2.1 SELECT FirstName, LastName, Title, Department FROM SalesReps WHERE SalesRepID IN (SELECT SalesRepID FROM tble_orders WHERE YEAR(OrderDate) = 2022 AND MONTH(OrderDate) IN (1, 2, 3, 4, 5, 6)) 
2.2 SELECT FirstName, LastName, Title, Department FROM SalesReps WHERE SalesRepID NOT IN (SELECT SalesRepID FROM tble_orders WHERE YEAR(OrderDate) = 2022 AND MONTH(OrderDate) = 6)
2.3 SELECT OrderID, CustomerID, OrderDate, ShippingCost FROM tble_orders WHERE OrderDate IN (SELECT MAX(OrderDate) FROM tble_orders)
2.4 SELECT OrderID, CustomerID, OrderDate, ShippingCost FROM tble_orders WHERE ShippingCost > (SELECT AVG(ShippingCost) FROM tble_orders) ORDER BY OrderID ASC
2.5 SELECT PackagingType, SUM(CASE WHEN YEAR(OrderDate) = 2022 THEN 1 ELSE 0 END) AS "2022", SUM(CASE WHEN YEAR(OrderDate) = 2021 THEN 1 ELSE 0 END) AS "2021", SUM(CASE WHEN YEAR(OrderDate) = 2020 THEN 1 ELSE 0 END) AS "2020" FROM tble_orders GROUP BY PackagingType















































