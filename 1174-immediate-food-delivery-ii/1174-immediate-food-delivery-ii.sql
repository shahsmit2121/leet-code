/* Write your T-SQL query statement below */
WITH first_date AS (
    SELECT  
        *,
        RANK() OVER(PARTITION BY customer_id
                    ORDER BY order_date ASC) as rank       
    FROM 
        Delivery
)


SELECT
    ROUND((COUNT(fd.customer_id) * 1.0 / (SELECT COUNT(DISTINCT customer_id)
                                    FROM Delivery
                                    )) * 100, 2) AS immediate_percentage

FROM 
    first_date AS fd
WHERE 
    fd.rank = 1
    AND fd.order_date = fd.customer_pref_delivery_date

