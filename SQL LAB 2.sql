
Use PracticeDatabase

Giacomo Bizzotto, Chapter 7

7.43  SELECT ProductName, ContainerType, ProductWeight, ProductPrice, SKU FROM Products WHERE ProductName like 'P%'
7.44  SELECT ProductName, ContainerType, ProductWeight, ProductPrice, SKU FROM Products WHERE ProductPrice LIKE '[1-3]%'
7.45  SELECT ProductName, ContainerType, ProductWeight, ProductPrice, ProductCost, SKU FROM Products WHERE ProductCost LIKE '[7-8]___'
7.46  SELECT OrderID, OrderDate, PackagingType, PackageWeight, QuotationAmount FROM Orders WHERE OrderDate Like '%-04-%'
7.47  SELECT OrderID, OrderDate, PackagingType, PackageWeight, QuotationAmount FROM Orders WHERE QuotationAmount Like 230
      SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE QuotationAmount = 230
7.48  SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE InvoiceAmount LIKE '[2-3]__' ORDER BY InvoiceAmount
      SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE InvoiceAmount BETWEEN 200 AND 400 ORDER BY InvoiceAmount
	  SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE InvoiceAmount >= 200 AND InvoiceAmount <= 400 ORDER BY InvoiceAmount
7.49  SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE InvoiceAmount NOT Like 200
      SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE InvoiceAmount != 200
      SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE InvoiceAmount <> 200
7.50  SELECT Firstname, LastName, City, State, Zip FROM tbls_Customers WHERE firstname LIKE 'Mary'
      SELECT Firstname, LastName, City, State, Zip FROM tbls_Customers WHERE ltrim(firstname) LIKE 'Mary'
7.51  SELECT Firstname, LastName, City, State, Zip FROM tbls_Customers WHERE Left(FirstName,1) LIKE ' '
7.52  SELECT Firstname, LastName, City, State, Zip FROM tbls_Customers WHERE city LIKE '% % %'
7.53  SELECT Firstname, LastName, City, State, Zip FROM tbls_Customers WHERE city LIKE '%[0-9]%'
7.54  CREATE INDEX indCity ON tbls_Customers (city)


Giacomo Bizzotto, Chapter 8

8.55  SELECT FirstName, LastName, City, State, Zip FROM Customers WHERE lastname = 'Delaney' 
8.56  SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE OrderID = 972
8.57  SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE OrderDate > '2022-06-30' ORDER BY OrderDate
8.58  SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE OrderDate >= '2022/7/31'ORDER BY OrderDate
8.59  SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE PackageWeight < 28.80 ORDER BY PackageWeight DESC
8.60  SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE InvoiceAmount <> 200 ORDER BY InvoiceAmount DESC
8.61  SELECT OrderID, OrderDate, PackagingType, PackageWeight, InvoiceAmount FROM Orders WHERE OrderDate > '2022-07-31' AND InvoiceAmount < 150 ORDER BY InvoiceAmount DESC


Giacomo Bizzotto, Chapter 9

9.62  SELECT OrderID, OrderDate, ShippedDate, InvoiceAmount, PackageWeight, MaterialCost FROM Orders WHERE InvoiceAmount BETWEEN 150 AND 180 ORDER BY InvoiceAmount DESC
9.63  SELECT OrderID, OrderDate, ShippedDate, InvoiceAmount, PackageWeight, MaterialCost FROM Orders WHERE ShippedDate BETWEEN '2022-05-15' AND '2022-06-15' ORDER BY ShippedDate DESC
9.64  SELECT OrderID, OrderDate, ShippedDate, InvoiceAmount, PackageWeight, MaterialCost FROM Orders WHERE year(orderdate) BETWEEN 2021 AND 2022 ORDER BY orderdate DESC
9.65  SELECT OrderID, OrderDate, ShippedDate, InvoiceAmount, PackageWeight, MaterialCost FROM Orders WHERE PackageWeight NOT BETWEEN 10 AND 30 ORDER BY PackageWeight ASC
9.66  SELECT OrderID, OrderDate, ShippedDate, InvoiceAmount, PackageWeight, MaterialCost FROM Orders WHERE MaterialCost BETWEEN 30 AND 40 ORDER BY MaterialCost ASC
      SELECT OrderID, OrderDate, ShippedDate, InvoiceAmount, PackageWeight, MaterialCost FROM Orders WHERE MaterialCost >=30 AND MaterialCost <=40 ORDER BY MaterialCost ASC


Giacomo Bizzotto, Chapter 10

10.67 SELECT FirstName, LastName, City, State, CustomerSince, BonusPoints FROM Customers WHERE city = 'New York' OR city = 'Boston' OR city = 'Chicago' OR city = 'Los Angeles' OR city = 'Dallas' 
      SELECT FirstName, LastName, City, State, CustomerSince, BonusPoints FROM Customers WHERE city in ('New York', 'Boston', 'Chicago', 'Los Angeles', 'Dallas')
10.68 SELECT FirstName, LastName, City, State, CustomerSince, BonusPoints FROM Customers WHERE city NOT IN ('New York', 'Boston', 'Chicago', 'Los Angeles', 'Dallas')
10.69 SELECT ProductName, IngredientType, ProductWeight, ProductPrice FROM Products WHERE ProductPrice in (15, 19, 22, 23, 42)
10.70 SELECT OrderID, OrderDate, ShippedDate, InvoiceAmount FROM Orders WHERE OrderDate IN ('2022-6-1', '2022-7-1', '2022-8-1')
10.71 SELECT FirstName, LastName, Address, City, State FROM Customers WHERE 'Davis' IN (Firstname, Lastname, Address)
10.72 SELECT FirstName, LastName, Address, City, State FROM Customers WHERE LastName LIKE '%Davis%' OR Firstname LIKE '%Davis%' OR Address LIKE '%Davis%'
10.73 SELECT FirstName, LastName, Address, City, MembershipType FROM Customers WHERE CustomerID IN (SELECT CustomerID FROM Orders WHERE InvoiceAmount > 400)
      SELECT CustomerID FROM Orders WHERE InvoiceAmount > 400
10.74 SELECT Orderid, Orderdate, ShippedDate, InvoiceAmount FROM Orders WHERE Orderid IN (SELECT Orderid FROM JoinOrdersProducts GROUP BY OrderID HAVING sum(Discount) =0)
10.75 SELECT FirstName, LastName, City, MemberShipType FROM Customers WHERE CustomerID NOT IN (Select CustomerID FROM Orders WHERE OrderDate BETWEEN '2022-6-1' AND '2022-12-31')
10.76 SELECT FirstName, LastName, City, MemberShipType FROM Customers WHERE CustomerID NOT IN (Select CustomerID FROM Orders WHERE year(orderdate) = 2022)


Giacomo Bizzotto, Chapter 11

11.77 SELECT city FROM customers
11.78 SELECT DISTINCT city FROM customers
11.79 SELECT DISTINCT city, state FROM Customers
11.80 SELECT FirstName, State FROM Customers WHERE FirstName = 'John'
      SELECT DISTINCT firstname, state FROM customers WHERE firstname = 'John'
11.81 SELECT city, Count(city) AS NumberOfCities FROM Customers GROUP BY City


Giacomo Bizzotto, Chapter 12

12.82 SELECT TOP 5 Productname, ProductPrice, ProductWeight, Unitsinstock, DateEnteredInventory FROM Products
12.83 SELECT TOP 5 Productname, ProductPrice, ProductWeight, Unitsinstock, DateEnteredInventory FROM Products ORDER BY unitsinstock DESC
12.84 SELECT TOP 10 PERCENT Productname, ProductPrice, ProductWeight, Unitsinstock, DateEnteredInventory FROM Products ORDER BY ProductPrice DESC
12.85 SELECT TOP 5 Productname, ProductPrice, ProductWeight, Unitsinstock, DateEnteredInventory FROM Products ORDER BY DateEnteredInventory DESC
12.86 SELECT TOP 5 OrderID, Sum(([unitprice]*[quantity])) AS OrderAmount FROM JoinOrdersProducts GROUP BY OrderID ORDER BY Sum(unitprice*quantity) DESC





