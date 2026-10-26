 # Big Billion Days Regional Performance Review

## Tools Used
- **SQL compiler and dialect:** Programiz Online SQL Editor, SQLite dialect
- **Spreadsheet:** Google Sheets
- **Tableau Public dashboard:** Yes, created in Tableau Public

## Key Findings
The 63 completed orders generated total revenue of ₹3,46,200. North had the highest regional revenue at ₹1,19,300, while East had the lowest at ₹69,500. Electronics was the highest-revenue category at ₹1,42,300. North's revenue fell from ₹53,500 in September 2026 to ₹41,300 in October 2026, a decrease of 22.8%.

## File Index

| File | Part |
|---|---|
| `sql/00_schema_and_seed.sql` | Part A |
| `sql/q01.sql` | Part A |
| `sql/q02.sql` | Part A |
| `sql/q03.sql` | Part A |
| `sql/q04.sql` | Part A |
| `sql/q05.sql` | Part A |
| `sql/q06.sql` | Part A |
| `sql/q07.sql` | Part A |
| `sql/q08.sql` | Part A |
| `sql/q09.sql` | Part A |
| `sql/q10.sql` | Part A |
| `sql/q11.sql` | Part A |
| `sql/q12.sql` | Part A |
| `sql/q13.sql` | Part A |
| `results/query_results.md` | Part A |
| `data/orders_enriched.csv` | Part A |
| `data/orders_clean.csv` | Part B |
| `docs/spreadsheet_notes.md` | Part B |
| `docs/dashboard_spec.md` | Part C |
| `sql/d1_corrected.sql` | Part D |
| `docs/ai_log.md` | Part D |

## Assumptions
- Revenue includes completed orders only; pending and disputed orders are excluded.
- The supplied dataset is synthetic, as stated in the brief.
- Missing order amounts are left blank and are not estimated.
- `order_month` is kept as text in `YYYY-MM` format.
