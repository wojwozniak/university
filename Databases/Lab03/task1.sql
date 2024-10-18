with tab as (select * from customer
	join nation on c_nationkey = n_nationkey
	join region on r_regionkey = n_regionkey
	join orders on c_custkey = o_custkey
	where r_name = 'EUROPE' and EXTRACT(year from o_orderdate) = '1997'
), grouped as (
	select c_custkey, c_name, SUM(o_totalprice) as mysum
	from tab
	group by c_custkey, c_name
)
select * from grouped where mysum > '500000'