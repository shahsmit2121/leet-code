/* Write your T-SQL query statement below */
WITH top_user AS (
    SELECT TOP 1
        u.name AS results
    FROM 
        MovieRating AS mr
    INNER JOIN
        Users AS u
        ON mr.user_id = u.user_id
    GROUP BY
        mr.user_id,
        u.name
    ORDER BY
        COUNT(*) DESC, u.name ASC
),
top_movie AS 
(
    SELECT TOP 1
        m.title AS results
    FROM 
        MovieRating AS mr
    INNER JOIN 
        Movies AS m
        ON mr.movie_id = m.movie_id
    WHERE
        mr.created_at >= '2020-02-01' AND mr.created_at < DATEADD(MONTH, 1, '2020-02-01')
    GROUP BY
        mr.movie_id, m.title
    ORDER BY
        AVG(mr.rating * 1.0) DESC, m.title ASC
)

SELECT 
    *
FROM    
    top_user
UNION ALL
SELECT 
    *
FROM 
    top_movie