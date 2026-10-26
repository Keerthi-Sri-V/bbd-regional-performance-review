# Spreadsheet Cleaning and Reconciliation Notes

## Setup
- Spreadsheet tool: Google Sheets.
- Tabs: `orders`, `products`, and `completed_orders`.
- Imported all 90 data rows from `data/orders_enriched.csv` into `orders` (header not counted).
- Pasted the product table, including headers, into `products!A1:C10`.
- Kept `order_month` as plain text, such as `2026-09`.
- On `orders`, filtered `status` to `completed`, sorted `amount` from largest to smallest, and copied the 63 visible rows as values into `completed_orders`.
- Tested the lookup fallback with `Mystery Item` in a spare cell. The XLOOKUP formula returned `UNKNOWN_ITEM`.

## Formulas
The source columns are: `first_name` in C, `last_name` in D, `item` in G, `quantity` in H. The added columns are K:O.

- `clean_first_name` (K2): `=PROPER(TRIM(C2))`
- `clean_last_name` (L2): `=PROPER(TRIM(D2))`
- `category` (M2): `=VLOOKUP(G2, products!$A$2:$C$10, 2, FALSE)`
- `unit_price` (N2): `=XLOOKUP(G2, products!$A$2:$A$10, products!$C$2:$C$10, "UNKNOWN_ITEM")`
- `revenue_calc` (O2): `=N2*H2`

The formulas were copied down all 90 rows. In `completed_orders`, the 13 columns are arranged in this order: `order_id`, `order_month`, `clean_first_name`, `clean_last_name`, `region`, `rep_name`, `item`, `category`, `unit_price`, `quantity`, `amount`, `revenue_calc`, `status`.

## Completed-Order Aggregates

| Metric | Result |
|---|---:|
| COUNT of amount | 63 |
| SUM of amount | 346200 |
| AVERAGE of amount | 5495.24 |
| MIN of amount | 1100 |
| MAX of amount | 15600 |

## Pivot Table 1: Sum of Amount by Category and Region

| Category | East | North | South | West | Grand Total |
|---|---:|---:|---:|---:|---:|
| Apparel | 10600 | 19400 | 10000 | 37500 | 77500 |
| Electronics | 21400 | 73400 | 28700 | 18800 | 142300 |
| Home | 37500 | 26500 | 43800 | 18600 | 126400 |
| **Grand Total** | **69500** | **119300** | **82500** | **74900** | **346200** |

## Pivot Table 2: Revenue and Order Count by Month

| Order month | Sum of amount | Count of order_id |
|---|---:|---:|
| 2026-09 | 98300 | 19 |
| 2026-10 | 93100 | 20 |
| 2026-11 | 154800 | 24 |
| **Grand Total** | **346200** | **63** |

## Reconciliation with Part A q05

| Metric | Spreadsheet | q05 | Result |
|---|---:|---:|---|
| COUNT | 63 | 63 | Match |
| SUM | 346200 | 346200 | Match |
| AVERAGE | 5495.24 | 5495.24 | Match |

## Data Validation
- Orders 1001, 1010, and 1064 have missing amounts and are pending. Their amounts were left blank because no verified replacement values were provided. They are not included in completed-order revenue.
- Checked that `quantity`, `unit_price`, `amount`, and `revenue_calc` are numeric; `order_id` is an identifier; and `order_month` remains text.
- No duplicate `order_id` values were found in the 90 orders.
- The largest completed-order amount is INR 15,600. The order IDs are 1061, 1065, 1069, and 1077; each is three Air Fryers at INR 5,200 each.
- Handover decision: keep the original export unchanged and document cleaning formulas and filters so another analyst can repeat the work.
- No real order has an unknown product item. The `UNKNOWN_ITEM` fallback was tested separately without changing the source data.

## Export Validation
- `data/orders_clean.csv` contains 63 data rows and 13 columns in the required order.
- The completed-order revenue total is INR 346,200, and `revenue_calc` matches unit price multiplied by quantity.
