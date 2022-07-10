/*
    Selecionar somente fornecedores que cuja moeda de negociação é Euro
*/


SELECT 
    t1.PARTNERID,
    t1.COMPANYNAME,
    t1.CURRENCY
FROM business_partners as t1
WHERE t1.CURRENCY = 'EUR'
;