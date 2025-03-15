
USE PracticeDatabase


Giacomo Bizzotto, Chapter 2, Case 2

2.1  SELECT LastName, FirstName, Address, City, State, Zip FROM Customers WHERE State = 'MA' 
2.2  SELECT LastName, FirstName, Address, City, State, Zip FROM Customers WHERE MembershipType = 'Platinum'
2.3  SELECT LastName, FirstName, City, State, BonusPoints FROM Customers ORDER BY BonusPoints DESC
2.4  SELECT LastName AS [Last Name], FirstName AS [First Name], CustomerSince AS [Date Became Customer] , MembershipType AS [Type of Membership] FROM Customers
2.5  SELECT LastName, FirstName, CONCAT(Address, ' ', City, ' ', State, ' ', Zip) AS [Address] FROM Customers


Giacomo Bizzotto, Chapter 3, Case 2

3.1  SELECT * INTO Products52 FROM Products
3.2  SELECT ProductName, QuantityPerUnit, ProductPrice, UnitsInStock INTO Products53 FROM Products WHERE SupplierID IN (5,6,7,8,9)
3.3  SELECT * INTO Products54 FROM Products WHERE 1=2 ALTER TABLE Products54 ADD CONSTRAINT PK_Products54 PRIMARY KEY (ProductID) 
     SET IDENTITY_INSERT Products54 ON
3.4  INSERT INTO Products54 
     (ProductID, SupplierID, ProductName, ContainerType, ProductWeight, IngredientType, QualityRating, SKU, QuantityPerUnit, ProductPrice, ProductCost, UnitsInStock, UnitsOnOrder, ReorderLevel, CatalogLastUpdated, DateEnteredInventory) 
     SELECT ProductID,SupplierID, ProductName, ContainerType, ProductWeight, IngredientType, QualityRating, SKU, QuantityPerUnit, ProductPrice, ProductCost, UnitsInStock, UnitsOnOrder, ReorderLevel, CatalogLastUpdated, DateEnteredInventory
     FROM Products
     WHERE ProductPrice > 25
3.5  SELECT ProductName, ContainerType, IngredientType,  ProductPrice FROM  Products54 WHERE ProductPrice > 48 ORDER BY ProductPrice DESC


Giacomo Bizzotto, Chapter 4, Case 2

4.1  SELECT FirstName, LastName, City, State, Address, Zip FROM Customers WHERE State = 'NY' OR State = 'MA' OR State = 'AZ' OR State = 'TX'
4.2  SELECT FirstName, LastName, City, State, Address, Zip FROM Customers WHERE State IN('NY' , 'MA' , 'AZ' , 'TX')
4.3  SELECT FirstName, LastName, City, State, Address, Zip FROM Customers WHERE State = 'NY'
     UNION SELECT FirstName, LastName, City, State, Address, Zip FROM Customers WHERE State = 'MA'
     UNION SELECT FirstName, LastName, City, State, Address, Zip FROM Customers WHERE State = 'AZ'
	 UNION SELECT FirstName, LastName, City, State, Address, Zip FROM Customers WHERE State = 'TX'
4.4  SELECT FirstName, LastName, City, State, Address, Zip FROM Customers WHERE State NOT IN ('CA', 'AZ', 'MA')
4.5  SELECT FirstName, LastName, City, State, Address, Zip FROM Customers WHERE Zip <> '22459'


Giacomo Bizzotto, Chapter 5, Case 2

5.1  SELECT FirstName, LastName, City, State, Zip FROM Customers ORDER BY State ASC, City ASC
5.2  SELECT FirstName, LastName, City, State, Zip FROM Customers ORDER BY State ASC, City DESC
5.3  SELECT TOP 10 OrderID, OrderDate, ShippedDate, PackagingType, InvoiceAmount, ShippingCost FROM Orders ORDER BY ShippedDate DESC
5.4  SELECT TOP 10 OrderID, OrderDate, ShippedDate, PackagingType, InvoiceAmount, ShippingCost FROM Orders ORDER BY ShippingCost DESC
5.5  SELECT FirstName, LastName, City, State, Zip FROM Customers ORDER BY CASE City
        WHEN  'Boston'  THEN 1
        WHEN  'Albany'  THEN 2
        WHEN  'Orlando' THEN 3
        WHEN  'Miami'   THEN 4
        ELSE 5
     END


Giacomo Bizzotto, Chapter 6, Case 2

6.1  SELECT ProductName, ProductPrice, ContainerType, IngredientType, QualityRating, SKU FROM Products WHERE ProductName LIKE '[A-E]%'
6.2  SELECT ProductName, ProductPrice, ContainerType, IngredientType, QualityRating, SKU FROM Products WHERE QualityRating LIKE '[AEV]%'
6.3  SELECT ProductName, ProductPrice, ContainerType, IngredientType, QualityRating, SKU FROM Products WHERE SKU LIKE 'PD%-____'
6.4  SELECT ProductName, ProductPrice, ContainerType, IngredientType, QualityRating, SKU FROM Products WHERE SKU LIKE '[A-P]%-__89'
6.5  SELECT ProductName, ProductPrice, ContainerType, IngredientType, QualityRating, SKU FROM Products WHERE SKU LIKE '%-2345'


















