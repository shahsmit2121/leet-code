/* Write your T-SQL query statement below */
WITH cumm_weight AS (
    SELECT 
        person_name
        SUM(weight) OVER(ORDER BY turn) as cumulative_weight
    FROM 
        Queue
)

SELECT
    person_name
FROM
    cumm_weight
WHERE
    cumulative_weight <= 1000
    AND turn = (SELECT MAX(turn)
                FROM cumm_weight
                WHERE cumulative_weight <= 1000)