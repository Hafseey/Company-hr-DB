-- Create the database
CREATE DATABASE CompanyHRDB;

-- Switch context to the new database
USE CompanyHRDB;

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

-- Insert sample departments
INSERT INTO Departments (DepartmentID, DepartmentName, Location) VALUES
(1, 'Engineering', 'Lagos'),
(2, 'Data & Analytics', 'Abuja'),
(3, 'Human Resources', 'Lagos'),
(4, 'Marketing', 'Ibadan');


-- Create the Employees table linked to Departments via Foreign Key
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    JobTitle VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert sample employees into the table
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, JobTitle, Salary, HireDate) VALUES
(101, 'Amina', 'Bello', 1, 'Senior Software Engineer', 450000.00, '2023-01-15'),
(102, 'Chinedu', 'Okafor', 1, 'Backend Developer', 320000.00, '2023-06-20'),
(103, 'Fatima', 'Ibrahim', 2, 'Data Analyst', 380000.00, '2022-11-10'),
(104, 'Tunde', 'Bakare', 2, 'Data Engineer', 410000.00, '2024-02-01'),
(105, 'Grace', 'Effiong', 3, 'HR Manager', 350000.00, '2021-08-05'),
(106, 'Emeka', 'Nnamdi', 4, 'Marketing Specialist', 280000.00, '2023-09-12'),
(107, 'Zainab', 'Garba', 1, 'Frontend Developer', 300000.00, '2024-03-10');


-- Analyze salary distribution and headcount per department
SELECT 
    d.DepartmentName,
    COUNT(e.EmployeeID) AS TotalEmployees,
    AVG(e.Salary) AS AverageSalary,
    MAX(e.Salary) AS HighestSalary,
    MIN(e.Salary) AS LowestSalary
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

-- Categorize employees into salary bands
SELECT 
    FirstName,
    LastName,
    JobTitle,
    Salary,
    CASE 
        When Salary >= 400000 THEN 'High Earner'
        When Salary >= 300000 THEN 'Mid Earner'
        ELSE 'Entry Level'
    END AS SalaryCategory
FROM Employees
ORDER BY Salary DESC;

