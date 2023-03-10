
---Partition-------
select 
*,
sum(sales_cost) over (partition by transaction_id) as transaction_total_sales,
sales_cost/sum(sales_cost) over (partition by transaction_id) as transaction_percentage
from 
grocery_db.transactions;


---Row number------

select 
*,
row_number() over (partition by customer_id order by transaction_date,transaction_id)
as transaction_number 
from 
grocery_db.transactions;

----NTILE----

select 
	customer_id,
	customer_loyalty_score,
	ntile(3) over (order by customer_loyalty_score desc) as loyalty_cat1,
	ntile(10) over (order by customer_loyalty_score desc) as loyalty_cat2
from grocery_db.loyalty_scores;

-- temp query view  with ---
WITH TOPTWO AS (
    SELECT customer_id,product_area_id, sum(sales_cost) as total_spend, ROW_NUMBER() 
    over (
        PARTITION BY customer_id,product_area_id
        order by sum(sales_cost)
    ) AS RowNo 
    FROM  grocery_db.transactions
    group by customer_id,product_area_id
   )
   SELECT * FROM TOPTWO WHERE RowNo <= 2;
