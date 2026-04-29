/* Write your T-SQL query statement below */
WITH ranked_salary AS (
SELECT
    *,
    RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) as salary_rank
FROM 
    Employee
)

SELECT
    d.name AS Department,
    r.name AS Employee,
    r.salary AS Salary
FROM 
    ranked_salary AS r
INNER JOIN 
    Department AS d
    ON r.departmentId = d.id
WHERE
    salary_rank = 1