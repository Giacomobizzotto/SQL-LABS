
Use PracticeDatabase

Giacomo Bizzotto, Chapter 7

2.1 SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount, FulfillmentCost FROM Orders WHERE PackagingType LIKE 'C%' OR PackagingType LIKE 'M%'
2.2 SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount, FulfillmentCost FROM Orders WHERE OrderDate BETWEEN '2022-11-01' AND '2022-11-30';
2.3 SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount, FulfillmentCost FROM Orders WHERE InvoiceAmount BETWEEN 100 AND 200 ORDER BY InvoiceAmount DESC
2.4 SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount, FulfillmentCost FROM Orders WHERE PackagingType LIKE '% %'
2.5 SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount, FulfillmentCost FROM Orders WHERE PackageWeight NOT LIKE '[1-6]%' ORDER BY PackageWeight ASC


Giacomo Bizzotto, Chapter 8

2.1 SELECT OrderID, OrderDate, ShippedDate, BoxType, PackageWeight, MaterialCost FROM Orders WHERE OrderDate >= '2022-04-01' AND OrderDate <= '2022-04-30' ORDER BY OrderDate DESC
2.2 SELECT OrderID, OrderDate, ShippedDate, BoxType, PackageWeight, MaterialCost FROM Orders WHERE (OrderDate >= '2020-03-01' AND OrderDate <= '2020-04-30') OR (OrderDate >= '2021-03-01' AND OrderDate <= '2021-04-30') OR (OrderDate >= '2022-03-01' AND OrderDate <= '2022-04-30') ORDER BY OrderDate DESC
2.3 SELECT OrderID, OrderDate, ShippedDate, BoxType, PackageWeight, MaterialCost FROM Orders WHERE MaterialCost >= 30 AND MaterialCost <= 40 ORDER BY MaterialCost ASC
2.4 SELECT OrderID, OrderDate, ShippedDate, BoxType, PackageWeight, MaterialCost FROM Orders WHERE PackageWeight != 30 AND PackageWeight != 35 AND PackageWeight != 40 ORDER BY PackageWeight DESC
2.5 SELECT OrderID, OrderDate, ShippedDate, BoxType, PackageWeight, MaterialCost FROM Orders WHERE BoxType = 'telescopic' OR BoxType = 'side loading' OR BoxType = 'cube'


Giacomo Bizzotto, Chapter 9

2.1 SELECT OrderID, ShippedDate, QuotationAmount, ProcessingCost, DailyInventoryCost FROM Orders WHERE YEAR(ShippedDate) = 2022 AND MONTH(ShippedDate) NOT IN (1, 2, 3) ORDER BY ShippedDate DESC
2.2 SELECT OrderID, ShippedDate, QuotationAmount, ProcessingCost, DailyInventoryCost FROM Orders WHERE ShippedDate BETWEEN '2022-06-01' AND '2022-12-31' AND QuotationAmount BETWEEN 200 AND 300 ORDER BY QuotationAmount DESC
2.3 SELECT OrderID, ShippedDate, QuotationAmount, ProcessingCost, DailyInventoryCost FROM Orders WHERE MONTH(ShippedDate) = 6 AND (ProcessingCost < 2 OR ProcessingCost > 4)
2.4 SELECT OrderID, ShippedDate, QuotationAmount, ProcessingCost, DailyInventoryCost FROM Orders WHERE QuotationAmount BETWEEN 0 AND 50 AND YEAR(ShippedDate) = 2022 ORDER BY QuotationAmount ASC
2.5 SELECT OrderID, ShippedDate, QuotationAmount, ProcessingCost, DailyInventoryCost FROM Orders WHERE ((MONTH(ShippedDate) = 7 AND YEAR(ShippedDate) = 2022) OR (MONTH(ShippedDate) = 9 AND YEAR(ShippedDate) = 2022) OR (MONTH(ShippedDate) = 11 AND YEAR(ShippedDate) = 2022)) AND DailyInventoryCost BETWEEN 5 AND 10 ORDER BY DailyInventoryCost DESC


Giacomo Bizzotto, Chapter 10

2.1 SELECT SalesRepID, FirstName, LastName, City, Zip, Salary, Bonus, DateOfHire FROM SalesReps WHERE Zip = 22459 OR Zip = 12189
2.2 SELECT SalesRepID, FirstName, LastName, City, Zip, Salary, Bonus, DateOfHire FROM SalesReps WHERE DateOfHire IN ('2021-06-12', '2021-05-12')
2.3 SELECT SalesRepID, FirstName, LastName, City, Zip, Salary, Bonus, DateOfHire FROM SalesReps WHERE SalesRepID NOT IN (SELECT DISTINCT SalesRepID FROM Orders WHERE OrderDate BETWEEN '2022-12-17' AND '2022-12-31')
2.4 SELECT DISTINCT S.SalesRepID, S.FirstName, S.LastName, S.City, S.Zip, S.Salary, S.Bonus, S.DateOfHire FROM SalesReps S JOIN Orders O ON S.SalesRepID = O.SalesRepID WHERE O.InvoiceAmount > 500
2.5 SELECT DISTINCT S.SalesRepID, S.FirstName, S.LastName, S.City, S.Zip, S.Salary, S.Bonus, S.DateOfHire FROM SalesReps S JOIN Orders O ON S.SalesRepID = O.SalesRepID WHERE O.PaymentType = 'COD'
    

Giacomo Bizzotto, Chapter 11

2.1 SELECT DISTINCT MemberShipType FROM Customers ORDER BY MemberShipType ASC
2.2 SELECT DISTINCT ContainerType, ProductWeight FROM Products ORDER BY ContainerType ASC
2.3 SELECT City, COUNT(SalesRepID) AS NumberOfSalesReps FROM SalesReps GROUP BY City ORDER BY City ASC
2.4 SELECT DISTINCT Discount FROM JoinOrdersProducts ORDER BY Discount DESC
2.5 SELECT Discount, COUNT(*) AS ProductNumber FROM JoinOrdersProducts GROUP BY Discount ORDER BY Discount ASC


Giacomo Bizzotto, Chapter 12

2.1 SELECT TOP 4 FirstName, LastName, Salary, Bonus, DateOfHire, DateOfBirth FROM SalesReps ORDER BY DateOfHire ASC
2.2 SELECT TOP 4 FirstName, LastName, Salary, Bonus, DateOfHire, DateOfBirth FROM SalesReps ORDER BY DateOfBirth DESC
2.3 SELECT TOP 5 OrderID, SUM(Quantity * UnitPrice) AS OrderAmount FROM JoinOrdersProducts GROUP BY OrderID ORDER BY OrderAmount DESC 
2.4 SELECT TOP 5 J.OrderID, SUM(J.Quantity * J.UnitPrice) AS OrderAmount FROM JoinOrdersProducts J JOIN tbls_products_n P ON J.ProductID = P.ProductID WHERE P.ProductName = 'California Original Pistachios' GROUP BY J.OrderID ORDER BY OrderAmount DESC
2.5 SELECT TOP 3 SalesRepID, COUNT(OrderID) AS CountOfOrders FROM Orders GROUP BY SalesRepID ORDER BY CountOfOrders DESC
























































































