create database company1;
use company1;

-- CommontableExpressions (CTEs)
-- A CTE is a temporary result set defined using WITH that 
-- exists only during the execution of the query.
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    ManagerID INT
);
INSERT INTO Employees VALUES
(1, 'Alice', 'HR', 60000, NULL),
(2, 'Bob', 'HR', 50000, 1),
(3, 'Charlie', 'IT', 70000, NULL),
(4, 'David', 'IT', 65000, 3),
(5, 'Eva', 'Finance', 55000, NULL),
(6, 'Frank', 'Finance', 40000, 5);

-- Find employees with salary greater than 55,000.
Select * from Employees;
WITH HighSalary AS (
    SELECT EmpID, Name, Salary
    FROM Employees
    WHERE Salary > 55000
)
SELECT name from Employees where salary>60000;
SELECT * FROM HighSalary;
Select name from HighSalary where salary>60000;

SELECT EmpID, Name, Salary
FROM Employees
WHERE Salary > 55000;

-- Recursive CTE's
-- A Recursive CTE is a Common Table Expression that refers to itself.
-- It is useful for working with hierarchical or tree-structured data
-- Anchor Member → the base query (starting point, usually root nodes
-- Recursive Member → query that references the CTE itself, used to 
-- fetch child/next-level rows.
Select * from Employees;
SELECT EmpID, Name, ManagerID, 1 AS Level
FROM Employees
WHERE ManagerID IS NULL;
WITH RECURSIVE EmpHierarchy AS (
    -- (1) Anchor: Top-level managers (no ManagerID)
    SELECT EmpID, Name, ManagerID, 1 AS Level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    -- (2) Recursive: Fetch employees who report to the previous level
    SELECT e.EmpID, e.Name, e.ManagerID, eh.Level + 1
    FROM Employees e
    INNER JOIN EmpHierarchy eh ON e.ManagerID = eh.EmpID
)
SELECT * FROM EmpHierarchy ORDER BY Level, EmpID;

-- Temporary table
-- Tables created for short-term use (only for your session).
-- Exist only during the session (auto-deleted when session ends).
CREATE TEMPORARY TABLE TempHighSalary AS
SELECT EmpID, Name, Salary
FROM Employees
WHERE Salary > 55000;

Select * from TempHighSalary;

-- Views
-- A view is like a saved SQL query that acts as a virtual table.
-- It does not store actual data (unlike a table).
-- When you query a view, the DB engine runs the 
-- underlying query and shows results.
CREATE VIEW HighSalaryEmployees AS
SELECT EmpID, Name, Department, Salary
FROM Employees
WHERE Salary > 55000;

SELECT * FROM HighSalaryEmployees;

SET SQL_SAFE_UPDATES = 0;

UPDATE Employees  -- UPDATE BASE Table
set salary=90000
where name='bob';

-- Execute the view query
SELECT * FROM HighSalaryEmployees;