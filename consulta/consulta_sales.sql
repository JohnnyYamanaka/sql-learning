-- Consulta de vendas realizadas por um determinado vendedor,
-- destacando os itens e quais foram os pedidos

SELECT
    t1.SALESORDERID,
    t1.CREATEDAT,
    t1.PARTNERID,
    t2.PRODUCTID,
    t3.SHORT_DESCR,
    t2.QUANTITY,
    t2.GROSSAMOUNT,
    t2.QUANTITY * t2.GROSSAMOUNT as TOTAL
    
FROM sales_orders as t1

LEFT JOIN sales_order_items as t2
    ON t1.SALESORDERID = t2.SALESORDERID

LEFT JOIN product_text as t3
    ON t2.PRODUCTID = t3.PRODUCTID

WHERE t1.CREATEDBY = 2
;