#Solution1
with cte as ( 
    select player_id, device_id, min(event_date) as 'event_date' from activity 
    group by player_id ) 
select a.player_id, a.device_id from activity a 
    join cte c on a.player_id = c.player_id 
    and a.event_date = c.event_date;


#Solution2
select distinct a.player_id, first_value(a.device_id) over(partition by a.player_id order by a.event_date) as device_id from activity a

#Solution3
select a.player_id, a.device_id from activity a where a.event_date in (select min(b.event_date) from activity b where a.player_id = b.player_id);

#Solution4
with cte as ( select distinct player_id, device_id, rank() over(partition by player_id order by event_date) as 'rnk' from activity)select player_id, device_id from cte where rnk = 1;

#Solution5
select a1.player_id, a1.device_id from activity a1 where (a1.player_id, a1.event_date) in (select a2.player_id, min(a2.event_date) from activity a2 group by a2.player_id)