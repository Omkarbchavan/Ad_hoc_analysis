SELECT 
        s.fiscal_year AS year,
        MONTHNAME(s.date) AS month,
        SUM((g.gross_price * s.sold_quantity)) AS gross_sales_amount
    FROM
        ((dim_customer c
        JOIN fact_sales_monthly s ON ((s.customer_code = c.customer_code)))
        JOIN fact_gross_price g ON ((g.product_code = s.product_code)))
    WHERE
        (c.customer= 'Atliq Exclusive')
    GROUP BY year , month
