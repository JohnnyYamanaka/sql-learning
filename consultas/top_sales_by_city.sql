-- Quais são as 10 cidades que mais venderam e entregaram
-- (em quantidade e valor) no ano de 2018 no continente americano?

WITH sales_by_date AS (
    SELECT
        substr(t4.CREATEDAT, 1, 4) as YEAR

    FROM sales_orders as t4
    WHERE substr(t1.CREATEDAT, 1, 4) = '2018'
)

Select 
    t3.CITY,
    t3.COUNTRY,
    count(t1.SALESORDERID) AS QTD_SALES,
    sum(t1.GROSSAMOUNT) AS TOTAL_VALUES

FROM sales_orders AS t1
LEFT JOIN business_partners AS t2
ON t1.PARTNERID = t2.PARTNERID

LEFT JOIN addresses AS t3
on t2.ADDRESSID = t3.ADDRESSID

WHERE 
    t1.DELIVERYSTATUS = 'C'
    AND
    substr(t1.CHANGEDAT, 1, 4) IN (SELECT YEAR FROM sales_by_date)
    AND
    t3.REGION = 'AMER'

GROUP BY t3.CITY
ORDER BY TOTAL_VALUES DESC

LIMIT 10;

