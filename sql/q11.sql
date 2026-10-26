-- Completed-order revenue by customer region and month.
-- INNER JOIN is appropriate because only orders with a matching customer and assigned rep are reportable; COUNT(DISTINCT customer_id) prevents a customer with multiple orders in one month from being counted more than once.
SELECT c.region, o.order_month, COUNT(*) AS number_of_orders, COUNT(DISTINCT c.customer_id) AS number_of_customers, SUM(o.amount) AS total_revenue, AVG(o.amount) AS average_revenue
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
JOIN reps AS r ON c.rep_id = r.rep_id
WHERE o.status = 'completed'
GROUP BY c.region, o.order_month
ORDER BY c.region ASC, o.order_month ASC;
