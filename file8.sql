WITH RecursiveReporting AS (
    SELECT e.EmployeeID,
           e.EmployeeName,
           e.ManagerID,
           e.PerformanceRating
    FROM Employees e
    WHERE e.ManagerID = @ManagerID  -- Assume @ManagerID is a parameter for the query
    UNION ALL
    SELECT e.EmployeeID,
           e.EmployeeName,
           e.ManagerID,
           e.PerformanceRating
    FROM Employees e
    INNER JOIN RecursiveReporting r ON e.ManagerID = r.EmployeeID
)
SELECT AVG(PerformanceRating) AS AvgPerformanceRating,
       COUNT(EmployeeID) AS NumberOfDirectReports
FROM RecursiveReporting;
