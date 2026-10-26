-- Target customer segment in North or West, ages 25 through 40.
SELECT c.customer_id, c.first_name, c.last_name, c.region, c.age
FROM customers AS c
WHERE c.region IN ('North', 'West') AND c.age BETWEEN 25 AND 40
ORDER BY c.age ASC, c.customer_id ASC;
