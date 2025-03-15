Use PracticeDatabase

Giacomo Bizzotto, Chapter 13

2.1 SELECT ProductName, ProductPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, (UnitsInStock + UnitsOnOrder - ReorderLevel) AS UnitStatus FROM Products ORDER BY UnitStatus ASC
2.2 SELECT ProductName, IngredientType, ProductPrice, CASE WHEN IngredientType = 'Organic' THEN ProductPrice * 0.8 WHEN IngredientType = 'GMO-Free' THEN ProductPrice * 0.75 ELSE ProductPrice END AS NewProductPrice FROM Products ORDER BY ProductName ASC
2.3 SELECT OrderID, SUM((UnitPrice * Quantity) * (1 - Discount)) AS OrderTotal FROM JoinOrdersProducts GROUP BY OrderID
2.4 SELECT OrderID, ProductID, UnitPrice, IIF(Discount > 0.15, 0.15, Discount) AS Discount FROM JoinOrdersProducts
2.5 SELECT ProductName, 
       CASE 
           WHEN SupplierID = (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'Home of Snacks') THEN ProductPrice * (1 - (0.25 * 0.8)) 
           WHEN SupplierID = (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'Mediterranean Foods, LLC') THEN ProductPrice * (1 - (0.20 * 0.8)) 
           WHEN SupplierID = (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'Nature''s Food, Inc.') THEN ProductPrice * (1 - (0.30 * 0.8)) 
           WHEN SupplierID = (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'Old York Foods, Inc.') THEN ProductPrice * (1 - (0.30 * 0.8)) 
           ELSE ProductPrice 
       END AS ProductPrice 
     FROM Products


Giacomo Bizzotto, Chapter 14

2.1 SELECT CONCAT(Title, ' ', FirstName, ' ', LastName, ', ', Address, ', ', City, ', ', State, ' ', Zip) AS MailingLabel FROM SalesReps ORDER BY LastName ASC;
2.2 SELECT 'Dear ' + ContactName + ', due to the recent downturn in the market we would like to ask for a 5% discount for the products we buy from you. Please let us know if this is a possibility.' AS Letter FROM Suppliers ORDER BY ContactName ASC;
2.3 SELECT CONCAT('Dear ', firstname, ', you are now working with us for more than ten years and the company highly appreciates your work and loyalty. You are invited to our family dinner this Friday night at 6:30 PM.') AS EmployeeLetter  FROM SalesReps WHERE DateofHire < '2012-12-31' ORDER BY lastname ASC
2.4 SELECT CONCAT('Dear ', firstname, ', ', 
        CASE 
            WHEN state = 'NY' THEN 'Our major competitor cut prices by 15%. Cut our own prices by up to 20% but not more.'
            WHEN state = 'MA' THEN 'Start introducing our new product immediately before any of our competitors enters the market with their own updated products.'
            WHEN state = 'TX' THEN 'We were able to get significant discounts from our suppliers and as such try to increase market share by reducing our current prices by 20% for the next two months.'
        END) AS SalesLetter 
    FROM SalesReps WHERE state IN ('NY', 'MA', 'TX') ORDER BY lastname ASC
2.5 SELECT 
    CONCAT('Dear ', firstname, ' ', lastname, ', For the next 30 days only, take the opportunity to obtain our product at the generous discount rate of ', 
        CASE 
            WHEN state = 'NY' THEN '15%'
            WHEN state = 'TX' THEN '20%'
            WHEN state = 'FL' THEN '25%'
            WHEN state = 'CA' THEN '20%'
        END, '.') AS MarketingLetter 
    FROM customers 
    WHERE state IN ('NY', 'TX', 'FL', 'CA') 
    ORDER BY lastname ASC


Giacomo Bizzotto, Chapter 15

2.1 SELECT productID, SUM(quantity) AS TotalProductUnitsSold  FROM JoinOrdersProducts  GROUP BY productID  ORDER BY TotalProductUnitsSold DESC
2.2 SELECT productID, SUM(quantity * UnitPrice) AS TotalOrderAmount FROM JoinOrdersProducts GROUP BY productID ORDER BY TotalOrderAmount DESC
2.3 SELECT ShipperID, MIN(ShippingCost) AS MinShippingCost, AVG(ShippingCost) AS AvgShippingCost, MAX(ShippingCost) AS MaxShippingCost FROM Orders GROUP BY ShipperID
2.4 SELECT productID, SUM(quantity * UnitPrice) AS TotalOrderAmount FROM JoinOrdersProducts WHERE productID NOT IN (1, 14, 15, 28) GROUP BY productID HAVING SUM(quantity * UnitPrice) > 2000 
2.5 SELECT OrderID, ProductID, SUM(Quantity * UnitPrice) AS TotalOrderAmount FROM JoinOrdersProducts GROUP BY OrderID, ProductID


Giacomo Bizzotto, Chapter 16

2.1 SELECT SupplierID, COUNT(*) AS TotalProducts FROM Products GROUP BY SupplierID
2.2 SELECT MIN(Quantity) AS MinimumUnitsSold, AVG(Quantity) AS AverageUnitsSold, MAX(Quantity) AS MaximumUnitsSold, SUM(Quantity) AS TotalUnitsSold FROM JoinOrdersProducts
2.3 SELECT ProductID, MIN(Quantity) AS MinimumUnitsSold, AVG(Quantity) AS AverageUnitsSold, MAX(Quantity) AS MaximumUnitsSold, SUM(Quantity) AS TotalUnitsSold FROM JoinOrdersProducts GROUP BY ProductID ORDER BY ProductID ASC
2.4 SELECT ProductID, MIN(Quantity) AS MinimumUnitsSold, AVG(Quantity) AS AverageUnitsSold, MAX(Quantity) AS MaximumUnitsSold, SUM(Quantity) AS TotalUnitsSold FROM JoinOrdersProducts WHERE UnitPrice > 20 GROUP BY ProductID ORDER BY ProductID ASC
2.5 SELECT ProductID, MIN(Quantity) AS MinimumUnitsSold, AVG(Quantity) AS AverageUnitsSold, MAX(Quantity) AS MaximumUnitsSold, SUM(Quantity) AS TotalUnitsSold FROM JoinOrdersProducts WHERE UnitPrice > 20 GROUP BY ProductID HAVING SUM(Quantity) >= 100 ORDER BY ProductID ASC


Giacomo Bizzotto, Chapter 17

2.1 SELECT
    ProductName,
    SUM(CASE WHEN OrderYear = 2020 THEN Quantity * UnitPrice ELSE 0 END) AS "2020",
    SUM(CASE WHEN OrderYear = 2021 THEN Quantity * UnitPrice ELSE 0 END) AS "2021",
    SUM(CASE WHEN OrderYear = 2022 THEN Quantity * UnitPrice ELSE 0 END) AS "2022"
    FROM View_CrosstabBase WHERE OrderYear IN (2020, 2021, 2022) GROUP BY ProductName
2.2 SELECT ProductName,
    SUM(CASE WHEN OrderYear = 2020 THEN Quantity * UnitPrice ELSE 0 END) AS "2020",
    SUM(CASE WHEN OrderYear = 2021 THEN Quantity * UnitPrice ELSE 0 END) AS "2021",
    SUM(CASE WHEN OrderYear = 2022 THEN Quantity * UnitPrice ELSE 0 END) AS "2022"
    FROM View_CrosstabBase WHERE OrderYear IN (2020, 2021, 2022) AND ProductName NOT IN ('Chili salsa', 'Coffee biscuits', 'Crispy Pears') GROUP BY ProductName ORDER BY ProductName
2.3 SELECT ProductName,
    SUM(CASE WHEN OrderYear = 2020 THEN Quantity * (CASE WHEN UnitPrice > 30 THEN UnitPrice * 0.9 ELSE UnitPrice * 0.95 END) ELSE 0 END) AS "2020",
    SUM(CASE WHEN OrderYear = 2021 THEN Quantity * (CASE WHEN UnitPrice > 30 THEN UnitPrice * 0.9 ELSE UnitPrice * 0.95 END) ELSE 0 END) AS "2021",
    SUM(CASE WHEN OrderYear = 2022 THEN Quantity * (CASE WHEN UnitPrice > 30 THEN UnitPrice * 0.9 ELSE UnitPrice * 0.95 END) ELSE 0 END) AS "2022"
    FROM View_CrosstabBase WHERE OrderYear IN (2020, 2021, 2022) AND ProductName NOT IN ('Chili salsa', 'Coffee biscuits', 'Crispy Pears') GROUP BY ProductName ORDER BY ProductName
2.4 SELECT ProductName,
    SUM(CASE WHEN OrderYear = 2021 THEN Quantity * (CASE WHEN UnitPrice > 30 THEN UnitPrice * 0.9 ELSE UnitPrice * 0.95 END) ELSE 0 END) AS "2021",
    SUM(CASE WHEN OrderYear = 2022 THEN Quantity * (CASE WHEN UnitPrice > 30 THEN UnitPrice * 0.9 ELSE UnitPrice * 0.95 END) ELSE 0 END) AS "2022"
    FROM View_CrosstabBase WHERE OrderYear IN (2021, 2022) AND ProductName NOT IN ('Chili salsa', 'Coffee biscuits', 'Crispy Pears') GROUP BY ProductName ORDER BY ProductName
2.5 SELECT CASE
        WHEN UnitPrice BETWEEN 1 AND 10 THEN 'Price 1-10'
        WHEN UnitPrice BETWEEN 11 AND 20 THEN 'Price 11-20'
        WHEN UnitPrice BETWEEN 21 AND 30 THEN 'Price 21-30'
        WHEN UnitPrice > 30 THEN 'Price > 31'
    END AS ProductPriceRange,
    SUM(CASE WHEN OrderYear = 2020 THEN Quantity * UnitPrice ELSE 0 END) AS "2020",
    SUM(CASE WHEN OrderYear = 2021 THEN Quantity * UnitPrice ELSE 0 END) AS "2021",
    SUM(CASE WHEN OrderYear = 2022 THEN Quantity * UnitPrice ELSE 0 END) AS "2022"
    FROM View_CrosstabBase
    WHERE OrderYear IN (2020, 2021, 2022) GROUP BY CASE
        WHEN UnitPrice BETWEEN 1 AND 10 THEN 'Price 1-10'
        WHEN UnitPrice BETWEEN 11 AND 20 THEN 'Price 11-20'
        WHEN UnitPrice BETWEEN 21 AND 30 THEN 'Price 21-30'
        WHEN UnitPrice > 30 THEN 'Price > 31'
    END ORDER BY CASE
        WHEN UnitPrice BETWEEN 1 AND 10 THEN 'Price 1-10'
        WHEN UnitPrice BETWEEN 11 AND 20 THEN 'Price 11-20'
        WHEN UnitPrice BETWEEN 21 AND 30 THEN 'Price 21-30'
        WHEN UnitPrice > 30 THEN 'Price > 31'
    END


Giacomo Bizzotto, Chapter 18

2.1 SELECT ProductID, ProductName, QuantityPerUnit, IIF(ProductID IN (1, 2, 3), ProductPrice * 0.8, ProductPrice) AS NewProductPrice FROM Products ORDER BY ProductID ASC
2.2 SELECT ProductID, ProductName, QuantityPerUnit, CASE WHEN ProductID IN (1, 2, 3) THEN ProductPrice * 0.8 ELSE ProductPrice END AS NewProductPrice FROM Products ORDER BY ProductID ASC
2.3 SELECT ProductName, UnitsInStock, CASE
        WHEN UnitsInStock < 20 THEN ProductPrice * 0.8  
        WHEN UnitsInStock >= 20 AND UnitsInStock < 30 THEN ProductPrice * 0.75 
        WHEN UnitsInStock >= 30 AND UnitsInStock < 40 THEN ProductPrice * 0.7 
        WHEN UnitsInStock >= 40 THEN ProductPrice * 0.65 
        ELSE ProductPrice
    END AS NewProductPrice FROM Products ORDER BY ProductID ASC
2.4 SELECT ProductName, QuantityPerUnit, UnitsInStock, UnitsOnOrder, CASE 
           WHEN (UnitsInStock + UnitsOnOrder) < 20 THEN ProductPrice * 0.8  
           WHEN (UnitsInStock + UnitsOnOrder) >= 20 AND (UnitsInStock + UnitsOnOrder) < 30 THEN ProductPrice * 0.75 
           WHEN (UnitsInStock + UnitsOnOrder) >= 30 AND (UnitsInStock + UnitsOnOrder) < 40 THEN ProductPrice * 0.7 
           WHEN (UnitsInStock + UnitsOnOrder) >= 40 THEN ProductPrice * 0.65 
           ELSE ProductPrice
    END AS NewProductPrice FROM Products ORDER BY ProductID ASC
2.5 SELECT ProductName, QuantityPerUnit, UnitsInStock, UnitsOnOrder, 
       CASE 
           WHEN (UnitsInStock + UnitsOnOrder) < 20 THEN '20%'  
           WHEN (UnitsInStock + UnitsOnOrder) >= 20 AND (UnitsInStock + UnitsOnOrder) < 30 THEN '25%' 
           WHEN (UnitsInStock + UnitsOnOrder) >= 30 AND (UnitsInStock + UnitsOnOrder) < 40 THEN '30%' 
           WHEN (UnitsInStock + UnitsOnOrder) >= 40 THEN '35%' 
           ELSE '0%' 
    END AS DiscountExtended FROM Products










































