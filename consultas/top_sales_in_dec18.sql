-- Pesquisar o montante de venda por vendedor, no ano de 2018
-- e mes de dezembro, ordenado pelo maior montante

WITH table_sales_month AS (
    SELECT 
        substr(t1.CREATEDAT, 1, 4) AS YEAR,
        substr(t1.CREATEDAT, 5, 2) AS MONTH,
        substr(t1.CREATEDAT, 7, 2) AS DAY
    FROM sales_orders as t1
    WHERE 
        substr(t1.CREATEDAT, 1, 4) = '2018'
        AND
        substr(t1.CREATEDAT, 5, 2) = '12'
)

SELECT 
    t2.FISCALYEARPERIOD,
    t2.CREATEDBY,
    t3.NAME_FIRST,
    SUM(t2.GROSSAMOUNT) AS TOTAL_SALES,
    t2.CURRENCY
FROM sales_orders AS t2
LEFT JOIN employees as t3
    ON t2.CREATEDBY = t3.EMPLOYEEID

WHERE 
    substr(t2.CREATEDAT, 1, 4) IN (SELECT YEAR FROM table_sales_month)
    AND
    substr(t2.CREATEDAT, 5, 2) IN (SELECT MONTH FROM table_sales_month)

GROUP BY t2.CREATEDBY
ORDER BY TOTAL_SALES DESC;
