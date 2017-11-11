-- procedures with parameters
DELIMITER $
CREATE PROCEDURE countNumbers(n1 INT, n2 INT)
BEGIN
SELECT n1 + n2 AS "Count";
END
$
DELIMITER ;

CALL countNumbers(5, 5);
CALL countNumbers(25, 23);
DROP PROCEDURE countNumbers;
