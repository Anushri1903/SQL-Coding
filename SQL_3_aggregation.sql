select 
sum(sales_cost) as sum_sales_cost,
min(sales_cost) as min_sales_cost,
max(sales_cost) as max_sales_cost,
avg(sales_cost) as avg_sales_cost,
count(*) as number_of_observations
from 
grocery_db.transactions;

---- Group-By-----

select 
transaction_date,
sum(sales_cost) as sum_sales_cost,
count(distinct transaction_id) as dict_transaction

from 
grocery_db.transactions
group by
transaction_date
order by 
transaction_date;

---- Group-By Multi variable-----
select 
product_area_id,
transaction_date,
sum(sales_cost) as sum_sales_cost,
count(distinct transaction_id) as dict_transaction

from 
grocery_db.transactions

group by
transaction_date,
product_area_id
order by 
transaction_date,
product_area_id;


--- Having---
select 
transaction_date,
sum(sales_cost) as total_sales
from 
grocery_db.transactions
group by 
transaction_date
having sum(sales_cost) > 2000
;


