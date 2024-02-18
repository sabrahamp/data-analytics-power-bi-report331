select p.category PRODUCT_CATEGORY, sum(o.product_quantity * p.cost_price) COST, sum(o.product_quantity * p.sale_price) SALES, SUM(o.total_orders) ORDERS, (sum(o.product_quantity * p.sale_price) - sum(o.product_quantity * p.cost_price)) PROFIT
from orders o, dim_product p, dim_store s
where o.product_code = p.product_code
and o.store_code = s.store_code
and EXTRACT(year from CAST(o.order_date as DATE)) = '2021'
and s.country_code = 'GB'
and s.full_region = 'Wiltshire, UK'
GROUP BY PRODUCT_CATEGORY
ORDER BY PROFIT DESC 