SELECT DISTINCT
    e.employee_id
FROM
    Employees AS e
LEFT JOIN   
    Employees AS m
    ON e.employee_id = m.manager_id
WHERE 
    e.salary < 30000
    AND e.manager_id NOT IN (SELECT employee_id
                                FROM Employees)
ORDER BY e.employee_id