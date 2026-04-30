WITH first_year_table AS (
SELECT
    product_id,
    MIN(year) AS first_year
FROM 
    Sales
GROUP BY
    product_id
)

SELECT
    s.product_id,
    f.first_year AS first_year,
    SUM(s.quantity) AS quantity,
    s.price
FROM 
    Sales AS s
INNER JOIN
    first_year_table AS f
    ON s.product_id = f.product_id
    AND s.year = f.first_year
GROUP BY
    s.product_id, f.first_year, s.price