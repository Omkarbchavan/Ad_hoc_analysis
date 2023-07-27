--In which quarter of 2020, got the maximum total_sold_quantity
SELECT 
        (CASE
            WHEN (MONTH(fact_sales_monthly.date) IN (9 , 10, 11)) THEN 'Q1'
            WHEN (MONTH(fact_sales_monthly.date) IN (12 , 1, 2)) THEN 'Q2'
            WHEN (MONTH(fact_sales_monthly.date) IN (3 , 4, 5)) THEN 'Q3'
            ELSE 'Q4'
        END) AS quater,
        SUM(fact_sales_monthly.sold_quantity) AS total_sold_quantity
    FROM
        fact_sales_monthly
    WHERE
        (fact_sales_monthly.fiscal_year = 2020)
    GROUP BY quater
    ORDER BY total_sold_quantity DESC
