# Employee & Department Analytics System (CompanyHRDB) 🏢📊

## Overview
A relational database and SQL analytics project designed to manage organizational structure and analyze employee compensation, department headcounts, and salary distributions.

## Tech Stack & Tools
* **Database Management System:** SQL Server (SSMS 2022)
* **Language:** T-SQL

## Database Schema
* **Departments Table:** Stores department IDs, names, and physical office locations.
* **Employees Table:** Stores staff personal details, job titles, hire dates, salaries, and links back to departments using a **Foreign Key**.

## Key SQL Concepts Demonstrated
* **Relational Database Design:** Enforcing data integrity using Primary and Foreign Keys (`REFERENCES`).
* **Aggregate Statistics:** Using `COUNT`, `AVG`, `MAX`, and `MIN` combined with `GROUP BY` to summarize payroll by department.
* **Conditional Logic:** Using `CASE WHEN` statements to dynamically categorize staff into compensation tiers (High Earner, Mid Earner, Entry Level).

## Sample Query Highlights
Here is an example of the salary categorization logic built into the project:
```sql
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
