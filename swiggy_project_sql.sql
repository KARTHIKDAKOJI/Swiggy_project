

------------------------------------------------------- SWIGGY ORDERS ANALYSIS -------------------------------------------------------------
--Leverage SQL to analyze real-time Swiggy orders data from Chennai, extracting insights on
--popular items, peak order times, and demand trends to optimize food delivery operations. 
--------------------------------------------------------------------------------------------------------------------------------------------------
select * from  orders   --- orders table
select * from  items    --- items table
-------------------------------------------------------------------------------------------------------------------------------------------------

---  datatype conversion in tables

ALTER TABLE orders  
ALTER COLUMN on_time VARCHAR(3);   -- on time



alter table  items 
alter column is_veg varchar(3)   -- is veg


---  converts 0,1 to no,yes in orders table
UPDATE orders
SET on_time = CASE WHEN on_time = '1' THEN 'Yes' ELSE 'No' END;



---  converts 0,1 to no,yes in items  table
UPDATE items
SET is_veg = CASE WHEN is_veg = '1' THEN 'Yes' ELSE 'No' END;


------------------------------------------------------CASE   STUDY   QUETIONS-------------------------------------------------------------------------
------------------------------------------------------    ITEMS TABLE  --------------------------------------------------------------------------

--QUE.1 -SELECT DISTINCT ITEMS ORDERED AND COUNT HOW MANY DISTINCT ITEMS
select distinct name,order_id  from  items
select count(distinct name)  from  items


--QUE.2 -   FINDOUT THE NO OF UNIQUE ORDER_ID AND ITS TOTAL COUNT
select distinct  order_id from  items
select count(distinct  order_id)  from items


--QUE.3 - NO OF RESTURANTS SERVING  VEG AND NON-VEG  FOOD
select is_veg, count(name) AS  no_of_resturants
from items
group by is_veg  


--QUE.4 - CHECKING  THE  FOOD THAT CONTAINS  RICE AND SEPARATING  AND COUNTING VEG AND NON-VEG IN IT
select * from items
where name like '%rice%'

select is_veg,count(name) veg_nonveg from
(select * from items
where name like '%rice%') tus group by is_veg


--QUE.5 - CHECKING  THE  FOOD ITEM  PARATHA AND SEPARATING  AND COUNTING VEG AND NON-VEG IN IT
select * from items
where name like '%PARATHA%'

select is_veg,count(name) veg_non from
(select * from items
where name like '%PARATHA%') tus group by is_veg

--QUE.6 - FINDING  NO OF ORDERED ITEMS PER UNIQUE  ORDER_ID (AVG ORDER)  no of orders per id ON AN AVERAGE
select count(distinct order_id) as order_id_total  from items
select count(name) as total_items from items
SELECT count(name)/ count(distinct order_id) as avg_order_per_orderid  from items


--QUE.7 - FINDING MAXIMUM  ORDERD   ITEMS  SUCH THAT CAN INCREASE   PRODUCTION OF THOSE ITEMS
SELECT name, COUNT(*) AS order_count
FROM items
GROUP BY name
ORDER BY order_count DESC


---------------------------------------------------------- ORDERS TABLE ----------------------------------------------------------------------

--QUE.8 - DISTINCT  RAIN MODE OPTION IN  ZOMATO SERVICES
select  distinct rain_mode  from orders


--QUE.9 -  DISTINCT RESTAURANTS FROM WHERE  ORDERS ARE  DELIVERED  
select  distinct RESTAURANT_NAME from orders


--QUE.10 - FINDING FAVOURITE RESTAURANT i.e  MAX ORDER PLACED RESTAURANTS
SELECT restaurant_name, count(*) as max_orders from  orders
group by  restaurant_name
order by count(*) desc 


SELECT TOP 1 restaurant_name, max_orders  
FROM (
    SELECT restaurant_name, COUNT(*) AS max_orders 
    FROM orders
    GROUP BY restaurant_name
) val
ORDER BY max_orders DESC;


--QUE.11 - MAX ORDERD PLACED IN DIFFERENT YEARS AND MONTHS IN SAME YEAR
SELECT  format(order_time,'yyyy') as  order_month,
count(distinct order_id)  max_order from orders
group by format(order_time,'yyyy') 
order by  max_order desc

SELECT  format(order_time,'yyyy-MM') as  order_month,
count(distinct order_id)  max_order from orders
group by format(order_time,'yyyy-MM') 
order by  max_order desc


--QUE.12 - MOST  RECENT  ORDER 
select max(order_time) as recent_order_date from orders


--QUE.13 -  TOTAL REVENUE GENERATED TO SWIGGY IN DIFFERENT  MONTHS AND DIFFERENT YEARS
select format(order_time,'yyyy-MM') as per_month, sum(order_total) as total_revenue from  orders
group by  format(order_time,'yyyy-MM')
order  by  sum(order_total) desc



--QUE.14 -    FINDING  AVG ORDER_AMOUNT PER DISTINCT  ORDER_ID

select sum(order_total)/ count(distinct order_id)  avg_order_amount from  orders
-- since  per order_id means per customer on  an avg amt is 293 and  avg orders by individual customer is 2
-- therefore on avg  amt  customer spend on one order is 293/2 146.5 



--QUE.15 -  RANKING MAXIMUM REVENUE  GENERATED  YEAR  TO SWIGGY
select format(order_time,'yyyy') as per_month, sum(order_total) as total_revenue,
DENSE_RANK() over(order by  sum(order_total) desc)  as ranking from  orders
group by  format(order_time,'yyyy')
order  by  sum(order_total) desc
--  from above it can  be seen that  max revenue is genrated in year 2021


--QUE.16 -  REVENUE  GENERATED  DURING  DIFFERENT  RAIN MODES
select rain_mode, sum(order_total) as revenue from  orders
group by rain_mode
-- from the outcome it can be observed that  max revenue is generated on  normal dates(no rain) with  comparing to other days


--QUE.17 - DIFFERENCE IN REVENUE THAT ZOMATO GET  FROM CUSTOMERS IN  CONSECUTIVE YEARS
select FORMAT(order_time,'yyyy') as year,sum(order_total)  as amount,
lag(sum(order_total)) over (order by FORMAT(order_time,'yyyy'))   as  previous_year,

sum(order_total) -lag(sum(order_total)) over (order by FORMAT(order_time,'yyyy'))  as diff_in_revenue 
from   orders
group by FORMAT(order_time,'yyyy')
order by year



--QUE.18 -  REVENUE  GENERATED BASING ON ON_TIME DELIVERY OR NOT
select on_time, sum(order_total) as revenue from  orders
group by on_time
--  yes represents on time delivery 
-- no represents not delivered on time




------------------------------------------------------------ joinig two tables ---------------------------------------------------------------

--QUE.19 - FINDING THE ITEMS ORDERED  FROM DIFFERENT RESTAURANTS BY ORDER_TIME 
select   i.order_id,o.order_time,i.name,  o.restaurant_name from items  i 
join orders o  on  i.order_id = o.order_id 


--QUE.20 - DIFFERENT COMBO THAT ORDERED BY CUSTOMER (PREDICTIVE)
select a.order_id,a.name,b.name, CONCAT(a.name, '--',b.name) as  combo_orderd from items a  join items b on  a.order_id = b.order_id  
join orders o  on a.order_id = o.order_id
where a.name!=b.name and a.name>b.name  
