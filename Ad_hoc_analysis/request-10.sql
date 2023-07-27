with cte1 as (select 
	p.division,p.product_code,
    p.product,sum(s.sold_quantity) as total_sold_quantity
from dim_product p
join fact_sales_monthly s
on s.product_code=p.product_code
group by p.division,p.product_code,p.product),
cte2 as (select *,
	dense_rank() over(partition by division order by total_sold_quantity desc) as d_rank 
from cte1)
select * from cte2
where d_rank<=3