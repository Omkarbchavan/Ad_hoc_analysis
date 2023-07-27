select p.product_code,p.product,
		m.manufacturing_cost
from dim_product p
join fact_manufacturing_cost m
on m.product_code=p.product_code
where m.manufacturing_cost in
		((select max(manufacturing_cost) from fact_manufacturing_cost),
        (select min(manufacturing_cost) from fact_manufacturing_cost))
order by manufacturing_cost desc