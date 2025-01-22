WITH MonthlyRevenue AS (
    SELECT 
        YEAR(o.OrderDate) AS OrderYear,
        MONTH(o.OrderDate) AS OrderMonth,
        SUM(oi.Quantity * p.Price) AS TotalRevenue
    FROM Orders o
    JOIN OrderItems oi ON o.OrderID = oi.OrderID
    JOIN Products p ON oi.ProductID = p.ProductID
    WHERE o.OrderDate >= DATEADD(YEAR, -1, GETDATE())
    GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
),
MonthlyGrowth AS (
    SELECT 
        OrderYear,
        OrderMonth,
        TotalRevenue,
        LAG(TotalRevenue) OVER (ORDER BY OrderYear, OrderMonth) AS PreviousMonthRevenue
    FROM MonthlyRevenue
)
SELECT 
    OrderYear,
    OrderMonth,
    TotalRevenue,
    CASE 
        WHEN PreviousMonthRevenue > 0 THEN 
            ((TotalRevenue - PreviousMonthRevenue) * 1.0 / PreviousMonthRevenue) * 100 
        ELSE 0 END AS GrowthRate
FROM MonthlyGrowth
ORDER BY OrderYear, OrderMonth;
