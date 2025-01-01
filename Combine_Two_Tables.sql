#Solution1
select p.firstname, p.lastname, a.city , a.state from person p left join address a on p.personid = a.personid

#Solution2
select p.firstname, p.lastname, a.city , a.state from address a right join person p on p.personid = a.personid