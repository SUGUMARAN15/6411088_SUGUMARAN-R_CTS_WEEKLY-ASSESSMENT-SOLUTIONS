-- ============================
-- Drop existing tables (if any)
-- ============================
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- ============================
-- Create Departments Table
-- ============================
CREATE TABLE Departments ( 
    DepartmentID INT PRIMARY KEY, 
    DepartmentName VARCHAR(100) 
);

-- ============================
-- Create Employees Table
-- ============================
CREATE TABLE Employees ( 
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT, 
    FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    DepartmentID INT, 
    Salary DECIMAL(10,2), 
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- ============================
-- Insert Sample Data
-- ============================
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES 
(1, 'HR'), 
(2, 'Finance'), 
(3, 'IT'), 
(4, 'Marketing');

INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES 
('John', 'Doe', 1, 5000.00, '2020-01-15'), 
('Jane', 'Smith', 2, 6000.00, '2019-03-22'), 
('Michael', 'Johnson', 3, 7000.00, '2018-07-30'), 
('Emily', 'Davis', 4, 5500.00, '2021-11-05');

-- ============================
-- Stored Procedure 1: Get Employees by Department
-- ============================
DELIMITER $$

CREATE PROCEDURE sp_GetEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT * FROM Employees
    WHERE DepartmentID = dept_id;
END$$

DELIMITER ;

-- ============================
-- Stored Procedure 2: Insert a New Employee
-- ============================
DELIMITER $$

CREATE PROCEDURE sp_InsertEmployee (
    IN FirstName VARCHAR(50),
    IN LastName VARCHAR(50),
    IN DepartmentID INT,
    IN Salary DECIMAL(10,2),
    IN JoinDate DATE
)
BEGIN
    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
    VALUES (FirstName, LastName, DepartmentID, Salary, JoinDate);
END$$

DELIMITER ;

-- ============================
--  SAMPLE CALLS (TO SEE OUTPUT)
-- ============================

-- Call to get employees from IT department (DepartmentID = 3)
CALL sp_GetEmployeesByDepartment(3);

-- Call to insert a new employee into Finance department
CALL sp_InsertEmployee('Arjun', 'Rao', 2, 6200.00, '2024-04-15');

-- Call again to view updated Finance department employees
CALL sp_GetEmployeesByDepartment(2);
