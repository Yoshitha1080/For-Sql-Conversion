WITH AvgSalaries AS (
    SELECT YEAR(s.SalaryDate) AS SalaryYear,
           d.DepartmentName,
           AVG(s.Salary) AS AvgSalary
    FROM Salaries s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
    JOIN Departments d ON e.DepartmentID = d.DepartmentID
    GROUP BY YEAR(s.SalaryDate), d.DepartmentName
)
SELECT current.DepartmentName,
       current.SalaryYear,
       current.AvgSalary,
       COALESCE(((current.AvgSalary - previous.AvgSalary) / previous.AvgSalary) * 100, 0) AS SalaryChangePercentage
FROM AvgSalaries current
LEFT JOIN AvgSalaries previous ON current.DepartmentName = previous.DepartmentName 
                               AND current.SalaryYear = previous.SalaryYear + 1
ORDER BY current.DepartmentName, current.SalaryYear;
