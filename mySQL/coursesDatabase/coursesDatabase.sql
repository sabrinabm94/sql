CREATE DATABASE coursesDatabase;
USE DATABASE coursesDatabase;

-- table courses
CREATE TABLE courses (
	idCourse INT PRIMARY KEY AUTO_INCREMENT,
	nameCourse VARCHAR(30) NOT NULL,
	hoursCourse INT(3),
	valueCourse FLOAT(10, 2)
);

INSERT INTO courses VALUES (NULL, 'Database fundaments', 25, 200.00);

SELECT * FROM courses;
-- DROP TABLE Courses;

-- table sellers
CREATE TABLE sellers (
	idSeller INT PRIMARY KEY AUTO_INCREMENT,
	nameSeller VARCHAR(30) NOT NULL,
	sex CHAR(1),
    january FLOAT(10, 2),
    february FLOAT(10, 2),
	march FLOAT(10, 2)
);

INSERT sellers 
VALUES (NULL, 'Maria', 'F', 10, 20, 30),
	   (NULL, 'Rodrigo', 'M', 5, 30, 10),
       (NULL, 'Rebeca', 'F', 15, 88, 50);

SELECT * FROM sellers;
-- DROP TABLE Sellers;

-- sun
SELECT MAX(february) AS Max_Sun_Feb
FROM sellers;

-- max
SELECT MAX(february) AS Max_Sel_Feb
FROM sellers;

-- min
SELECT MIN(february) AS Max_Sel_Feb
FROM sellers;

-- avg (média)
SELECT AVG(february) AS Max_Sel_Feb
FROM sellers;

-- all in one function
SELECT MAX(january) AS Max_Sel_Jan,
	   MIN(february) AS Max_Sel_Feb,
       AVG(march) AS Max_Sel_Mar
FROM sellers;

-- truncate (first parameter is a number and secound is a number of decimal places)
SELECT MAX(january) AS Max_Sel_Jan,
	   MIN(february) AS Max_Sel_Feb,
       TRUNCATE (AVG(march), 2) AS Max_Sel_Mar
FROM sellers;

-- count per sex
SELECT sex, SUM(january) AS Total_Jan
FROM sellers
GROUP BY sex;

-- SUBQUERIES
-- value and name of the worse sellers of march
SELECT nameSeller, march 
FROM sellers
WHERE march = (SELECT MIN(march) FROM sellers); -- the inner query is done first

-- value and name of the best sellers of march
SELECT nameSeller, march 
FROM sellers
WHERE march = (SELECT MAX(march) FROM sellers);

-- value and name of the best sellers of march
SELECT nameSeller, march 
FROM sellers
WHERE march = (SELECT MAX(march) FROM Sellers);

-- new table with sellers year media
SELECT nameSeller, january, february, march, 
	   (january + february + march) AS "totalSellerSalersYear",
TRUNCATE ((january + february + march) / 3, 2) AS "mediaSellerSalersYear"
FROM sellers;

-- procedure for insert
DELIMITER $
CREATE PROCEDURE coursesInsert(nameCourse VARCHAR(30), hoursCourse INT(3), valueCourse FLOAT(10, 2))
BEGIN
INSERT INTO courses VALUES(NULL, nameCourse, hoursCourse, valueCourse);
END
$
DELIMITER ;

-- procedure for select
DELIMITER $
CREATE PROCEDURE searchCourses()
BEGIN	
	SELECT idCourse, nameCourse, hoursCourse, valueCourse
    FROM courses;
END
$
DELIMITER ;

CALL coursesInsert('BI SQL SERVER', 35, 200.00);
CALL searchCourses();

