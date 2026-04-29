SELECT 
    ROUND(
        COUNT(DISTINCT player_id) * 1.0 /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity a1
WHERE (player_id, DATEADD(day, -1, event_date)) IN (
    SELECT player_id, MIN(event_date)
    FROM Activity
    GROUP BY player_id
);