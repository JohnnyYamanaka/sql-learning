-- Classificar os vendedores de acordo com a quantidade de vendas realizadas

SELECT 
    t1.CREATEDBY,
    t2.NAME_FIRST,
    t2.NAME_LAST,
    COUNT(t1.SALESORDERID) AS QTD_SALES

FROM sales_orders as t1

LEFT JOIN employees as t2
    ON t1.CREATEDBY = t2.EMPLOYEEID

GROUP BY t1.CREATEDBY
ORDER BY QTD_SALES DESC;

-- Classificar os vendedores de acordo com o montante de vendas realizada

SELECT
    t1.CREATEDBY,
    t2.NAME_FIRST,
    t2.NAME_LAST,
    sum(t1.GROSSAMOUNT) AS TOTAL_SALES

FROM sales_orders as t1
LEFT JOIN employees as t2
    ON t1.CREATEDBY = t2.EMPLOYEEID

GROUP BY t1.CREATEDBY
ORDER BY TOTAL_SALES DESC;

