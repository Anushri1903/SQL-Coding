
/* Q1----- Order the Country names from A_Z*/

select * 
from 
Person.CountryRegion
order by Name 
ASC;

/* Q2----- sort reviews by comment length */ 

select 
ProductID, ReviewerName, Rating, Comments
from 
Production.ProductReview
order by len(Comments);


/* Q3----- Display top 10 percent of the data  -- rounding to nect whole number*/ 
 select top 10 percent
 TransactionID, productID, TransactionDate, TransactionType
 from Production.TransactionHistory;

 /* Q4----- sort reviews by comment length */ 

 select 
 RATING,
 ReviewerName,
 CASE 
    WHEN RATING=1 THEN 'POOR'
    WHEN RATING=2 THEN 'FAIR'
    WHEN RATING=3 THEN 'GOOD'
    WHEN RATING=4 THEN 'VERY_GOOD'
    WHEN  RATING=5 THEN 'EXCELLENT'END AS QuantityText
 from 
Production.ProductReview;

/* Q6----- Handling Null values Instead of null values use 0 in a specific set of columns  */ 
 
with temmp as ( Select BillofMaterialsID,ProductAssemblyID, StartDate,
case 
 when ProductAssemblyID = 'NULL' then 1 else 0
end as new
from Production.BillofMaterials)
select * from temmp;

select BillofMaterialsID, StartDate,
isnull(ProductAssemblyID,0) as ProductAssemblyID
from Production.BillofMaterials;

/* Q7----- Changing column nnames temporarily- Use of Alias   */ 
 select 
 ProductModelID as id, CultureID as cult
 from Production.ProductModelProductDescriptionCulture as PMPD; 

 /* Q8----Filtering the data   */ 

 select 
 * 
 from Person.AddressType
 where Name = 'Archive';


select 
 * 
 from Person.AddressType
 where not  Name = 'Archive';

 /* Q9----Filtering te data - Multiple conditions   */ 
 select 
 ProductID, Name, ListPrice,
 case
 when ListPrice < 300 then 'cheap'
 when  ListPrice BETWEEN 300 and 1000  then 'medium'
 when ListPrice > 1000 then 'Expensive' end as tag
 from Production.Product;

/* Discreptive Statistics */
 select avg(ListPrice) as Mean,min(ListPrice) as MIN , STDEV(ListPrice) as STD, avg(ListPrice)+2*STDEV(ListPrice) as max, avg(ListPrice)-2*STDEV(ListPrice) as min

  from Production.Product;

   /* Q11----Filtering te data - Multiple conditions   */ 

   select 
   *
   from Production.workorder
   where ProductID =995;

    select 
   *
   from Production.workorder
   where ProductID = 995 and OrderQty > 500 and  StartDate < '2013-05-3';

/* Q17---Extract Specific characters  */ 

select *, 
UPPER(SUBSTRING(Name,1,2)) as sub, 
LEFT(ProductNumber,2) as lf, 
Right(ProductNumber,4)as rt   -- SIBSTRING(SYTING, START, LENGTH )
from Production.Product;