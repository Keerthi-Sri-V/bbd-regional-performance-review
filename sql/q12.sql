-- Product contribution tiers for completed orders.
SELECT p.item, COALESCE(SUM(CASE WHEN o.status = 'completed' THEN o.amount END), 0) AS total_revenue, CASE WHEN COALESCE(SUM(CASE WHEN o.status = 'completed' THEN o.amount END), 0) >= 60000 THEN 'High' WHEN COALESCE(SUM(CASE WHEN o.status = 'completed' THEN o.amount END), 0) >= 15000 THEN 'Medium' ELSE 'Low' END AS contribution_tier
FROM products AS p
LEFT JOIN orders AS o ON p.item = o.item
GROUP BY p.item
ORDER BY total_revenue DESC, p.item ASC;
