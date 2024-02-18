select EXTRACT(month from CAST(o.order_date as DATE)) MONTH_DISP, sum(o.product_quantity * p.sale_price) REVENUE
from orders o, dim_product p
where o.product_code = p.product_code
and EXTRACT(year from CAST(o.order_date as DATE)) = '2022'
GROUP BY EXTRACT(month from CAST(o.order_date as DATE))
ORDER BY REVENUE DESC 