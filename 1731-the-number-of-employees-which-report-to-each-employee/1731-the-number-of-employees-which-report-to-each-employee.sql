SELECT  
    e.employee_id,
    e.name,
    COUNT(m.employee_id) AS reports_count,
    ROUND(AVG(m.age * 1.0), 0) AS average_age
FROM 
    Employees AS e
LEFT JOIN 
    Employees AS m
    ON e.employee_id = m.reports_to
GROUP BY 
    e.employee_id,
    e.name
HAVING  
    COUNT(m.employee_id) >= 1
ORDER BY
    e.employee_id