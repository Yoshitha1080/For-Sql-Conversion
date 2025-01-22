SELECT d.DepartmentName,
       AVG(e.PerformanceRating) AS AvgPerformanceRating,
       SUM(s.Salary) AS TotalSalary,
       RANK() OVER (ORDER BY AVG(s.Salary) DESC, AVG(e.PerformanceRating) DESC) AS DepartmentRank
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
JOIN Salaries s ON e.EmployeeID = s.EmployeeID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 5
ORDER BY TotalSalary DESC;
