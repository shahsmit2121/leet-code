/* Write your T-SQL query statement below */
SELECT
    e.name AS Employee
FROM Employee AS e
JOIN Employee AS M 
ON e.managerId = m.id
WHERE e.salary > m.salary;