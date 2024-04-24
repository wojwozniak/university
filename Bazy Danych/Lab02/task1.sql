with t1 as (
	select skill.name, 
    COUNT(skill.value) as c, 
    sum(skill.value), 
    max(skill.value), 
    min(skill.value) 
    from offer
      join skill on offer.id = skill.offer_id
      group by skill.name
      order by c desc
), t2 as (
	select distinct skill.name as n, offer.title as c2 from skill
		join offer on offer.id = skill.offer_id
), t3 as (
	select n, count(c2) from t2
		group by n
		order by count desc
)
select distinct
	t1.name,
	t3.count as "stanowiska",
	t1.c as "oferty",
	t1.min as "min",
	t1.max as "max",
	round(t1.sum / t1.c) as "avg"
	from t1
		join t2 on t1.name = t2.n
		join t3 on t2.n = t3.n
		order by "stanowiska" desc, "oferty" desc;


```
Poprawki które możnaby tu zrobić korzystając ze wzorcówki:
- avg(value) zamiast ręcznego liczenia
- count(distinct o.title) zamiast obchodzenia poprzez t2