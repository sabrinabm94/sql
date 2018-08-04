CREATE DATABASE bankAccountsDataBase;
GO
USE bankAccountsDataBase;
GO

CREATE TABLE accountingEntry(
	accountNumber INT,
	valueAccount INT,
	debOrCred CHAR(1)
);	

BULK INSERT accountingEntry
FROM 'C:\sql\SQLServer\bankAccountsDataBase\acount.txt'
WITH (
	FIRSTROW = 2, -- the data starts in the secound line of the doc
	DATAFILETYPE = 'char', -- the data type will be in table
	FIELDTERMINATOR =  '\t', -- the field terminator is case the TAB
	ROWTERMINATOR = '\n' -- the row terminator is the ENTER
);

SELECT * FROM accountingEntry;
