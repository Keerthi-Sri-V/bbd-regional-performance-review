# AI-Assisted Analysis and Verification Log

## Part A Prompt: q13 Representative Performance

**Role:** Act as a careful business analyst writing SQL for the SQLite dialect.

**Task:** Write query q13 to compare each sales representative's monthly completed-order revenue with their monthly target.

**Context:** Use these tables and columns: `reps(rep_id, rep_name, region, monthly_target)`, `customers(customer_id, first_name, last_name, city, region, age, rep_id)`, and `orders(order_id, customer_id, item, quantity, amount, status, order_month)`. Join `customers.rep_id` to `reps.rep_id` and `orders.customer_id` to `customers.customer_id`. The SQL dialect is SQLite.

**Constraints:** Include completed orders only. Group by representative, month, and monthly target. Set `Below Target` when revenue is below target, `On Target` when revenue is at least target but below 1.1 times target, and `Above Target` otherwise. Do not use `WITH` clauses or stored procedures. Do not use aggregate aliases in `WHERE` or `GROUP BY`.

**Format:** Return raw SQL only, with inline comments and the aliases `rep_name`, `order_month`, `monthly_target`, `revenue`, and `performance_tier`.

## Scenario D1: Defects in the Original Answer

The original answer was:

```sql
SELECT region_name, SUM(total_sales) AS sales
FROM sales
WHERE SUM(total_sales) > 80000
GROUP BY region_name
ORDER BY sales DESC;
```

It also claimed: “North is the strongest region, and its revenue grew 38% month over month.”

| Defect | Classification | Correction |
|---|---|---|
| The `sales` table does not exist. | Fake method/function | Use the real `orders` table and join to `customers` for region. |
| `region_name` and `total_sales` do not exist. | Fake method/function | Use `customers.region` and `orders.amount`. |
| The aggregate condition is in `WHERE`. | Logic error | Put the aggregate condition in `HAVING`. |
| The 38% growth claim is unsupported. | Phantom statistic | Calculate the change using the q11 monthly revenue values. |

## Scenario D1: Corrected Query Result

The corrected query in `sql/d1_corrected.sql` includes completed orders only and keeps the revenue threshold greater than INR 80,000.

| Region | Revenue (INR) |
|---|---:|
| North | 119300 |
| South | 82500 |

North revenue was INR 53,500 in September 2026 and INR 41,300 in October 2026. The percentage change is `((41300 - 53500) / 53500) * 100` = **-22.8%**. This is a decrease, so the assistant's 38% growth claim is contradicted by the data.

## Human-in-the-Loop Protocol

**Specification:** I defined “which regions sell the most?” as completed-order revenue by customer region, using a threshold greater than INR 80,000.

**Execution:** The corrected query returned North at INR 119,300 and South at INR 82,500.

**Inspection:** I checked the table and column names against the supplied schema and used the correct joins between orders, customers, and regions.

**Verification:** I checked that the aggregate filter uses `HAVING` and compared the North September and October values from q11. The calculated change is -22.8%.

**Decision:** Reject the original answer because it uses nonexistent schema names, places an aggregate in `WHERE`, and makes an unsupported growth claim. Accept the corrected query because it returns the two regions above INR 80,000 and its results match the supplied data.

## Scenario D2: Prompt for the Lookup Error

**Role:** Act as a spreadsheet troubleshooting analyst.

**Task:** Find why an exact-match VLOOKUP returns “not found” and give a corrected formula.

**Context:** The formula is `=VLOOKUP(G2, $A$2:$C$10, 3, FALSE)`. Cell `G2` contains ` Smart Watch` with a leading space. The products table occupies `A1:C10`, item names are in column A, and unit prices are in column C. The lookup should find Smart Watch and return its unit price.

**Constraints:** Keep exact-match behavior and do not change the intended item or product table.

**Format:** State the cause in one sentence and provide the corrected formula.

**Cause:** The leading space in `G2` makes its text different from `Smart Watch` in the product table.

**Corrected formula:** `=VLOOKUP(TRIM(G2), $A$2:$C$10, 3, FALSE)`

## Skeptical-Analyst Check for Part C

**Prompt:** Act as a skeptical business analyst. Challenge the recommendation to test an Electronics promotion in North. Identify unstated assumptions, distinguish correlation from cause, and state what data or experiment would test each assumption. Do not treat revenue alone as proof that a promotion will work.

| Assumption | Evidence or check |
|---|---|
| North has enough Electronics demand to justify a promotion. | North Electronics revenue is INR 73,400; compare its share of North revenue with other regions. |
| A promotion would create additional sales rather than discount existing purchases. | Run a controlled test with a holdout group and compare revenue, conversion, and margin. Campaign and margin data are not in the supplied dataset. |
| Enough stock is available for increased demand. | Check inventory and stockout records; these are not included in the supplied dataset. |
| Higher revenue would improve profit. | Check contribution margin and discount data, which are not included in the supplied dataset. |

## AI Use Disclosure

An AI assistant helped draft and organize parts of this project, including SQL, formulas, dashboard notes, and this log. The query results and totals were checked against the supplied dataset. I am responsible for reviewing the files and being able to explain the queries, formulas, and recommendations.
