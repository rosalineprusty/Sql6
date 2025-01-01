#Solution1
select round(sqrt(min(pow(p2.x-p1.x,2)+pow(p2.y-p1.y,2))),2) as 'shortest' from point2d p1 inner join point2d p2 on p1.x != p2.x or p1.y != p2.y

#Solution2
select round(sqrt(min(pow(p2.x-p1.x,2)+pow(p2.y-p1.y,2))),2) as 'shortest' from point2d p1 inner join point2d p2 on 
p1.x <= p2.x and p1.y < p2.y or 
p1.x <= p2.x and p1.y > p2.y or
p1.x > p2.x and p1.y = p2.y