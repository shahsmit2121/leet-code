/* Write your T-SQL query statement below */
WITH first_login AS (
SELECT
    player_id,
    MIN(event_date) AS first_event_date
FROM 
    Activity
GROUP BY 
    player_id
)

SELECT  
    ROUND(COUNT(DISTINCT f.player_id) * 1.0 / 
        (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM 
    first_login AS f
JOIN 
    Activity AS a
    ON f.player_id = a.player_id
    AND DATEDIFF(DAY, f.first_event_date, a.event_date) = 1