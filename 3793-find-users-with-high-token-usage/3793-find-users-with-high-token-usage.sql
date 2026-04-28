WITH cleaned AS (
SELECT
    user_id,
    COUNT(*) AS prompt_count,
    ROUND(AVG(tokens * 1.0), 2) AS avg_tokens
FROM 
    prompts
GROUP BY 
    user_id
)

SELECT  
    c.user_id,
    c.prompt_count,
    c.avg_tokens
FROM 
    cleaned AS c
WHERE
    c.prompt_count >= 3
    AND EXISTS (
                SELECT 1
                FROM prompts AS p
                WHERE p.user_id = c.user_id
                AND p.tokens > c.avg_tokens
    )
ORDER BY
    c.avg_tokens DESC,
    c.user_id ASC