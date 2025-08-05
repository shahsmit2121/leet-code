SELECT
	player_id,
	first_login
FROM (
		SELECT
			player_id,
			MIN(event_date) OVER(PARTITION BY player_id ORDER BY event_date) as first_login,
			RANK() OVER(PARTITION BY player_id ORDER BY event_date) as first_date
		FROM Activity
)t
WHERE first_date = 1
