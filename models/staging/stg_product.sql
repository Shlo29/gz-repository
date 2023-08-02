SELECT
   products_id
  ,purchSE_PRICE AS purchase_price
  ,CAST purchase_price to FLOAT64
FROM `gz_raw_data.raw_gz_product`