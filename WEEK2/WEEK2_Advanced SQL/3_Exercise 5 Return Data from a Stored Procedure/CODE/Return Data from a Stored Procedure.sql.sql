-- ==========================================================
-- Exercise 5 – Return Data from a Stored Procedure
-- Goal: Create a stored procedure that returns the total number 
--       of employees in a department.
--
-- Steps:
-- 1. Define the stored procedure with a parameter for DepartmentID.
-- 2. Write the SQL query to count the number of employees in the specified department.
-- 3. Save the stored procedure by executing the Stored procedure content.
-- ==========================================================

-- ============================
-- Step 1: Create Departments Table
-- ============================
CREATE TABLE Departments ( 
    DepartmentID INT PRIMARY KEY, 
    DepartmentName VARCHAR(100) 
);

-- ============================
-- Step 2: Create Employees Table
-- ============================
CREATE TABLE Employees ( 
    EmployeeID INT PRIMARY KEY, 
    FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    DepartmentID INT, 
    Salary DECIMAL(10,2), 
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- ============================
-- Step 3: Insert Sample Data
-- ============================

-- Departments Data
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES 
(1, 'HR'), 
(2, 'Finance'), 
(3, 'IT'), 
(4, 'Marketing');

-- Employees Data
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES 
(1, 'John', 'Doe', 1, 5000.00, '2020-01-15'), 
(2, 'Jane', 'Smith', 2, 6000.00, '2019-03-22'), 
(3, 'Michael', 'Johnson', 3, 7000.00, '2018-07-30'), 
(4, 'Emily', 'Davis', 4, 5500.00, '2021-11-05');

-- ============================
-- Step 4: Create Stored Procedure
-- ============================
DELIMITER $$

CREATE PROCEDURE sp_CountEmployeesByDepartment(
    IN dept_id INT
)
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = dept_id;
END$$

DELIMITER ;

-- ============================
-- Step 5: Sample Call to Execute
-- ============================

-- Example: Count employees in HR department (DepartmentID = 1)
CALL sp_CountEmployeesByDepartment(2);
