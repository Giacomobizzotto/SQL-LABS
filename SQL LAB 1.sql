

Giacomo Bizzotto Chapter 2

2.1  SELECT * FROM Customers
2.2  SELECT * FROM Customers WHERE 0=1
2.3  SELECT Lastname, Firstname, Address, City, State, Zip FROM Customers
2.4  SELECT * FROM Customers WHERE city = 'Boston'
2.5  SELECT Companyname, Contactname FROM suppliers WHERE state = 'NY'
2.6  SELECT CompanyName AS Company, ContactName AS [Supplier Contact] FROM suppliers
2.7  SELECT 'Dear' + ' ' + firstname + ' ' + 'We would like you to know that our full product catalog is on sale in the city of' + ' ' + city + ' ' + 'Please visit our website for details' As CustomerLetter FROM customers
2.8  SELECT LastName, FirstName, Address, City, State, Zip FROM Customers ORDER BY LastName
2.9  SELECT * FROM Customers WHERE city <> 'Boston' ORDER BY lastname
2.10 SELECT State, Count(CustomerID) As NumberOfCustomers FROM Customers WHERE State <> 'NY' GROUP BY State HAVING Count(CustomerID) >10 ORDER BY Count(CustomerID) DESC

Giacomo Bizzotto Chapter 3

3.11 CREATE TABLE Customer2 ([CustomerID] int identity (1,1) Primary key not null,[LastName] nvarchar(50),[FirstName] nvarchar(50),[Address] nvarchar(100),[City] nvarchar(50)) 
     INSERT INTO Customer2 (firstname, lastname, address, city) SELECT firstname, lastname, address, city FROM Customers
3.12 INSERT INTO Customer2 (firstname, lastname, address, city) SELECT firstname, lastname, address, city FROM customers WHERE State = 'NY'
3.13 SELECT * INTO Products_Backup FROM Products
3.14 SELECT ProductName, UnitsInStock, UnitsOnOrder INTO Products_Subset FROM Products WHERE SupplierID IN (1,2,3,4)
3.15 SELECT customers.lastname, customers.firstName, Orders.OrderDate, JoinOrdersProducts.UnitPrice, JoinOrdersProducts.Quantity INTO TempCustomersOrders FROM (customers INNER JOIN Orders ON customers.CustomerID = Orders.CustomerID) INNER JOIN JoinOrdersProducts ON Orders.OrderID = JoinOrdersProducts.OrderID WHERE customers.State='NY'
3.16 SELECT * INTO Products1 FROM Products WHERE 1=2
3.17 SELECT ProductID, ProductName, QuantityPerUnit, ProductPrice INTO Products2 FROM Products WHERE 1=2
3.18 SELECT Name, Type FROM SysObjects WHERE Type = 'U'
3.19 SELECT Name, Type FROM SysObjects WHERE Type = 'S'

Giacomo Bizzotto Chapter 4

4.20 SELECT * FROM customers WHERE city = 'New York' OR city = 'Houston'
4.21 SELECT lastname, firstname, city, state FROM customers WHERE city IN ('Albany', 'Denver', 'Houston', 'Phoenix') ORDER BY lastname ASC
4.22 SELECT productname, unitsinstock, unitsonorder FROM products WHERE UnitsInStock > 40 OR UnitsOnOrder > 10
4.23 SELECT productname, unitsinstock, unitsonorder FROM products WHERE UnitsInStock > 40 UNION SELECT productname, unitsinstock, unitsonorder FROM products WHERE UnitsOnOrder > 10
4.24 SELECT lastname, firstname, city, state FROM customers WHERE state = 'NY' AND city = 'Albany'
4.25 SELECT lastname, firstname, city, state FROM customers WHERE state = 'NY' AND city = 'Albany' OR state = 'NY' AND city = 'New York' ORDER BY lastname

Giacomo Bizzotto Chapter 5

5.26 SELECT FirstName, LastName, Address, City, Zip, State FROM Customers ORDER BY lastname ASC
5.27 SELECT FirstName, LastName, Address, City, Zip, State FROM Customers ORDER BY lastname DESC
5.28 SELECT city, lastname, firstname FROM Customers ORDER BY city, lastname ASC
5.29 SELECT city, lastname, firstname FROM Customers ORDER BY city ASC, lastname DESC
5.30 SELECT lastname, firstname FROM Customers ORDER BY firstname
5.31 SELECT productname, unitsinstock FROM products ORDER BY unitsinstock DESC
5.32 SELECT ProductName, ProductPrice, DateEnteredInventory FROM Products ORDER BY DateEnteredInventory DESC
5.33 SELECT TOP 7 unitsinstock, productname FROM products ORDER BY unitsinstock DESC
5.34 SELECT TOP 10 unitsinstock, productname FROM products ORDER BY unitsinstock DESC
5.35 SELECT FirstName, LastName, City, State FROM Customers WHERE STATE in ('NY','CA','TX') ORDER BY CASE State When 'NY' THEN 1 When 'CA' THEN 2 When 'TX' THEN 3 Else 4 End

Giacomo Bizzotto Chapter 6

6.36 SELECT FirstName, LastName, Address, City, State, Zip FROM customers WHERE lastname Like 'D%'
6.37 SELECT FirstName, LastName, Address, City, State, Zip FROM customers WHERE lastname Like 'Da_e%'
6.38 SELECT FirstName, LastName, Address, City, State, Zip FROM customers WHERE zip Like '12[0-9][0-9][0-9]'
6.39 SELECT FirstName, LastName, Address, City, State, Zip FROM customers WHERE lastname Like 'C[ru]%'
6.40 SELECT FirstName, LastName, Address, City, State, Zip FROM customers WHERE lastname Like '[^abcde]%' ORDER BY lastname
6.41 SELECT FirstName, LastName, Address, City, State, Zip FROM customers WHERE lastname Like '[^a-p]%' ORDER BY lastname
6.42 SELECT FirstName, LastName, Address, City, State, Zip FROM customers WHERE lastname Like '[a-p]%' ORDER BY lastname

