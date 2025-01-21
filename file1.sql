CREATE OR REPLACE PROCEDURE GetEmployeeDetails (
    p_employee_id IN Employees.EmployeeId%TYPE,
    o_employee_name OUT Employees.Name%TYPE,
    o_employee_salary OUT Employees.Salary%TYPE
) AS
BEGIN
    SELECT Name, Salary
    INTO o_employee_name, o_employee_salary
    FROM Employees
    WHERE EmployeeId = p_employee_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        o_employee_name := NULL;
        o_employee_salary := NULL;
END GetEmployeeDetails;
