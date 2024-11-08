S1:
drop table if exists liczby1;
drop table if exists liczby2;
create table liczby1 ( liczba int )
create table liczby2 ( liczba int )
go

S1:
begin tran
insert liczby1 values ( 1 )

S2:
begin tran
insert liczby2 values ( 1 )

S1:
update liczby2 set liczba=10

S2:
update liczby1 set liczba=10

-- on read uncommited/commited there should not be a deadlock
-- unless there isn't some unlucky timing with updates

-- on repeatable read and serializable locks are held for 
-- entire transaction and we try to update row that is already there
-- (so even less strict repeatable read) will catch it