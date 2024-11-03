-- setup
USE Test;

drop table if exists liczby;
go
create table liczby ( liczba int );
go
insert liczby values ( 10 );
go

-- 1 --
-- Select will put on shared lock
-- Update will try to get exclusive lock (it won't work - there is already shared one)
-- Commit transaction (releasing shared lock) and update will finish instantly
-- # Repeatable Read prevents other transactions from editing rows that have been read
-- until transaction completes
EXEC sp_lock;

set transaction isolation level repeatable read;
begin transaction;

-- First connection: perform select
select * from liczby;

-- Second connection: attempt update
update liczby set liczba=4;

commit;


-- 2 -- 
-- On first select sql server applies a range lock
-- we cannot do affect those rows until the transaction is commited
-- so the second connection is blocked
-- sp_lock will show us range lock
-- # Seralizable blocks other transactions from modifying 
-- range of data affected by currect transaction
EXEC sp_lock;

set transaction isolation level serializable;
insert liczby values (10);
begin transaction;

-- First connection: perform select
select * from liczby;

-- Second connection: attempt insert
insert liczby values (151);

commit;



-- 3 --
-- Snapshot isolation takes a snapshot of the data when the transaction
-- begins. All transactions can read and edit data - sp_lock will show
-- no locks.
-- # Snapshot isolation does not block transactions in place, it just
-- checks conflicts on commit
EXEC sp_lock;

ALTER DATABASE Test SET ALLOW_SNAPSHOT_ISOLATION ON;

set transaction isolation level snapshot;
begin transaction;

-- First connection: perform select
select * from liczby;

-- Second connection: attempt update
update liczby set liczba=6;

-- Back in the first connection, update
update liczby set liczba=7;

select * from liczby;

commit;
