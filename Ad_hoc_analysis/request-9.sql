with cte1 as 
(select c.channel AS channel,
		sum((g.gross_price * s.sold_quantity) / 1000000) AS gross_sales_mln 
from dim_customer c 
join fact_sales_monthly s 
on s.customer_code = c.customer_code
join fact_gross_price g 
on g.product_code = s.product_code
where s.fiscal_year = 2021 
group by c.channel
order by gross_sales_mln desc)
select cte1.channel AS channel,
		cte1.gross_sales_mln AS gross_sales_mln,
        round(((cte1.gross_sales_mln * 100) / sum(cte1.			gross_sales_mln) OVER () ),2) AS pct 
from cte1
