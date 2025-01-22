SELECT e.EmployeeID, 
       e.EmployeeName, 
       SUM(s.Salary) AS TotalSalary,
       COUNT(p.ProjectID) AS ProjectCount
FROM Employees e
JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects p ON ep.ProjectID = p.ProjectID
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
WHERE p.Budget > (SELECT AVG(Budget) FROM Projects)
GROUP BY e.EmployeeID, e.EmployeeName
HAVING COUNT(p.ProjectID) > 2
ORDER BY TotalSalary DESC;
