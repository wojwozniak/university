with parts as (select * from part
join partsupp on ps_partkey = p_partkey
join supplier on s_suppkey = ps_suppkey
join nation on n_nationkey = s_nationkey
join region on r_regionkey = n_regionkey
where p_container = 'JUMBO PKG'
),
ae as (
select p_partkey, p_name, sum(ps_availqty) as mysum from parts
where r_name = 'MIDDLE EAST'
group by p_partkey, p_name
)

select distinct parts.p_partkey, parts.p_name, COALESCE(ae.mysum, '0') as avail from parts
left join ae on ae.p_partkey = parts.p_partkey
order by p_partkey