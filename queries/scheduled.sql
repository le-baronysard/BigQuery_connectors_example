-- Example of a scheduled query
WITH join_table AS (
  SELECT
    date_date,
    products_id,
    turnover,
    qty,
    purchase_price
  FROM `data-analyse-wagon.course12.gwz_sales`
  LEFT JOIN `data-analyse-wagon.course12.gwz_product`
    USING (products_id)
  )
,calculating_product AS (SELECT
  date_date,
  products_id,
  turnover,
  qty * purchase_price AS products_costs,
	qty
FROM join_table
)
SELECT
  date_date,
  SUM(qty) AS number_of_products,
  ROUND(SUM(turnover),0) AS total_turnover,
  ROUND(SUM(products_costs),0) AS total_costs
FROM calculating_product
GROUP BY date_date
ORDER BY date_date ASC
