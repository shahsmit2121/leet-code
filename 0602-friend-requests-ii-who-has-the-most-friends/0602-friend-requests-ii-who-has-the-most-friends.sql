/* Write your T-SQL query statement below */
WITH cleaned AS (
    SELECT
        requester_id,
        COUNT(*) AS count
    FROM
        RequestAccepted
    GROUP BY
        requester_id

    UNION ALL

    SELECT
        accepter_id,
        COUNT(*) AS count
    FROM 
        RequestAccepted
    GROUP BY
        accepter_id
), ranked AS (
    SELECT
        requester_id AS id,
        SUM(count) AS num,
        DENSE_RANK() OVER (ORDER BY SUM(count) DESC) AS rank
    FROM 
        cleaned
    GROUP BY
        requester_id
)

SELECT 
    id,
    num
FROM 
    ranked
WHERE
    rank = 1