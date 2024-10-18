WITH 
  offer_pairs AS (
    SELECT DISTINCT company_branch_id, company_id FROM offer
  ),
  true_pairs AS (
    SELECT DISTINCT id AS company_branch_id, company_id FROM company_branch
  ),
  outputed AS (
	SELECT 
		true_pairs.company_branch_id, 
		offer_pairs.company_id,
		true_pairs.company_id as "target_value"
			FROM true_pairs 
				JOIN offer_pairs ON true_pairs.company_branch_id = offer_pairs.company_branch_id
					where offer_pairs.company_id <> true_pairs.company_id
	  )
update offer
	set company_id = (select target_value from outputed)
	where 
		EXISTS (
    		SELECT 1 
			   FROM outputed WHERE 
					  offer.company_branch_id = outputed.company_branch_id
					  AND offer.company_id = outputed.company_id
				  );


-- ale wzorcówka dużo prostsza:
update offer
  set company_id = company_branch.company_id
  from company_branch
  where company_branch_id = company_branch.id
  and offer.company_id = company_branch_company_id;