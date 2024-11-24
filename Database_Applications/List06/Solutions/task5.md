# Execute the example of replica sets presented in the MongoDB lecture presentation

## Replication

In MongoDB we have "replica set" where a group of servers are grouped into:
- Primary - handles reads and writes
- Secondaries - have copies of data and can takeover when primary fails
- Arbiter - participates in election without storing data
  
Where if primary goes down, secondaries elect a new primary

## Example
- We start by creating three directories for each database
- Start those servers on different ports
```
start "A" mongod --dbpath c:\Data\Databases\MongoDB\db1 --port 10000 --replSet "demo"
start "B" mongod --dbpath c:\Data\Databases\MongoDB\db2 --port 20000 --replSet "demo"
start "C" mongod --dbpath c:\Data\Databases\MongoDB\db3 --port 30000 --replSet "demo"
```
- Connect to the first instance
- Setup replica set
```js
var rsConfig = {
    _id: "demo",
    members: [
        { _id: 0, host: 'localhost:10000', priority: 10 },
        { _id: 1, host: 'localhost:20000' },
        { _id: 2, host: 'localhost:30000', arbiterOnly: true }
    ]
};
rs.initiate(rsConfig)
rs.status() // Check status
```
- Insert a document on the primary node
```js
use test;
db.books.save({_id: 1, title: "Mistrz i Małgorzata"});
db.books.find();
```
- Check replication on secondary
```js
mongo --port 20000
db.books.find();
rs.secondaryOk(); // Enable read access on secondary
db.books.find();
```
- Kill primary terminal
- Check with `rs.status()` if 20000 is new primary