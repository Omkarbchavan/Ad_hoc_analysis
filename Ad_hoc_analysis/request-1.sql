select market 
from dim_customer
where customer="Atliq Exclusive" 
and region="APAC"
group by market