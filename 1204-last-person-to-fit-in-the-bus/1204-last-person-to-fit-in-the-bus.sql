SELECT TOP 1
    person_name
FROM
    (
    SELECT 
        *,
        SUM(weight) OVER(ORDER BY turn) as cumulative_weight
    FROM 
        Queue
    ) AS t
WHERE
    t.cumulative_weight <= 1000
ORDER BY
    t.cumulative_weight DESC