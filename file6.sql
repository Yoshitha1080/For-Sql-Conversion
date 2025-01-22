WITH RankedEmployees AS (
    SELECT e.EmployeeID,
           e.EmployeeName,
           d.DepartmentName,
           s.Salary,
           ROW_NUMBER() OVER (PARTITION BY d.DepartmentID ORDER BY s.Salary DESC) AS SalaryRank
    FROM Employees e
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
    JOIN Salaries s ON e.EmployeeID = s.EmployeeID
)
SELECT EmployeeID, EmployeeName, DepartmentName, Salary
FROM RankedEmployees
WHERE SalaryRank <= 3;  -- Change the number to get top N employees
