{{ config(schema='transaction') }}

WITH 
   sales AS (SELECT * FROM {{ ref('stg_sales') }} )

  ,product AS (SELECT * FROM {{ ref('stg_product')}})

SELECT
  s.date_date
  ### Key ###
  ,s.orders_id
  ,s.pdt_id AS products_id
  ###########
	-- qty --
	,s.quantity AS qty
  -- revenue --
  ,s.revenue AS turnover
  -- cost --

	,ROUND(s.quantity*purchase_price,2) AS purchase_cost
	-- margin --
	,ROUND({{ margin('s.revenue', 'p.purchase_price') }}) AS margin
    ,{{ margin_percent('s.revenue', 'p.purchase_price') }} AS margin_percent
FROM sales s
INNER JOIN product p ON s.pdt_id = p.products_id