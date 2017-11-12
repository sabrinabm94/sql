-- block not named

-- if/else
DECLARE @number INT = 1
BEGIN
	IF @number = 5
		PRINT 'The number is 5'
	ELSE
		PRINT 'The number is not 5'
END
GO

-- case
DECLARE @numberA INT = 1, @numberB INT = 1
BEGIN 
	CASE 
		WHEN @numberA = 1 THEN SET @numberB = 1
		SELECT '@numberB is not 1'
		WHEN @numberA = 2 THEN SET @numberB = 2
		SELECT '@numberB is not 2'
		SELECT @numberA AS numberA, @numberB AS numberB
	END 
END
GO

-- while
DECLARE @numberC INT = 1
BEGIN 
	WHILE (@numberC < 15)
	BEGIN
		PRINT 'The @numberC value is ' + CAST(@numberC AS VARCHAR)
		SET @numberC = @numberC + 1
	END
END
GO