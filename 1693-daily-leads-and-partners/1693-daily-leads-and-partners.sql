/* Write your T-SQL query statement below */
SELECT DISTINCT
    date_id,
    make_name,
    COUNT(DISTINCT lead_id) as unique_leads,
    COUNT(DISTINCT partner_id) AS unique_partners
FROM DailySales
GROUP BY 
    date_id,
    make_name;