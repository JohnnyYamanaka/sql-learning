-- Qual o produto mais caro que o seller já vendeu
-- considere pedidos entregues

SELECT
    t2.PARTNERID,
    t3.COMPANYNAME,
    t1.PRODUCTID,
    MAX(t1.GROSSAMOUNT) AS AMOUNT

FROM sales_order_items AS t1


LEFT JOIN sales_orders AS t2
    ON t1.SALESORDERID = t2.SALESORDERID

LEFT JOIN business_partners AS t3
    ON t2.PARTNERID = t3.PARTNERID

WHERE t2.DELIVERYSTATUS = 'C'
GROUP BY t2.PARTNERID

ORDER BY AMOUNT DESC, t2.PARTNERID;