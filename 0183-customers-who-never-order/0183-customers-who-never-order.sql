/* Write your T-SQL query statement below */
SELECT
    c.name AS Customers
FROM Customers AS c
LEFT JOIN Orders as o
ON c.id = o.customerID
WHERE o.customerID IS NULL;