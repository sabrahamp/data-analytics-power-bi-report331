CREATE VIEW StoreSalesSummary_view AS
SELECT
    s.store_type,
    sum(o.product_quantity * p.sale_price) AS TotalSales,
    100.0 * SUM(o.product_quantity * p.sale_price) / (SELECT SUM(o.product_quantity * p.sale_price) 
    FROM orders o, dim_product p
    where o.product_code = p.product_code) AS PercentageOfTotalSales,
    SUM(o.total_orders) AS OrderCount
FROM
    orders o, dim_product p, dim_store s
    where o.product_code = p.product_code
and o.store_code = s.store_code
GROUP BY s.store_type
ORDER BY TotalSales DESC 