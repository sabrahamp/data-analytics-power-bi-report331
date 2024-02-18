select s.store_type STORE_TYPE, sum(o.product_quantity * p.sale_price) REVENUE
from orders o, dim_product p, dim_store s
where o.product_code = p.product_code
and o.store_code = s.store_code
and EXTRACT(year from CAST(o.order_date as DATE)) = '2022'
and s.country_code = 'DE'
GROUP BY s.store_type
ORDER BY REVENUE DESC 