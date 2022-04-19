/*Database fundamentals*/

USE AdventureWorksLT2019;

SELECT FirstName, LastName
FROM [SalesLT].[Customer]

SELECT *
FROM [SalesLT].[Customer]

/*Column expressions*/

SELECT FirstName, LastName
FROM [SalesLT].[Customer]

--Aliases

--No Alias
SELECT FirstName
,SUBSTRING(MiddleName, 1, 1)
,LastName
FROM [SalesLT].[Customer]

--Alias

SELECT FirstName
,SUBSTRING(MiddleName, 1, 1) AS Initial
,LastName
FROM [SalesLT].[Customer]

--Accidental Alias

SELECT FirstName
LastName
FROM [SalesLT].[Customer]


--The WHERE Clause – Filter Rows with WHERE

SELECT CustomerID
,FirstName
,LastName
FROM [SalesLT].[Customer]
WHERE CustomerID = 19

--Other Examples

SELECT CustomerID
,FirstName
,LastName
FROM [SalesLT].[Customer]
WHERE CustomerID >= 19
AND CustomerID < 23


SELECT CustomerID
,FirstName
,LastName
,ModifiedDate
FROM [SalesLT].[Customer]
WHERE ModifiedDate >= '2007-09-01 00:00:00'
AND ModifiedDate <= '2007-09-30 00:00:00'



--Wildcard Search using LIKE

SELECT CustomerID
,FirstName
,LastName
,ModifiedDate
FROM [SalesLT].[Customer]
WHERE LastName LIKE 'A%'


--Order by 
--Not sorted

SELECT CustomerID
,FirstName
,LastName
,ModifiedDate
FROM [SalesLT].[Customer]
WHERE ModifiedDate >= '2007-06-01 00:00:00'
AND ModifiedDate <= '2007-09-30 00:00:00'


--Sorted by modifed date

SELECT CustomerID
,FirstName
,LastName
,ModifiedDate
FROM [SalesLT].[Customer]
WHERE ModifiedDate >= '2007-06-01 00:00:00'
AND ModifiedDate <= '2007-09-30 00:00:00'
ORDER BY ModifiedDate

--Latest values first

SELECT CustomerID
,FirstName
,LastName
,ModifiedDate
FROM [SalesLT].[Customer]
WHERE ModifiedDate >= '2007-06-01 00:00:00'
AND ModifiedDate <= '2007-09-30 00:00:00'
ORDER BY ModifiedDate DESC

--Sort on more than one column

SELECT CustomerID
,FirstName
,LastName
,ModifiedDate
FROM [SalesLT].[Customer]
WHERE ModifiedDate >= '2007-06-01 00:00:00'
AND ModifiedDate <= '2007-09-30 00:00:00'
ORDER BY ModifiedDate DESC, LastName


/*Null Examples*/

SELECT [ProductID]
,[Name]
,[ProductNumber]
,[Color]
,[StandardCost]
,[ListPrice]
,[Size]
,[Weight]
FROM [SalesLT].[Product]


SELECT [ProductID]
,[Name]
,[ProductNumber]
,[Color]
,[StandardCost]
,[ListPrice]
,[Size]
,[Weight]
,StandardCost/ Weight as CostToWeightRatio
FROM [SalesLT].[Product]


SELECT [ProductID]
,[Name]
,[ProductNumber]
,[Color]
,[StandardCost]
,[ListPrice]
,[Size]
,[Weight]
,COALESCE (Weight,1) as COALEASCEWeight
,StandardCost/ COALESCE(Weight,1) as CostToWeightRatio
FROM [SalesLT].[Product]

--Nulls in a condition

SELECT [ProductID]
,[Name]
,[ProductNumber]
,[Color]
,[StandardCost]
,[ListPrice]
,[Size]
,[Weight]
,COALESCE (Weight,1) as COALEASCEWeight
,StandardCost/ COALESCE(Weight,1) as CostToWeightRatio
FROM [SalesLT].[Product]
WHERE Weight = NULL


SELECT [ProductID]
,[Name]
,[ProductNumber]
,[Color]
,[StandardCost]
,[ListPrice]
,[Size]
,[Weight]
,COALESCE (Weight,1) as COALEASCEWeight
,StandardCost/ COALESCE(Weight,1) as CostToWeightRatio
FROM [SalesLT].[Product]
WHERE Weight IS NULL


/*Inner Join*/

SELECT SalesLT.Customer.CustomerID,SalesLT.Customer.Title, SalesLT.Customer.FirstName, SalesLT.Customer.LastName
FROM SalesLT.Customer
Where SalesLT.Customer.CustomerID = 29847

SELECT SalesLT.SalesOrderHeader.SalesOrderID, SalesLT.SalesOrderHeader.CustomerID, SalesLT.SalesOrderHeader.TotalDue
FROM SalesLT.SalesOrderHeader
Where SalesLT.SalesOrderHeader.CustomerID = 29847

SELECT SalesLT.Customer.CustomerID
,SalesLT.Customer.Title
,SalesLT.Customer.FirstName
,SalesLT.Customer.LastName
,SalesLT.SalesOrderHeader.SalesOrderID
,SalesLT.SalesOrderHeader.CustomerID
,SalesLT.SalesOrderHeader.TotalDue
FROM SalesLT.Customer
INNER JOIN SalesLT.SalesOrderHeader ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID
WHERE SalesLT.Customer.CustomerID = 29847


--Table aliases

SELECT C.CustomerID
,C.Title
,C.FirstName
,C.LastName
,S.SalesOrderID
,S.CustomerID
,S.TotalDue
FROM SalesLT.Customer AS C
INNER JOIN SalesLT.SalesOrderHeader AS S
ON C.CustomerID = S.CustomerID
WHERE C.CustomerID = 29847

/*Outer join example*/

SELECT C.CustomerID
,C.Title
,C.FirstName
,C.LastName
,S.SalesOrderID
,S.CustomerID
,S.TotalDue
FROM SalesLT.Customer AS C
LEFT OUTER JOIN SalesLT.SalesOrderHeader AS S
ON C.CustomerID = S.CustomerID
WHERE S.SalesOrderID IS NULL


SELECT C.CustomerID
,C.Title
,C.FirstName
,C.LastName
,S.SalesOrderID
,S.CustomerID
,S.TotalDue
FROM SalesLT.Customer AS C
RIGHT OUTER JOIN SalesLT.SalesOrderHeader AS S
ON C.CustomerID = S.CustomerID
WHERE C.CustomerID IS NULL


SELECT C.CustomerID
,C.Title
,C.FirstName
,C.LastName
,S.SalesOrderID
,S.CustomerID
,S.TotalDue
FROM SalesLT.Customer AS C
FULL OUTER JOIN SalesLT.SalesOrderHeader AS S
ON C.CustomerID = S.CustomerID
