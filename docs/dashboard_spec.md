# Dashboard Specification and Business Narrative

## Data Source
Use `data/orders_clean.csv`. It contains 63 completed orders and these 13 fields:

| Field | Type |
|---|---|
| `order_id` | Dimension |
| `order_month` | Dimension |
| `clean_first_name` | Dimension |
| `clean_last_name` | Dimension |
| `region` | Dimension |
| `rep_name` | Dimension |
| `item` | Dimension |
| `category` | Dimension |
| `unit_price` | Measure |
| `quantity` | Measure |
| `amount` | Measure |
| `revenue_calc` | Measure |
| `status` | Dimension |

## KPI Cards
- **Total Revenue:** `SUM(amount)` = INR 346,200. This matches Part A q05 `total_revenue`.
- **Total Units Sold:** `SUM(quantity)` = 106.

## Worksheet 1: Revenue by Region
- **Chart:** Bar chart.
- **Rows:** `region`; **Columns:** `SUM(amount)`; **Colour:** `region`.
- **Reason:** Bars make it easy to compare revenue across regions.

| Region | Revenue (INR) |
|---|---:|
| East | 69500 |
| North | 119300 |
| South | 82500 |
| West | 74900 |
| **Total** | **346200** |

## Worksheet 2: Revenue by Category
- **Chart:** Bar chart.
- **Rows:** `category`; **Columns:** `SUM(amount)`; **Colour:** `category`.
- **Reason:** Bars make it easy to rank category revenue.

| Category | Revenue (INR) |
|---|---:|
| Apparel | 77500 |
| Electronics | 142300 |
| Home | 126400 |
| **Total** | **346200** |

## Worksheet 3: Revenue Trend by Month and Category
- **Chart:** Line chart.
- **Columns:** `order_month`, sorted ascending as text; **Rows:** `SUM(amount)`; **Colour:** `category`.
- **Reason:** Lines show how each category's revenue changes over time.

| Order month | Apparel | Electronics | Home | Total |
|---|---:|---:|---:|---:|
| 2026-09 | 24700 | 43000 | 30600 | 98300 |
| 2026-10 | 30600 | 49900 | 12600 | 93100 |
| 2026-11 | 22200 | 49400 | 83200 | 154800 |
| **Total** | **77500** | **142300** | **126400** | **346200** |

## Worksheet 4: Region x Category Detail
- **Chart:** Text table.
- **Rows:** `region`; **Columns:** `category`; **Text:** `SUM(amount)`; **Colour:** optional intensity based on `SUM(amount)`.
- **Reason:** A detail table shows exact revenue for each region and category.

| Region | Apparel | Electronics | Home | Total |
|---|---:|---:|---:|---:|
| East | 10600 | 21400 | 37500 | 69500 |
| North | 19400 | 73400 | 26500 | 119300 |
| South | 10000 | 28700 | 43800 | 82500 |
| West | 37500 | 18800 | 18600 | 74900 |
| **Total** | **77500** | **142300** | **126400** | **346200** |

## Dashboard Layout and Filters
1. Top: Total Revenue and Total Units Sold KPI cards side by side in a horizontal container.
2. Below the KPIs: category filter in a horizontal container. Apply it to all four worksheets using this data source.
3. Next: full-width monthly trend chart.
4. Next: Revenue by Region and Revenue by Category charts side by side in a horizontal container.
5. Bottom: full-width Region x Category Detail table.
6. Use an outer vertical container to stack these sections. Turn on **Use as Filter** for Revenue by Region. Clicking a region bar filters the category chart, trend chart, and detail table to that region.

## Visualization Summary
The dashboard shows INR 346,200 in completed-order revenue across four regions and three categories, 106 units sold, and monthly category revenue from September to November 2026. A category filter and region-bar selection let users focus on selected data.

## Summary Analysis
1. **Regional comparison:** North had the highest revenue at INR 119,300, while East had the lowest at INR 69,500, a difference of INR 49,800.
2. **Category comparison:** Electronics led with INR 142,300, compared with Apparel at INR 77,500.
3. **Monthly change:** Total revenue fell from INR 98,300 in September to INR 93,100 in October, then rose to INR 154,800 in November.
4. **North trend:** North revenue fell from INR 53,500 in September to INR 41,300 in October, a 22.8% decrease.

## Recommendations
1. **North and Electronics:** Test a small Electronics promotion in North, where Electronics revenue was INR 73,400. Measure incremental completed-order revenue and conversion against a control group.
2. **Electronics inventory:** Review stock and replenishment for Electronics, which generated INR 142,300. Monitor stockouts and completed revenue during the next comparable sale.
3. **October performance:** Check campaign timing, stock availability, and order status after total revenue fell from INR 98,300 in September to INR 93,100 in October. Monitor the next month's completed revenue.

## Reconciliation

| Measure | Value (INR) |
|---|---:|
| Total Revenue KPI | 346200 |
| Sum of Revenue by Region | 346200 |
| Sum of Revenue by Category | 346200 |
| Part B pivot grand total | 346200 |
