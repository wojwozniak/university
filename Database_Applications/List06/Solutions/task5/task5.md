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
```powershell
.\mongod.exe --config D:\mongo\bin\mongod-primary.cfg
.\mongod.exe --config D:\mongo\bin\mongod-secondary.cfg
.\mongod.exe --config D:\mongo\bin\mongod-arbiter.cfg
```
- Connect to the first instance
- Setup replica set
  
```js
var rsConfig = {
    _id: "demo",
    members: [
        { _id: 0, host: "localhost:10000", priority: 10 },
        { _id: 1, host: "localhost:20000" },
        { _id: 2, host: "localhost:30000", arbiterOnly: true }
    ]
};

rs.initiate(rsConfig);

rs.status(); // Check status
// 10000 not primary before insert -> check again after inserting
```

- Insert a document on the primary node
```js
use test;
db.books.insertOne({ _id: 1, title: "Mistrz i Małgorzata" });
db.books.find();
```
- Check replication on secondary
```powershell
mongosh --port 20000
db.books.find();
```

- Kill primary terminal
- Check with `rs.status()` if 20000 is new primary