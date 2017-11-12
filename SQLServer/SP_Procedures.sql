SP_COLUMNS tableName -- detailed information about column

-- GETDATE return int
SELECT GETDATE()
SELECT nameClient, GETDATE() 
FROM clients;


-- DATEDIFF return int
SELECT DATEDIFF()
SELECT nameClient, (DATEDIFF(DAY, birthDate, GETDATE())/365) AS "age"
FROM clients;

SELECT DATEDIFF()
SELECT nameClient, (DATEDIFF(MONTH, birthDate, GETDATE())/12) AS "age"
FROM clients;

SELECT DATEDIFF()
SELECT nameClient, DATEDIFF(YEAR, birthDate, GETDATE()) AS "age"
FROM clients;


-- DATENAME return String
SELECT nameClient, DATENAME(WEEKDAY, birthDate)
FROM clients;

SELECT nameClient, DATENAME(MONTH, birthDate)
FROM clients;

SELECT nameClient, DATENAME(YEAR, birthDate)
FROM clients;

-- DATEADD return int 
SELECT DATEADD(DAY, 365, GETDATE());

SELECT DATEADD(MONTH, 12, GETDATE());

SELECT DATEADD(YEAR, 10, GETDATE());

-- data conversion
SELECT nameClient
CAST(DAY(birthDate) AS VARCHAR) 
+ '/' 
+ (CAST(MONTH(birthDate) AS VARCHAR) 
+ '/' 
+ (CAST(YEAR(birthDate) AS VARCHAR) AS "birthDate"
FROM clients;

-- charindex
SELECT * nameClient, CHARINDEX('A', nameClient) AS "Indice" -- the index informs which position it is for A, if it does not have is 0, if is used index 2, the first position of the name string will be disregarded for search
FROM clients;

-- check user online in database
SELECT SUSER_NAME() AS userName, SUSER_ID() AS userId;

