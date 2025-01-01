#Solution1
select player_id, event_date, sum( games_played) over (partition by player_id order by event_date) as games_played_so_far from activity 

#Solution2
select a1.player_id, a1.event_date, sum(a1.games_played) as games_played_so_far from activity a1 inner join activity a2 on a1.player_id = a2.player_id and a1.event_date <= a2.event_date group by a2.player_id,a2.event_date

#Solution3
select a1.player_id, a1.event_date, (select sum(a2.games_played) from activity a2 where a1.player_id = a2.player_id and a2.event_date <= a1.event_date) as 'games_played_so_far' from activity a1;