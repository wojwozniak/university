with t1 as (
	select distinct offer.title, skill.name from offer
		join skill on skill.offer_id = offer.id
		order by title desc
)
select 
	t1.title, 
	count(t1.name),
	(array_agg(t1.name))[1:4] as example_skill
	from t1
		group by title
		having count(t1.name) > 20
		order by count desc;


```
Tu pamiętać o having
i o array_agg z przedziałem [n1:n2]