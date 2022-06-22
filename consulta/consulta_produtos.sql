/*
    Seleciona os primeiros 15 bicicletas, ordenadas pelo preço decrescente
*/

SELECT 
    products.PRODUCTID AS ID,
    product_text.SHORT_DESCR AS Description,
    products.PRODCATEGORYID,
    product_category_text.SHORT_DESCR AS Category_Descripton,
    products.PRICE,
    products.CURRENCY
FROM products, product_text, product_category_text
WHERE 
    (products.PRODUCTID = product_text.PRODUCTID) 
    AND
    (products.PRODCATEGORYID = product_category_text.PRODCATEGORYID)
ORDER BY products.PRICE
LIMIT 15;
