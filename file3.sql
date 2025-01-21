WITH TotalSales AS (
    SELECT 
        product_id,
        SUM(sale_amount) AS total_sales
    FROM 
        sales
    GROUP BY 
        product_id
)
SELECT 
    p.product_name,
    ts.total_sales
FROM 
    products p
JOIN 
    TotalSales ts ON p.id = ts.product_id
ORDER BY 
    ts.total_sales DESC;
