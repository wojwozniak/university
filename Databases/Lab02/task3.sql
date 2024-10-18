select distinct company.name from offer
	join company on company.id = offer.company_id
	where 
		offer.id not in (
			select offer_id
			from skill
			where name ilike '%sql%' or name ilike '%database%'
		)
	order by company.name asc;

```
ilike - case insensitive like