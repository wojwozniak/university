select distinct company.name from offer
	join company on company.id = offer.company_id
	where 
		company.id not in (
			select distinct company.id from skill
				join offer on offer.id = skill.offer_id
				join company on offer.company_id = company.id
				where skill.name ilike '%sql%' or skill.name ilike '%database%'
		)
	order by company.name asc;