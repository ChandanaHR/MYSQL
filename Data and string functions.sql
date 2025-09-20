create database company;
use company;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    JoinDate DATE,
    Salary DECIMAL(10,2),
    Bonus DECIMAL(10,2)
);
INSERT INTO Employees (EmpID, Name, JoinDate, Salary, Bonus) VALUES
(1, 'Alice Johnson', '2022-01-15', 50000.75, 5000.50),
(2, 'Bob Smith',     '2021-06-10', 60000.00, NULL),
(3, 'Charlie Brown', '2023-03-05', 45000.30, 2500.00),
(4, 'Daisy Adams',   '2020-12-25', 70000.80, NULL),
(5, 'Evan Lee',      '2024-09-01', 55000.45, 1500.25);
Select * from Employees;

-- String functions
-- UPPER(str)=> converts string to uppercase
-- LOWER(str)=> converts string to lowercase
-- TRIM(str)=> Removes spaces from both ends
-- CONCAT(s1,s2,..)=> Joins strings together
-- SUBSTRING(str, start, length)=>Extracts part of a string
-- Function	Description	Example
-- UPPER(str)	Converts string to uppercase	SELECT UPPER('hello'); -- HELLO
-- LOWER(str)	Converts string to lowercase	SELECT LOWER('HELLO'); -- hello
-- TRIM(str)	Removes spaces from both ends	SELECT TRIM(' hello '); -- hello
-- CONCAT(s1, s2, …)	Joins strings together	SELECT CONCAT('SQL ', 'Functions'); -- SQL Functions
-- SUBSTRING(str, start, length)	Extracts part of a string	SELECT SUBSTRING('Database', 2, 4); -- atab
-- REPLACE(str, from, to)=> Replaces part of string
SELECT Name, UPPER(Name) AS UpperName, LOWER(Name) AS LowerName FROM Employees;
Select TRIM(    'SQL Functions'      )  as trimname;
SELECT CONCAT(Name, ' earns ' , Salary) as employeeinfo FROM Employees;
SELECT Name, SUBSTRING(Name, 1, 5) AS firstchars FROM Employees;
SELECT Name, REPLACE(Name, 'A', '@') AS replacename FROM Employees;

-- DATE/TIME Functions
-- NOW()		Current date & time (MySQL)
-- GETDATE()	Current date & time (SQL Server)
-- DATE_ADD(unit, value, date)	Adds interval to a date
-- DATEDIFF(unit, date1, date2)	Difference between dates
-- EXTRACT(part FROM date)		Extracts part of date
-- YEAR(date)		Gets year
-- MONTH(date)		Gets month
-- DAY(date)		Gets day of month
SELECT NOW() as currentdatetime; -- MYSQL
SELECT GETDATE() as currentdatetime; -- SQL Server
SELECT Name, DATE_ADD(JoinDate, INTERVAL 30 DAY) AS ProbationEnd
FROM Employees;
SELECT Name, DATEDIFF(NOW(), JoinDate) AS DaysWorked 
FROM Employees;
-- Extract parts of date
SELECT Name, YEAR(JoinDate) AS JoinYear, MONTH(JoinDate) AS JoinMonth, DAY(JoinDate) 
AS JoinDay FROM Employees;

-- Numeric functions
-- ROUND(num/column, decimals)		Rounds a number
-- CEIL(num)		Rounds up
-- FLOOR(num)		Rounds down
-- ABS(num)		Absolute value
-- POWER(num, exp)		Exponentiation
-- MOD(a, b)		Remainder
Select Salary, ROUND(Salary,0) as roundedsalary from Employees;
Select Salary, CEIL(Salary) as ceilsalary from Employees;
Select Salary, FLOOR(Salary) as floorsalary from Employees;
Select abs(-150) as absolutevalue;
Select power(2,3) as exponent;
Select Salary, MOD(Salary,2) as modulus From Employees;

-- Handling NULL Values
-- COALESCE(val1, val2, …)	Replace null value with certain values
	-- takes 2 or more arguments
-- NULLIF(val1, val2)	Returns NULL if values are equal, else val1
-- IFNULL(expr, alt) (MySQL)	Returns alt if expr is NULL
	-- takes only 2 arguments
Select Name, coalesce(Bonus,0) From Employees;
SELECT Name, NULLIF(Salary, 45000.30) AS NullIfSalary FROM Employees; -- Returns null if salary is equal to that value
SELECT Name, IFNULL(Bonus, 1000) AS SafeBonus FROM Employees;