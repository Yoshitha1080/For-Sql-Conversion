SELECT 
    department_id, 
    total_salary
FROM 
    (SELECT 
         department_id, 
         SUM(salary) AS total_salary
     FROM 
         employees
     GROUP BY 
         department_id) AS dept_salaries
WHERE 
    total_salary > 120000;
