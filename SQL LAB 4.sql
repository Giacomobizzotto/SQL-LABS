Use PracticeDatabase

Giacomo Bizzotto, Chapter 19

19.144 SELECT lastname, firstname, city, state, zip FROM tbls_customers_un1  UNION  SELECT lastname, firstname, city, state, zip FROM tbls_customers_un2 
19.145 SELECT lastname, firstname, city, state, zip FROM customers UNION SELECT companyname, contactname, city, state, zip FROM suppliers
19.146 SELECT lastname, firstname, city, state, zip FROM tbls_customers_un1 UNION SELECT lastname, firstname, city, state, zip FROM tbls_customers_un2 UNION SELECT companyname, contactname, city, state, zip FROM suppliers 
19.147 SELECT lastname, firstname, city, state, zip FROM tbls_customers_un1 UNION ALL SELECT lastname, firstname, city, state, zip FROM tbls_customers_un2 
19.148 SELECT lastname, firstname, city, state, zip FROM tbls_customers_un1 UNION SELECT lastname, firstname, city, state, zip FROM tbls_customers_un2 ORDER BY lastname
19.149 SELECT lastname, firstname, city, state, zip FROM tbls_customers_un1 WHERE state = 'NY' UNION SELECT lastname, firstname, city, state, zip FROM tbls_customers_un2 WHERE state ='TX' ORDER BY state
19.150 SELECT lastname, firstname, city, state, zip, CustomerID FROM tbls_customers_un1 UNION SELECT  'zTotal customer count', '', '', '', '', Count(CustomerID) FROM tbls_customers_un1 ORDER BY lastname ASC 
19.151 SELECT lastname, firstname, city, state, zip INTO Temp_UnionTable1 FROM tbls_customers_un1 UNION SELECT lastname, firstname, city, state, zip FROM tbls_customers_un2 
19.152 CREATE TABLE TempTable_Union_InsertInto ( CustomerID int PRIMARY KEY identity (1,1), lastname varchar (50), firstname varchar (50), city varchar (50), state varchar (50), zip varchar (10) )
       INSERT INTO TempTable_Union_InsertInto (lastname, firstname, city, state, zip)  SELECT lastname, firstname, city, state, zip  FROM tbls_customers_un1 WHERE state = 'NY' UNION SELECT lastname, firstname, city, state, zip FROM tbls_customers_un2 WHERE state = 'NY' 
19.153 SELECT 'Main' As DisCenter, state, count(CustomerID) AS Customers FROM customers GROUP BY state UNION SELECT 'Regional' As Center, state, Count(CustomerID) AS Customers FROM tbls_customers_un2 GROUP BY state ORDER BY STATE 
19.154 SELECT 'Main' As DisCenter, state, count(CustomerID) AS Customers FROM tbls_customers_un1 WHERE State in (SELECT state from tbls_customers_un2) GROUP BY state UNION SELECT 'Regional' As Center, state, Count(CustomerID) AS Customers FROM tbls_customers_un2 GROUP BY state ORDER BY STATE 
19.155 SELECT lastname, firstname, city, state, zip, 'customer' AS TypeOfContact FROM customers UNION SELECT companyname, contactname, city, state, zip, 'supplier' FROM suppliers 


Giacomo Bizzotto, Chapter 20

20.156 SELECT OrderID, Count(*) AS NumberofDuplicates FROM tbls_orders GROUP BY OrderID HAVING count(*)>1 ORDER BY OrderID 
20.157 SELECT OrderID, CustomerID, Count(*) AS NumberofDuplicates FROM tbls_orders GROUP BY OrderID, CustomerID HAVING count(*)>1 
20.158 SELECT Count(*) AS NumberofDuplicates, OrderID, CustomerID, SalesRepID, ShipperID, OrderDate, RequiredDate, ShippedDate, ShippingCost  FROM tbls_orders GROUP BY OrderID, CustomerID, SalesRepID, ShipperID, OrderDate, RequiredDate, ShippedDate, ShippingCost HAVING count(*)>1 
20.159 SELECT *  FROM tbls_orders WHERE OrderID IN( SELECT OrderID FROM tbls_Orders GROUP BY OrderID HAVING count(*)>1) ORDER BY OrderID
20.161 SELECT OrderID, SalesRepID, ShipperID, OrderDate   FROM tbls_orders  WHERE CustomerID  NOT IN (SELECT CustomerID from Customers)  
20.162 SELECT OrderID, SalesRepID, ShipperID, OrderDate FROM tbls_orders  LEFT JOIN Customers ON tbls_orders.CustomerID = Customers.CustomerID WHERE Customers.CustomerID Is Null
20.163 SELECT * INTO tbls_orders1 FROM tbls_orders 
       DELETE  FROM tbls_orders1  WHERE CustomerID  NOT IN (SELECT CustomerID FROM Customers) 
20.164 SELECT * INTO tbls_orders2 FROM tbls_orders 
       DELETE tbls_orders2 FROM tbls_orders2  LEFT JOIN Customers ON tbls_Orders2.CustomerID = Customers.CustomerID WHERE (Customers.CustomerID Is Null)
20.165 SELECT CustomerID, FirstName, LastName, Address, City, State  FROM Customers  WHERE CustomerID  NOT IN (SELECT CustomerID from tbls_orders)
20.166 SELECT CustomerID, FirstName, LastName, Address, City, State  FROM Customers  WHERE CustomerID NOT IN  (SELECT CustomerID  FROM tbls_Orders  WHERE OrderDate BETWEEN '2021/1/1' AND '2021/12/31') 
20.167 SELECT CustomerID, FirstName, LastName, Address, City, State  FROM Customers  WHERE CustomerID  IN (SELECT CustomerID from tbls_orders)
20.168 SELECT CustomerID, FirstName, LastName, Address, City, State  FROM Customers  WHERE CustomerID  IN (SELECT CustomerID from tbls_orders WHERE DatePart(q , OrderDate) = 4 AND  year(OrderDate) = 2021) 


Giacomo Bizzotto, Chapter 21

21.169 SELECT productID, productname, productprice, SKU  FROM tbls_products_n WHERE SKU IS NULL 
21.170 SELECT ProductID, productname, productprice, ISNULL(SKU,'Nothing') AS SKUCheck FROM tbls_products_n ORDER BY SKU 
21.171 SELECT productID, productname, (productprice*quantityperunit) As Subtotal  FROM tbls_products_n ORDER BY (productprice*quantityperunit) DESC
21.172 SELECT SUM(productprice*quantityperunit) As Total FROM tbls_products_n 
21.173 SELECT Count(SKU) As CountSKUs FROM tbls_products_n 
       SELECT Count(ProductID) As CountSKUs FROM tbls_products_n 
	   SELECT Count(*) As CountRecords FROM tbls_products_n 
21.174 SELECT productID, productname, productprice, SKU  FROM tbls_products_n WHERE SKU IS NOT NULL 
21.175 SELECT * INTO temp_tbls_Products_n FROM tbls_products_n
       UPDATE temp_tbls_products_n SET SKU = 'NA' WHERE SKU IS NULL


Giacomo Bizzotto, Chapter 22

22.176 SELECT cast(245.234 AS TinyInt) AS ConvertedNumber
       SELECT convert(TinyInt, 245.234 ) AS ConvertedNumber
	   SELECT ProductName, QuantityPerUnit, convert(TinyInt, ProductPrice) AS ProductPrice, UnitsInStock FROM products 
22.177 SELECT cast('November 21 2022' AS date ) AS ConvertedDate 
       SELECT convert(date, 'November 21 2022' ) AS ConvertedDate 
	   SELECT year(cast('November 21 2022' AS date )) AS ConvertedDate
22.178 SELECT cast(12456 AS char(5) ) AS ConvertedText 
       SELECT convert(char(5), 12456 ) AS ConvertedText


Giacomo Bizzotto, Chapter 23

23.180 SELECT Upper(lastname) AS LastName, Upper(firstname) AS FirstName, city, state, zip FROM customers 
23.181 SELECT upper(left(lastname,1))+ substring (lastname, 2, 50) AS LastName, city, state, zip FROM customers
       SELECT upper(left(lastname,1))+ substring (lastname, 2, len(lastname)) AS LastName, city, state, zip FROM customers
23.182 SELECT lower(lastname) AS LastName, lower(firstname) AS FirstName, city, state, zip FROM customers
23.183 SELECT productid, productname, left(sku,4) AS SKU4 FROM Products
23.184 SELECT productid, productname, right(sku,4) AS SKU4 FROM Products 
23.185 SELECT productid, productname, len(sku) AS CountSKUChars FROM Products 
23.186 SELECT productid, productname, sku, charindex('-',sku,1) AS PartSKU FROM Products 
23.187 SELECT productid, productname, sku, charindex(' ', sku, 1) AS PartSKU FROM Products  WHERE charindex (' ', sku, 1) <> 0 
23.188 SELECT substring (productname, 5, 5) as ProductName FROM Products 
23.189 SELECT productid, productname, sku, charindex('-', sku) AS PartSKU FROM Products
       SELECT productid, productname, sku, left(sku, charindex('-', sku)) AS PartSKU FROM Products 
	   SELECT charindex('-', sku) AS PartSKU FROM Products 
	   SELECT charindex('-', sku)-1 AS PartSKU FROM Products 
	   SELECT productid, productname, sku, left(sku,charindex('-', sku)-1) AS PartSKU FROM Products WHERE charindex('-', sku) > 0 
23.190 SELECT productid, productname, sku, left(sku, charindex(' ', sku)) AS PartSKU FROM Products WHERE charindex(' ', sku) <> 0
23.191 SELECT productid, ltrim(productname) AS LeftTrimmedName, sku FROM Products
23.192 SELECT productid, Rtrim(productname) AS RightTrimmedName, sku FROM Products 
23.193 SELECT productid,  (' ' +productname + ' ')  AS SpacedName, sku FROM Products
23.194 SELECT productid,  (space(10)+ productname + space(10))  AS SpacedName, sku FROM Products 
23.195 SELECT productid,  productname, sku FROM Products WHERE left(sku, 4) = 'PDK-'
       SELECT productid,  productname, replace(sku, 'pdk-', 'pds-') As skuUpdated FROM Products WHERE left(sku, 4) = 'PDK-'
23.196 SELECT productid,  Reverse(sku) As ReverseSKU FROM Products 


















