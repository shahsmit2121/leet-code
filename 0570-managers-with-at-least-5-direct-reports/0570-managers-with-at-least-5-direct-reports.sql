/* Write your T-SQL query statement below */
SELECT
    name
FROM
    Employee
WHERE 
    id IN (SELECT
                m.id
            FROM 
                Employee AS e
            LEFT JOIN
                Employee AS m
                ON e.managerId = m.id
            GROUP BY 
                m.id
            HAVING 
                m.id IS NOT NULL
                AND COUNT(m.id) >= 5)