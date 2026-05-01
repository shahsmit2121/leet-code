/* Write your T-SQL query statement below */
WITH cte_total_per_day AS (
    SELECT
        visited_on,
        SUM(amount) AS total_per_day
    FROM 
        Customer
    GROUP BY
        visited_on
),
rolling AS (
    SELECT
        visited_on,
        total_per_day,
        SUM(total_per_day) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_total
    FROM cte_total_per_day
)

SELECT
    visited_on,
    rolling_total AS amount,
    ROUND(rolling_total * 1.0 / 7, 2) AS average_amount
FROM 
    rolling
WHERE
    visited_on >= (SELECT DATEADD(DAY, 6, MIN(visited_on)) FROM cte_total_per_day)