SELECT
	sp.name 
FROM SalesPerson as sp
WHERE sales_id NOT IN (SELECT
							o.sales_id
						FROM Orders AS o
						JOIN Company  c
						ON o.com_id = c.com_id
						WHERE c.name = 'RED'
					   );