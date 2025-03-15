
Use PracticeDatabase

Giacomo Bizzotto, Chapter 13

13.87  SELECT ProductName, ProductPrice, ProductPrice + 2 AS CurrentProductPrice FROM Products
13.88  SELECT ProductName, ProductPrice, ProductPrice * (1.2) as CurrentProductPrice FROM Products
13.89  SELECT ProductName, unitsinstock, unitsonorder, (unitsinstock + unitsonorder) AS TotalUnits FROM products
13.90  SELECT OrderID, Sum([UnitPrice]*[Quantity]) AS OrderSubtotal FROM JoinOrdersProducts GROUP BY OrderID
13.91  SELECT ProductName, ProductPrice, ProductPrice * (1-0.2) as PromotionalPrice FROM Products
13.92  SELECT ProductName, ProductPrice, format((ProductPrice * (1+0.2)),'$#,#.00') AS DiscountedProductPrice FROM products
13.93  SELECT LastName, FirstName, IIf(Bonus < Salary*0.1,'Bonus','No Bonus') AS 'Bonus Eligibility' FROM SalesReps
13.94  SELECT ProductName, ProductPrice, CASE When SupplierID = 1 Then ProductPrice*(1-0.2) When SupplierID = 2 Then ProductPrice*(1-0.15) When SupplierID = 3 Then ProductPrice*(1-0.18) When SupplierID = 4 Then ProductPrice*(1-0.25) Else ProductPrice*(1-0.1) End AS DiscountedProductPrice FROM Products
13.95  SELECT OrderID, Sum((UnitPrice*Quantity)*Discount) AS OrderDiscount FROM JoinOrdersProducts GROUP BY OrderID
13.96  SELECT OrderID, SUM((unitprice*Quantity)*(1-Discount)) AS OrderTotal INTO ArchivedOrders FROM JoinOrdersProducts GROUP BY OrderID


Giacomo Bizzotto, Chapter 14

14.97  SELECT (address+city+state+zip) AS FullAddress FROM Customers
14.98  SELECT (address +' '+ city +' '+ state +' '+ zip) AS FullAddress FROM Customers
14.99  SELECT LastName, SUM(OrderID) AS NumberOfOrders FROM View_Invoices GROUP BY LastName
       SELECT LastName +' '+ FirstName As [Customer Name], SUM(OrderID) AS NumberOfOrders FROM View_Invoices GROUP BY LastName +' '+ FirstName
       SELECT cast(CustomerID AS nvarchar) +' '+ LastName +' '+ FirstName As [Customer Name], SUM(OrderID) AS NumberOfOrders FROM View_Invoices GROUP BY cast(CustomerID AS nvarchar) +' '+ LastName +' '+ FirstName
	   SELECT CustomerID, FirstName, LastName FROM customers
	   SELECT CustomerID, FirstName, LastName, Address, City, State FROM Customers WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders)
14.100 SELECT 'Dear' + ' '+ (LastName + ' ' + FirstName) +'.' + ' '+ 'It is our pleasure to announce that we reviewed your resume, and we have set up an interview time for you. Can you please verify that your address is' + ' ' + (Address +' '+ City +' '+ State +' '+ Zip) + ' ' + 'to send you corporate policy details and directions?' AS CustomerLetter FROM Customers
14.101 SELECT 'Dear' + ' '+ (lastname + ' ' + left(firstname, 1)) +'.' + ' '+ 'Please complete the enclosed forms so that we can ship your order to your state.' AS CustomerLetter FROM Customers
14.102 SELECT 'Dear' + ' '+ upper(left(lastname,1))+ substring (lastname, 2, 50) + ' ' + firstname +'.' + ' ' + 'Please complete the enclosed forms so that we can ship your order to your state.' AS CustomerLetter FROM Customers
14.103 SELECT OrderDate + ' with ' + ShippingCost + ' shipping cost' FROM Orders
       SELECT concat(orderdate, ' with ', shippingcost, ' shipping cost') as LetterToTheCustomer FROM Orders 
14.104 SELECT IIf(([State]='NY'),[Companyname]+' '+[ContactTitle]+' '+[Contactname], [ContactTitle]+' '+[Contactname]) AS MailTo FROM Suppliers
14.105 SELECT CASE When City = 'Boston' Then 'Dear' +' '+ [contactname]+',' +' '+ 'for our current sale we offer a 10% discount in' +' '+ [city] When City = 'Dallas' Then 'Dear' +' '+ [contactname]+',' +' '+ 'for our current sale we offer a 25% discount in' +' '+ [city] When City = 'New York' Then 'Dear' +' '+ [contactname]+',' +' '+ 'for our current sale we offer a 30% discount in' +' '+ [city] End AS SupplierLetter FROM Suppliers


Giacomo Bizzotto, Chapter 15

15.106 SELECT LastName, SUM(quantity) AS TotalUnits FROM tbls_customersgr GROUP BY LastName
15.107 SELECT LastName, SUM(unitprice*quantity) AS OrderTotal FROM tbls_customersgr GROUP BY LastName
15.108 SELECT lastname, SUM(unitprice*quantity) AS OrderTotal, AVG(unitprice*quantity) AS AvgOrder FROM tbls_customersgr GROUP BY lastname 
15.109 SELECT LastName, SUM(unitprice*quantity) AS OrderTotal FROM tbls_customersgr WHERE orderid <> 509 GROUP BY LastName
15.110 SELECT LastName, SUM(unitprice*quantity) AS OrderTotal FROM tbls_customersgr GROUP BY LastName HAVING SUM(unitprice*quantity)>100
15.111 SELECT LastName, SUM(unitprice*quantity) AS OrderTotal FROM tbls_customersgr WHERE productname <> 'Chocolate Chip Brownie' GROUP BY LastName HAVING SUM(unitprice*quantity)>100
15.112 SELECT LastName, SUM(unitprice*quantity) AS OrderTotal FROM tbls_customersgr WHERE orderid <> 509 GROUP BY LastName HAVING SUM(unitprice*quantity)>100 ORDER BY Lastname DESC
15.113 SELECT OrderID, Avg(unitprice*quantity) AS AverageOrderAmount FROM tbls_customersgr GROUP BY OrderID
       SELECT OrderID, Avg(unitprice*quantity) AS AverageOrderAmount FROM tbls_customersgr GROUP BY OrderID
15.114 SELECT lastname, OrderID, SUM([unitprice]*[quantity]) AS OrderTotal FROM tbls_customersgr GROUP BY lastname, OrderID


Giacomo Bizzotto, Chapter 16

16.115 SELECT count(orderid) as NumberofOrders FROM tbls_customersag 
16.116 SELECT count(lastname) as NumberofCustomers FROM tbls_customersag        SELECT count(*) as NumberofCustomers FROM tbls_customersag	   SELECT count(distinct lastname) As CountUniqueCustomers FROM tbls_customersag	   SELECT count(distinct lastname) As CountUniqueCustomers FROM tbls_customersag 16.117 SELECT Count ( Distinct OrderID ) as NumberofOrders FROM tbls_customersag
16.118 SELECT LastName, count(orderid) as NumberofOrders FROM tbls_customersag GROUP BY lastname
16.119 SELECT lastname, count(orderid) as NumberofOrders, AVG(unitprice*quantity) AS AvgOrderAmount FROM tbls_customersag GROUP BY lastname
16.120 SELECT LastName, count(orderid) as NumberofOrders, AVG(unitprice*quantity) AS AvgOrderAmount FROM tbls_customersag WHERE lastname NOT IN ('Johnson', 'Madsen') GROUP BY lastname
16.121 SELECT lastname, count(orderid) as Num, avg(unitprice*quantity) AS Avg, sum(unitprice*quantity) AS Total FROM tbls_customersag WHERE lastname NOT IN ('Johnson', 'Madsen') GROUP BY lastname
16.122 SELECT LastName, count(orderid) as Num, min(unitprice*quantity) AS Min, avg(unitprice*quantity) AS Avg, sum(unitprice*quantity) AS Total FROM tbls_customersag WHERE lastname NOT IN ('Johnson', 'Madsen') GROUP BY lastname
16.123 SELECT LastName, count(orderid) as Num, min(unitprice*quantity) AS Min, avg(unitprice*quantity) AS Avg, max(unitprice*quantity) AS Max, sum(unitprice*quantity) AS Total FROM tbls_customersag WHERE lastname NOT IN ('Johnson', 'Madsen') GROUP BY lastname
16.124 SELECT lastname, count(orderid) as Num, min(unitprice*quantity) AS Min, avg(unitprice*quantity) AS Avg, max(unitprice*quantity) AS Max, sum(unitprice*quantity) AS Total, convert(decimal(5,2), stdev(unitprice*quantity)) As stdev, var(unitprice*quantity) as var FROM tbls_customersag WHERE lastname NOT IN ('Johnson', 'Madsen') GROUP BY lastname
16.125 SELECT lastname, count(orderid) as Num, min(unitprice*quantity) AS Min, avg(unitprice*quantity) AS Avg, max(unitprice*quantity) AS Max, sum(unitprice*quantity) AS Total FROM tbls_customersag WHERE productID NOT IN (13,56,30) GROUP BY lastname HAVING sum(unitprice*quantity) > 100 AND avg(unitprice*quantity) > 40 AND convert(smallint, stdev(unitprice*quantity)) < 20


Giacomo Bizzotto, Chapter 17

17.126 SELECT * FROM (SELECT CustomerState, OrderYear, OrderTotal FROM View_CrosstabBase) AS Crosstab PIVOT (sum(OrderTotal) FOR OrderYear IN ([2020], [2021], [2022])) AS CrossTabTable
17.127 SELECT * FROM (SELECT CustomerCity, OrderYear, OrderTotal FROM View_CrosstabBase) AS Crosstab PIVOT (sum(OrderTotal) FOR OrderYear IN ([2020], [2021], [2022])) AS CrossTabTable
17.128 SELECT * FROM (SELECT CustomerLastName, OrderYear, OrderTotal FROM View_CrosstabBase) AS Crosstab PIVOT (sum(OrderTotal) FOR OrderYear IN ([2020], [2021], [2022])) AS CrossTabTable
17.129 SELECT * FROM (SELECT CustomerLastName + ' ' + CustomerFirstName AS CustomerName, OrderYear, OrderTotal FROM View_CrosstabBase) AS Crosstab PIVOT (sum(OrderTotal) FOR OrderYear IN ([2020], [2021], [2022])) AS CrossTabTable
17.130 SELECT * FROM (SELECT CustomerState, OrderYear, OrderTotal FROM View_CrosstabBase WHERE CustomerState IN ('CA', 'NY', 'FL')) AS Crosstab PIVOT(sum(OrderTotal) FOR OrderYear IN ([2020], [2021], [2022])) AS CrossTabTable
17.131 SELECT * FROM (SELECT CustomerState, OrderYear, OrderTotal FROM View_CrosstabBase) AS Crosstab PIVOT (sum(OrderTotal) FOR OrderYear IN ([2021], [2022])) AS CrossTabTable 
17.132 SELECT * FROM (SELECT CustomerState, OrderYear, OrderTotal FROM View_CrosstabBase WHERE CustomerCity NOT IN ('Albany')) AS Crosstab PIVOT (sum(OrderTotal) FOR OrderYear IN ([2020], [2021], [2022])) AS CrossTabTable
17.133 SELECT * FROM (SELECT CustomerState, OrderYear, iif(ordertotal>=10000, ordertotal*0.9, OrderTotal*0.95) AS Ordertotal FROM View_CrosstabBase) AS Crosstab PIVOT (Sum(Ordertotal) FOR OrderYear IN ([2020], [2021], [2022])) AS CrossTabTable
17.134 SELECT * FROM (SELECT CASE WHEN unitprice >= 25 THEN 'Expensive Products Total Sales' WHEN unitprice < 25 THEN 'Inexpensive Product Total Sales' END AS UnitPrice, OrderYear, OrderTotal FROM View_CrosstabBase) AS Crosstab PIVOT (sum(OrderTotal) FOR OrderYear IN ([2020], [2021], [2022])) AS CrossTabTable


Giacomo Bizzotto, Chapter 18

18.135 SELECT ProductID, ProductName, QuantityPerUnit, iif([productid]=14,[productprice]*0.5,[productprice]) AS ProductPrice FROM Products
       SELECT ProductID, ProductName, QuantityPerUnit, case WHEN productid = 14 THEN productprice*0.5 WHEN productid <>14 THEN productprice END AS ProductPrice FROM Products
18.136 SELECT State, LastName, FirstName, OrderTotal, IIf([state]= 'NY' Or [state]= 'CA' Or [state]= 'TX',0.20,0.10) AS Discount FROM View_Conditions
       SELECT State, LastName, FirstName, OrderTotal, CASE WHEN state= 'NY' Or state= 'CA' Or state = 'TX' THEN 0.20 ELSE 0.10 END AS Discount FROM View_Conditions  
18.137 SELECT LastName, FirstName, OrderTotal, iif(ordertotal<200,0, iif(ordertotal>=200 And ordertotal<300, 0.05, iif(ordertotal>=300 And ordertotal<500, 0.10, 0.25))) AS Discount FROM View_Conditions
       SELECT LastName, FirstName, OrderTotal, CASE WHEN ordertotal < 200 THEN 0 WHEN ordertotal>= 200 and ordertotal < 300 THEN 0.05 WHEN ordertotal> 300 and ordertotal <= 500 THEN 0.10 WHEN ordertotal> 500 THEN 0.25 END AS Discount FROM View_Conditions 
18.138 SELECT state, lastname, firstname, ordertotal, CASE WHEN state = 'NY' THEN 0.20 WHEN state = 'AZ' THEN 0.15 WHEN state = 'CO' THEN 0.12 WHEN state = 'FL' THEN 0.18 WHEN state = 'MA' THEN 0.18 ELSE 0.10 END AS Discount FROM View_Conditions
18.139 SELECT OrderID, lastname, firstname, State, CASE WHEN ordertotal>= 200 and ordertotal < 300 THEN ordertotal*(1-0.1) WHEN ordertotal> 300 and ordertotal <= 500 THEN ordertotal*(1-0.15) WHEN ordertotal> 500 THEN ordertotal*(1-0.2) ELSE ordertotal END AS DiscountedOrders FROM View_conditions WHERE state in ('AZ', 'CO', 'TX', 'FL') ORDER BY ordertotal DESC
18.140 SELECT ProductName, UnitsInStock, UnitsOnOrder, CASE WHEN ProductPrice*QuantityPerUnit < 500 THEN 'Economical' WHEN ProductPrice*QuantityPerUnit >= 500 AND ProductPrice*QuantityPerUnit<1000 THEN 'Moderate' WHEN ProductPrice*QuantityPerUnit >= 1000 THEN 'Expensive' END as PricingCategory FROM Products ORDER BY ProductPrice*QuantityPerUnit DESC18.141 SELECT LastName, Year(OrderDate) AS OrderYear, SUM ( CASE
           WHEN (UnitPrice*quantity) < 5000 THEN (UnitPrice*quantity)*(0.1) + 500
           WHEN (UnitPrice*quantity) >= 5000 AND (UnitPrice*quantity) <10000 THEN (UnitPrice*quantity)*(0.15) + 1000
           WHEN (UnitPrice*quantity) >= 10000 AND (UnitPrice*quantity) <15000 THEN (UnitPrice*quantity)*(0.2) + 3000
           WHEN (UnitPrice*quantity) >= 15000 THEN (UnitPrice*quantity)*(0.25) + 5000
       END) AS CommissionAndBonus 
	   FROM SalesReps INNER JOIN (Orders INNER JOIN JoinOrdersProducts ON Orders.OrderID = JoinOrdersProducts.OrderID) ON SalesReps.SalesRepID = Orders.SalesRepID
       GROUP BY LastName, Year(OrderDate) HAVING Year(OrderDate)=2022 ORDER BY Sum(UnitPrice*quantity) DESC
18.142 UPDATE tbls_products_upd SET ProductPrice = CASE
           WHEN supplierid=1 THEN ProductPrice*(1.1)
           WHEN supplierid=2 THEN ProductPrice*(1.08)
           WHEN supplierid=3 THEN ProductPrice*(1.07)
           WHEN supplierid=4 THEN ProductPrice*(1.05)
           WHEN supplierid=5 THEN ProductPrice*(1.03)
           WHEN supplierid=6 THEN ProductPrice*(1.02)
           WHEN supplierid=7 THEN ProductPrice*(1.03)
           WHEN supplierid=8 THEN ProductPrice*(1.07)
           WHEN supplierid=9 THEN ProductPrice*(1.11)
           WHEN supplierid=10 THEN ProductPrice*(1.08)
       END
18.143 SELECT * FROM (SELECT CASE 
           WHEN CustomerCity IN ('New York', 'Los Angeles') THEN 'BigCities' 
		   WHEN CustomerCity NOT IN ('New York', 'Los Angeles') THEN 'SmallCities' 
	   END AS Salestotal, OrderYear, OrderTotal FROM View_CrosstabBase) AS Crosstab PIVOT ( sum(OrderTotal) FOR OrderYear IN ([2020], [2021], [2022]) ) AS CrossTabTable








