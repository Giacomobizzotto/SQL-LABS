Use PracticeDatabase

Giacomo Bizzotto, Chapter 24

24.197 SELECT OrderID, OrderDate, InvoiceAmount, PackagingType, PackageWeight FROM Orders WHERE OrderDate BETWEEN '2022/1/1' AND '2022/6/30' ORDER BY OrderDate ASC
       SELECT OrderID, OrderDate, InvoiceAmount, PackagingType, PackageWeight FROM Orders WHERE OrderDate>= '2022/1/1' AND OrderDate<= '2022/6/30' ORDER BY OrderDate
24.198 SELECT OrderID, OrderDate, InvoiceAmount, PackagingType, PackageWeight FROM Orders WHERE OrderDate<= '2022/1/1' OR OrderDate >= '2022/6/30' ORDER BY OrderDate
24.199 SELECT GetDate() as CurrentTimeAndDate
24.200 SELECT CustomerID, max(OrderDate) As LatestOrder FROM Orders GROUP BY CustomerID
       SELECT lastname, Max(Orders.OrderDate) AS MaxOfOrderDate FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID GROUP BY lastname
	   SELECT Customers.CustomerID, Customers.LastName, Customers.FirstName, Max(Orders.OrderDate) AS LatestOrderDate FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID GROUP BY Customers.CustomerID, Customers.LastName, Customers.FirstName
24.201 SELECT DateDiff(d, '2022/5/15', '2022/6/30') As NumberOfDays
24.202 SELECT datepart(dw, orderdate) As BusinessDay, Count(OrderID) AS NumberOfOrders FROM Orders WHERE year(orderdate) = 2022 AND datepart(q, orderdate) = 2 AND datepart(dw, orderdate) IN (2,3,4,5,6) GROUP BY datepart(dw, orderdate)
24.203 SELECT datepart(q, orderdate) As Quarter, datepart(dw, orderdate) As NonBusinessDay,Count(OrderID) AS NumberOfOrders FROM Orders WHERE year(orderdate) = 2022 AND datepart(dw, orderdate) IN (1,7) GROUP BY datepart(q, orderdate), datepart(dw, orderdate)
24.204 SELECT OrderID, OrderDate, InvoiceAmount, PackagingType, PackageWeight FROM Orders WHERE DatePart(m, [OrderDate]) =6 AND year(Orderdate) = 2022 ORDER BY OrderDate
       SELECT OrderID, OrderDate, InvoiceAmount, PackagingType, PackageWeight FROM Orders WHERE OrderDate BETWEEN '2022/6/1' AND '2022/6/30' ORDER BY OrderDate
24.205 SELECT DatePart(d,OrderDate) AS Day, Count(OrderID) AS NumberOfOrders FROM Orders WHERE Year(OrderDate)=2022 AND DatePart(m,OrderDate) = 6 GROUP BY DatePart(d,OrderDate) ORDER BY DatePart(d,OrderDate)
24.206 SELECT DatePart(ww,[OrderDate]) AS Week, Count(OrderID) AS NumberOfOrders FROM Orders WHERE (((Year([OrderDate]))=2022)) GROUP BY DatePart(ww,[OrderDate])
24.207 SELECT DatePart(m,[OrderDate]) As month, DatePart(dw,[OrderDate]) AS Day, Count(OrderID) AS NumberOfOrders FROM Orders WHERE year(OrderDate) = 2022 AND datepart(q, ([OrderDate])) = 1 AND datepart(w,([OrderDate])) = 2 GROUP BY DatePart(m,[OrderDate]), DatePart(w,[OrderDate]) ORDER BY DatePart(m,[OrderDate])
24.208 SELECT Year([orderdate]) AS [Year], DatePart(ww,[OrderDate]) AS Week, Sum(unitprice*quantity) AS OrderTotal FROM View_Invoices WHERE (((DatePart(ww,[OrderDate]))=50)) GROUP BY Year([orderdate]), DatePart(ww,[OrderDate])
24.209 SELECT year(OrderDate) AS Year, sum(unitprice*quantity) AS OrderTotal FROM View_Invoices GROUP BY Year(OrderDate)
       SELECT datepart(yyyy, OrderDate) AS Year, SUM(unitprice*quantity) AS OrderTotal FROM View_Invoices GROUP BY datepart(yyyy, OrderDate)
24.210 SELECT datePart(q,[OrderDate]) AS Quarter, sum(unitprice*quantity) AS OrderTotal FROM View_Invoices WHERE Year(orderdate) = 2022 GROUP BY DatePart(q , [OrderDate]) 
24.211 SELECT month(OrderDate) AS [Month], Sum(unitprice*quantity) AS OrderTotal,Sum(([unitprice]*[quantity])*[Discount]) AS TotalDiscount FROM View_Invoices WHERE year(orderdate) = 2022 GROUP BY month(OrderDate) ORDER BY month([OrderDate])
       SELECT datename(m,OrderDate) AS [Month], sum(unitprice*quantity) AS OrderTotal,sum(([unitprice]*[quantity])*[Discount]) AS TotalDiscount FROM View_Invoices WHERE year(orderdate) = 2022 GROUP BY datename(m,OrderDate), month([OrderDate]) ORDER BY month([OrderDate])
	   SELECT datepart(m, OrderDate) AS [Month], sum(unitprice*quantity) AS OrderTotal,Sum(([unitprice]*[quantity])*[Discount]) AS TotalDiscount FROM View_Invoices WHERE year(orderdate) = 2022 GROUP BY datepart(m, OrderDate), month([OrderDate]) ORDER BY datepart(m, OrderDate)
24.212 SELECT DatePart(dw,[OrderDate]) AS Day, Count(OrderID) AS NumberOfOrders FROM Orders WHERE (((Year([OrderDate]))=2022)) GROUP BY DatePart(dw,[OrderDate])
       SELECT DateName(dw,[OrderDate]) AS Day, Count(OrderID) AS NumberOfOrders FROM Orders WHERE (((Year([OrderDate]))=2022)) GROUP BY DateName(dw,[OrderDate])
24.213 SELECT DatePart (y, OrderDate) AS Day, Count(OrderID) AS NumberOfOrders FROM Orders WHERE Year([OrderDate])=2022 GROUP BY DatePart(y,[OrderDate]) ORDER BY DatePart(y,[OrderDate])
24.214 SELECT OrderID, CustomerID, OrderDate FROM Orders WHERE OrderDate Like '%-10-22'
24.215 SELECT firstname, lastname, DateAdd(yyyy, 20 , DateOfHire) AS Anniversary20yr FROM SalesReps
24.216 SELECT firstname, lastname, title, datepart(d, dateofbirth) As DayOfBirth FROM SalesReps WHERE datepart(m, dateofbirth) = 4
24.217 SELECT firstname, lastname, DateDiff(yyyy, DateOfHire, GetDate()) AS YearsEmployed FROM SalesReps
24.218 SELECT firstname, lastname, title, DateDiff(yyyy, DateOfBirth, GetDate()) As Age FROM SalesReps
24.219 SELECT OrderID, datediff(d, orderdate, shippeddate) AS CycleTime FROM Orders WHERE year(orderdate) = 2022 AND month(orderdate) = 9
24.220 SELECT OrderID, dateadd(d, 2, orderdate) AS PolicyShipmentDate FROM Orders WHERE year(orderdate) = 2022 AND month(orderdate) = 9


Giacomo Bizzotto, Chapter 25

25.222 SELECT * FROM tbls_customers_upd WHERE lastname = 'Demizio' AND firstname = 'Michael' 
       UPDATE tbls_customers_upd SET Address = '12 Lark Street' WHERE lastname = 'Demizio' AND firstname = 'Michael'
25.223 SELECT * FROM tbls_customers_upd WHERE lastname = 'Demizio' AND firstname = 'Michael'
       UPDATE tbls_customers_upd SET Address = '12 Lark Street', city = 'Albany' WHERE lastname = 'Demizio' AND firstname = 'Michael'
25.224 SELECT * FROM tbls_customers_upd WHERE city = 'Denver'
       UPDATE tbls_customers_upd SET zip = '22215' WHERE city = 'Denver'
25.225 SELECT * FROM tbls_customers_upd WHERE city = 'Denver'
       UPDATE tbls_customers_upd SET zip = '22730', city = 'Tucson', state = 'AZ' WHERE city = 'Denver'
25.226 SELECT * FROM View_SupplierPrices WHERE SupplierID = 1
       UPDATE View_SupplierPrices SET ProductPrice = ProductPrice * (1+0.05) WHERE SupplierID = 1
25.227 UPDATE tbls_products_upd SET ProductPrice = CASE WHEN supplierid=1 THEN ProductPrice*(1.1) WHEN supplierid=2 THEN ProductPrice*(1.05) WHEN supplierid=3 THEN ProductPrice*(1.1) WHEN supplierid=4 THEN ProductPrice*(1.05) WHEN supplierid=5 THEN ProductPrice WHEN supplierid=6 THEN ProductPrice*(1.02) WHEN supplierid=7 THEN ProductPrice*(1.03) WHEN supplierid=8 THEN ProductPrice*(1.05) WHEN supplierid=9 THEN ProductPrice*(1.15) WHEN supplierid=10 THEN ProductPrice*(1.1) END
25.228 UPDATE tbls_products_upd SET ProductPrice = ProductPrice * (1+0.20) WHERE SupplierID IN (SELECT SupplierID FROM Suppliers WHERE city= 'Boston' or city = 'Denver')


Giacomo Bizzotto, Chapter 26

26.230 SELECT * FROM tbls_orders_del WHERE OrderID = 20 
       DELETE FROM tbls_orders_del WHERE OrderID = 20
26.231 SELECT * FROM tbls_orders_del WHERE CustomerID = 2       DELETE FROM tbls_orders_del WHERE CustomerID = 2  
26.232 SELECT * FROM tbls_orders_del WHERE OrderDate BETWEEN '2022/10/15' AND '2022/10/17'
       DELETE FROM tbls_orders_del WHERE OrderDate BETWEEN '2022/10/15' AND '2022/10/17'
26.233 SELECT OrderID, CustomerID, OrderDate, RequiredDate, InvoiceAmount, PackagingType FROM tbls_orders_del AS T2 WHERE OrderID <> (SELECT Max(OrderID) FROM tbls_Orders_Del AS T1 WHERE T2.CustomerID = T1.CustomerID AND T2.SalesRepID = T1.SalesRepID AND T2.ShipperID = T1.ShipperID AND T2.OrderDate = T1.OrderDate)
       DELETE tbls_orders_del FROM tbls_orders_del AS T2 WHERE OrderID <> (SELECT Min(OrderID) FROM tbls_orders_del AS T1 WHERE T2.CustomerID = T1.CustomerID AND T2.SalesRepID = T1.SalesRepID AND T2.ShipperID = T1.ShipperID AND T2.OrderDate = T1.OrderDate)
26.234 SELECT * INTO TempTable1 FROM tbls_orders_del WHERE OrderDate BETWEEN '2022/8/15' AND '2022/9/15'       DELETE FROM tbls_orders_del WHERE OrderDate BETWEEN '2022/8/15' AND '2022/9/15'
26.235 SELECT OrderID, CustomerID, OrderDate, ShippedDate, InvoiceAmount FROM tbls_orders_del WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE city= 'Los Angeles' AND lastname = 'Orlando')       DELETE FROM tbls_orders_del WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE city= 'Los Angeles' AND lastname = 'Orlando')26.236 SELECT OrderID, CustomerID, OrderDate, ShippedDate FROM tbls_orders_del WHERE OrderID IN( SELECT Sum([unitprice]*[quantity]*(1-[Discount])) AS TotalOrder FROM JoinOrdersProducts GROUP BY OrderID HAVING Sum([unitprice]*[quantity]*(1-[Discount])) >400)
       DELETE FROM tbls_orders_del WHERE OrderID IN( SELECT Sum([unitprice]*[quantity]*(1-[Discount])) AS TotalOrder FROM JoinOrdersProducts GROUP BY OrderID HAVING Sum([unitprice]*[quantity]*(1-[Discount])) >400)


Giacomo Bizzotto, Chapter 27

27.237 SELECT FirstName, LastName, Address FROM Customers WHERE CustomerID IN (SELECT CustomerID from orders)
       SELECT FirstName, LastName, Address, OrderDate, ShippingCost FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	   SELECT FirstName, LastName, Address FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID GROUP BY FirstName, LastName, Address ORDER BY LastName
27.238 SELECT lastname, firstname, Address, OrderDate, ShippingCost FROM Customers LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
27.239 SELECT LastName, FirstName, Address, OrderDate, ShippingCost FROM Customers RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
27.240 SELECT LastName, FirstName, Address, OrderDate, ShippingCost FROM Customers FULL OUTER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
27.241 SELECT CompanyName, ContactName, City, ProductName, IngredientType FROM Suppliers CROSS JOIN Products
       SELECT * FROM Suppliers, Products
27.242 SELECT salesreps.LastName as SalesRepLastName, salesreps.FirstName as SalesRepLFirstName, salesreps.City as SalesRepCity, suppliers.CompanyName as SupplierCompanyName, suppliers.City as SupplierCity FROM Suppliers cross join salesreps where salesreps.city = 'Boston' 
27.243 SELECT salesreps.lastname, salesreps.city, Companyname, suppliers.city FROM Suppliers inner join salesreps ON Suppliers.City = SalesReps.City
27.245 SELECT p1.productID, p1.productname, p2.productname as Component1 FROM tbls_products_joins AS p1 inner JOIN tbls_products_joins AS p2 ON p2.Comp1 = p1.ProductID
27.246 SELECT p1.productID, p1.productname, p2.productname as Component1 FROM tbls_products_joins AS p1 left JOIN tbls_products_joins AS p2 ON p2.Comp1 = p1.ProductID


Giacomo Bizzotto, Chapter 28

28.247 SELECT FirstName, LastName, Address, City, Zip FROM Customers WHERE CustomerID IN (Select CustomerID FROM Orders WHERE (DatePart(q,[OrderDate])=4 AND Year([orderdate])=2021))
28.248 SELECT FirstName, LastName, Address, City, Zip FROM Customers C WHERE EXISTS (Select CustomerID FROM Orders O WHERE C.CustomerID = O.CustomerID AND (DatePart(q,[OrderDate])=4 AND Year([orderdate])=2021))28.249 SELECT FirstName, LastName, Address, City, Zip FROM Customers WHERE CustomerID NOT IN (SELECT CustomerID FROM tbls_orders WHERE OrderDate BETWEEN '2022/1/1' AND '2022/6/30')
28.250 SELECT FirstName, LastName, Address, City, Zip FROM Customers C WHERE NOT EXISTS (Select CustomerID FROM tbls_Orders O WHERE C.CustomerID = O.CustomerID AND OrderDate BETWEEN '2022/1/1' AND '2022/6/30')28.251 SELECT OrderID, CustomerID, OrderDate, ShippingCost FROM tbls_orders WHERE CustomerID NOT IN (SELECT CustomerID FROM Customers)
28.252 SELECT OrderID, CustomerID, OrderDate, ShippingCost FROM Orders WHERE shippeddate = (SELECT max(ShippedDate) FROM Orders)
28.253 SELECT FirstName, LastName, Address, City, Zip FROM Customers WHERE EXISTS (SELECT * FROM SalesReps WHERE customers.city = salesreps.city)
28.254 SELECT ProductName, ContainerType, SKU, ProductPrice FROM Products WHERE ProductPrice > (SELECT avg(ProductPrice) FROM Products) ORDER BY ProductPrice DESC
28.255 SELECT OrderID, CustomerID, OrderDate, ShippingCost FROM orders O WHERE EXISTS (SELECT orderid, Sum([unitprice]*[quantity]) FROM JoinOrdersProducts P WHERE O.OrderID = P.OrderID GROUP BY orderid HAVING (Sum([unitprice]*[quantity]))>500)
28.256 SELECT OrderID, CustomerID, OrderDate, InvoiceAmount, ShippingCost FROM Orders WHERE OrderID IN (SELECT OrderID FROM JoinOrdersProducts WHERE Discount =0)
28.257 UPDATE tbls_products_upd SET ProductPrice = ProductPrice * (1+0.20) WHERE SupplierID IN (SELECT SupplierID FROM Suppliers WHERE city= 'Boston' or city = 'Dallas')
28.258 DELETE FROM tbls_orders_del WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE city= 'Los Angeles' OR city = 'Orlando')28.259 SELECT PaymentType, SUM(CASE WHEN year(OrderDate) = 2022 THEN InvoiceAmount END) AS [2022], SUM(CASE WHEN year(OrderDate) = 2021 THEN InvoiceAmount END) AS [2021], SUM(CASE WHEN year(OrderDate) = 2020 THEN InvoiceAmount END) AS [2020] FROM Orders GROUP BY PaymentType






























































