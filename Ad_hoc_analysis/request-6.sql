-- Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.
select 
	c.customer,c.customer_code,
    avg(pre_invoice_discount_pct) as avg_discount_pct
from dim_customer c
join fact_pre_invoice_deductions p
on p.customer_code=c.customer_code
where p.fiscal_year=2021 and 
		market="India"
group by c.customer,c.customer_code
order by avg_discount_pct desc
limit 5
