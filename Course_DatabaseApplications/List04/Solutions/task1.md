# ACID in transactions

## A - Atomicity

Transaction is treated as single, indivisible task. If any part of task fails, entire transaction will fail. We prevent partial updates (ensuring data integrity)

## C - Consistency

Transactions move database from valid state to valid state. They cannot violate any rules (including triggers)

## I - Isolation

When transaction is active, its intermediate state is invisible to all other transactions (ensuring we don't get some unexpected results)

## D - Durability

When transaction is commited, its effects are permament (even after system failure). (Usually it is ensured by transaction log, allowing system to recover last commited state)

<br />

The ACID properties are crucial for ensuring data integrity, consistency, and reliability