------ inner join -----
select
a.*, b.customer_loyalty_score 
from 
grocery_db.customer_details a
inner join
grocery_db.loyalty_scores b 
on
a.customer_id = b.customer_id 

---- left join------
select
a.*, b.customer_loyalty_score 
from 
grocery_db.customer_details a
left join
grocery_db.loyalty_scores b 
on
a.customer_id = b.customer_id 


-----right join ----
select
a.*, b.customer_loyalty_score 
from 
grocery_db.customer_details a
right join
grocery_db.loyalty_scores b 
on
a.customer_id = b.customer_id 

---- Multi table joins -----

select
a.*,
b.customer_loyalty_score,
c.product_area_name
from 
grocery_db.transactions  a
right join
grocery_db.loyalty_scores b 
on
a.customer_id = b.customer_id 
inner join 
grocery_db.product_areas c 
on
a.product_area_id =c.product_area_id;


---- create table ---

create table table1 (id char(1),
					t1_col1 int,
					t1_col2 int);
insert into table1 values('A',1,1),('B',1,1),('C',1,1);

select * from table1;


create table table2 (id char(1),
					t2_col1 int,
					t2_col2 int);
insert into table2 values('A',1,1),('B',1,1),('C',1,1);

select * from table2;

---joins----
					
--1--
select 
a.id as id1,
b.id as id2,
a.t1_col1 as t1_col1,
b.t2_col2 as t2_col2
from 
table1 a 
inner join 
table2 b
on 
a.id=b.id
;
--2---
select 
a.id as id1,
b.id as id2
from 
table1 a 
right join 
table2 b
on 
a.id=b.id
;

----3----
select 
a.id as id1,
b.id as id2,
a.t1_col1 as t1_col1
from 
table1 a 
full outer join 
table2 b
on 
a.id=b.id
;

