
Use PracticeDatabase


Giacomo Bizzotto, Chapter 19

2.1 SELECT lastname, firstname, city, state, zip FROM Customers UNION SELECT lastname, firstname, city, state, zip FROM SalesReps UNION SELECT companyname AS lastname, contactname AS firstname, city, state, zip FROM Suppliers
2.2 SELECT lastname, firstname, city, state, zip INTO tbls_greeting_cards FROM Customers UNION SELECT lastname, firstname, city, state, zip FROM SalesReps UNION SELECT companyname AS lastname, contactname AS firstname, city, state, zip FROM Suppliers
2.3 SELECT 'Local' AS Location, SKU, COUNT(*) AS NumberOfProducts FROM tbls_products_local GROUP BY SKU UNION ALL SELECT 'Regional' AS Location, SKU, COUNT(*) AS NumberOfProducts FROM tbls_products_regional GROUP BY SKU
2.4 SELECT SKU, COUNT(*) AS NumberOfProducts FROM tbls_products_local GROUP BY SKU UNION ALL SELECT SKU, COUNT(*) AS NumberOfProducts FROM tbls_products_regional GROUP BY SKU 
2.5 SELECT SKU, SUM(NumberOfProducts) AS TotalCount FROM (
    SELECT SKU, COUNT(*) AS NumberOfProducts, ProductPrice FROM tbls_products_local GROUP BY SKU, ProductPrice
    UNION ALL
    SELECT SKU, COUNT(*) AS NumberOfProducts, ProductPrice FROM tbls_products_regional GROUP BY SKU, ProductPrice) AS CombinedProducts
    WHERE ProductPrice BETWEEN 20 AND 35 GROUP BY SKU HAVING SUM(NumberOfProducts) > 1


Giacomo Bizzotto, Chapter 20

2.1 SELECT CompanyName, City, State, Phone FROM ShippingCompanies WHERE ShipperID NOT IN (SELECT DISTINCT ShipperID FROM tbls_Orders WHERE ShipperID IS NOT NULL)
2.2 SELECT CompanyName, City, State, Phone FROM ShippingCompanies WHERE ShipperID NOT IN (SELECT DISTINCT ShipperID FROM tbls_Orders WHERE OrderDate BETWEEN '2022-07-01' AND '2022-12-31' AND ShipperID IS NOT NULL)
2.3 SELECT OrderID, ShipperID, OrderDate, ShippedDate, ShippingCost FROM tbls_Orders WHERE ShipperID IS NULL
2.4 SELECT CompanyName, City, State, Phone FROM ShippingCompanies WHERE ShipperID IN (SELECT DISTINCT ShipperID FROM tbls_Orders WHERE ShipperID IS NOT NULL)
2.5 SELECT CompanyName, City, State, Phone FROM ShippingCompanies WHERE ShipperID IN (SELECT DISTINCT ShipperID FROM tbls_Orders WHERE OrderDate BETWEEN '2022-12-10' AND '2022-12-31')


Giacomo Bizzotto, Chapter 21

2.1 SELECT ProductID, OrderID, UnitPrice, Quantity FROM tbls_joinOrdersProducts_n WHERE Quantity IS NULL
2.2 SELECT COUNT(*) AS NumberOfNulls FROM tbls_joinOrdersProducts_n WHERE UnitPrice IS NULL
2.3 SELECT ProductID, COUNT(DISTINCT OrderID) AS NumberOfOrders, AVG(UnitPrice * Quantity) AS AvgOrder, SUM(UnitPrice * Quantity) AS TotalAmount FROM tbls_joinOrdersProducts_n GROUP BY ProductID
2.4 SELECT ProductID, OrderID, UnitPrice, Quantity, Discount FROM tbls_joinOrdersProducts_n WHERE UnitPrice IS NULL OR Quantity IS NULL
2.5 SELECT ProductID, COUNT(DISTINCT OrderID) AS NumberOfOrders, AVG(UnitPrice * Quantity) AS AvgOrder, SUM(UnitPrice * Quantity) AS TotalAmount FROM tbls_joinOrdersProducts_n WHERE UnitPrice IS NOT NULL AND Quantity IS NOT NULL GROUP BY ProductID


Giacomo Bizzotto, Chapter 22

2.1 SELECT ProductName, QuantityPerUnit, CAST(ROUND(ProductUnitPrice, 0) AS INT) AS ProductUnitPrice, UnitsInStock, UnitsOnOrder FROM tble_products_conversion
2.2 SELECT ProductName, QuantityPerUnit, CONVERT(Int, CONVERT(DECIMAL(10, 2), ProductUnitPrice)) AS ProductUnitPrice, UnitsInStock, UnitsOnOrder FROM  tble_products_conversion
2.3 SELECT ProductName, ProductUnitPrice, UnitsInStock, UnitsOnOrder, CONVERT(DATE, CatalogLastUpdated) AS CatalogLastUpdated FROM tble_products_conversion
2.4 SELECT ProductName, ProductUnitPrice, UnitsInStock, UnitsOnOrder, YEAR(CONVERT(DATE, CatalogLastUpdated)) AS  CatalogLastUpdated FROM tble_products_conversion
2.5 SELECT ProductName, SUM(CONVERT(TinyInt, UnitsInStock) + CONVERT(TinyInt, UnitsOnOrder)) AS TotalInventoryUnits FROM tble_products_conversion GROUP BY ProductName, ProductID


Giacomo Bizzotto, Chapter 23

2.1 SELECT SUBSTRING(ProductName, 1, CHARINDEX('-', ProductName) - 1) AS ProductName, ProductUnitPrice FROM tble_products_strings WHERE CHARINDEX('-', ProductName) > 0
2.2 SELECT REPLACE(ProductName, 'oz.', 'grams') AS ProductName, ProductUnitPrice FROM tble_products_strings
2.3 SELECT LEFT(SupplierID, CHARINDEX('-', SupplierID) - 1) AS SupplierRegion, ProductName FROM tble_products_strings WHERE CHARINDEX('-', SupplierID) > 0
2.4 SELECT LEFT(SupplierID, CHARINDEX('-', SupplierID) - 1) AS SupplierRegion, SUM(UnitsInStock * ProductUnitPrice) AS TotalInventoryValue FROM  tble_products_strings WHERE CHARINDEX('-', SupplierID) > 0 GROUP BY LEFT(SupplierID, CHARINDEX('-', SupplierID) - 1)
2.5 SELECT RIGHT(SupplierID, LEN(SupplierID) - CHARINDEX('-', SupplierID)) AS ProductFamily, SUM(UnitsInStock * ProductUnitPrice) AS TotalInventoryValue FROM tble_products_strings WHERE CHARINDEX('-', SupplierID) > 0 GROUP BY RIGHT(SupplierID, LEN(SupplierID) - CHARINDEX('-', SupplierID))


