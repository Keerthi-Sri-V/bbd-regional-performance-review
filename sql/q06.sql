-- Order counts and amounts by status.
SELECT o.status, COUNT(*) AS number_of_orders, SUM(o.amount) AS total_amount
FROM orders AS o
GROUP BY o.status
ORDER BY number_of_orders DESC, o.status ASC;
