-- @localVariables @@globalVariables

-- create procedures
CREATE PROCEDURE sumNumbers
AS
	SELECT 20 + 3 AS sumResults
GO

CREATE PROCEDURE sumNumbersWithParameters @num INT, @num2 INT
AS
	SELECT @num + @num2 AS sumResults
GO

CREATE PROCEDURE printMessage @message VARCHAR(100)
AS
	SELECT @message
GO

-- execute procedures
EXEC sumNumbers
GO

EXEC sumNumbersWithParameters @num = 5, @num2 = 548
GO

EXEC printMessage @message =  'Hello World'
GO

-- drop procedures
DROP PROCEDURE sumNumbers
GO

DROP PROCEDURE sumNumbersWithParameters
GO

DROP PROCEDURE printMessage
GO