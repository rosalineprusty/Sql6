with cte as (
    select customer_id, year(order_date) as 'year' , sum(price) as 'price' from orders 
    group by year , customer_id order by customer_id,year)

select c1.customer_id from cte c1 
left join cte c2 on c1.customer_id = c2.customer_id 
and c1.year+1 = c2.year and c2.price > c1.price 
group by c1.customer_id having count(*) - count(c2.customer_id) = 1